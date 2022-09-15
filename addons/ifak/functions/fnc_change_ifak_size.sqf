/*
 * Author: Fluffy
 * Chnages ifak in _caller inventory
 *
 * Arguments:
 * 0: Ammount <NUMBER>
 *
 * Return Value:
 * 0: New IFAK Item <STRING>
 *
 *
 * Example:
 * [_target, -5] call kat_ifak_fnc_change_ifak_size;
 *
 * Public: No
 */
params ["_caller", "_change"];

private ["_selectedIfakNumber"];



_BaseClass = "kat_ifak";
//find all ifaks, sort them, select smallest one and get only its weight
_ifak_items = (items _caller) select {(str _x) select [1,8] == "kat_ifak"};
_ifak_items sort false;

_selectedIfak = _ifak_items # 0;

if (_selectedIfak == "kat_ifak") then {
	_selectedIfakNumber = 30;
} else {
	_selectedIfakNumber = parseNumber (_selectedIfak select [9,11]);
};

_newIfakNumber = _selectedIfakNumber + _change;


//handle exceptions, remove previous ifaks and give new one
if (_newIfakNumber == 30) then {
_newIfakItem = "kat_ifak";
//_caller removeItem _selectedIfak;
[_caller, _selectedIfak] remoteExec ["removeItem",0];
//_caller addItem _newIfakItem;
[_caller, _newIfakItem] remoteExec ["addItem",0];
_newIfakItem
} else {
	if (_newIfakNumber <= 0) then {
	_caller removeItem _selectedIfak;
	};
_newIfakItem = "kat_ifak_" + str _newIfakNumber;
_caller removeItem _selectedIfak;
_caller addItem _newIfakItem;
_newIfakItem
};
