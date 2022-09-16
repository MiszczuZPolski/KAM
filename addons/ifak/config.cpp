#include "script_component.hpp"

class CfgPatches {
    class ADDON    {
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        units[] = {};
        weapons[] = {
            "kat_ifak"
        };
        magazines[] = {};
        requiredAddons[] = {
            "ace_medical_treatment",
            "ace_interaction"
        };
        author = "Fluffy";
        authors[] = {"Fluffy", "MiszczuZPolski"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "CfgSounds.hpp"