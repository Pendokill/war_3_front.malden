Bot_otr_L = ["rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_usmc_marpat_wd_grenadier","rhsusf_usmc_marpat_wd_squadleader","rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_smaw",
"rhsusf_usmc_marpat_wd_smaw","rhsusf_usmc_recon_marpat_wd_grenadier_m32","rhsusf_usmc_marpat_wd_stinger","rhsusf_usmc_marpat_wd_jfo","rhsusf_usmc_marpat_wd_autorifleman"];
Bot_otr_A = ["rhsusf_usmc_marpat_wd_grenadier","rhsusf_usmc_marpat_wd_grenadier","rhsusf_usmc_marpat_wd_squadleader","rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_smaw"];
Bronia0 = ["rhsusf_M1117_W", "rhsusf_CGRCAT1A2_Mk19_usmc_wd"];
Bronia1 = ["rhsusf_m1a1hc_wd", "rhsusf_m966_w", "rhsusf_stryker_m1126_m2_wd", "rhsusf_M1117_W"];
Bronia2 = ["rhsusf_m1a1aim_tuski_wd", "rhsusf_m966_w", "RHS_M6_wd", "rhsusf_CGRCAT1A2_Mk19_usmc_wd", "rhsusf_m113_usarmy_MK19_90", "rhsusf_stryker_m1126_m2_wd"];
Bronia3 = ["rhsusf_m1a1aim_tuski_wd", "RHS_M2A3_BUSKI_wd", "rhsusf_M1117_W", "RHS_M2A3_BUSKI_wd","rhsusf_m1a1aim_tuski_wd", "rhsusf_m113_usarmy_MK19","rhsusf_M1117_W", "rhsusf_stryker_m1126_m2_wd"];
Grp_CC = [];
Grp_CA = [];
Grp_AA = [];
Grp_All = [];
Grp_B00 = [];
Grp_B01 = [];
Grp_B10 = [];
Grp_B11 = [];
Grp_B20 = [];
Grp_B21 = [];
Grp_B22 = [];

_a = 0;
While {_a < 7} do {
	_g0 = createGroup West;
	_g1 = createGroup West;
	_g2 = createGroup West;
	_g3 = createGroup West;
	Switch (_a) do {
		case 0 :{ Grp_B00 = [_g0,_g1,_g2,_g3];};
		case 1 :{ Grp_B10 = [_g0,_g1,_g2,_g3];};
		case 2 :{ Grp_B20 = [_g0,_g1,_g2,_g3];};
		case 3 :{ Grp_B01 = [_g0,_g1,_g2,_g3];};
		case 4 :{ Grp_B11 = [_g0,_g1,_g2,_g3];};
		case 5 :{ Grp_B21 = [_g0,_g1,_g2,_g3];};
		case 6 :{ Grp_B22 = [_g0,_g1,_g2,_g3];};
	};
	_a = _a + 1;
};



{
	_g0 = createGroup West;
	_g1 = createGroup West;
	_g2 = createGroup West;
	Grp_CC = Grp_CC + [[_g0,_g1,_g2]];
	_g0 = createGroup West;
	_g1 = createGroup West;
	_g2 = createGroup West;
	Grp_CA = Grp_CA + [[_g0,_g1,_g2]];
	_g0 = createGroup West;
	_g1 = createGroup West;
	_g2 = createGroup West;
	Grp_AA = Grp_AA + [[_g0,_g1,_g2]];
} forEach [0,1,2];

grp_R0 = createGroup West;
grp_R1 = createGroup West;
grp_R2 = createGroup West;
grp_R3 = createGroup West;
grp_R4 = createGroup West;
grp_R5 = createGroup West;
grp_R6 = createGroup West;
grp_R7 = createGroup West;
gr_av0 = createGroup West;
gr_av1 = createGroup West;
gr_av2 = createGroup West;
gr_av3 = createGroup West;

gr_avE = createGroup EAST;
recrut = createGroup EAST;






Creat_bots = {
	_grp_siti = [];
	_sit_ln = [];
	_grp_ln = [];
	_brig = [];
	_pos = [];
	_ls =  [];
	_grp = "";
	_un = "";
	_ve = "";
	_skop = 0;
	_a = 0;
	_b = 0;
	_c = 0;
	_Ln = 0;
	_xp = 0;
	_yp = 0;
	_dir = 0;
	_con = 0;
	sleep 0.5;
	Switch (_this select 0) do {
		case 0 :{_grp_ln = [Grp_B00,Grp_B01];_sit_ln = At_sit select 0;};
		case 1 :{_grp_ln = [Grp_B10,Grp_B11];_sit_ln = At_sit select 1;};
		case 2 :{_grp_ln = [Grp_B20,Grp_B21,Grp_B22];_sit_ln = At_sit select 2;};
	};
	_a = 0;
	While {_a < count _sit_ln} do {
		_grp_siti = _grp_ln select _a;
		_skop = ((toArray (_sit_ln select _a)) select 2) - 44;
		_pos = GetMarkerPos (_sit_ln select _a);
		_b = 0;
		_xp = _pos select 0;
		_yp = _pos select 1;
		While {_b < 3} do {
			_grp1 = _grp_siti select _b;
			_grp = createGroup west;
			sleep 1;
			_c = 0;
			While {_c < _skop} do {
				_un = _grp createUnit [Bot_otr_L select (random 9),[(_pos select 0) - 150 + random 300,(_pos select 1) - 150 + random 300,0], [], 30, "FORM"];
				_ls = _ls + [_un];
				_c = _c + 1;
			};
			_un = _grp createUnit ["rhsusf_usmc_recon_marpat_wd_officer",[(_pos select 0) - 150 + random 300,(_pos select 1) - 150 + random 300,0], [], 50, "FORM"];
			_grp selectLeader _un;
			List_WE_b = List_WE_b + _ls + [_un];
			_b = _b + 1;
			sleep 1;
			[_grp,0] setWpPos [_xp,_yp];
			for "_i" from count waypoints _grp - 1 to 0 step -1 do
			{
				deleteWaypoint [_grp, _i];
			};
			[_grp,0] setWpPos [_xp,_yp];
			{
				_dir = random 360;
				_ps = [_xp + (sin _dir) * ((random 50)+60),_yp + (cos _dir) * ((random 50)+60),0];
				if(_x == 1) then {_grp move _ps;};
				_wp = _grp addWaypoint [_ps, 0];
				_wp setWaypointBehaviour "SAFE";
			} forEach [1,2,3,4,5];
			[_grp,4] setWaypointType "CYCLE";
			units _grp1 join _grp;
			deleteGroup _grp1;
			compile format ["Grp_B%1%2 set [_b,_grp];",(_this select 0),_a];
		};
		_brig = [];
		Switch (_skop) do {
			case 5: {_brig = Bronia0};
			case 6: {_brig = Bronia1};
			case 7: {_brig = Bronia2};
		};
		_dir = 0;
		_xpv = _xp - 100 + random 200;
		_ypv = _yp - 100 + random 200;
		_grp1 = _grp_siti select _b;
		_grp = createGroup west;
		_b1 = _b;
		sleep 1;
		_b = 0;
		_blackList = [];
		While {_b < (count _brig)} do {
			_pos_safe = [[_xpv, _ypv], 0, 75, 6, 0, 1, 0, _blackList, [[_xpv, _ypv],[_xpv, _ypv]]] call BIS_fnc_findSafePos;
			_blackList = _blackList + [[_pos_safe, 6]];
			_ve = createVehicle [_brig select _b,_pos_safe, [], 50, "CAN_COLLIDE"];
			_ve setVehicleLock lockStatus;
			List_WE_T = List_WE_T + [_ve];
			_un = _grp createUnit ["rhsusf_usmc_marpat_wd_crewman",[_xpv,_ypv], [], 0, "FORM"];
			_un MoveInDriver _ve;
			_ls = [_un];
			_un = _grp createUnit ["rhsusf_usmc_marpat_wd_crewman",[_xpv,_ypv], [], 0, "FORM"];
			_un MoveInGunner _ve;
			_ls = _ls + [_un];
			if ((_brig select _b) in ["rhsusf_m1a1aim_tuski_wd","rhsusf_M1117_W"]) then {
			[_ve,5,"killed"] call fnc_addStatEH;
			_un = _grp createUnit ["rhsusf_usmc_marpat_wd_crewman",[_xpv,_ypv], [], 0, "FORM"];
			_un MoveInCommander _ve;
			List_WE_C = List_WE_C + _ls + [_un];
			};
			if ((_brig select _b) in ["RHS_M2A3_BUSKI_wd","rhsusf_M977A4_usarmy_wd","rhsusf_m966_w"]) then {
			[_ve,5,"killed"] call fnc_addStatEH;
			};
			_b = _b + 1;
			sleep 1;
		};
		[_grp,0] setWpPos [_xp,_yp];
		for "_i" from count waypoints _grp - 1 to 0 step -1 do
		{
			deleteWaypoint [_grp, _i];
		};
		[_grp,0] setWpPos [_xp,_yp];
		{
			_dir = random 360;
			_ps = [_xp + (sin _dir) * ((random 50)+60),_yp + (cos _dir) * ((random 50)+60),0];
			if(_x == 1) then {_grp move _ps;};
			_wp = _grp addWaypoint [_ps, 0];
			_wp setWaypointSpeed "LIMITED";
		} forEach [1,2,3,4,5];
		[_grp,4] setWaypointType "CYCLE";
		units _grp1 join _grp;
		deleteGroup _grp1;
		compile format ["Grp_B%1%2 set [_b1,_grp];",(_this select 0),_a];
		_grp selectLeader _un;
		sleep 1;
		[_pos,_grp,_skop] spawn {
			_pos = _this select 0;
			_grp = _this select 1;
			_xp = _pos select 0;
			_yp = _pos select 1;
			_sk = (_this select 2) - 5;
			private["_un"];
			While {count (units _grp) > 7} do {sleep 60};
			_ps = [(_pos select 0) - 150 + random 300,(_pos select 1) - 150 + random 300];
			_c = 0;
			_blackList = [];
			While {_c < _sk} do {
				_pos_safe = [[_ps select 0, _ps select 1], 0, 75, 6, 0, 1, 0, _blackList, [[_ps select 0, _ps select 1],[_ps select 0, _ps select 1]]] call BIS_fnc_findSafePos;
				_blackList = _blackList + [[_pos_safe, 6]];
				_ve = createVehicle [Bronia3 select _c,_pos_safe, [], 50, "CAN_COLLIDE"];
				_ve setVehicleLock lockStatus;
				List_WE_T = List_WE_T + [_ve];
				if ((Bronia3 select _c) == "rhsusf_m1a1aim_tuski_wd") then {
					[_ve,5,"killed"] call fnc_addStatEH;
				} else {
					[_ve,8,"killed"] call fnc_addStatEH;
				};
				_un = _grp createUnit ["rhsusf_usmc_marpat_wd_crewman",_ps, [], 0, "FORM"];
				_un MoveInDriver _ve;
				_ls = [_un];
				_un = _grp createUnit ["rhsusf_usmc_marpat_wd_crewman",_ps, [], 0, "FORM"];
				_un MoveInGunner _ve;
				_ls = _ls + [_un];
				_un = _grp createUnit ["rhsusf_usmc_marpat_wd_crewman",_ps, [], 0, "FORM"];
				_un MoveInCommander _ve;
				List_WE_C = List_WE_C + _ls + [_un];
				_c = _c + 1;
			};
			if(_sk > 0) then {
				_grp selectLeader _un;
			};
		};
		_a =_a + 1;
	};
};

Off_camp_re = {
	_un = "";
	sleep 5;
	Ru_s_of = recrut createUnit ["rhs_vdv_flora_officer", getPos botcamp, [],0, "FORM"];
	Ru_s_of disableAI "MOVE";
	Ru_s_of allowDamage false;
	Ru_s_of switchMove "Acts_CivilStand_Default";
	Ru_s_of enableSimulationGlobal false;
};

fnc_askCreateAI = {
	params["_owner","_list"];
	private ["_gr","_ls"];
	_gr = Group _owner;
	_ls = [];
	{
		Sleep 0.5;
		_un = _gr createUnit [Mi_tach_bot select _x, getPos botcamp, [], 3, "FORM"];
		if(isClass (configFile >> "cfgPatches" >> "SeamanRadioVoices")) then
		{
			[_un, format ["Male0%1A1RU",(floor (random 8))+1]] remoteExec ["setSpeaker", 0, _un];
		};
		_ls = _ls + [_un];
	} foreach _list;
	List_WE_C = List_WE_C + _ls;
	[_ls] remoteExec ["fnc_ansCreateAI", _owner];
};