/*
 * Author: MiszczuZPolski
 * Open ifak pouches
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_target] call kat_ifak_fnc_open_ifak;
 *
 * Public: No
 */

params ["_target"];

playSound3D [QPATHOF_SOUND(sounds\zip1.ogg), _target, false, getposASL _target, 0.6, 1, 0, 0, true];
[QGVAR(openBandages), _target, _target] call CBA_fnc_targetEvent;
[QGVAR(openInjectors), _target, _target] call CBA_fnc_targetEvent;
[QGVAR(openMedicines), _target, _target] call CBA_fnc_targetEvent;