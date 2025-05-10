
_pos = getMarkerPos (_this select 0);
_dir = MarkerDir (_this select 0);
_ls = [];
_grp = _this select 2;


	_ve = createVehicle ["RHS_M2A3_BUSKI_wd",_pos, [], 10, "FORM"];
	_ve setDir _dir;
	[_ve,8,"killed"] call fnc_addStatEH;
	_ve setVehicleLock lockStatus;
	_ve setDir _dir;
	List_WE_T = List_WE_T + [_ve];
	_un = _grp createUnit ["rhsusf_usmc_marpat_wd_crewman",_pos, [], 0, "FORM"];
	_un MoveInDriver _ve;
	_ls = _ls + [_un, _ve];
	_un = _grp createUnit ["rhsusf_usmc_marpat_wd_crewman",_pos, [], 0, "FORM"];
	_un MoveInGunner _ve;
_ls = _ls + [_un];

{
_un = _grp createUnit [_x, _pos, [], 30, "FORM"];
_un MoveInCargo _ve;
_ls = _ls + [_un];
}forEach ["rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_usmc_marpat_wd_grenadier","rhsusf_usmc_marpat_wd_squadleader","rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_smaw",
"rhsusf_usmc_marpat_wd_grenadier"];
List_WE_c = List_WE_c + _ls;
_pos = getMarkerPos (_this select 1);
_grp Move _pos;
_ve setSpeedMode "LIMITED";
while {_ve distance _pos > 200} do {sleep 5;};
_dir = (getDir _ve) - 180;
{
unassignVehicle _x; 
_x setPos [((getPos _ve) select 0) + sin _dir * 3, ((getPos _ve) select 1) + cos _dir * 3];
sleep 0.5;
} forEach (units _grp) - [driver _ve, Gunner _ve];


_grp setFormation "FILE";