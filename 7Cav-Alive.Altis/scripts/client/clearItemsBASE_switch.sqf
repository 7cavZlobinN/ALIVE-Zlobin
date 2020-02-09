private _headquartersArea = triggerArea headquarters; //headquarts area
{ deleteVehicle _x } forEach (allDeadMen inAreaArray headquarters); //Deletes bodies in headquarts area
([getPos headquarters] + _headquartersArea) remoteExec ["SERVER_DeleteWeaponHolders", 2]; //Deletes magizines on the ground in headquarts area