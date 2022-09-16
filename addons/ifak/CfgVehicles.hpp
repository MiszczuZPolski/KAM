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
					statement = QFUNC(open_ifak);
					icon = QPATHOF(ui\ifak_interaction);
				};
			};
		};
		
		class ACE_Actions {
			class ACE_MainActions {
					class Open_Unit_Ifak {
					displayName = CSTRING(IFAK_Open);
					condition = QUOTE('kat_ifak' in (items player) && (_target getVariable ['ACE_isUnconscious', false]));
					exceptions[] = {};
					statement = QFUNC(open_ifak_target);
					icon = QPATHOF(ui\ifak_interaction);
					};
			};
		};
		
	};
};