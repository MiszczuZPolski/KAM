params [["_caller",player,[objNull]]];

//Misc types
private _Misctype1 = _caller getVariable [QGVAR(MiscPouch1_type), ""];
private _Misctype2 = _caller getVariable [QGVAR(MiscPouch2_type), ""];

//Misc Amount
private _MiscAmount1 = _caller getVariable [QGVAR(MiscPouch1_amount), 0];
private _MiscAmount2 = _caller getVariable [QGVAR(MiscPouch2_amount), 0];

//Painkillers
private _painBool = _caller getVariable [QGVAR(painkillersPouch), false];

if (_MiscAmount1 > 0 || _MiscAmount2 > 0 || _pain_bool) then {
	// M I S C   I T E M S
	if (_MiscAmount1 > 0) then {
		for "_i" from 1 to _MiscAmount1 do {
			 if !(_caller canAdd [_Misctype1, 1]) then { break }; 
			 _caller addItem _Misctype1; 
			 _caller setVariable [QGVAR(MiscPouch1_amount), (_MiscAmount1 - _i)]; 
		};
	};
		
	if (_MiscAmount2 > 0) then {
		for "_j" from 1 to _MiscAmount2 do { 
			if !(_caller canAdd [_Misctype2, 1]) then { break }; 
			_caller addItem _Misctype2; 
			_caller setVariable [QGVAR(MiscPouch2_amount), (_MiscAmount2 - _j)]; 
		};
	};
		
	//P A I N K I L L E R S
	//check before another check for ppl playing without KAT
	if (_painBool && (_caller canAdd ["kat_Painkiller", 1])) then {
		_caller addMagazine "kat_Painkiller"; 
		_caller setVariable [QGVAR(painkillersPouch), false];
	};

	[LSTRING(MedicalMisc), true] call CBA_fnc_notify;
	
	// in case when after unpacking selected items ifak would be empty we need to reset all the values
	[_caller] call FUNC(handle_refill);
};
	