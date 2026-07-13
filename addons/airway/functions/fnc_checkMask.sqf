#include "..\script_component.hpp"
/*
 * Author: Mazinski
 * Checks if patient has mask on
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * Mask active <BOOL>
 *
 * Example:
 * [player] call kat_airway_fnc_checkMask;
 *
 * Public: No
 */

params ["_patient"];

if ((goggles _patient in (missionNamespace getVariable [QEGVAR(chemical,availGasmaskHash), createHashMap])) || (goggles _patient in (missionNamespace getVariable [QEGVAR(breathing,availOxyMaskList), []]))) exitWith {
    true
};

false
