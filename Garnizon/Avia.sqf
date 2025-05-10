Luf_pos set [2, 100];

_wp = [];
{_wp = gr_av1 addWaypoint [[0,0], 0];} ForEach [0,1,2,3,4,5,6];
_wp setWaypointBehaviour "COMBAT";
_wp setWaypointCombatMode "RED";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointType "CYCLE";
{_wp = gr_av2 addWaypoint [[0,0], 0];} ForEach [0,1,2,3,4,5,6,7,8,9,10];
_wp setWaypointBehaviour "COMBAT";
_wp setWaypointCombatMode "RED";
_wp setWaypointSpeed "NORMAL";
_wp setWaypointType "CYCLE";

Fli_cobra = {
	_pos = [];
	_ms = [];
_a = _this select 0;
sleep 1200;
_ms = At_sit select _a;
Switch (count _ms) do {
case 1: {
	_dir = 0;
	_pos = getmarkerPos (_ms select 0);
{
[gr_av1, _x] setWpPos [(_pos select 0) + (sin _dir)* 250, (_pos select 1) + (cos _dir)* 250];
_dir = _dir + 60;
} forEach [0,1,2,3,4,5,6];
	};
case 2: {
_pos = getmarkerPos (_ms select 0);
[gr_av1, 0] setWpPos _pos;
[gr_av1, 6] setWpPos _pos;	
[gr_av1, 1] setWpPos [(_pos select 0) + (sin 120)* 250, (_pos select 1) + (cos 120)* 250];
[gr_av1, 2] setWpPos [(_pos select 0) + (sin 240)* 250, (_pos select 1) + (cos 240)* 250];
_pos = getmarkerPos (_ms select 1);
[gr_av1, 3] setWpPos _pos;	
[gr_av1, 4] setWpPos [(_pos select 0) + (sin 120)* 250, (_pos select 1) + (cos 120)* 250];
[gr_av1, 5] setWpPos [(_pos select 0) + (sin 240)* 250, (_pos select 1) + (cos 240)* 250];
	};
case 3: {
_pos = getmarkerPos (_ms select 0);
[gr_av1, 6] setWpPos [(_pos select 0) + (sin 120)* 250, (_pos select 1) + (cos 120)* 250];
[gr_av1, 0] setWpPos [(_pos select 0) + (sin 120)* 250, (_pos select 1) + (cos 120)* 250];
[gr_av1, 1] setWpPos [(_pos select 0) + (sin 240)* 250, (_pos select 1) + (cos 240)* 250];
_pos = getmarkerPos (_ms select 1);
[gr_av1, 2] setWpPos [(_pos select 0) + (sin 120)* 250, (_pos select 1) + (cos 120)* 250];
[gr_av1, 3] setWpPos [(_pos select 0) + (sin 240)* 250, (_pos select 1) + (cos 240)* 250];
_pos = getmarkerPos (_ms select 2);
[gr_av1, 4] setWpPos [(_pos select 0) + (sin 120)* 250, (_pos select 1) + (cos 120)* 250];
[gr_av1, 5] setWpPos [(_pos select 0) + (sin 240)* 250, (_pos select 1) + (cos 240)* 250];
	};
};

_pos = getmarkerPos (_ms select 0);
_ps = [(_pos select 0) + 2000, (_pos select 1) + 2000,100];
_ve = createVehicle ["RHS_AH1Z_wd",_ps, [], 50, "FLY"];
[_ve,6,"killed"] call fnc_addStatEH;
_un = gr_av1 createUnit ["rhsusf_usmc_marpat_wd_helipilot",_ps, [], 0, "FORM"];
gr_av1 selectLeader _un;
_un MoveInDriver _ve;
List_WE_C = List_WE_C + [_un];
_un = gr_av1 createUnit ["rhsusf_usmc_marpat_wd_helipilot",_ps, [], 0, "FORM"];
_un MoveInGunner _ve;
_ve flyInHeight 100;
List_WE_T = List_WE_T + [_ve];
List_WE_C = List_WE_C + [_un];

};

Fli_Herie = {
Sleep 3900;
	_pos = [];
	_ps = [];
	_ms = [];
_ms = (At_sit select 0) + (At_sit select 1) + (At_sit select 2);
_pos = getMarkerPos (_ms select 0);
_ps = [(_pos select 0) + 2000, (_pos select 1) + 2000,100];
_a = 1;
{
[gr_av2, _a] setWpPos (getMarkerPos _x);
_a = _a + 1;
} forEach _ms;

While {_a < 10} do {
	[gr_av2, _a] setWpPos _pos;
_a = _a + 1;
};

[gr_av2, 0] setWpPos _ps;
[gr_av2, 10] setWpPos _ps;
_ve = createVehicle ["rhsusf_f22",_ps, [], 50, "FLY"];
[_ve,6,"hit"] call fnc_addStatEH;
_un = gr_av2 createUnit ["rhsusf_usmc_marpat_wd_helipilot",_ps, [], 0, "FORM"];
gr_av2 selectLeader _un;
_un MoveInDriver _ve;
_ve flyInHeight 250;
List_WE_T = List_WE_T + [_ve];
List_WE_C = List_WE_C + [_un];
};

Luf0 = "";
Luf0_ded = {
	sleep 2400;
Luf0 = createVehicle ["RHS_A10",Luf_pos, [], 50, "FLY"];
List_WE_T = List_WE_T + [Luf0];
[Luf0,6,"hit"] call fnc_addStatEH;
_EH = Luf0 addEventHandler ["Hit", {
as = [] Spawn Luf0_ded;
Luf0 setDamage 1;
Luf0 removeAllEventHandlers "Hit";
}];
_un = Gr_Luf createUnit ["rhsusf_usmc_marpat_wd_helipilot",Luf_pos, [], 0, "FORM"];
List_WE_C = List_WE_C + [_un];
Gr_Luf selectLeader _un;
_un MoveInDriver Luf0;
Luf0 flyInHeight 300;
Luf0 setVelocity [0, 150,1];
};


Avia_tim = true;
Avia_serv = {
private ["_un","_nm","_vh"];
_pos = [];
_un = SOS_avi;
sleep 100;
if (SOS) then {
SOS = false;
publicVariable "SOS";
"Sup_Avi" setMarkerText "";
"Sup_Avi" setMarkerPos [0,0];
	if (Avia_tim) then {
		Avia_tim = false;
		_pos = getMarkerPos "st_avia";
		_pos set [2, 100];
	{
	_vh = createVehicle [_x, _pos, [], 0, "FLY"];
	_vh setPos _pos;
	_nm = gr_avE createUnit ["rhs_pilot",_pos, [], 0, "FORM"];
	_nm moveInDriver _vh;
	List_WE_C = List_WE_C + [_nm];
	List_WE_T = List_WE_T + [_vh];
	sleep 0.5;
	} forEach ["RHS_Su25SM_vvs","RHS_Su25SM_vvs"];
	gr_av0 selectLeader _nm;
	_vh Move (getPos _un);
	hint format ["W - %1", _vh];
	sleep 900; 
	Avia_tim = true;
	};
};
};

Paras = {
	private ["_grp_ln","_grs_ln","_sit_ln","_pos","_ps","_ve","_grp","_grs"];
_grp_ln = Grp_AA select (_this select 0);
_grs_ln = Grp_CA select (_this select 0);
_ls = [];
		sleep (20 + (random 100));
	_grp = _grp_ln select (_this select 1);
	_grs = _grs_ln select (_this select 1);
	_pos = _this select 2;
	_dir = random 90;
	_ps = [(_pos select 0) + (sin _dir)* 2000, (_pos select 1) + (cos _dir)* 2000,100];
	
_ve = createVehicle ["RHS_UH1Y_FFAR",_ps, [], 50, "FLY"];
[_ve,6,"killed"] call fnc_addStatEH;
_un = _grp createUnit ["rhsusf_usmc_marpat_wd_helipilot",_ps, [], 0, "FORM"];
_grp selectLeader _un;
_un MoveInDriver _ve;
_ls = [_un];
_un = _grp createUnit ["rhsusf_usmc_marpat_wd_helipilot",_ps, [], 0, "FORM"];
_un MoveInGunner _ve;
_ls = _ls + [_un];
_ve flyInHeight 100;
_ve Move _pos;
While {!((_ve distance _pos) < 250 or !(alive _ve))} do {sleep 2;};
if (alive _ve) then {
		{
		_pm = getPos _ve;
		_pa = "Steerable_Parachute_F" createVehicle _pm;
		_pa setPos _pm;
		_un = _grs createUnit [_x, _pm, [], 0, "FORM"];
		_un MoveinDriver _pa;
	_ls = _ls + [_un];
		sleep 0.7;
		} forEach ["rhsusf_usmc_marpat_wd_grenadier","rhsusf_usmc_marpat_wd_grenadier","rhsusf_usmc_marpat_wd_squadleader","rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_smaw"];
	_grs selectLeader _un;
	sleep 2;
	{_x Move _pos} forEach (units _grs);
List_WE_b = List_WE_b + _ls;
	sleep 2;
{_x Move _ps} forEach (units _grp);
};
sleep 5;
_ve Move _ps;
_tm = time + 3660;
waitUntil {(_ve distance _ps) < 300 or !(alive _ve) or (_tm < time)};
deleteVehicle _ve;
};
