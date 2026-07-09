#include "..\script_component.hpp"
/*
 * Author: Katalam
 * Initializes unit variables.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call kat_misc_fnc_init;
 *
 * Public: No
 */

params ["_unit", ["_isRespawn", true]];

if (!local _unit) exitWith {};

_unit setVariable [QGVAR(isLeftArmFree), true, true];
_unit setVariable [QGVAR(isRightArmFree), true, true];
_unit setVariable [QGVAR(isLeftLegFree), true, true];
_unit setVariable [QGVAR(isRightLegFree), true, true];
private ["_str", "_array"];

_str = missionNamespace getVariable [QGVAR(armbandSlingLeftArm), ""];
_array = [_str, ","" ", true] call FUNC(stringToArray);
_unit setVariable [QGVAR(armbandSlingLeftArmPos), _array, true];

_str = missionNamespace getVariable [QGVAR(armbandSlingRightArm), ""];
_array = [_str, ","" ", true] call FUNC(stringToArray);
_unit setVariable [QGVAR(armbandSlingRightArmPos), _array, true];

_str = missionNamespace getVariable [QGVAR(armbandSlingLeftLeg), ""];
_array = [_str, ","" ", true] call FUNC(stringToArray);
_unit setVariable [QGVAR(armbandSlingLeftLegPos), _array, true];

_str = missionNamespace getVariable [QGVAR(armbandSlingRightLeg), ""];
_array = [_str, ","" ", true] call FUNC(stringToArray);
_unit setVariable [QGVAR(armbandSlingRightLegPos), _array, true];

_str = missionNamespace getVariable [QGVAR(armbandSlingLeftArmRotation), ""];
_array = [_str, ","" ", true] call FUNC(stringToArray);
_unit setVariable [QGVAR(armbandSlingLeftArmRot), _array, true];

_str = missionNamespace getVariable [QGVAR(armbandSlingRightArmRotation), ""];
_array = [_str, ","" ", true] call FUNC(stringToArray);
_unit setVariable [QGVAR(armbandSlingRightArmRot), _array, true];

_str = missionNamespace getVariable [QGVAR(armbandSlingLeftLegRotation), ""];
_array = [_str, ","" ", true] call FUNC(stringToArray);
_unit setVariable [QGVAR(armbandSlingLeftLegRot), _array, true];

_str = missionNamespace getVariable [QGVAR(armbandSlingRightLegRotation), ""];
_array = [_str, ","" ", true] call FUNC(stringToArray);
_unit setVariable [QGVAR(armbandSlingRightLegRot), _array, true];
