#include "..\script_component.hpp"
/*
 * Author: YetheSamartaka
 * Ensures proper initial values reset on respawn
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Dead Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, corpse] call kat_airway_fnc_handleRespawn;
 *
 * Public: No
 */

params ["_unit","_dead"];
TRACE_2("handleRespawn",_unit,_dead);

[_unit] call FUNC(fullHealLocal);
KAT_forceWakeup = false;
