class CfgVehicles {
    class Man;
	//class Land_Ground_sheet_folded_khaki_F;
    class CAManBase: Man {
        class ACE_SelfActions {
			class ACE_Equipment {
				class Open_Ifak
				{
					displayName = CSTRING(IFAK_Open);
					condition = QUOTE('kat_ifak' in (items player));
					exceptions[] = {};
					statement = QUOTE([_player] call FUNC(open_ifak));
					icon = QPATHTOF(ui\ifak_interaction);
				};
			};
		};
		
		class ACE_Actions {
			class ACE_MainActions {
					class Open_Unit_Ifak {
					displayName = CSTRING(IFAK_Open);
					condition = QUOTE('kat_ifak' in (items player) && (_target getVariable ['ACE_isUnconscious', false]));
					exceptions[] = {};
					statement = QUOTE(call FUNC(open_ifak_target));
					icon = QPATHTOF(ui\ifak_interaction);
					};
			};
		};
		
	};
};