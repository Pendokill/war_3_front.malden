Player removeAction At_tU;
If (Rang < 6) exitWith {};
sleep 1;
f_cam = nil;
nmZ = 0;
Cam_ring = 300;
Cam_high = 950;
Cam_spid = 40;
Kl_pos = [];
nmN = false;
M_key = true;
N_key = true;
Up_key = true;
Ri_key = true;
Sp_key = true;
_pos = getPos Player;
_pos set [2,Cam_high];

_EG = (finddisplay 46) displayaddeventhandler ["MouseMoving","
if (!dialog) then {
_dir = (getDir f_cam) + (_this select 1);
_xp = (sin _dir)* 30;
_yp = (cos _dir)* 30;
nmZ = nmZ - (_this select 2);
f_cam  setVectorDirAndUp [[_xp, _yp, nmZ],[_xp, _yp, -nmZ]];
};
"];

_EH = (finddisplay 46) displayaddeventhandler ["KeyDown","
	Switch (_this select 1) do {
		case 49 :{
	if (N_key) then {N_key =  false;camUseNVG true;} else {N_key = true; camUseNVG false;};
	};
		case 50 :{
	if (M_key) then { M_key =  false;
	if (dialog) then {closeDialog 0;} else {_ok = createDialog ""Bpla_dial"";};
	M_key = true;
		};
	};
		case 201 :{
	if (Up_key) then {Up_key =  false;
	if (Cam_high < 1000) then {Cam_high = Cam_high + 10;};
	[1] Spawn Cam_Text;
	Up_key = true; nmN = true;
		};
	};
		case 209 :{
	if (Up_key) then {Up_key =  false; 
	if (Cam_high > 150) then {Cam_high = Cam_high - 10;};
	[1] Spawn Cam_Text;
	Up_key = true; nmN = true;
		};
	};
		case 199 :{
	if (Ri_key) then {Ri_key =  false;
	if (Cam_ring < 1000) then {Cam_ring = Cam_ring + 10;};
	[2] Spawn Cam_Text;
	Ri_key = true; nmN = true;
		};
	};
		case 207 :{
	if (Ri_key) then {Ri_key =  false;
	if (Cam_ring > 300) then {Cam_ring = Cam_ring - 10;};
	[2] Spawn Cam_Text;
	Ri_key = true; nmN = true;
		};
	};
		case 17 :{
	if (Sp_key) then {Sp_key =  false;
	if (Cam_spid < 100) then {Cam_spid = Cam_spid + 10;};
	[0] Spawn Cam_Text;
	Sp_key = true; nmN = true;
		};
	};
		case 31 :{
	if (Sp_key) then {Sp_key =  false;
	if (Cam_spid > 30) then {Cam_spid = Cam_spid - 10;};
	[0] Spawn Cam_Text;
	Sp_key = true; nmN = true;
		};
	};
		case 15:{
	1110 cuttext ["""",""plain""];
	closeDialog 0;
	f_cam cameraEffect [""Terminate"", ""BACK""];
	camDestroy f_cam;
	};
};
"];

Cam_Text = {
	disableSerialization;
Switch (_this select 0) do {
	case 0: {((Sa_UAV_cam select 0) displayCtrl 1120) ctrlSetText str (Cam_spid);};
	case 1: {((Sa_UAV_cam select 0) displayCtrl 1121) ctrlSetText str (Cam_high);};
	case 2: {((Sa_UAV_cam select 0) displayCtrl 1122) ctrlSetText str (Cam_ring);};
};};

f_cam = "camera" camCreate _pos;
f_cam cameraEffect ["External", "BACK"];
f_cam camSetFov 0.4;
f_cam camCommit 0;
1110 cutRsc ["UAV_cam", "Plain"];
[0] Spawn Cam_Text;
[1] Spawn Cam_Text;
[2] Spawn Cam_Text;
showCinemaBorder false;
_as = [] execVM "UAV\Fli.sqf";
WaitUntil {!alive f_cam};
terminate _as;

(finddisplay 46) displayremoveeventhandler ["MouseMoving",_EG];
(finddisplay 46) displayremoveeventhandler ["keydown",_EH];
