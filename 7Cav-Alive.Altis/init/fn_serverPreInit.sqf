if (not isServer && hasInterface) exitWith {};

#include "\serverscripts\zeusserverscripts\secretKey.sqf" //Includes the zeus security key.sqf so we can reference it for zeus IDs
#include "..\scripts\server\baseCleanup.sqf" //Includes the baseCleanup script so everything can reference it 

missionNamespace setVariable["LOYALTY_CIPHER", CIPHERSECRETKEY, true]; //variable init for loyalty cipher
missionNamespace setVariable["endMissionNumber",0]; //Variable init for missionEnd scripts located in scripts/missionEnd

//Initial Task Creation for all strongpoints
//Airfield
private _endMission = [BLUFOR, "Deactivate the Airfield!" Term1, ["Deactivate the satellite to prevent the enemy air commander from being able to call in air strikes!" _target, "Defend The Satellite!", "_target"], Term1, true] call BIS_fnc_taskCreate; //create the task (google it, it's under taskTutorial)
["Deactivate the Airfield!", "Attack"] call BIS_fnc_taskSetType;

//Armor
private _endMission = [BLUFOR, "Deactivate the Armored Corps!" Term2, ["Deactivate the satellite to prevent the enemy armored commander from being able to call in armored support!" _target, "Defend The Satellite!", "_target"], Term1, true] call BIS_fnc_taskCreate; //create the task (google it, it's under taskTutorial)
["Deactivate the Armored Corps", "Attack"] call BIS_fnc_taskSetType;

//Mechanized
private _endMission = [BLUFOR, "Deactivate the Mechanized Corps!" Term3, ["Deactivate the satellite to prevent the enemy mechanized infantry commander from being able to call in mechanized infantry support!" _target, "Defend The Satellite!", "_target"], Term1, true] call BIS_fnc_taskCreate; //create the task (google it, it's under taskTutorial)
["Deactivate the Mechanized Corps!",  "Attack"] call BIS_fnc_taskSetType;

//Special Operations
private _endMission = [BLUFOR, "Deactivate the Specops headquarters!" Term4, ["Deactivate the satellite to prevent the enemy special operations commander from being able to sabotage our efforts!" _target, "Defend The Satellite!", "_target"], Term1, true] call BIS_fnc_taskCreate; //create the task (google it, it's under taskTutorial)
["Deactivate the Specops headquarters!", "Attack"] call BIS_fnc_taskSetType;

[] execVM "scripts\server\curator.sqf";