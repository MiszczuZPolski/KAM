#include "..\script_component.hpp"
/*
 * Author: kolmipilot
 * Causes a heart attack on a patient with selected rhythm.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Rhythm <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "0"] call kat_training_fnc_causeHeartAttack
 *
 * Public: No
 */

params ["_medic", "_patient", "_rhythm"];


["ace_medical_FatalVitals", [_patient], _patient] call CBA_fnc_targetEvent;
_patient setVariable ["kat_circulation_cardiacArrestType", 1, true];

// Set cardiac arrest type based on rhythm
// 0 = Asystole, 1 = PEA, 2 = V-Fib, 3 = V-Tach

switch (_rhythm) do {
    case "0": {
        _patient setVariable ["kat_circulation_cardiacArrestType", 0, true];
    };
    case "1": {
        _patient setVariable ["kat_circulation_cardiacArrestType", 1, true];
    };
    case "2": {
        _patient setVariable ["kat_circulation_cardiacArrestType", 2, true];
    };
    case "3": {
        _patient setVariable ["kat_circulation_cardiacArrestType", 3, true];
    };
};

systemchat format ["%1 caused a heart attack on %2 with rhythm %3.", name _medic, name _patient, _rhythm];
