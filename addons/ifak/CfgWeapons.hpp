class CfgWeapons
{
    class ACE_ItemCore;
	class CBA_MiscItem_ItemInfo;
	class kat_ifak: ACE_ItemCore
	{
		scope = 2;
		author = "Fluffy";
		picture = QPATHTOF(ui\ifak_bk.paa);
		displayName = CSTRING(IFAK_DisplayName);
		descriptionShort = CSTRING(IFAK_DescriptionShort);
		class ItemInfo: CBA_MiscItem_ItemInfo {
        	mass = 30; //1,46kg
        };
	};
};