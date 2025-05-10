Switch (_this select 3) do {
	case 0 : {
_ob = nearestObject [vehicle player, "LandVehicle"];
If (isNull _ob) exitWith {hint localize "STR_NoVehicle";};
if (_ob distance (vehicle player) > 15) exitWith {hint localize "STR_Closer"};
vehicle player removeAction (_this select 2);
_ob attachTo [Vehicle Player, [0,0,-10]];
Dr_acs = vehicle Player addAction [localize "STR_Attach", "Updat\Drup_tag.sqf",1,0, false, true,"",""];
};
	case 1 : {
	if (((getPos vehicle player) select 2) > 20) exitWith {hint localize "STR_Closer"};
vehicle player removeAction (_this select 2);
_ob = nearestObject [vehicle player, "LandVehicle"];
Dr_acs = vehicle Player addAction [localize "STR_Detach", "Updat\Drup_tag.sqf",0,0, false, true,"",""];
	detach _ob;	
	};
	case 2: {
		_obs = nearestObjects [vehicle player, ["LandVehicle"], 7];
		_ob = objNull;
		_dist = 15;
		{
			if((_x != vehicle player) and ((vehicle player distance _x) < _dist)) then
			{
				_dist = vehicle player distance _x;
				_ob = _x;
			};
		} foreach _obs;
		If (isNull _ob) exitWith {hint localize "STR_NoVehicle";};
		if (_ob distance (vehicle player) > 11) exitWith {hint localize "STR_Closer"};
		_ve =  vectorUp _ob;
		_pos = getPos _ob;
		While {(_ve select 2) < 0.4} do {
			_ve set [2,(_ve select 2) + 0.01];
			_ob setPos [_pos select 0, _pos select 1, (_pos select 2)+2];
			_ob setvectorup _ve;
			sleep 0.05;
		};
	};
};	



