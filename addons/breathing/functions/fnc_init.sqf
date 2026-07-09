#include "..\script_component.hpp"
/*
 * Author: Katalam
 * Initializes unit variables.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Is Respawn? <BOOL> (optional, default true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, true] call kat_breathing_fnc_init
 *
 * Public: No
 */

params ["_unit", ["_isRespawn", true]];

if (!local _unit) exitWith {};
if !(GVAR(enable)) exitWith {};

[_unit] call FUNC(fullHealLocal);

_unit setVariable [QGVAR(pulseoximeter), false, true];
_unit setVariable [QGVAR(PulseOximeter_Volume), true, true];
_unit setVariable [QGVAR(PulseOximeter_VolumePatient), false, true];

_unit setVariable [QGVAR(oxygenMaskActive), false, true];
_unit setVariable [QGVAR(oxygenMaskStatus), [0,0], true];
