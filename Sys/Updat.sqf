
_tr = createTrigger ["EmptyDetector", [0,0,0]];
_tr setTriggerArea [0,0,0,false];
_tr setTriggerText "Доставка оружия";
_tr setTriggerActivation ["DELTA", "PRESENT", true];
_tr setTriggerStatements ["this", "nl = [] Spawn Fli_box",""];

[] Spawn { WaitUntil {ActP > 1};
_tr = createTrigger ["EmptyDetector", [0,0,0]];
_tr setTriggerArea [0,0,0,false];
_tr setTriggerText "Воздушная поддержка";
_tr setTriggerActivation ["INDIA", "PRESENT", true];
_tr setTriggerStatements ["this","nl = [] Spawn Sos_supp",""];
};

Btl_Point = 0;
Btl_Tan = 0;
Btl_Car = 0;
Btl_Avi = 0;
Med_sup = 0;
Rem_sup = 0;
eho = [];
Namb_Pl = 0;
Mi_Post = "";
Mi_data = [];
Nik_num = 0;
Nik_pl = "";
Nik_sim = false;
nam_Data = [];
Namb_Pl = -1;
medali = 0;
panel = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
Rang = 0;
//respawnLoadout = getUnitLoadout player;
Dostup_in_base = false;
Player_in_base = false;
SOS = false;
SOS_avi = Vehicle Player;
Glas = "Non";
Lekar = false;
Suport0 = false;
Suport1 = false;
Suport2 = false;
Suport3 = false;
Suport4 = false;
Sov_inf = [];
Tr_time = 30;
Sc_pl = 0;
Act = true;
publicVariable "Act";

_am = [] execVM "Sys\Pl_pos.sqf";

Fli_box = {
	if (Rang < 1) exitWith {hint localize "STR_AIDescr3"};
	if (Suport0) exitWith {};
	Suport0 = true;
	_pos = getPos Player;
	_pos set [2, (_pos select 2) + 100];
	_pa = "Steerable_Parachute_F" createVehicleLocal _pos;
	_pa setPos _pos;
	_vh = "rhs_launcher_crate" createVehicleLocal _pos;
	_vh attachTo [_pa, [0,0,-3]];
	WaitUntil {isNull _pa};
	clearWeaponCargo _vh;
	clearMagazineCargo _vh;
_a = 0;
While {_a <= Rang} do {
{_vh addWeaponCargo [_x,1]} forEach (WepnBox select _a);
{_vh addMagazineCargo [_x,5]} forEach MagBox;
_a = _a + 1;
};
	_pos = getPos _vh;
	_pos resize 2;
	_vh setPos _pos;
	sleep 1800;
	Suport0 = False;
};

Sos_supp = {
SOS_avi = Vehicle Player;
PublicVariable "SOS_avi";
sleep 4;
SOS = true;
publicVariable "SOS";
"Sup_Avi" setMarkerPos (getPos SOS_avi);
"Sup_Avi" setMarkerText (format ["%1 %2", Naim_Pl, localize "STR_CallAir"]);	
};

Avia_supp = {
hint composeText [
parseText "<br/><t size='1' color='#00ffff' align='center'>",localize "STR_AirSupport1" , parseText"</t>",
parseText format ["<br/><t size='1.5' color='#00ff00' align='center'>%1</t>", name SOS_avi],
parseText "<br/><t size='1' color='#00ffff' align='center'>",localize "STR_AirSupport2" , parseText"</t>",
parseText "<br/><t size='1.5' color='#ffff00' align='center'>",localize "STR_AirSupport3" , parseText"</t>"];
At_tS = Player addAction [localize "STR_Teleport", "Sys\Action.sqf",[Player,0],0, true, true,"",""];
Dostup_in_base = true;
sleep 60;
if (Dostup_in_base) then {
hint localize "STR_AirSupportDenied";
Dostup_in_base = false;
};
Player removeAction At_tS;
};

Swoloch = {
removeallweapons player;
WepnPlay = ["NVGoggles","Binocular"];
MagPlay = [];
Re_pos = getMarkerPos "Turma";
player setPos Re_pos;
_a = Tr_time;
while {_a > 0} do {
titleText [format ["Time under guards %1",_a*2],"plain"];
if ((Player distance Re_pos) > 3) then {player setPos Re_pos;};
sleep 2.0;
_a = _a - 1;
};
Re_pos = getMarkerPos "Res";
player setPos Re_pos;
};

sleep 7;
Player setRank "COLONEL";
Naim_Pl = name Player;
Pl_gr = Group player;
Pl_rek = format ["Re%1", Player];
//Pl_typ = Mi_tach select Rang;
R_S_M = true;

titleText ["","PLAIN"];


[] Spawn {
private  ["_ms"];
_ms = pogost getVariable "Mass_Pl";
sleep 1;
if !(Naim_Pl in _ms) then {
Namb_Pl = count _ms;
_ms set [Namb_Pl, Naim_Pl];
pogost setVariable ["Mass_Pl", _ms, true];
Mi_Post = "Suitcase" createVehicle [20* Namb_Pl,1000];
sleep 1;
Mi_Post setVariable ["Data_Pl", [0,0], true];
} else {
Namb_Pl = _ms find Naim_Pl;
Mi_Post = [20 * Namb_Pl,1000] nearestObject "Suitcase";
};
Mi_data = Mi_Post getVariable "Data_Pl";
Rang = Mi_data select 0;
medali = Mi_data select 1;
_b = medali;
_a = 15;
While {_a >= 0} do {
if ((2^_a) <= _b) then {panel set [_a,1];_b = _b - 2^_a;} else {panel set [_a,0];};
_a = _a - 1;
};
};
sleep 3;
init_tr = true;
_as = [1, 10] spawn fnc_textInf;
[] Spawn {
	_ls = [];
	while {true} do {
		WaitUntil {init_tr};
		_ls = Init_bac - _ls;
	{
	_x addAction [localize "STR_Repair", "Sys\Server.sqf",0,0, true, true,"",""];
	sleep 1;
	} forEach _ls;
	init_tr = false;
	sleep 1;
	};
};