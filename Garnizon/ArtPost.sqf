A_otr = ["rhs_vdv_flora_aa","rhs_vdv_flora_rifleman","rhs_vdv_flora_at","rhs_vdv_flora_medic","rhs_vdv_flora_machinegunner"];
_wp = [];
_ps = [];
_un = "";
_a = 0;
_pos = getMarkerPos "Arti_pos";
grp_art = createGroup EAST;
{
	_ps = [(_pos select 0) + (sin _x) * 35,(_pos select 1) + (cos _x) * 35,0];
	_wp = grp_art addWaypoint [_ps, 0];
} forEach [0,90,180,270,0];
_wp setWaypointType "CYCLE";
_wp setWaypointSpeed "LIMITED";

_ps = getMarkerPos "Arti_sta";

[] Spawn {
	_a = 0;
	_ps = getMarkerPos "Arti_sta";
	While {true} do {
		while {count (units grp_art) > 7} do {sleep 300};
		_un = grp_art createUnit [A_otr select _a,_ps, [], 20, "FORM"];
		List_WE_B = List_WE_B + [_un];
		if (_a < 4) then {_a = _a + 1} else {_a = 0};
		sleep 2;	
	};
};

ArtBusy = false;
askArtillery = {
	if(ArtBusy) exitWith{};
	ArtBusy = true;
	_a = 0;
	_kp = [];
	_oper = ""; 
	_pos = getMarkerPos "Arti_pos";
	_list = nearestObjects [_pos , ["rhs_D30_msv"],50];

	While {_a < count _list} do {
		if !("rhs_mag_3of56_10" in getArtilleryAmmo [(_list select _a)]) then {_list = _list - [(_list select _a)]};
		_a = _a + 1;
	};
	_ms = _this;
	_kp = _ms select 0;
	_oper = _ms select 2;
	_dis = _pos distance _kp;
	if (_dis < 500) exitWith {ArtBusy = false;};
	_ps = _kp + [0];
	_a = 0;
	while{format ["art_pos%1",_a] in allMapMarkers} do
	{
		_a = _a +1;
	};
	_marker = createMarker [format ["art_pos%1",_a],_kp];
	_marker setMarkerBrush "GRID";
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerColor "ColorOrange";
	_marker setMarkerSize [50,50];

	Switch (_ms select 1) do {
		case 0: {
			{_x doArtilleryFire [_kp + [0], "rhs_mag_3of56_10", 1]; sleep 0.25} forEach _list;
		};
		case 1: {
			(_list select 0) doArtilleryFire [_kp + [0], "rhs_mag_3of56_10", 1];
		};
	};
	_eta = (_list select 0) getArtilleryETA [_kp + [0], "rhs_mag_3of56_10"];
	if(_eta < 1) then {_eta = 1;};
	[_dis / 1000, _marker] Spawn {
		_a = 0;
		While {_a < (_this select 0)} do {
			(_this select 1) setMarkerColor "ColorRed";
			sleep 0.5;
			(_this select 1) setMarkerColor "ColorOrange";
			sleep 0.5;
			_a = _a + 1;
		};
	};
	sleep 5;
	sleep _eta;
	deleteMarker _marker;
	ArtBusy = false;
};
