
_pos = getMarkerPos (_this select 0);
_dir = MarkerDir (_this select 0);
_ls = [];
_grp = _this select 2;

{
	_ve = createVehicle ["HMMWV_M2",_pos, [], 10, "FORM"];
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

} foreach [0,0];
_grp setFormation "STAG COLUMN";
_grp Move getMarkerPos (_this select 1);
List_WE_c = List_WE_c + _ls;