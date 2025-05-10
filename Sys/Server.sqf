Switch (_this select 3) do {
	case 0:{
_typ = "";
_pos = [];
_list = nearestObjects [player,["rhs_gaz66_repair_msv"],40];
if (count _list == 0) exitWith {hint localize "STR_RepairTruckFar";};
{_x setDamage 0} forEach _list;
_list = nearestObjects [player,["Car","Tank"],10];
_ob = objNull;
{if !(alive _x) then {_ob = _x};} forEach _list;
if (isNull _Ob) exitWith {hint localize "STR_NothingToRepair";};
hint localize "STR_RepairBegins";
if (Suport3) exitWith {hint "";};	
	Suport3 = true;
_typ = typeOf _Ob;
_pos = getPos _Ob;
sleep 15;
Rem_ret = _Ob;
publicVariable "Rem_ret";
sleep 5;
_Ob = _pos nearestObject _typ;
//_Ob setFuel 0;
_a = 0.9;
While {_a > 0} do {
	_Ob setDamage _a;
	sleep 0.5;
	hint format [localize "STR_DamageLevel",(1-_a)*100,"%"];
	_a = _a - 0.05;
};
sleep 1;
_a = 0.1;
While {_a < 1} do {
	_Ob setVehicleAmmo _a;
	sleep 0.1;
	hint format [localize "STR_AmmoLevel",ceil (_a*100),"%"];
	_a = _a + 0.01;
};
Sleep 2;
hint localize "STR_Repaired";
_as = [9] Spawn fnc_addStat;
Suport3 = false;
};
	case 1:{
_pos = [];
_ob = vehicle Player;
_am = "";
_a = 0;
if (_ob isKindOf "Air")  then {
{if ((_ob distance _x)< 7) then {_a = 1}} forEach [zar0,zar1,zar2,zar3,zar4,zar5];
if (_a == 0) exitWith {hint localize "STR_NotInAirRepair";};
} else {
if !(_ob isKindOf "Man") then {
{if ((_ob distance _x)< 7) then {_a = 1}} forEach [zar6,zar7,zar8];
if (_a == 0) exitWith {hint localize "STR_NotInRepair";};	
};};
if (_a == 0) exitWith {};
if (Suport1) exitWith {hint localize "STR_RepairInProgress";};
Suport1 = true;
_a = Damage _ob;
hint format [localize "STR_DamageLevel",(1-_a)*100,"%"];
sleep 3;
While {_a > 0} do {
	_a = _a - 0.05;
	_Ob setDamage _a;
	sleep 0.5;
	hint format [localize "STR_DamageLevel",(1-_a)*100,"%"];
};
_a = Fuel _ob;
hint format [localize "STR_FuelLevel",ceil (_a*100),"%"];
sleep 3;
While {_a < 1} do {
	_a = _a + 0.05;
	_Ob setFuel _a;
	sleep 0.5;
	hint format [localize "STR_FuelLevel",ceil (_a*100),"%"];
};
_ob setVehicleAmmo 1;
sleep 5;
_ob removeAction At_z1;
Suport1 = false;
	};
};
