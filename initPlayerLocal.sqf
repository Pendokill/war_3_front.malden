Mi_vdv = [];
ProcessGetIn = {
params ["_unit","_vehicle"];
_a = 0;_b = 0;
{if (typeOf _vehicle in _x) then {_b = _a};_a =_a + 1;}ForEach Mi_Dostup;
if (_b > Rang) then {
	_unit action ["eject", _vehicle];
hint format [localize "STR_NoAccess",
Mi_rang select Rang, name _unit, Mi_rang select _b]; 
} else {
if(_unit == player) then {
	if ((typeOf _vehicle) in ["RHS_Mi8mtv3_Cargo_vvs","rhsgref_ins_g_Mi8amt"]) then {
	Dr_acs = vehicle Player addAction [localize "STR_Attach", "Updat\Drup_tag.sqf",0,0, false, true,"",""];
	WaitUntil {player != driver _vehicle};
	_vehicle removeAction Dr_acs;
	};
	if ((typeOf _vehicle) in ["rhs_gaz66_repair_msv"]) then {
	(vehicle Player) setDamage 0;
	Dr_acs = vehicle Player addAction [localize "STR_Unflip", "Updat\Drup_tag.sqf",2,0, false, true,"",""];
	WaitUntil {player != driver _vehicle};
	_vehicle removeAction Dr_acs;
	};
	};
};
};
//respawnLoadout = getUnitLoadout player;
player enableFatigue false;
[missionNamespace, "arsenalClosed", {

		player setVariable ["respawnLoadout",getUnitLoadout player,true];
		hint localize "STR_LoadoutSaved";
	
	}] call BIS_fnc_addScriptedEventHandler;
/*
["ace_killed", {
    if (_this select 0 == player) then {
        ["unconscious", false] call ace_common_fnc_setDisableUserInputStatus;
    };
}] call CBA_fnc_addEventHandler;
*/
waitUntil{player == player};
cutRSC ["overlay","PLAIN"];
player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	[_unit,_vehicle] spawn ProcessGetIn;
}];

fnc_ansCreateAI =
{
	params["_list"];
	{if (_x == objNull or !alive _x) then {Mi_vdv = Mi_vdv - [_x]};} foreach Mi_vdv;
	Mi_vdv = Mi_vdv + _list;
	{
		_x addEventHandler ["GetInMan", {
			params ["_unit", "_role", "_vehicle", "_turret"];
			[_unit,_vehicle] spawn ProcessGetIn;
		}];
	} foreach _list;
};

if(("paramAllowedSavedLoadouts" call BIS_fnc_getParamValue) < 1) then {
[ missionNamespace, "arsenalOpened", {

    disableSerialization;

    _display = _this select 0;

    {

        ( _display displayCtrl _x ) ctrlSetText localize "STR_Unavailable";

        ( _display displayCtrl _x ) ctrlSetTextColor [ 1, 0, 0, 0.5 ];

        ( _display displayCtrl _x ) ctrlRemoveAllEventHandlers "buttonclick";

    }forEach [ 44146, 44147 ];

} ] call BIS_fnc_addScriptedEventHandler;
};
waitUntil{time > 0};
player remoteExec ["fnc_askSavedData",2];