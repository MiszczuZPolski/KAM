#include "..\script_component.hpp"
/*
 * Author: kolmipilot
 * Causes thoracic injuries on a patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Injury Type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "0"] call kat_training_fnc_causeThoracicInjuries
 *
 * Public: No
 */

params ["_medic", "_patient", "_injuryType"];

// 0 = Tension Pneumothorax
// 1 = Hemopneumothorax
// 2 = Cardiac Tamponade

switch (_injuryType) do {
    case "0": {
        _patient setVariable ["kat_breathing_tensionpneumothorax", true, true];
        _patient setVariable ["kat_breathing_pneumothorax", 4, true];
        [_patient] call kat_circulation_fnc_updateInternalBleeding;
    };
    case "1": {
        _patient setVariable ["kat_breathing_hemopneumothorax", true, true];
        _patient setVariable ["kat_breathing_pneumothorax", 4, true];
        [_patient] call kat_circulation_fnc_updateInternalBleeding;
    };
    case "2": {
        [_patient] call kat_breathing_fnc_createTamponade;
    };
};
