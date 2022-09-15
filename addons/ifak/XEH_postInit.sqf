#include "script_component.hpp"

[QGVAR(openBandages), LINKFUNC(open_bandage_pouch)] call CBA_fnc_addEventHandler;
[QGVAR(openInjectors), LINKFUNC(open_injector_pouch)] call CBA_fnc_addEventHandler;
[QGVAR(openMedicines), LINKFUNC(open_medicine_pouch)] call CBA_fnc_addEventHandler;