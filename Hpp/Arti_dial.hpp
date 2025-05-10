
class text_01 : RscText {SizeEx = 0.055;colorBackground[]={0,0,0,0};colorText[]={1,1,1,1};};

class tex_dialog  {
	idd = 61000;
	movingEnable = 1;
	objects[] = {};
	duration = 15;
	name = "tex_dialog";
	controlsBackground[] = {Fon_j};
	controls[] = {MiniMap, strin0 ,strin1, Koo0, Koo1,Koo2,Koo3,Koo4,
	boton0,boton1,boton2,boton3,botend,botonZ};

class MiniMap : RscMapControl {
	idc = 51020;
	x = -0.1;
	y = 0;
	w = 1.2;
	h = 0.7;
};
class Fon_j : RscText {
colorBackground[] = {0.7109,0.6406,0.5351,0.85};
	x = -1;
	y = -1;
	w = 3;
	h = 3;
	text = "";
};	
class strin0 : RscEdit {
	idc = 61001;
	x = 0.3;
	y = 0.8;
	w = 0.17;
	h = 0.1;
	onKeyDown = "pres = 1";
};
class strin1 : RscEdit {
	idc = 61002;
	x = 0.3;
	y = 0.9;
	w = 0.17;
	h = 0.1;
	onKeyDown = "pres = 2";
};
class Koo0 : text_01 {
	x = 0;y = 0.7;w = 0.9;h = 0.1;
	text = $STR_EnterCoord;
};
class Koo1 : text_01 {
	x = 0.05;y = 0.81;w = 0.9;h = 0.1;
	text = $STR_Longitude;
};
class Koo2 : text_01 {
	x = 0.05;y = 0.91;w = 0.9;h = 0.1;
	text = $STR_Latitude;
};
class Koo3 : text_01 {
	idc = 61005;
	style = 256 + 2;
	colorBackground[]={0,1,0,0.2};
	x = 0.5;y = 0.72;w = 0.38;h = 0.05;
	text = $STR_Waiting;
};
class Koo4 : text_01 {
	idc = 61006;
	style = 256;
	colorBackground[]={0,0,0,0};
	x = 0.3;y = 0.52;w = 0.7;h = 0.05;
	text = "";
};
class boton0 : RscShortcutButton {
	idc = 61010;
	sizeEx = 0.030210;
	x = 0.7;
	y = 0.8;
	w = 0.18;
	h = 0.1;
	text = $STR_ArtSingle;
	action = "pres_b = 1";
};
class boton1 : boton0 {
	x = 0.5;
	y = 0.8;
	text = $STR_Reset;
	action = "pres_b = 2";
};
class boton2 : boton0 {
	x = 0.5;
	y = 0.88;
	text = $STR_UndoReset;
	action = "pres_b = 3";
};
class boton3 : boton0 {
	x = 0.7;
	y = 0.88;
	text = $STR_ArtFire;
	action = "pres_b = 4";
};
class botonZ : boton0 {
	x = 0.9;
	y = 0.8;
	text = $STR_ArtRearm;
	action = "pres_b = 5";
};
class botend : boton0 {
	x = 0.9;
	y = 0.88;
	text = $STR_Exit;
	action = "closeDialog 0";
};

};
