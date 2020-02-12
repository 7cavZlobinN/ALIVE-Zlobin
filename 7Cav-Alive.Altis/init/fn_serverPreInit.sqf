if (not isServer && hasInterface) exitWith {};

#include "\serverscripts\zeusserverscripts\secretKey.sqf" //Includes the zeus security key.sqf so we can reference it for zeus IDs
#include "..\scripts\client\clearItemsBASE_switch.sqf" //Base script
#include "..\scripts\server\deleteWeaponHolder.sqf" //Includes the deleteWeaponHolder script so everything can reference it 

missionNamespace setVariable["LOYALTY_CIPHER", CIPHERSECRETKEY, true]; //variable init for loyalty cipher
missionNamespace setVariable["endMissionNumber",0]; //Variable init for missionEnd scripts located in scripts/missionEnd

[] execVM "scripts\server\curator.sqf";
[] execVM "scripts\client\cleanUpLoop.sqf"; 