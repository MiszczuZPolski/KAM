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
 * [_caller] call kat_ifak_fnc_open_ifak;
 *
 * Public: No
 */

 _caller = _this #0;

playSound3D [QPATHTOF_SOUND(sounds\zip1.ogg), _caller, false, getposASL _caller, 0.6, 1, 0, 0, true];
[QGVAR(openBandages), _caller, _caller] call CBA_fnc_targetEvent;
[QGVAR(openInjectors), _caller, _caller] call CBA_fnc_targetEvent;
[QGVAR(openMedicines), _caller, _caller] call CBA_fnc_targetEvent;