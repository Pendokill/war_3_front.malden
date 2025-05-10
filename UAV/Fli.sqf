private ["_a","_xp","_yp","_pos"];
_roud = [];
waitUntil{!isNil "f_cam"};
Cam_pos = getPos f_cam;
While {true} do {
	_a = 0;
	While {_a < 8} do {
_xp = Cam_pos select 0;
_yp = Cam_pos select 1;
			
_pos = [_xp + (sin (_a*45))* Cam_ring, _yp + (cos (_a*45))* Cam_ring, Cam_high];	
f_cam camSetPos _pos;
f_cam camCommit ((f_cam distance _pos)/Cam_spid);
nmN = false;
	WaitUntil {((f_cam distance _pos) < (Cam_ring / 10)) or nmN};
	if (! nmN) then {_a = _a + 1;};
	};
};
/*
ctrlSetText [61100, format ['%1 : %2',floor (Kl_pos select 0),floor (Kl_pos select 1)]];

((finddisplay 61000) displayCtrl 61101) ctrlMapScreenToWorld [_this select 2,_this select 3];

(_this displayCtrl 61101) ctrlMapAnimAdd [1, 0.1, getPos f_cam];
ctrlMapAnimCommit (_this displayCtrl 61101);


*/