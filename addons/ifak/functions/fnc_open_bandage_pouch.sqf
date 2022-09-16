
params ["_caller"];

//Get all the bandage types
private _bandage1_type = _caller getVariable [QGVAR(bandagePouch1_type), ""];
private _bandage2_type = _caller getVariable [QGVAR(bandagePouch2_type), ""];
private _bandage3_type = _caller getVariable [QGVAR(bandagePouch3_type), ""];

//Get bandage Amount
private _bandage1_Amount = _caller getVariable [QGVAR(bandagePouch1_amount), 0];
private _bandage2_Amount = _caller getVariable [QGVAR(bandagePouch2_amount), 0];
private _bandage3_Amount = _caller getVariable [QGVAR(bandagePouch3_amount), 0];

if (_bandage1_Amount > 0 || _bandage2_Amount > 0 || _bandage3_Amount > 0) then {
	//replace IFAK item with lighter version
	[_caller, -15] call FUNC(change_ifak_size);

	// B A N D A G E S
	//Get desired ammount from namespace, then iterate through each bandage and check if it fits inside the inventory if not, break the loop and save remaining ammount to namespace.
	if (_bandage1_Amount > 0) then {
	for "_i" from 1 to _bandage1_Amount do { if !(_caller canAdd [_bandage1_type, 1]) then { break }; _caller addItem _bandage1_type; _caller setVariable [QGVAR(bandagePouch1_amount), (_bandage1_Amount - _i)]; };
	};
		
	if (_bandage2_Amount > 0) then {
	for "_j" from 1 to _bandage2_Amount do { if !(_caller canAdd [_bandage2_type, 1]) then { break }; _caller addItem _bandage2_type; _caller setVariable [QGVAR(bandagePouch2_amount), (_bandage2_Amount - _j)]; };
	};
		
	if (_bandage3_Amount > 0) then {
	for "_k" from 1 to _bandage3_Amount do { if !(_caller canAdd [_bandage3_type, 1]) then { break }; _caller addItem _bandage3_type; _caller setVariable [QGVAR(bandagePouch3_amount), (_bandage3_Amount - _k)]; };
	};
		
	[LSTRING(Bandages), true] call CBA_fnc_notify;

	// in case when after unpacking selected items ifak would be empty we need to reset all the values
	[_caller] call FUNC(handle_refill);
};
	