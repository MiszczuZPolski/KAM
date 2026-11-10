#include "..\script_component.hpp"
/*
 * Author: kolmipilot
 * mission patient handiling
 *
 * Arguments:
 * 0: Mode (damaged = 1, not = 0)<Number>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1] call kat_training_fnc_createPatient
 *
 * Public: No
 */

params ["_mode"];

private _pos = getPos GVAR(patientPosition);
private _group = createGroup [civilian, true];
private _patient = _group createUnit ["B_Soldier_F", _pos, [], 0, "NONE"];

_patient disableAI "MOVE";
_patient disableAI "FSM";
missionNamespace setVariable [QGVAR(lastPatient), _patient, true];
GVAR(patientSpawned) = true;

if (_mode == 1) then {
    [_patient, true] call ACEFUNC(medical,setUnconscious);
    private _selections = ["body", "head", "hand_r", "hand_l", "leg_r", "leg_l"];
    for "_i" from 1 to 4 do {
        private _selected = selectRandom _selections;
        [_patient, 0.8, _selected, "bullet"] call ACEFUNC(medical,addDamageToUnit);
    };
};
