#include "..\script_component.hpp"
/*
 * Author: Mazinski
 * Applies the opioid factor from Nalbuphine
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "Leftleg", 1] call kat_pharma_fnc_treatmentAdvanced_NalbuphineLocal;
 *
 * Public: No
 */

params ["_patient", "_bodyPart", "_opioidRelief"];

private _opioidFactor = _patient getVariable [QGVAR(opioidFactor), 1];
if (_opioidFactor == 1) then {
    _patient setVariable [QGVAR(opioidFactor), _opioidRelief, true];
};