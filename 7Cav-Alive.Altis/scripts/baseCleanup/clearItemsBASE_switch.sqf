CLIENT_BaseCleanup = {
	private _headquartersArea = triggerArea headquarters;
	{ deleteVehicle _x } forEach (allDeadMen inAreaArray headquarters);
	([getPos headquarters] + _headquartersArea) remoteExec ["SERVER_DeleteWeaponHolders", 2];
};

/*
CLIENT_BaseCleanup = {
	private _headquartersArea = triggerArea headquarters;
	{ deleteVehicle _x } forEach (allDeadMen inAreaArray headquarters);
	([getPos headquarters] + _headquartersArea) remoteExec ["SERVER_DeleteWeaponHolders", 2];
};
*/