private _boxNumber = missionNameSpace getVariable "endMissionNumber";
private _term = Term4;
removeAllActions _term;
[_term,1] call BIS_fnc_DataTerminalAnimate; //keyframe 1 


//Create task
private _title = "Defend The Satellite!";
private _description = "Activate the satellite array to destroy the armor commander!";
private _waypoint = "_term";
private _endMission = [BLUFOR, "Defend The Satellite!", [_description, _title, _waypoint], Term1, true] call BIS_fnc_taskCreate; //create the task (google it, it's under taskTutorial)
"Defend The Satellite!" call BIS_fnc_taskSetCurrent; //set as the current task
["Defend The Satellite!", "Defend"] call BIS_fnc_taskSetType; //set the task type

["LeadTrack01_F",0,1] call BIS_fnc_playMusic;//Play some music that lasts a while
titleText ["<t color='#ff0000' size='2'>Defend the satellite!</t>", "PLAIN DOWN", 1, true, true];  //Display a hint in the middle of screen (https://community.bistudio.com/wiki/titleText)


["LeadTrack01_F",0,1] call BIS_fnc_playMusic;//Play some music that lasts a while
/*
 *Unit Creation
 */
for "_i" from 1 to 20 do {
  private _group = createGroup east; 
//group createUnit [type, position, markers, placement, special]
  _group createUnit [
    "rhs_msv_emr_grenadier", //unit
    getMarkerPos "specop_marker1", //position
    [], 
    250, //radius from center of marker
    "can_collide" //place exactly on the marker
  ];
//groupName addWaypoint [center, radius, index, name]
  _group addWaypoint [getPos _term, 20]; //ADD A WAYPOINT
  sleep .01
};
[_term,2] call bis_fnc_dataTerminalAnimate; //keyframe 2
sleep 20;

_boxNumber = _boxNumber + 1;

[ missionConfigFile >> "CfgORBAT" >> "specop" , "mil_destroy", [1,0.1,0.1,1], 1, 1, 0, "Killed", true ] call BIS_fnc_ORBATAddGroupOverlay; sleep 5; //kll that orbat commander


[_term,3] call BIS_fnc_DataTerminalAnimate;//keyframe 3
["Defend The Satellite!", "SUCCEEDED"] call BIS_fnc_taskSetState; sleep 30; //Change the task state to succeeded

diag_log formatText["Strongpoint number %1 has been activated!", _boxNumber]; //log which box was activated

missionNameSpace setVariable ["endMissionNumber", _boxNumber]; //set the missionNameSpace variable endMissionNumber equal to boxNumber.
if (_boxNumber >= 3) then {"EveryoneWon" call BIS_fnc_endMissionServer};// End the mission if _boxNumber is greater than or equal to 3.
sleep 300;

["Defend The Satellite!"] call BIS_fnc_deleteTask; // Delete the task after it's been suceeded.