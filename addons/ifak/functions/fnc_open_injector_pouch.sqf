params [
	["_caller",player,[objNull]]
];

//Injector types
_injector1_type = _caller getVariable [QGVAR(injectorPouch1_type), ""];
_injector2_type = _caller getVariable [QGVAR(injectorPouch2_type), ""];

//Injector Amount
_injector1_Amount = _caller getVariable [QGVAR(injectorPouch1_amount), 0];
_injector2_Amount = _caller getVariable [QGVAR(injectorPouch2_amount), 0];

if (_injector1_Amount > 0 || _injector2_Amount > 0) then {
	//replace IFAK item with lighter version
	[_caller, -10] call FUNC(change_ifak_size);
		
	//I N J E C T O R S
	if (_injector1_Amount > 0) then {
	for "_i" from 1 to _injector1_Amount do { if !(_caller canAdd [_injector1_type, 1]) then { break }; _caller addItem _injector1_type; _caller setVariable [QGVAR(injectorPouch1_amount), (_injector1_Amount - _i)]; };
	};
		
	if (_injector2_Amount > 0) then {
	for "_j" from 1 to _injector2_Amount do { if !(_caller canAdd [_injector2_type, 1]) then { break }; _caller addItem _injector2_type; _caller setVariable [QGVAR(injectorPouch2_amount), (_injector2_Amount - _j)]; };
	};
		
	[LSTRING(Injectors),true] call CBA_fnc_notify;

	// in case when after unpacking selected items ifak would be empty we need to reset all the values
	[_caller] call FUNC(handle_refill);
};
	