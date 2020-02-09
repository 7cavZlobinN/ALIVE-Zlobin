SERVER_DeleteWeaponHolders =
{
    params ["_center", "_a", "_b", "_angle", "_isRectangle", "_c"];

    {
        deleteVehicle _x;
    } forEach (nearestObjects [_center, ["WeaponHolder"], sqrt (_a*_a + _b*_b)]) inAreaArray [_center, _a, _b, _angle, _isRectangle, _c];
};