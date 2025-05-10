_ms = _this select 3;

Switch (_ms select 1) do {
	case 0: {
	Player removeAction At_t0;
	disableSerialization;
	pres = 0;
	end_dial = false;
	_pos = getPos Player;
	New_Base = nil;
	Slayd_nm = 0;
	private ["_con"];
	_ok = createDialog "Teleport";
	sliderSetRange [51005, 1000, 7000];
	sliderSetPosition [51005, viewDistance];
	ctrlSetText [51006, format ["%1 %2",localize 'STR_ViewDistance', viewDistance]];
if (ActP < 2) then {ctrlShow [51011,false]};
if (ActL < 6) then {ctrlShow [51012,false]};
if (Rang < 4) then {ctrlShow [51013,false]};
	sleep 0.2;
	_con = (findDisplay 50000) displayctrl 51020;
	While {dialog && !end_dial} do {
	new_klik = false;
	WaitUntil {new_klik or !dialog};
	ctrlMapAnimClear _con;
	if(!isNil "New_base") then {
	_con ctrlMapAnimAdd [1, 0.2, markerPos New_Base];
	};
	ctrlMapAnimCommit _con;
	sleep 1;
};

if !(isNil ("New_Base")) then {_pos = getmarkerPos New_Base};
if (end_dial) then {
if (isNil ("New_Base")) exitWith {};
if ((New_Base == "A_1_1") or (New_Base == "A_2_2")) then {SOS = false;Dostup_in_base = false;publicVariable "SOS"};
if (Slayd_nm > 0) then {setViewDistance Slayd_nm;};
Player setPos _pos;
if (pres == 1) then {
	[_pos] Spawn {
_pos = _this select 0;
_a = - 5;
{
_un = _x call compile "vehicle _this";
if (!alive _un) then {Mi_vdv = Mi_vdv - [_un]} else {
if(formationLeader _x == player) then {
sleep 0.5;
_un setPos ([[(_pos select 0) + _a,(_pos select 1) + 15], 0, 50, 6, 0, 1, 0, [], [[(_pos select 0) + _a,(_pos select 1) + 15],[(_pos select 0) + _a,(_pos select 1) + 15]]] call BIS_fnc_findSafePos);
_a = _a + 7;
};
};} forEach Mi_vdv;
};
};
Player removeAction At_t0;
};
};
	
	
	case 1: {
Player removeAction At_t2;
if (Suport2 or Param2 == 0) exitWith {};
If (leader group Player != Player) exitWith {hint localize "STR_NotGL";};
Suport2 = true;
_text = "";
_ico = "";
_pic = "";
_gr = [];
Ok = false;
Klb = -1;
_a = 0;
_nm = Mi_bots select Rang;
_gr = (units Group Player) - [Player];
_vk = _nm - (count _gr);
disableSerialization;
_ok = createDialog "RscCo";
_con = (findDisplay 6) displayCtrl 5000;
_con ctrlSetPosition [-0.01, -0.03, 0.27, 0.035 + 0.12*Rang];
_con ctrlCommit 0;
_con = (findDisplay 6) displayCtrl 5001;
_con ctrlSetPosition [0.49, -0.03, 0.27, 0.035 + 0.12 * _nm];
_con ctrlCommit 0;
_con = (findDisplay 6) displayCtrl 5002;
_con ctrlSetPosition [-0.01, -0.03, 0.27, 0.035 + 0.12*Rang];
_con ctrlCommit 0;
_con = (findDisplay 6) displayCtrl 5003;
_con ctrlSetPosition [0.49, -0.03, 0.27, 0.035 + 0.12 * _nm];
_con ctrlCommit 0;
While {_a < 9} do {

	if (_a < count _gr) then {
	_text = getText (configFile >> "CfgVehicles" >> typeOf (_gr select _a) >> "displayName");
	_ico = getText (configFile >> "CfgVehicles" >> typeOf (_gr select _a) >> "portrait");
	_pic = getText (configFile >> "CfgVehicles" >> typeOf (_gr select _a) >> "picture");
		ctrlSetText [5150 + _a, _text];
		ctrlSetText [5160 + _a, _ico];
		ctrlSetText [5170 + _a, _pic];
	} else {ctrlShow [5150 + _a, false]};
	
	if (_a < Rang) then {
_text = getText (configFile >> "CfgVehicles" >> Mi_tach_bot select _a >> "displayName");
_ico = getText (configFile >> "CfgVehicles" >> Mi_tach_bot select _a >> "portrait");
_pic = getText (configFile >> "CfgVehicles" >> Mi_tach_bot select _a >> "picture");
ctrlSetText [5050 + _a, _text];
ctrlSetText [5060 + _a, _ico];
ctrlSetText [5070 + _a, _pic];
	} else {
	ctrlShow [5050 + _a, false];
	ctrlShow [5080 + _a, false];
	};
	
_a = _a + 1;	
};
_nm = (count _gr);
_gr = [];
While {_vk > 0} do {
	Klb = -1;
	WaitUntil {Klb > -1 or !dialog or Ok};
	if (!dialog or Ok) exitWith {};
_text = getText (configFile >> "CfgVehicles" >> Mi_tach_bot select Klb >> "displayName");
_ico = getText (configFile >> "CfgVehicles" >> Mi_tach_bot select Klb >> "portrait");
_pic = getText (configFile >> "CfgVehicles" >> Mi_tach_bot select Klb >> "picture");
		ctrlShow [5150 + _nm, true];
		ctrlSetText [5150 + _nm, _text];
		ctrlSetText [5160 + _nm, _ico];
		ctrlSetText [5170 + _nm, _pic];
		
sleep 0.5;
_gr = _gr + [Klb];	
_vk = _vk - 1;	
_nm = _nm + 1;
};
[player,_gr] remoteExec ["fnc_askCreateAI", 2];
sleep 1;
closeDialog 0;
Suport2 = false;
/*
botcamp setVariable [Pl_rek, _gr, true];
sleep 1;
closeDialog 0;
sleep 1;
botcamp_ok = true;
PublicVariable "botcamp_ok";
sleep 10;
{if (_x == objNull or !alive _x) then {Mi_vdv = Mi_vdv - [_x]};} foreach Mi_vdv;
Mi_vdv = Mi_vdv + (botcamp getVariable Pl_rek);
Suport2 = false;
botcamp_ok = false;
botcamp setVariable [Pl_rek, [], true];
*/
	};
	
	
	case 2 : {
Player removeAction At_t3;

Ok = false;
pres = 0;
id_lb = 0;
_ok = createDialog "RscSelGrp";
_pipl = [];
_a = 0;
if (leader group Player != Player) then {
	_a = 40; 
	lbAdd [51001, name Player];
} else {if (count (units Player) > 1) exitWith {_a = 30;closeDialog 0};};
	
{
if !(isNull _x) then {
	if (leader group _x == _x) then {
	_pipl = _pipl + [_x];
	 lbAdd [51001, name _x];
};};
} foreach playableUnits;

WaitUntil {Ok or !dialog};
closeDialog 0;
if (pres == 0) exitWith {};
if (_a == 40) then {
	[Player] Join Pl_gr;
	Pl_gr selectLeader Player;
	} else {
	[Player] Join (_pipl select id_lb);
	};

	};
};