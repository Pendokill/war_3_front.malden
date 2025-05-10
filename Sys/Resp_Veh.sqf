
List_All = nearestObjects [(getMarkerPos "Base"),["Fort_RazorWire","Air","Ship","LandVehicle","RU_WarfareBFieldhHospital","RU_WarfareBUAVterminal","Land_CamoNetB_EAST"],400];
List_Pos = [];
List_Dir = [];
List_Resp = [];
List_Typ = [];
List_tank = [];
List_Text = [];
List_Pal = [];
List_Pal2 = [];
Rem_Trac = false;
Tm_pip = 500;
List_Bus = [Bus0,Bus1,Bus2];
Q_ret = [];
Q_liv = [];
_list = [];
_pos = [];
_ob = "";
_a = 0;
_b = 0;
{
	Q_ret set [_a, 0];
	Q_liv set [_a, 0];
	List_Pos set [_a , getPos _x];
	List_Dir set [_a , getDir _x];
	List_Typ set [_a , typeOf _x];
	//_x setFuel 0;
	if ((typeOf _x) in ["rhs_gaz66_repair_msv","O_Truck_03_ammo_F","O_Truck_03_fuel_F"]) then {
		List_Resp set [_a , 0];
		} else {
	if ((typeOf _x) in ["rhs_bmd4ma_vdv","rhs_t90a_tv","rhs_t72bd_tv","rhs_bmp3_msv","rhs_btr80_msv","rhs_zsu234_aa"]) then {
		List_Resp set [_a , 2];
		} else {
		List_Resp set [_a , 1];
	};};

	_nm = "Non";
	Switch (typeOf _x) do {
		case "rhs_D30_msv" :{List_Resp set [_a , 4];Q_ret set [_a, 1];};
		case "RHS_Ka52_vvs" :{List_Resp set [_a , 5];};
		case "RHS_Ka52_vvs" :{List_Resp set [_a , 6];};
		case "RHS_T50_vvs_blueonblue" :{List_Resp set [_a , 7];};
		case "RHS_Su25SM_vvs" :{List_Resp set [_a , 8];};
		case "RHS_Mi8AMTSh_vvs" :{List_Resp set [_a , 9];};
		case "RHS_Mi8AMTSh_vvs" :{List_Resp set [_a , 7];};
		case "RHS_Mi8MTV3_heavy_vvs" :{List_Resp set [_a , 8];};
		case "RHS_Mi8mt_Cargo_vvs" :{List_Resp set [_a , 1];};
		case "rhsgref_ins_g_Mi8amt" :{List_Resp set [_a , 1];};
		//case "O_Truck_03_ammo_F": {_nm = "REM"};
		case "rhs_gaz66_repair_msv": {_nm = localize "STR_Rep"};
		case "O_Truck_03_ammo_F": {_nm = localize "STR_Amm"};
		case "O_Truck_03_fuel_F": {_nm = localize "STR_Fue"};
		case "rhs_t90a_tv": {_nm = localize "STR_T90"};
		case "rhs_t72bd_tv": {_nm = localize "STR_T72"};
		//case "rhs_zsu234_aa": {_nm = "ЗСУ"};
		case "rhs_bmd4ma_vdv": {_nm = localize "STR_BMP2"};
		case "rhs_bmp3_msv": {_nm = localize "STR_BMP3"};
		case "rhs_btr80_msv": {_nm = localize "STR_BTR80"};
		case "rhs_zsu234_aa": {_nm = localize "STR_ZSU"};
	};
	List_Text set [_a, _nm];
	if (_nm != "Non") then {
	_mk = createMarker [format ["Mk_trak_%1",_a],getPos _x];
	/*
	player globalchat format ["Mk_trak_%1",_a];
	player globalchat format ["%1",_mk];
	player globalchat format ["%1",getPos _x];
	*/
	_mk setMarkerType "o_armor";
	_mk setMarkerSize [0,0];
	_list pushBack _mk;
	};
	_a = _a + 1;
} forEach List_All;
_saved = profileNamespace getVariable ["war3front_veh1",[]];
_arSize = count List_Typ;
_listTyp = [];
_listPos = [];
{
	_sav_type = _x select 0;
	_sav_pos = _x select 1;
	_sav_dir = _x select 2;
	if(_listTyp find _sav_type == -1) then
	{
		_listTyp = _listTyp + [_sav_type];
		_listPos = _listPos + [0];
	};
	_listPosIdx = (_listTyp find _sav_type);
	_array2 = [List_Typ, (_listPos select _listPosIdx)] call BIS_fnc_subSelect;
	if((_array2 find _sav_type) != -1) then
	{
		_sav_a = (_array2 find _sav_type) + (_listPos select _listPosIdx);
		//player sidechat format ["%1 - %2", _sav_type, _sav_a];
		_listPos set [_listPosIdx,_sav_a + 1];
		if(surfaceIsWater _sav_pos) then
		{
			_sav_pos = List_pos select _sav_a;
			_sav_dir = List_dir select _sav_a;
		};
		_sav_dam = _x select 3;
		_sav_fue = _x select 4;
		_sav_hit = _x select 5;
		_sav_mag = _x select 6;
		_sav_pit = _x select 7;
		_ob = List_All select _sav_a;
		_ob setpos _sav_pos;
		_ob setdir _sav_dir;
		[_ob, _sav_pit select 0, _sav_pit select 1] call BIS_fnc_setPitchBank;
		if(_sav_dam == 1) then
		{
			_ob setVariable ["ace_cookoff_enableAmmoCookoff", false, true];
		};
		_ob setdamage [_sav_dam, false];
		_ob setfuel _sav_fue;
		for [{ _i = 0 }, { _i < count (_sav_hit select 0) }, { _i = _i + 1 }] do
		{ 
			_ob setHitPointDamage [(_sav_hit select 0) select _i, (_sav_hit select 2) select _i, false];
		}; 
		for [{ _i = 0 }, { _i < count (_sav_mag) }, { _i = _i + 1 }] do
		{ 
			_ob removeMagazinesTurret [(_sav_mag select _i) select 0,(_sav_mag select _i) select 1];
		};
		for [{ _i = 0 }, { _i < count (_sav_mag) }, { _i = _i + 1 }] do
		{ 
			_ob addMagazineTurret [(_sav_mag select _i) select 0,(_sav_mag select _i) select 1,(_sav_mag select _i) select 2];
		};
		if(((List_Pos select _sav_a) distance _sav_pos) > 5) then
		{
			Q_ret set [_sav_a,1];
		};
	};
} foreach _saved;

Slids = Slids + _list;
_a = 0;
While {_a < 3} do {
	_ob = call compile (format ["LocalBase_%1",_a]);
	_pos = [List_All find _ob];
	_list = nearestObjects [getPos _ob,["rhs_kamaz5350_vdv", "rhs_gaz66_repair_msv","rhs_btr80_msv"],15];
	{
		_pos = _pos + [List_All find _x];
	} forEach _list;
	List_Pal set [_a, _pos];
	_a = _a + 1;
};

if(ActL > 0) then
{
	[0,ActL-1] Spawn Creat_Tent;
	if(ActL > 5) then
	{
		_as = [0] execVM "Updat\Add_Avi.sqf";
	};
};

if(ActC > 0) then
{
	[1,ActC-1] Spawn Creat_Tent;
};

if(ActP > 0) then
{
	[2,ActP-1] Spawn Creat_Tent;
	if(ActL > 1) then
	{
	_as = [1] execVM "Updat\Add_Avi.sqf";
	};
};

_a = 0;
While {_a < 3} do {
	_pos = [];
	{
		_ob = call compile (format ["Vd_%1%2",_a,_x]);
		_pos = _pos + [List_All find _ob];
	} forEach [0,1,2];
	List_Pal2 set [_a, _pos];
	_a = _a + 1;
};

Bak_ret = {
	_veh = _this select 0;
	_nm = _this select 1;
	_tm = 0;
	Switch (List_Resp select _nm) do {
		case 1 :{_tm = time + 300};
		case 2 :{_tm = time + 7200};
		case 3 :{_tm = time + 60;List_Resp set [_nm, 1];};
		case 4 :{
		_veh setDamage 0;
		_un = grp_art createUnit ["rhs_vdv_flora_rifleman",List_Pos select _nm, [], 2, "FORM"];
		_un addEventHandler ["killed", "vehicle (_this select 0) setdamage 1;"];
		_un assignAsGunner _veh;
		_un moveInGunner _veh;
		_un disableAI "MOVE";
		List_WE_C = List_WE_C + [_un];
		_tm = time + 10;
		artSup synchronizeObjectsAdd [_veh];
		};
		case 5 :{_tm = time + 1800};
		case 6 :{_tm = time + 1800};
		case 7 :{_tm = time + 1200};
		case 8 :{_tm = time + 1800};
		case 9 :{_tm = time + 1800};
	};
	WaitUntil {(_tm < time) or !(alive _veh) or (count (crew _veh) > 0)};
	if ((List_Resp select _nm) == 4) then {Q_ret set [_nm,1]} else {Q_ret set [_nm,0]};
	if (!(alive _veh) or (count (crew _veh) > 0)) exitWith {};
	_veh setPos (List_Pos select _nm);
	_veh setDir (List_Dir select _nm);
	_veh setDamage 0;
	//_veh setFuel 0;
	_veh setVehicleAmmo 1;
	if ((List_Text select _nm) != "Non") then {
		_mk = format ["Mk_trak_%1", _nm];
		_mk setMarkerSize [0,0];
		_mk setMarkerText "";
		_mk setMarkerPos (getPos _veh);
	};
};

Bak_liv = {
	_pos = [];
	_dir = 0;
	_tim = 0;
	_bus = -1;
	_veh = _this select 0;
	_nm = _this select 1;
	_pos = List_Pos select _nm;
	_dir = List_Dir select _nm;
	if (_veh in List_Bus) then {_bus = List_Bus find _veh};
	Switch (List_Resp select _nm) do {
		case 0 : {_pos = position _veh; _dir = direction _veh; Sleep 100;};
		case 1 : {Sleep 100;};
		case 2 : {
			_tim = time + 7200;
			if !(IsNull _veh) then {_pos = [getpos _veh select 0, getpos _veh select 1, 0]; _dir = direction _veh;};
			WaitUntil {(Rem_ret == _veh) or (_tim < time) or (surfaceIsWater (getpos _veh))};
			_veh removeAction 0;
			Init_bac = Init_bac - [_veh];
			if ((_tim < time) or (surfaceIsWater (getpos _veh))) then {_pos = List_Pos select _nm; _dir = List_Dir select _nm;};
		};
		case 3 : {Sleep 30;};
		case 4 : {Sleep 10;};
		case 5 :{Sleep 600;};
		case 6 :{Sleep 500;};
		case 7 :{Sleep 400;};
		case 8 :{Sleep 350;};
		case 9 :{Sleep 300;};
	};
	deleteVehicle _veh;
	sleep 0.5;
	_veh = createVehicle [List_Typ select _nm,_pos, [], 0, "FORM"];
	_veh setPos _pos;
	_veh setDir _dir;
	if(List_Resp select _nm == 4) then
	{
		_veh addEventHandler ["killed", "if(gunner (_this select 0) != objNull) then {deleteVehicle gunner (_this select 0);}"];
		_veh setVehicleLock "LOCKEDPLAYER";
	};
	//_veh setFuel 0;
	sleep 1;
	List_All set [_nm, _veh];
	Q_liv set [_nm, 0];
	if (_bus > -1) then {List_Bus set [_bus, _veh];};
	if ((List_Resp select _nm) in [2, 4]) then {Q_ret set [_nm,1]} else {Q_ret set [_nm,0];};
		if ((List_Text select _nm) != "Non") then {
		_mk = format ["Mk_trak_%1", _nm];
		_mk setMarkerColor "ColorGreen";
		_mk setMarkerSize [1,1];
		_mk setMarkerText format ["%1", List_Text select _nm];
		_mk setMarkerPos (getPos _veh);
	};
};

Bak_ded = {
	sleep 1200;
	{deleteVehicle _x; sleep 1;} forEach _this;
};

sleep 1;
_pos = getMarkerPos "Base";
_ob = "";
_mk = "";
_tx = "";
_ls = [];
_lp = [];
While {true} do {
	_lp = [];
	_a = 0;
	_saved = [];
	While {_a < count List_All} do {
		_b = 0;
		_ob = List_All select _a;
		_tx = List_Text select _a;	
		if ((List_Resp select _a) == 2) then
		{
			_saved = _saved + [[typeOf _ob, getPos _ob, getDir _ob, damage _ob, fuel _ob, getAllHitPointsDamage _ob, magazinesAllTurrets _ob, _ob call BIS_fnc_getPitchBank]];
		};
		profileNamespace setVariable ["war3front_veh1",_saved];
		if !(alive _ob)  then {
			if ((Q_liv select _a) == 0) then {
				if ((List_Resp select _a) == 2) then {_lp = _lp + [_ob];};
				Q_liv set [_a,1];
				Q_ret set [_a,0];
				[_ob, _a] Spawn Bak_liv;
				sleep 1;
				if (_tx != "Non") then {
					_mk = format ["Mk_trak_%1", _a];
					_mk setMarkerColor "ColorRed";
					_mk setMarkerSize [1,1];
					_mk setMarkerText format ["%1 %2",localize "STR_Destroyed", _tx];
					_mk setMarkerPos (getPos _ob);
				};
			};
		} else {
			Switch (Q_ret select _a) do {
				case 0: {
					if (count (crew _ob) > 0) then {
						Q_ret set [_a,1];
						if (_tx != "Non") then {
						_mk = format ["Mk_trak_%1", _a];
						_mk setMarkerSize [0,0];
						_mk setMarkerText "";
						};
					};
				};
				case 1: {
					if (count (crew _ob) == 0) then {
						if ((List_Resp select _a) == 0) then {Q_ret set [_a,0];} else {[_ob,_a] Spawn Bak_ret;};
						if (_tx != "Non") then {
							_mk = format ["Mk_trak_%1", _a];
							_mk setMarkerColor "ColorGreen";
							_mk setMarkerSize [1,1];
							_mk setMarkerText format ["%1", _tx];
							_mk setMarkerPos (getPos _ob);
						};
					};
				};
			};
		};
	_a = _a + 1;
	};
	if (count _lp > 0) then {
		Init_bac = Init_bac + _lp;
		publicVariable "Init_bac";
		sleep 2;
		init_tr = true;
		publicVariable "init_tr";
	};
	sleep 5;
	_ls = [];
	_lp = [];
	{
		if !(alive _x) then {_ls = _ls + [_x];};
	} forEach List_WE_T;
	List_WE_T = List_WE_T - _ls;
	_lp = _ls;
	sleep 5;
	_ls = [];
	{
		if !(alive _x) then {_ls = _ls + [_x];};
	} forEach List_WE_B;
	List_WE_B = List_WE_B - _ls;
	_lp = _lp + _ls;
	sleep 5;
	_ls = [];
	{
		if !(alive _x) then {_ls = _ls + [_x];};
	} forEach List_WE_C;
	List_WE_C = List_WE_C - _ls;
	_lp = _lp + _ls;
	if (count _lp > 0) then { _lp spawn Bak_ded;};
	sleep 5;
	_list = pogost getVariable "Add_Sc_pl";
	{(_x select 0) addScore (_x select 1);} forEach _list;
	pogost setVariable ["Add_Sc_pl", [], true];
	sleep 5;
};

titleCut ["Vehicle respawn is broken, contact developer", "Plain"];