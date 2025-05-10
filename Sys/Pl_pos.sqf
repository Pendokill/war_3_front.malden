#define sel_Fil(a,b)	_as = [a,b] spawn fnc_textInf

Sleep 14;

/*
//Хуета какая-то
[] Spawn { 
While {true} do {
	WaitUntil {! isNull Nik_sim_al};
	if (Nik_sim_al == Vehicle Player) then {Nik_sim = true;};
	Nik_sim_al = objNull;
};};
*/

fnc_addStat = {
	_sc = 0;
	Switch (_this select 0) do {
		case 0: { _sc = -1 * (score Player);};
		case 9: {
			if (Rem_sup < 10) then {
				Rem_sup = Rem_sup + 1;
				_sc = 2;
				if (Rem_sup == 10) then {sel_Fil(3,4);};
			};
		};
		case 8: {
			if (Btl_Car < 10) then {
				Btl_Car = Btl_Car + 1;
				if (Btl_Car == 2) then {sel_Fil(3,14);};
				if (Btl_Car == 5) then {sel_Fil(3,10);};
				if (Btl_Car == 10) then {sel_Fil(3,6);};
			};
		};
		case 7: {
			if (Btl_Point < 10) then {
				Btl_Point = Btl_Point + 1;
				if (Btl_Point == 10) then {sel_Fil(3,0);};
			};
		};
		case 6: {
			if (Btl_Avi < 5) then {
				Btl_Avi = Btl_Avi + 1;
				if (Btl_Avi == 5) then {sel_Fil(3,7);};
			};
		};
		case 5: {
			if (Btl_Tan < 30) then {
				Btl_Tan = Btl_Tan + 1;
				if (Btl_Tan == 2) then {sel_Fil(3,13);};
				if (Btl_Tan == 5) then {sel_Fil(3,9);};
				if (Btl_Tan == 10) then {sel_Fil(3,5);};
				if (Btl_Tan == 30) then {sel_Fil(3,1);};
			};
		};
		case 4: {
			if (Med_sup < 10) then {
				if !(Nik_sim) then {
					Med_sup = Med_sup + 1; _sc = 2;
					if (Med_sup == 3) then {sel_Fil(3,12);};
					if (Med_sup == 10) then {sel_Fil(3,8);};
				} else {
					Nik_sim = false; Med_sup = Med_sup - 1;
				};
			};
		};
	};
	if (_sc != 0) then {
		[player,_sc] remoteExec ["addScore",2];	
	};
};

_sc_med = [[49,11],[749,2],[999,3],[100000,0]];
_med = [24,15];
_pos = [];
_sc = 0;
_sd = 0;
_sm = 0;
_sk = 0;
_pipl_old = [];
_sc = score Player;
_gr = [];
{
_mk = createMarkerLocal [format ["Fb_%1",_x - 2], [0,0]];
_mk setMarkerTypeLocal "o_support";
_mk setMarkerTextLocal (format ["F%1",_x]);
_mk setMarkerColorLocal "ColorRed";
} ForEach [2,3,4,5,6,7,8];


While {true} do {
	_pipl = [];
	_a = 0;
	{
	if !(isNull _x) then {
		_pos = getPos _x;
		_ns = format ["MkPl_%1",name _x];
		_pipl = _pipl + [_ns];
		if (_ns in _pipl_old) then {
		_ns setMarkerPosLocal _pos;
	} else {
		_mk = createMarkerLocal [_ns, _pos];
		_mk setMarkerTypeLocal "o_support";
		_mk setMarkerTextLocal (str (name _x));
		_mk setMarkerSizeLocal [1,1];
		};
	};
} foreach playableUnits;

_gr = (units Player) - [Player];
_a = 0;
While {_a < count _gr} do {
(format ["Fb_%1",_a]) setMarkerPosLocal (getPos (_gr select _a));
_a = _a + 1;
};
While {_a < 6} do {
(format ["Fb_%1",_a]) setMarkerPosLocal [0,0];
_a = _a + 1;
};

_pipl_old = _pipl_old - _pipl;
{deleteMarkerLocal _x} forEach _pipl_old;
_pipl_old = _pipl;
sleep 2;
//if (_sc != score Player) then {

_sc = score Player;

Switch (Rang) do {
	case 0:{if (_sc > (rankThres select Rang)) then {Rang = 1; sel_Fil(1,20);};
	if (_sc < 0) then {};};
	case 1:{if (_sc > (rankThres select Rang)) then {Rang = 2; sel_Fil(1,20);};
	if (_sc < (rankThres select (Rang-1))+1) then {Rang = 0};};
	case 2:{if (_sc > (rankThres select Rang)) then {Rang = 3; sel_Fil(1,20);};
	if (_sc < (rankThres select (Rang-1))+1) then {Rang = 1};};
	case 3:{if (_sc > (rankThres select Rang)) then {Rang = 4; sel_Fil(1,20);if(Param10 == 0) then {supReq synchronizeObjectsAdd [player]};};
	if (_sc < (rankThres select (Rang-1))+1) then {Rang = 2};};
	case 4:{if (_sc > (rankThres select Rang)) then {Rang = 5; sel_Fil(1,20);};
	if (_sc < (rankThres select (Rang-1))+1) then {Rang = 3};};
	case 5:{if (_sc > (rankThres select Rang)) then {Rang = 6; sel_Fil(1,20);};
	if (_sc < (rankThres select (Rang-1))+1) then {Rang = 4};};
	case 6:{if (_sc > (rankThres select Rang)) then {Rang = 7; sel_Fil(1,20);};
	if (_sc < (rankThres select (Rang-1))+1) then {Rang = 5};};
	case 7:{if (_sc > (rankThres select Rang)) then {Rang = 8; sel_Fil(1,20);};
	if (_sc < (rankThres select (Rang-1))+1) then {Rang = 6};};
	case 8:{if (_sc > (rankThres select Rang)) then {Rang = 9; sel_Fil(1,20);};
	if (_sc < (rankThres select (Rang-1))+1) then {Rang = 7};};
	case 9:{if (_sc < (rankThres select (Rang-1))+1) then {Rang = 8; sel_Fil(1,20);};
	};};

	if (_sc > (_med select 0) && _sc < 1100 ) then {
		sel_Fil(3,_med select 1);
		_med = _sc_med select _sk;
		_sk =_sk + 1;
		};
//};
sleep 2;
};