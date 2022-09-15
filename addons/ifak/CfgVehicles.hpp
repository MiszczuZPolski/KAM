class CfgVehicles {
    class Man;
	//class Land_Ground_sheet_folded_khaki_F;
    class CAManBase: Man {
        class ACE_SelfActions {
			class ACE_Equipment {
				class flf_open_ifak
				{
					displayName = CSTRING(IFAK_Open);
					condition = QUOTE('kat_ifak' in (items player));
					exceptions[] = {};
					statement = QFUNC(open_ifak); "call flf_fnc_open_ifak; playSound3D ['flf_pouch\sfx\zip1.ogg', player,false,getposASL player, 0.6, 1, 0, 0, true];";
					icon = QPATHOF(ui\ifak_interaction);
				};
			};
		};
		
		class ACE_Actions {
			class ACE_MainActions {
					class flf_open_unit_ifak {
					displayName = "$STR_FLF_OpenIfak";
					condition = "(('flf_ifak' in (items _target)) || ('flf_ifak_25' in (items _target)) || ('flf_ifak_20' in (items _target)) || ('flf_ifak_15' in (items _target)) || ('flf_ifak_10' in (items _target)) || ('flf_ifak_5' in (items _target))) && (_target getVariable ['ACE_isUnconscious', false])";
					exceptions[] = {};
					statement = "[_target] remoteExec ['flf_fnc_open_ifak', 0]; playSound3D ['flf_pouch\sfx\zip1.ogg', _target,false,getposASL _target, 0.6, 1, 0, 0, true];";
					icon = "\flf_pouch\img\ifak_interaction.paa";
					};
			};
		};
		
	};
};