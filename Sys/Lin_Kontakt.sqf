
PointL = [["L_2_0_0"],
["L_3_1_0"],
["L_2_2_0"],
["L_2_3_0"],
["L_2_4_0"],
["A_2_2"],
["L_3_6_0"],
["L_2_7_0"],
["F_2_0","F_2_1"],
["A_1_3"]];

PointC = [["C_1_0_0"],
["C_2_1_0"],
["C_1_2_0"],
["C_3_3_0"],
["C_1_4_0"],
["C_2_5_0"],
["C_2_6_0"],
["F_1_2","F_1_3"],
["A_1_3"]];

PointP = [["P_2_0_0"],//0
["P_2_1_0","P_1_1_1"],//1
["P_2_2_0","P_2_2_1","P_2_2_2"],//2
["P_1_3_0"],//3
["P_3_4_0","P_3_4_1"],//4
["P_1_5_0"],//5
["P_2_6_0"],//6
["P_2_7_0"],//7
["P_2_8_0","P_2_8_1"],//8
["P_2_9_0"],//9
["F_1_4","F_1_5"],//10
["A_1_3"]];//11

Act = false;
Slids = [];
ActL = profileNamespace getVariable ["war3front_actL",0];

ActC = profileNamespace getVariable ["war3front_actC",0];

ActP = profileNamespace getVariable ["war3front_actP",0];

//PointE = [["L_1_7_0","L_2_7_1"],["C_3_7_0","C_1_7_1"],["P_2_10_0","P_1_10_1"]];
//At_sit = [["F_2_0","F_2_1"],["F_1_2","F_1_3"],["F_1_4","F_1_5"]];
At_sit = [["L_2_0_0"],["C_1_0_0"],["P_2_0_0"]];
PointE = [["Res"],["Res"],["Res"]];
_mas = [];
_put = [];
_pos = [];
_pis = [];
_dis = 0;
_dir = 0;
_xp = 0;
_yp = 0;
_a = 0;
_b = 0;

if(ActL > 0) then
{
PointE set [0, PointL select ActL-1];
At_sit set [0,PointL select ActL];
};

if(ActC > 0) then
{
PointE set [1, PointC select ActC-1];
At_sit set [1,PointC select ActC];
};

if(ActP > 0) then
{
PointE set [2, PointP select ActP-1];
At_sit set [2,PointP select ActP];
};

while {true} do {
Act_num = -1;
	while {Act_num == -1} do {
	WaitUntil {Act};
	Act = false;
	PublicVariable "Act";
	{_x setMarkerColor (MarkerColor _x)} forEach Slids;
publicVariable "ActL";
publicVariable "ActC";
publicVariable "ActP";
publicVariable "recrut";
//publicVariable "Param1";
//publicVariable "Param2";
publicVariable "Init_bac";
};

	_mas = PointE select Act_num;
	_put = At_sit select Act_num;
	_b = 0;
	While {_b < count _put} do {
	_pis = getMarkerPos (_put select _b);
	_dis = 20000;
	_a = 0;
	While {_a < count _mas} do {
		if (((getMarkerPos (_mas select _a)) distance _pis) < _dis) then {
		_pos = getMarkerPos (_mas select _a);
		_dis = _pos distance _pis;
		};
		_a = _a + 1;		
	};
		_dir = asin (((_pis select 0) - (_pos select 0))/_dis);
		if (_dir < 0) then {_dir = 360 + _dir};
		if ((_pis select 1) < (_pos select 1)) then {_dir = 180 - _dir};

_ps = [(_pos select 0) + (sin _dir)* ((_dis/2) min 700),(_pos select 1) + (cos _dir)* ((_dis/2) min 700)];
		_mk = createMarker [format ["QS_%1_%2",Act_num,_b],_ps];
		_mk setMarkerType "mil_arrow";
		_mk setMarkerDir _dir;
		_mk setMarkerColor "ColorRed";
		_mk setMarkerSize [2,_dis/700];
		Slids = Slids + [_mk];
		
		_mk = createMarker [format ["QL_%1_%2",Act_num,_b],_pis];
		_mk setMarkerShape "ELLIPSE";
		_mk setMarkerBrush "Cross";
		_mk setMarkerColor "ColorRed";
		_mk setMarkerSize [300,300];
		Slids = Slids + [_mk];

		_mk = createMarker [format ["QW_%1_%2",Act_num,_b],_pis];
		_mk setMarkerType "mil_circle";
		_mk setMarkerColor "ColorRed";
		_mk setMarkerSize [1.5,1.5];
		Slids = Slids + [_mk];
	_b = _b + 1;
	};
	Switch (Act_num) do {
		case 0 :{_b = ActL};
		case 1 :{_b = ActC};
		case 2 :{_b = ActP};
	};
	
	_a = 0;
		{
		_mk = createMarker [format ["QE_%1_%2_%3",Act_num,_b,_a], getMarkerPos _x];
		_mk setMarkerType "mil_circle";
		_mk setMarkerColor "ColorBlack";
		_mk setMarkerSize [1,1];
		_a = _a + 1;
		Slids = Slids + [_mk];
	} forEach _mas;
	_a = 0;
	While {_a < ActL} do {
		_mk = format ["B_l_%1",_a];
		_mk setMarkerSize [1,1];
	if (_a == (ActL -1)) then {_mk setMarkerColor "ColorGreen";}
	else {_mk setMarkerType "Faction_RU"; _mk setMarkerColor "ColorWhite";};
		_mk = format ["B_l_%1_%1",_a];
		_mk setMarkerSize [1,1];
	if (_a == (ActL -1)) then {_mk setMarkerColor "ColorGreen";};
		_a = _a + 1;};
	_a = 0;
	While {_a < ActC} do {
		_mk = format ["B_c_%1",_a];
		_mk setMarkerSize [1,1];
	if (_a == (ActC -1)) then {_mk setMarkerColor "ColorGreen";}
	else {_mk setMarkerType "Faction_RU"; _mk setMarkerColor "ColorWhite";};
		_mk = format ["B_c_%1_%1",_a];
		_mk setMarkerSize [1,1];
	if (_a == (ActC -1)) then {_mk setMarkerColor "ColorGreen";};
		_a = _a + 1;};
	_a = 0;
	While {_a < ActP} do {
		_mk = format ["B_p_%1",_a];
		_mk setMarkerSize [1,1];
	if (_a == (ActP -1)) then {_mk setMarkerColor "ColorGreen";}
	else {_mk setMarkerType "Faction_RU"; _mk setMarkerColor "ColorWhite";};
		_mk = format ["B_p_%1_%1",_a];
		_mk setMarkerSize [1,1];
	if (_a == (ActP -1)) then {_mk setMarkerColor "ColorGreen";};
		_a = _a + 1;};

Act_num = -1;
};
