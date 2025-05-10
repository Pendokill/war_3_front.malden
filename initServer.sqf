serverBusy = false;
[] spawn {
	while{true} do
	{
		Sleep 600;
		saveProfileNamespace;
	};
};

[] spawn {
	while{true} do
	{
		Sleep 30;
		waitUntil{!serverBusy};
		serverBusy = true;
		_ar = profileNamespace getVariable ["war3front_players",[]];
		{
			for [{ _i = 0 }, { _i < count _ar }, { _i = _i + 1 }] do
			{ 
				if((_ar select _i) select 0 == getPlayerUID _x) then
				{
					_ar set [_i,[getPlayerUID _x, score _x]];
				};
				Sleep 0.5;
			}; 
			Sleep 0.5;
		} forEach allPlayers;
		profileNamespace setVariable ["war3front_players",_ar];
		profileNamespace setVariable ["war3front_time",dayTime];
		serverBusy = false;
	}
};

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	_score = score _unit;
	[_unit, _id, _uid, _name, _score] spawn {
		waitUntil{!serverBusy};
		serverBusy = true;
		_ar = profileNamespace getVariable ["war3front_players",[]];
		for [{ _i = 0 }, { _i < count _ar }, { _i = _i + 1 }] do
		{ 
			if((_ar select _i) select 0 == _uid) then
			{
				_ar set [_i,[_uid, _score]];
			};
		}; 
		profileNamespace setVariable ["war3front_players",_ar];
		serverBusy = false;
	};
	false;
}];

fnc_askSavedData = {
	while {serverBusy} do {sleep 0.1};
	serverBusy = true;
	_ar = profileNamespace getVariable ["war3front_players",[]];
	_uid = getPlayerUID _this;
	_found = false;
	for [{ _i = 0 }, { _i < count _ar }, { _i = _i + 1 }] do
	{ 
		if((_ar select _i) select 0 == _uid) then
		{
			if(score _this == 0) then
			{
				_this addScore ((_ar select _i) select 1);
				_found = true;
			};
		};
	}; 
	if(!_found) then
	{
		_ar = _ar + [[_uid,0]];
		profileNamespace setVariable ["war3front_players",_ar];
	};
	serverBusy = false;
};