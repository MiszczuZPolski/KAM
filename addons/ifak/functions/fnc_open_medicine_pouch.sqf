params [
	["_caller",player,[objNull]]
];

//Misc types
_Misc1_type = _caller getVariable [QGVAR(MiscPouch1_type), ""];
_Misc2_type = _caller getVariable [QGVAR(MiscPouch2_type), ""];

//Misc Amount
_Misc1_Amount = _caller getVariable [QGVAR(MiscPouch1_amount), 0];
_Misc2_Amount = _caller getVariable [QGVAR(MiscPouch2_amount), 0];

//Painkillers
_pain_bool = _caller getVariable [QGVAR(painkillersPouch), false];

if (_Misc1_Amount > 0 || _Misc2_Amount > 0 || _pain_bool) then {
	//replace IFAK item with lighter version
	[_caller, -5] call FUNC(change_ifak_size);
		
	// M I S C   I T E M S
	if (_Misc1_Amount > 0) then {
		for "_i" from 1 to _Misc1_Amount do {
			 if !(_caller canAdd [_Misc1_type, 1]) then { break }; 
			 _caller addItem _Misc1_type; _caller setVariable ["flf_misc1_Amount_namespace", (_Misc1_Amount - _i)]; 
		};
	};
		
	if (_Misc2_Amount > 0) then {
		for "_j" from 1 to _Misc2_Amount do { 
			if !(_caller canAdd [_Misc2_type, 1]) then { break }; 
			_caller addItem _Misc2_type; _caller setVariable ["flf_misc2_Amount_namespace", (_Misc2_Amount - _j)]; 
		};
	};
		
	//P A I N K I L L E R S
	//check before another check for ppl playing without KAT
	if (_pain_bool && (_caller canAdd ["kat_Painkiller", 1])) then {
		_caller addMagazine "kat_Painkiller"; 
		_caller setVariable [QGVAR(painkillersPouch), false];
	};

	[LSTRING(MedicalMisc), true] call CBA_fnc_notify;
	
	// in case when after unpacking selected items ifak would be empty we need to reset all the values
	[_caller] call FUNC(handle_refill);
};
	