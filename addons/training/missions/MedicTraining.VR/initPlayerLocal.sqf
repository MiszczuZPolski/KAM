#include "script_component.hpp"

[{!isNull (missionNamespace getVariable ["laptop", objNull])}, {
    laptop addAction ["<t color='#00FF00'>[Patient] Spawn: Healthy</t>", {
        params ["_target", "_caller"];
        [0] call FUNC(createPatient);
        [format ["%1 spawned healthy patient.", name _caller]] remoteExecCall ["systemChat", 0];
    }, nil, 1.5, true, true, "", "!kat_training_spawned", 5];

    laptop addAction ["<t color='#FFCC00'>[Patient] Spawn: Random Injuries</t>", {
        params ["_target", "_caller"];
        [1] call FUNC(createPatient);
        [format ["%1 spawned an injured patient.", name _caller]] remoteExecCall ["systemChat", 0];
    }, nil, 1.5, true, true, "", "!kat_training_spawned", 5];



    laptop addAction ["<t color='#FF6600'>[Patient] Add: Random Damage</t>", {
        params ["_target", "_caller"];
        private _patient = missionNamespace getVariable ["kat_training_lastPatient", objNull];
        if (!alive _patient) exitWith {
            [format ["%1 - No living patient!", name _caller]] remoteExecCall ["systemChat", _caller];
        };

        private _selections = ["body", "head", "hand_r", "hand_l", "leg_r", "leg_l"];
        private _damageTypes = ["grenade", "stab", "bullet", "falling"];
        private _count = 2 + floor random 5;
        for "_i" from 1 to _count do {
            private _sel = selectRandom _selections;
            private _dmg = 0.5 + random 0.5;
            private _type = selectRandom _damageTypes;
            [_patient, _dmg, _sel, _type] call ace_medical_fnc_addDamageToUnit;
        };
        [format ["%1 added %2 random injuries.", name _caller, _count]] remoteExecCall ["systemChat", 0];
    }, nil, 1.5, true, true, "", "kat_training_spawned", 5];

    laptop addAction ["<t color='#FF0000'>[Patient] Delete patient</t>", {
        params ["_target", "_caller"];
        private _patient = missionNamespace getVariable ["kat_training_lastPatient", objNull];
        if (!isNull _patient) then {
            deleteVehicle _patient;
        };

        kat_training_spawned = false;
        publicVariable "kat_training_spawned";
        [format ["%1 deleted the patient.", name _caller]] remoteExecCall ["systemChat", 0];
    }, nil, 1.5, true, true, "", "kat_training_spawned", 5];
}] call CBA_fnc_waitUntilAndExecute;
