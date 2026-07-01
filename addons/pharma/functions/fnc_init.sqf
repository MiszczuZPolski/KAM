#include "..\script_component.hpp"
/*
 * Author: Katalam, Miss Heda
 * Initializes unit variables.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call kat_pharma_fnc_init;
 *
 * Public: No
 */

params ["_unit", ["_isRespawn", true]];

if (!local _unit) exitWith {};

[_unit] call FUNC(fullHealLocal);

[{
    params ["_args", "_idPFH"];
    _args params ["_unit"];

    private _alive = alive _unit;

    if (!_alive) exitWith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

    private _medicationArray = _unit getVariable [QACEGVAR(medical,medications), []];
    private _alpha = false;
    private _opioid = false;

    {
        _x params ["_medication"];

        if (_medication in ["Epinephrine", "EpinephrineIV", "Phenylephrine", "Nitroglycerin", "Lidocaine", "Norepinephrine"]) exitWith {
            _alpha = true;
        };
    } forEach (_medicationArray);

    {
        _x params ["_medication"];

        if (_medication in ["Fentanyl", "Morphine", "Nalbuphine"]) exitWith {
            _opioid = true;
        };
    } forEach (_medicationArray);

    if !(_alpha) then {
        _unit setVariable [QGVAR(alphaAction), 1];
    };

    if !(_opioid) then {
        _unit setVariable [QGVAR(opioidFactor), 1];
    };
}, 180, [_unit]] call CBA_fnc_addPerFrameHandler;

if (GVAR(kidneyAction)) then {
    [{
        params ["_args", "_idPFH"];
        _args params ["_unit"];

        private _alive = alive _unit;

        if (!_alive) exitWith {
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };

        private _ph = _unit getVariable [QGVAR(externalPh), 0];
        private _kidneyFail = _unit getVariable [QGVAR(kidneyFail), false];
        private _kidneyArrest = _unit getVariable [QGVAR(kidneyArrest), false];
        private _kidneyPressure = _unit getVariable [QGVAR(kidneyPressure), false];

        // Pressure-dependent kidney function (GFR / MAP perfusion relation)
        private _bloodPressure = [_unit] call EFUNC(circulation,getBloodPressure);
        _bloodPressure params ["_diastolic", "_systolic"];
        private _map = (_systolic + 2 * _diastolic) / 3;

        // Autoregulation holds down to MAP 75; filtration fails between 65 and 75; ceases below 65
        private _rEff = linearConversion [65, 75, _map, 0.0, 1.0, true];

        // Urine output tracking (modeled around 0.5 - 1.0 mL/min normal rate; loop runs every 20s)
        private _urineStep = (random [0.5, 0.8, 1.0]) * (20 / 60) * _rEff;
        private _urineVolume = _unit getVariable [QGVAR(urineVolume), 0];
        _unit setVariable [QGVAR(urineVolume), _urineVolume + _urineStep, true];

        switch true do {
            case (_ph >= 3000): {
                _unit setVariable [QGVAR(kidneyFail), true, true];
                _unit setVariable [QGVAR(kidneyArrest), true, true];
                [QACEGVAR(medical,FatalVitals), _unit] call CBA_fnc_localEvent;
            };
            case (_ph >= 2000): {
                _unit setVariable [QGVAR(kidneyFail), true, true];

                if !(_kidneyArrest) then {
                    private _random = random 1;
        
                    if (_random >= 0.75) then {
                        [QACEGVAR(medical,FatalVitals), _unit] call CBA_fnc_localEvent;
                        _unit setVariable [QGVAR(kidneyArrest), true, true];
                    };
                };
            };
            case (_ph >= 1000): {
                _ph = (_ph - (30 * _rEff)) max 0;
                _unit setVariable [QGVAR(externalPh), _ph, true];
    
                if !(_kidneyPressure) then {
                    _unit setVariable [QGVAR(kidneyPressure), true, true];
                    [_unit, "KIDNEY", 15, 1200, 30, 0, 15] call ACEFUNC(medical_status,addMedicationAdjustment);
                };
            };
            default {
                _ph = (_ph - (60 * _rEff)) max 0;
                _unit setVariable [QGVAR(externalPh), _ph, true];
            };
        };
    }, 20, [_unit]] call CBA_fnc_addPerFrameHandler;
};
