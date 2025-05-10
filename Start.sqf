/*
_tr = createTrigger ["EmptyDetector", [0,0,0]];
_tr setTriggerArea [0, 0, 0, false ];
_tr setTriggerActivation [ "LOGIC" , "PRESENT", true];
_tr setTriggerStatements ["Art_Stat","nl = [] Spawn Art_bumm",""];


_tr = createTrigger ["EmptyDetector", [0,0,0]];
_tr setTriggerArea [0, 0, 0, false ];
_tr setTriggerActivation [ "LOGIC" , "PRESENT", true];
_tr setTriggerStatements ["botcamp_ok","nl = [] Spawn Cret_bot_pl",""];
*/
Creat_Tent = {
	private ["_mk","_list","_nm","_tr","_tz","_pl"];
	_nm = _this select 0;
	Switch (_nm) do
	{
		case 0: {_mk = format ["B_L_%1",_this select 1]; _tr = Tr_basa0;_pl = zar6;_tz = Tr_zap6};
		case 1: {_mk = format ["B_C_%1",_this select 1]; _tr = Tr_basa1;_pl = zar7;_tz = Tr_zap7};
		case 2: {_mk = format ["B_P_%1",_this select 1]; _tr = Tr_basa2;_pl = zar8;_tz = Tr_zap8};
	};
	_vehicles = nearestObjects [_pl, ["rhs_tigr_sts_msv","rhs_t90a_tv","rhs_t72bd_tv","rhs_bmp3_msv","rhs_zsu234_aa","rhs_btr80_msv"], 30];
	_N_ps = [[0,0],[0,-9],[0,-18],[0,-27]];
	_pos = getMarkerPos _mk;
	_tr setPos _pos;
	_flag = createVehicle ["rhs_Flag_Russia_F", _pos, [], 0, "CAN_COLLIDE"];
	_pl setPos [(_pos select 0) + 12, _pos select 1];
	_a = 7;
	_blackList = [];
	{
		if(count (crew _x) == 0) then
		{
			_pos_safe = [[(_pos select 0) + 12 + _a, _pos select 1], 0, 50, 6, 0, 1, 0, _blackList, [[(_pos select 0) + 12 + _a, _pos select 1],[(_pos select 0) + 12 + _a, _pos select 1]]] call BIS_fnc_findSafePos;
			_x setPos _pos_safe;
			_blackList = _blackList + [[_pos_safe, 6]];
		};
		_a = _a + 7;
	} foreach _vehicles;
	_tz setPos [(_pos select 0) + 12, _pos select 1];
	_list = List_Pal select _nm;
	_a = 0;
	{
		_ps = _N_ps select _a;
		_psp = [(_pos select 0) + (_ps select 0),(_pos select 1) + (_ps select 1)];
		_pos_safe = [_psp, 0, 50, 5, 0, 1, 0, _blackList, [_psp,_psp]] call BIS_fnc_findSafePos;
		List_Pos set [_x , _pos_safe];
		_blackList = _blackList + [[_pos_safe, 5]];
		List_Dir set [_x , 90];
		List_Resp set [_x , 3];
		Q_ret set [_x,1];
		_a = _a + 1;
	} forEach _list;
	Switch (_nm) do {
		case 0: {_mk = format ["B_L_%1_%1",_this select 1];};
		case 1: {_mk = format ["B_C_%1_%1",_this select 1];};
		case 2: {_mk = format ["B_P_%1_%1",_this select 1];};
	};
	_N_ps = [[0,6],[0,0],[0,-6]];
	_pos = getMarkerPos _mk;
	_list = List_Pal2 select _nm;
	_a = 0;
	{
		_ps = _N_ps select _a;
		_psp = [(_pos select 0) + (_ps select 0),(_pos select 1) + (_ps select 1)];
		_pos_safe = [_psp, 0, 50, 6, 0, 1, 0, _blackList, [_psp,_psp]] call BIS_fnc_findSafePos;
		List_Pos set [_x , _pos_safe];
		_blackList = _blackList + [[_pos_safe, 6]];
		List_Dir set [_x , 90];
		List_Resp set [_x , 3];
		Q_ret set [_x,1];
		_a = _a + 1;
	} forEach _list;
	_a = _nm * 3;
	_list = PointE select _nm;
	{
		_veh = List_Bus select _a;
		_n = List_All find _veh;
		_pos_safe = [getMarkerPos _x, 0, 50, 6, 0, 1, 0, _blackList, [getMarkerPos _x,getMarkerPos _x]] call BIS_fnc_findSafePos;
		List_Pos set [_n, _pos_safe];
		_blackList = _blackList + [[_pos_safe, 6]];
		List_Resp set [_n, 3];
		Q_ret set [_n,1];
		_a = _a + 1;
	} forEach _list;
};

othod = {
	_pos = [];
	Switch (_this select 0) do {
		case 0: {_pos = getMarkerPos ((PointL select (ActL + 1)) select 0)};
		case 1: {_pos = getMarkerPos ((PointC select (ActC + 1)) select 0)};
		case 2: {_pos = getMarkerPos ((PointP select (ActP + 1)) select 0)};
	};
	{
		if (alive _x) then {
		if (side _x == EAST) then {
			_x addScore 5;
			[vehicle _x] Spawn {
				if((_this select 0) in allPlayers) then {
					[7] remoteExec ["fnc_addStat",_this select 0];
				}
			};
			};
		if (side _x == WEST) then {_x Move _pos};
		};
		Sleep 1;
	} forEach (_this select 1);
};

raport = {
	_ln = _this select 0;
	_ak = _this select 1;
	Num_Siti set [_ln, [true, true, true]];
	Act_para set [_ln, [true, true, true]];
	_as = [_ln] execVM "Garnizon\Random.sqf";
	Fli_WH = true;
	Fli_WC = true;	
	[_ln, _ak] Spawn Creat_Tent;
	[4,_ak + 1,_ln] remoteExec ["fnc_textInf"];
	[_ln] Spawn Creat_bots;
	Act_num = _ln;
	sleep 2;	
	Act = true;	
};

fnc_addStatEH = {
	params["_veh","_val","_ev"];
	_EH = _veh addEventHandler [_ev, compile format ["if((_this select 1) in allPlayers) then {[%1] remoteExec [""fnc_addStat"", _this select 1];};",_val]];
};

u_n = [];
List_WE_B = [];
List_WE_T = [];
List_WE_C = [];
List_Ea_B = [];
SEQ = createCenter East;
SWQ = createCenter West;
SHQ = createCenter civilian;
_as = [] execVM "Sys\Cargo200.sqf";
_as = [] execVM "Garnizon\ArtPost.sqf";
sleep 1;
_as = [] execVM "Garnizon\Bots.sqf";
sleep 1;
_as = [] execVM "Garnizon\Avia.sqf";
sleep 3;
[0] Spawn Creat_bots;
sleep 6;
Act_num = 0;
Act = true;
[1] Spawn Creat_bots;
sleep 6;
Act_num = 1;
Act = true;
[2] Spawn Creat_bots;
_as = [2] execVM "Garnizon\Random.sqf";
sleep 3;
Act_num = 2;
Act = true;
[] Spawn Luf0_ded;
[] Spawn Off_camp_re;
{
	(format ["CC_%1",_x]) setMarkerSize [0,0];
	(format ["general_%1",_x]) setMarkerSize [0,0];
} forEach [0,1,2];
{
	(format ["B_L_%1",_x]) setMarkerSize [0,0];
	(format ["B_L_%1_%1",_x]) setMarkerSize [0,0];
	(format ["B_C_%1",_x]) setMarkerSize [0,0];
	(format ["B_C_%1_%1",_x]) setMarkerSize [0,0];
	(format ["B_P_%1",_x]) setMarkerSize [0,0];
	(format ["B_P_%1_%1",_x]) setMarkerSize [0,0];
} forEach [0,1,2,3,4,5,6,7,8,9,10];

Fli_WC = true;
Fli_WH = true;
Act_para = [[true, true],[true, true],[true, true, true]];
Num_Siti = [[true, true],[true, true],[true, true, true]];
_a = 0;
_b = 0;
_con = 0;
_Ncon = [];
_L_tup = 0;
_C_tup = 0;
_P_tup = 0;
_Ln = 7;
_Cn = 6;
_Pn = 9;
_mks = [];
_list = [];
_siti = [];
_nm_pr = [];
While {true} do {
	_a = 0;
	While {_a < 3} do {
		_siti = At_sit select _a;
		_Ncon = Num_Siti select _a;
		_con = count _siti;
		_nm_pr = Act_para select _a;
		_b = 0;
		While {_b < (count _siti)} do {
			if (_Ncon select _b) then {
				_mks = getMarkerPos (_siti select _b);
				_list = _mks nearEntities [["Man","Tank","Car"],300];
				if ((WEST countSide _list) < 18 && (_nm_pr select _b)) then {
					[_a,_b,_mks] Spawn Paras;
					_nm_pr set [_b, false];
					Act_para set [_a, _nm_pr];
				}; 
				if ((WEST countSide _list) < 4) then {
					_Ncon set [_b, false];
					Num_Siti set [_a, _Ncon];
					deleteMarker (format ["QS_%1_%2",_a,_b]);
					deleteMarker (format ["QW_%1_%2",_a,_b]);
					deleteMarker (format ["QL_%1_%2",_a,_b]);
					Slids = Slids - [format ["QL_%1_%2",_a,_b],format ["QW_%1_%2",_a,_b],format ["QS_%1_%2",_a,_b]];
					sleep 1;
					_list = _mks nearEntities [["Man","Tank","Car","Air"],550];
					[_a, _list] Spawn othod;
				};
				if ((EAST countSide _list) > 0) then {
					if (Fli_WH) then {Fli_WH = false;[_mks] Spawn Fli_Herie;};
					if (Fli_WC) then {Fli_WC = false;[_a] Spawn Fli_cobra;};
				};
				sleep 10;
			} else {
				_con = _con - 1;
			};
		_b = _b + 1;
		};	
	if (_con == 0) then {
		Switch (_a) do {
			case 0: {
				Switch (ActL) do {
					case 1 : {_as = [0,0] execVM "Garnizon\Point_CC.sqf";};
					case 2 : {_as = [0, 3] execVM "Garnizon\Kolona.sqf";};
					case 3 : {"CC_0" setMarkerSize [0,0];};
					case 4 : {_as = [0, 5] execVM "Garnizon\Kolona.sqf";};
					case 5 : {
						_as = [0] execVM "Updat\Add_Avi.sqf";
						_as = [0,3] execVM "Garnizon\Point_general.sqf";
					};
					case 6 : {"general_0" setMarkerSize [0,0];};
					case 7 : {_L_tup = 1;};
				};
				PointE set [0, PointL select ActL];
				if (ActL < _Ln) then {
					if (ActL > 2) then {};
					[0,ActL] Spawn raport;
					ActL = ActL + 1;
					profileNamespace setVariable ["war3front_actl",ActL];
					At_sit set [0,PointL select ActL];
				};
			};	 
			case 1: {
				Switch (ActC) do {
					case 0 : {_as = [1, 1] execVM "Garnizon\Kolona.sqf";};
					case 1 : {_as = [1, 2] execVM "Garnizon\Kolona.sqf";};
					case 2 : {};
					case 3 : {};
					case 5 : {_as = [1,1] execVM "Garnizon\Point_CC.sqf"};
					case 6 : {
						if(_C_tup == 0) then {_as = [1,4] execVM "Garnizon\Point_general.sqf";
						"CC_1" setMarkerSize [0,0];
						"general_1" setMarkerSize [0,0];};
						_C_tup = 1;
					};
				};
				PointE set [1, PointC select ActC];
				if (ActC < _Cn) then {
					if (ActC > 2) then {};
					[1,ActC] Spawn raport;
					ActC = ActC + 1;
					profileNamespace setVariable ["war3front_actc",ActC];
					At_sit set [1,PointC select ActC];
				};
			};
			case 2: {
				Switch (ActP) do {
					case 1 : {_as = [1] execVM "Updat\Add_Avi.sqf";};
					case 2 : {_as = [2, 3] execVM "Garnizon\Kolona.sqf";};
					case 3 : {};
					case 4 : {_as = [2, 5] execVM "Garnizon\Kolona.sqf";};
					case 5 : {_as = [2,5] execVM "Garnizon\Point_general.sqf";};
					case 6 : {};
					case 7 : {"general_2" setMarkerSize [0,0]};
					case 8 : {_as = [2, 8] execVM "Garnizon\Kolona.sqf";};
					case 9 : {_P_tup = 1;};
					case 10: {};
					case 11 : {_as = [2,2] execVM "Garnizon\Point_CC.sqf"};
				};
				PointE set [2, PointP select ActP];
				if (ActP < _Pn) then {
					if (ActP > 2) then {};
					[2,ActP] Spawn raport;
					ActP = ActP + 1;
					profileNamespace setVariable ["war3front_actp",ActP];
					At_sit set [2,PointP select ActP];
				};
			};
		};
	};
	sleep 20;
	_a = _a + 1;
	};
	if (_L_tup == 1 && _C_tup == 1 && _P_tup == 1) then {_Ln = 8;_Cn = 8;_Pn = 11;};
	if (ActL == 8 && ActC == 8 && ActP == 11) exitWith {
		sleep 10;
		End_game = true;
		publicVariable "End_game";
	};
};
