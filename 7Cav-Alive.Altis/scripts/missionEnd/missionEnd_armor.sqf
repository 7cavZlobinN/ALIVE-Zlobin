/*
Term1 addaction ["<t color='#ff0000'>Activate The Box!!</t>", "scripts/missionEnd/missonEnd.sqf"];
Term2 addaction ["<t color='#ff0000'>Activate The Box!!</t>", "scripts/missionEnd/missonEnd.sqf"];
Term3 addaction ["<t color='#ff0000'>Activate The Box!!</t>", "scripts/missionEnd/missonEnd.sqf"];
Term4 addaction ["<t color='#ff0000'>Activate The Box!!</t>", "scripts/missionEnd/missonEnd.sqf"];
*/
//Set a variable in the missionNameSpace to EndMissionNumber and set boxNumber equal to it.
//We do this so that, if a previous 
private _boxNumber = missionNameSpace getVariable "endMissionNumber";

//Task Params
private _title = "Defend The Satellite!";
private _description = "Activate the sattellite array to destroy the armor commander!";
private _waypoint = "Term2";

//task endMission titled Defend the Satellite, created and assigned
private _endMission = [BLUFOR, "Defend The Satellite!", [_description, _title, _waypoint], Term1, true] call BIS_fnc_taskCreate; //create the task (google it, it's under taskTutorial)
"Defend The Satellite!" call BIS_fnc_taskSetCurrent; //set as the current task
["Defend The Satellite!", "Defend"] call BIS_fnc_taskSetType; //set the task type

[Term1,3] call bis_fnc_dataTerminalAnimate; //Animate the terminal
["EventTrack01a_F_Tacops",0,1] call BIS_fnc_playMusic; sleep 2; //Play some music that lasts roughly 35 seconds

titleText ["<t color='#ff0000' size='2'>Defend the satellite!</t>", "PLAIN DOWN", 1, true, true];  //Display a hint in the middle of screen (https://community.bistudio.com/wiki/titleText)
_boxNumber = _boxNumber + 1;

[3] call bis_fnc_earthquake; sleep 15; // earthquake at 1,2,3,4 intensity

//[ missionConfigFile >> "CfgORBAT" >> "air" , "mil_destroy", [1,0.1,0.1,0.5], 1, 1, 0, "Destroyed", true ] call BIS_fnc_ORBATAddGroupOverlay; sleep 1; //kll that orbat commander
[ missionConfigFile >> "CfgORBAT" >> "armor" , "mil_destroy", [1,0.1,0.1,0.5], 1, 1, 0, "Killed", true ] call BIS_fnc_ORBATAddGroupOverlay; sleep 1; //kll that orbat commander
//[ missionConfigFile >> "CfgORBAT" >> "mech" , "mil_destroy", [1,0.1,0.1,0.5], 1, 1, 0, "Killed", true ] call BIS_fnc_ORBATAddGroupOverlay; sleep 1; //kll that orbat commander
//[ missionConfigFile >> "CfgORBAT" >> "specop" , "mil_destroy", [1,0.1,0.1,0.5], 1, 1, 0, "Killed", true ] call BIS_fnc_ORBATAddGroupOverlay; sleep 1; //kll that orbat commander

["Defend The Satellite!", "SUCCEEDED"] call BIS_fnc_taskSetState; sleep 20; //Change the task state to succeeded

["Defend The Satellite!"] call BIS_fnc_deleteTask; // Delete the task after it's been suceeded.
diag_log formatText["Strongpoint number %1 has been activated!", _boxNumber]
missionNameSpace setVariable ["endMissionNumber", _boxNumber]; //set the missionNameSpace variable endMissionNumber equal to boxNumber.
if (_boxNumber >= 3) then {"EveryoneWon" call BIS_fnc_endMissionServer};// End the mission if _boxNumber is greater than or equal to 3.