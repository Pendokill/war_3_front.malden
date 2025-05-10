
_ln = _this select 0;
_si = _this select 1;

While {(Act_para select _ln) select 0} do {sleep 60;hint "OK";};
sleep 20;
_siti = [];
_Pos = [];
_dir = 0;
_grl = [];
_ls = [];


Switch (_ln) do {
	case 0 :{
	_grl = Grp_B00;	
	_pos = GetMarkerPos (format ["W_l_%1",_si]);
	_dir = MarkerDir (format ["W_l_%1",_si]);
};
	case 1 :{
	_grl = Grp_B10;
	_pos = GetMarkerPos (format ["W_c_%1",_si]);
	_dir = MarkerDir (format ["W_c_%1",_si]);
};
	case 2 :{
	_grl = Grp_B20;
	_pos = GetMarkerPos (format ["W_p_%1",_si]);
	_dir = MarkerDir (format ["W_p_%1",_si]);
};
};
 
_grp = _grl select 0;
	_ve = createVehicle ["rhsusf_M977A4_usarmy_wd",_pos, [], 0, "FORM"];
	[_ve,8,"killed"] call fnc_addStatEH;
	_ve setVehicleLock lockStatus;
	_ve setDir _dir;
	List_WE_T = List_WE_T + [_ve];
	_un = _grp createUnit ["rhsusf_usmc_marpat_wd_crewman",_pos, [], 0, "FORM"];
	_un MoveInDriver _ve;
	_ls = [_un];
{
	_un = _grp createUnit ["rhsusf_usmc_marpat_wd_crewman",_pos, [], 0, "FORM"];
	_un MoveInCargo _ve;
	_ls = _ls + [_un];
} forEach Bot_otr_A;
List_WE_b = List_WE_b + _ls;
Sleep 10;
_grp = _grl select 1;
	_ve = createVehicle ["rhsusf_M977A4_REPAIR_usarmy_wd",_pos, [], 0, "FORM"];
	[_ve,8,"killed"] call fnc_addStatEH;
	_ve setVehicleLock lockStatus;
	_ve setDir _dir;
	List_WE_T = List_WE_T + [_ve];
	_un = _grp createUnit ["rhsusf_usmc_marpat_wd_crewman",_pos, [], 0, "FORM"];
	_un MoveInDriver _ve;
	List_WE_b = List_WE_b + [_un];
Sleep 10;
_grp = _grl select 2;
	_ve = createVehicle ["rhsusf_M977A4_AMMO_usarmy_wd",_pos, [], 0, "FORM"];
	[_ve,8,"killed"] call fnc_addStatEH;
	_ve setVehicleLock lockStatus;
	_ve setDir _dir;
	List_WE_T = List_WE_T + [_ve];
	_un = _grp createUnit ["rhsusf_usmc_marpat_wd_crewman",_pos, [], 0, "FORM"];
	_un MoveInDriver _ve;
	List_WE_b = List_WE_b + [_un];
	
	