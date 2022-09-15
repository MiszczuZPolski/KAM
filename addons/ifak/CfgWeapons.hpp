class CfgWeapons
{
    class ACE_ItemCore;
	class CBA_MiscItem_ItemInfo;
	class kat_ifak: ACE_ItemCore
	{
		scope = 2;
		author = "Fluffy";
		picture = QPATHOF(ui\ifak_bk.paa);
		displayName = CSTRING(IFAK_DisplayName);
		descriptionShort = CSTRING(IFAK_DescriptionShort);
		class ItemInfo: CBA_MiscItem_ItemInfo {
        	mass = 30; //1,46kg
        };
	};
	//Hidden items
	class kat_ifak_25: kat_ifak
	{
		scope = 1;
		displayName = CSTRING(IFAK_DisplayName);
		descriptionShort = CSTRING(IFAK_DescriptionShort);
		class ItemInfo: CBA_MiscItem_ItemInfo {
        	mass = 25; 
        };
	};
	
	class kat_ifak_20: kat_ifak
	{
		scope = 1;
		displayName = CSTRING(IFAK_DisplayName);
		descriptionShort = CSTRING(IFAK_DescriptionShort);
		class ItemInfo: CBA_MiscItem_ItemInfo {
        	mass = 20; 
        };
	};
	
	class kat_ifak_15: kat_ifak
	{
		scope = 1;
		displayName = CSTRING(IFAK_DisplayName);
		descriptionShort = CSTRING(IFAK_DescriptionShort);
		class ItemInfo: CBA_MiscItem_ItemInfo {
        	mass = 15; 
        };
	};
	
	class kat_ifak_10: kat_ifak
	{
		scope = 1;
		displayName = CSTRING(IFAK_DisplayName);
		descriptionShort = CSTRING(IFAK_DescriptionShort);
		class ItemInfo: CBA_MiscItem_ItemInfo {
        	mass = 10; 
        };
	};
	
	class kat_ifak_5: kat_ifak
	{
		scope = 1;
		displayName = CSTRING(IFAK_DisplayName);
		descriptionShort = CSTRING(IFAK_DescriptionShort);
		class ItemInfo: CBA_MiscItem_ItemInfo {
        	mass = 5; 
        };
	};
};