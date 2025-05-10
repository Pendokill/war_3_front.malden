if (!(Player in (list Tr_arti))) exitWith {hint localize "STR_ArtilleryInUse";};
if (Rang < 4) exitWith {hint localize "STR_RequiredLieu"};
disableSerialization;
_ok = createDialog "tex_dialog";
_con = (findDisplay 61000) displayCtrl 61005;
_pos = getMarkerPos "Arti_pos";
_bm = false;
_pr = -1;
_dis = 0;
_list = [];
_ls = [];
_tx = [];
_a = 0;
_list = nearestObjects [_pos , ["rhs_D30_msv"],50];


While {dialog} do {
	_a = 0;	
	{if !("rhs_mag_3of56_10" in getArtilleryAmmo [_x]) then {_a = _a + 1}} forEach _list;
	if (_a == 3) then {
		_ls = nearestObjects [player,["O_Truck_03_ammo_F"],40];
		if (count _ls == 0) then {
			ctrlSetText [61006, localize "STR_NeedToReplenish"];
			sleep 3;
			closeDialog 0;
		} else {
			ctrlSetText [61006, localize "STR_Replenish"];sleep 3;};
			ctrlSetText [61006, ""];
	};
		
	pres = 0; pres_b = 0;
	WaitUntil {pres > 0 or pres_b > 0 or !dialog};
	if !(dialog) exitWith {};
	if (pres > 0) then {
		_tx = toArray (ctrlText (61000 + pres));
		_a = 0;
		{if (_x > 57 or _x < 48) then {_tx = _tx - [_tx select _a]};_a = _a + 1} forEach _tx;
		if (count _tx > 4) then {_tx resize 5}; 
		ctrlSetText [61000 + pres, toString _tx];
		Kr_str set [pres - 1, ctrlText (61000 + pres)];
	};

	if (pres_b > 0) then {
		Switch (pres_b) do {
			case 1: {
				Kr_num set [0, (parseNumber (Kr_str select 0))];
				Kr_num set [1, (parseNumber (Kr_str select 1))];
				if ((_list select 0) getArtilleryETA [Kr_num + [0], "rhs_mag_3of56_10"] > 0) then
				{
					_pr = 1;
					_bm = true;
					sleep 0.5;
				}
				else
				{
					ctrlSetText [61006, localize "STR_ArtUnable"];
					sleep 3;
					ctrlSetText [61006, ""];
				};
			};
			case 4: {
				Kr_num set [0, (parseNumber (Kr_str select 0))];
				Kr_num set [1, (parseNumber (Kr_str select 1))];
				if ((_list select 0) getArtilleryETA [Kr_num + [0], "rhs_mag_3of56_10"] > 0) then
				{
					_pr = 0;
					_bm = true;
					sleep 0.5;
				}
				else
				{
					ctrlSetText [61006, localize "STR_ArtUnable"];
					sleep 3;
					ctrlSetText [61006, ""];
				};
			};
			case 2: {ctrlSetText [61001, "0"];ctrlSetText [61002, "0"]};
			case 3: {
				ctrlSetText [61001, Kr_str select 0];
				ctrlSetText [61002, Kr_str select 1];
			};
			case 5: {
				if (count _ls == 0) then {
					ctrlSetText [61006, localize "STR_TooEarly"];
				} else {
					ctrlSetText [61006, localize "STR_RearmInProgress"];
					{_x setVehicleAmmo 1; sleep 2;} forEach _list;
				};
				sleep 2;
				ctrlSetText [61006, ""];
			};

		};

		if (_bm) then {
			[Kr_num, _pr, Player] remoteExec ["askArtillery",2];
			_con ctrlSetBackgroundColor [1, 0, 0, 0.2];
			ctrlSetText [61005, localize "STR_Execution"];
			_bm = false;
			_pr = -1;
			sleep 2;
			sleep 12;
			_con ctrlSetBackgroundColor [0, 1, 0, 0.2];
			ctrlSetText [61005, localize "STR_Waiting"];
		};
	};
};