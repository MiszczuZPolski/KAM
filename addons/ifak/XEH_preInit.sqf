#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#define CBA_SETTINGS_CAT "KAT - ADV Medical: IFAK"

// BANDAGE POUCH 1
[
    QGVAR(bandagePouch1_type),
    "LIST",
    LLSTRING(Bandage_type),
    [CBA_SETTINGS_CAT, LSTRING(Bandage_pouch1)],
    [["ACE_quikclot", "ACE_fieldDressing","ACE_elasticBandage","ACE_packingBandage"], ["STR_ACE_Medical_Treatment_Actions_QuikClot", "STR_ACE_Medical_Treatment_Actions_FieldDressing","STR_ACE_Medical_Treatment_Actions_ElasticBandage","STR_ACE_Medical_Treatment_Actions_PackingBandage"], 1],
    nil,
    {
		  player setVariable [QGVAR(bandagePouch1_type), _this];
    }
] call CBA_fnc_addSetting;

[
    QGVAR(bandagePouch1_amount),
    "SLIDER",
    LLSTRING(Amount),
    [CBA_SETTINGS_CAT, LSTRING(Bandage_pouch1)],
    [0, 5, 3, 0],
    nil,
    {
		  player setVariable [QGVAR(bandagePouch1_amount), round _this];
    }
] call CBA_fnc_addSetting;

// BANDAGE POUCH 2
[
    QGVAR(bandagePouch2_type),
    "LIST",
    LLSTRING(Bandage_type),
    [CBA_SETTINGS_CAT, LSTRING(Bandage_pouch2)],
    [["ACE_quikclot", "ACE_fieldDressing","ACE_elasticBandage","ACE_packingBandage"], ["STR_ACE_Medical_Treatment_Actions_QuikClot", "STR_ACE_Medical_Treatment_Actions_FieldDressing","STR_ACE_Medical_Treatment_Actions_ElasticBandage","STR_ACE_Medical_Treatment_Actions_PackingBandage"], 1],
    nil,
    {
		  player setVariable [QGVAR(bandagePouch2_type), _this];
    }
] call CBA_fnc_addSetting;

[
    QGVAR(bandagePouch2_amount),
    "SLIDER",
    LLSTRING(Amount),
    [CBA_SETTINGS_CAT, LSTRING(Bandage_pouch2)],
    [0, 5, 3, 0],
    nil,
    {
		  player setVariable [QGVAR(bandagePouch2_amount), round _this];
    }
] call CBA_fnc_addSetting;

// BANDAGE POUCH 3
[
    QGVAR(bandagePouch3_type),
    "LIST",
    LLSTRING(Bandage_type),
    [CBA_SETTINGS_CAT, LSTRING(Bandage_pouch3)],
    [["ACE_quikclot", "ACE_fieldDressing","ACE_elasticBandage","ACE_packingBandage"], ["STR_ACE_Medical_Treatment_Actions_QuikClot", "STR_ACE_Medical_Treatment_Actions_FieldDressing","STR_ACE_Medical_Treatment_Actions_ElasticBandage","STR_ACE_Medical_Treatment_Actions_PackingBandage"], 1],
    nil,
    {
		  player setVariable [QGVAR(bandagePouch3_type), _this];
    }
] call CBA_fnc_addSetting;

[
    QGVAR(bandagePouch3_amount),
    "SLIDER",
    LLSTRING(Amount),
    [CBA_SETTINGS_CAT, LSTRING(Bandage_pouch3)],
    [0, 5, 3, 0],
    nil,
    {
		  player setVariable [QGVAR(bandagePouch3_amount), round _this];
    }
] call CBA_fnc_addSetting;

// INJECTOR POUCH 1
[
    QGVAR(injectorPouch1_type),
    "LIST",
    LLSTRING(Injector_type),
    [CBA_SETTINGS_CAT,LSTRING(Injector_pouch1)],
    [["ACE_adenosine", "ACE_epinephrine","ACE_morphine"], ["STR_ACE_Medical_Treatment_Adenosine_Display", "STR_ACE_Medical_Treatment_Epinephrine_Display","STR_ACE_Medical_Treatment_Morphine_Display"], 2],
    nil,
    {
		  player setVariable [QGVAR(injectorPouch1_type), _this];
    }
] call CBA_fnc_addSetting;

[
    QGVAR(injectorPouch1_amount),
    "SLIDER",
    LLSTRING(Amount),
    [CBA_SETTINGS_CAT,LSTRING(Injector_pouch1)],
    [0, 5, 3, 0],
    nil,
    {
		  player setVariable [QGVAR(injectorPouch1_amount), round _this];
    }
] call CBA_fnc_addSetting;

// INJECTOR POUCH 1
[
    QGVAR(injectorPouch2_type),
    "LIST",
    LLSTRING(Injector_type),
    [CBA_SETTINGS_CAT,LSTRING(Injector_pouch2)],
    [["ACE_adenosine", "ACE_epinephrine","ACE_morphine"], ["STR_ACE_Medical_Treatment_Adenosine_Display", "STR_ACE_Medical_Treatment_Epinephrine_Display","STR_ACE_Medical_Treatment_Morphine_Display"], 2],
    nil,
    {
		  player setVariable [QGVAR(injectorPouch2_type), _this];
    }
] call CBA_fnc_addSetting;

[
    QGVAR(injectorPouch2_amount),
    "SLIDER",
    LLSTRING(Amount),
    [CBA_SETTINGS_CAT,LSTRING(Injector_pouch2)],
    [0, 5, 3, 0],
    nil,
    {
		  player setVariable [QGVAR(injectorPouch2_amount), round _this];
    }
] call CBA_fnc_addSetting;

// MISCELLANEOUS POUCH 1
[
    QGVAR(MiscPouch1_type),
    "LIST",
    LLSTRING(Medical_item),
    [CBA_SETTINGS_CAT,LSTRING(Medical_pouch1)],
    [["ACE_tourniquet", "ACE_splint","kat_guedel","kat_larynx"], ["STR_ACE_Medical_Treatment_Tourniquet_Display","STR_ACE_Medical_Treatment_splint_Display","STR_kat_airway_Guedel_Display","STR_kat_airway_Larynx_Display"], 0],
    nil,
    {
      player setVariable [QGVAR(MiscPouch1_type), _this];
    }
] call CBA_fnc_addSetting;

[
    QGVAR(MiscPouch1_amount),
    "SLIDER",
    LLSTRING(Amount),
    [CBA_SETTINGS_CAT,LSTRING(Medical_pouch1)],
    [0, 2, 2, 0],
    nil,
    {
      player setVariable [QGVAR(MiscPouch1_amount), round _this];
    }
] call CBA_fnc_addSetting;

// MISCELLANEOUS POUCH 2
[
    QGVAR(MiscPouch2_type),
    "LIST",
    LLSTRING(Medical_item),
    [CBA_SETTINGS_CAT,LSTRING(Medical_pouch2)],
    [["ACE_tourniquet", "ACE_splint","kat_guedel","kat_larynx"], ["STR_ACE_Medical_Treatment_Tourniquet_Display","STR_ACE_Medical_Treatment_splint_Display","STR_kat_airway_Guedel_Display","STR_kat_airway_Larynx_Display"], 0],
    nil,
    {
    player setVariable [QGVAR(MiscPouch2_type), _this];
    }
] call CBA_fnc_addSetting;

[
    QGVAR(MiscPouch2_amount),
    "SLIDER",
    LLSTRING(Amount),
    [CBA_SETTINGS_CAT,LSTRING(Medical_pouch2)],
    [0, 2, 2, 0],
    nil,
    {
      player setVariable [QGVAR(MiscPouch2_amount), round _this];
    }
] call CBA_fnc_addSetting;


// PAINKILLER POUCH
[
    QGVAR(painkillersPouch),
    "CHECKBOX",
    LLSTRING(Painkillers_type),
    [CBA_SETTINGS_CAT,LSTRING(Painkillers_pouch)],
    true,
    nil,
    {
      player setVariable [QGVAR(painkillersPouch), _this];
    }
] call CBA_fnc_addSetting;

ADDON = true;