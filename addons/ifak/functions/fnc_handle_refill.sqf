/*
 * Author: Fluffy
 * Checks if ifak is empty and then resets all the values in case player takes second ifak.
 *
 * Arguments:
 * 
 *
 * Return Value:
 * 0: True if IFAK is empty <BOOL>
 *
 *
 * Example:
 * call flf_fnc_handle_refill;
 *
 * Public: No
 */
 
 params [
	["_caller",player,[objNull]]
];

if ((_caller getVariable "flf_bandage1_Amount_namespace" == 0) && (_caller getVariable "flf_bandage2_Amount_namespace" == 0) && (_caller getVariable "flf_bandage3_Amount_namespace" == 0) && (_caller getVariable "flf_injector1_Amount_namespace" == 0) && (_caller getVariable "flf_injector2_Amount_namespace" == 0) && (_caller getVariable "flf_misc1_Amount_namespace" == 0) && (_caller getVariable "flf_misc2_Amount_namespace" == 0) && (!(_caller getVariable "flf_pain_type_namespace"))) then 
{

[[localize "$STR_FLF_Unpacked"]] call CBA_fnc_notify;
//systemChat "IFAK was opened and is now empty.";
//Reset values if player tries to take second IFAK
_caller setVariable ["flf_bandage1_Amount_namespace", (_caller getVariable "flf_bandage1_Amount_namespace_cba")];
_caller setVariable ["flf_bandage2_Amount_namespace", (_caller getVariable "flf_bandage2_Amount_namespace_cba")];
_caller setVariable ["flf_bandage3_Amount_namespace", (_caller getVariable "flf_bandage3_Amount_namespace_cba")];
_caller setVariable ["flf_injector1_Amount_namespace", (_caller getVariable "flf_injector1_Amount_namespace_cba")];
_caller setVariable ["flf_injector2_Amount_namespace", (_caller getVariable "flf_injector2_Amount_namespace_cba")];
_caller setVariable ["flf_misc1_Amount_namespace", (_caller getVariable "flf_misc1_Amount_namespace_cba")];
_caller setVariable ["flf_misc2_Amount_namespace", (_caller getVariable "flf_misc2_Amount_namespace_cba")];
_caller setVariable ["flf_pain_type_namespace", true];
true
} else {
false
};