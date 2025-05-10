
class Teleport  {
	idd = 50000;
	movingEnable = 1;
	objects[] = {};
	duration = 15;
	name = "Teleport";
	controlsBackground[] = {Fon_h,MiniMap,Tx_sl};
	controls[] = {DialNm,Lis0,Lis1,Lis2,Buts0,Buts1,Buts2,Buts3,Buts4,exits,sl, Tx_h};

class sl : MySlider {
	idc = 51005;
    x = 0.6; 
    y = 0.99; 
	w = 0.4;
	h = 0.03;
	};
class Tx_sl : RscText {
idc = 51006;
    x = 0.14; 
    y = 0.99; 
    w = 0.85; 
    h = 0.027;
    colorBackground[] = {0,0,0,0};
	text = "";
};


class Fon_h : RscText {
colorBackground[] = {0.7109,0.6406,0.5351,0.85};
	x = -1;
	y = -1;
	w = 3;
	h = 3;
	text = "";
};
class Fon_l : Fon_h {
	w = 0.7;
	h = 0.98;
	text = "";
};
class DialNm : RscText {
	idc = 51010;
	x = 0.1;
	y = -0.1;
	w = 0.9;
	h = 0.14;
	sizeEx = 0.12;
	style=2;
	colorBackground[] = {0,0,0,0 };
	text = $STR_SelectDestination;
};

class MiniMap : RscMapControl {
	idc = 51020;
	x = 0.1;
	y = 0.08;
	w = 1;
	h = 0.8;
};
class Lis0 : RscShortcutButton {
	idc = 51000;
	x = 0.15;
	y = 0.035;
	w = 0.3;
	h = 0.1;
	text = $STR_NorthFront;
	action = "ctrlSetText [51010, format ['%1',Dorf0 select ActL]];New_Base = BasLin0 select ActL; new_klik = true";
};
	
class Lis1 : RscShortcutButton {
	idc = 51001;
	x = 0.45;
	y = 0.035;
	w = 0.3;
	h = 0.1;
	text = $STR_CentralFront;
	action = "ctrlSetText [51010, format ['%1',Dorf1 select ActC]];New_Base = BasLin1 select ActC; new_klik = true";
};	
class Lis2 : RscShortcutButton {
	idc = 51002;
	x = 0.75;
	y = 0.035;
	w = 0.3;
	h = 0.1;
	text = $STR_SouthFront;
	action = "ctrlSetText [51010, format ['%1',Dorf2 select ActP]];New_Base = BasLin2 select ActP; new_klik = true";
};	
class Buts0 : RscShortcutButton {
	x = -0.1;
	y = 0.035;
	w = 0.2;
	h = 0.1;
	text = $STR_Base;
	action = "ctrlSetText [51010,format ['%1', localize 'STR_Base']]; New_Base = 'Base'; new_klik = true";
};
class Buts1 : RscShortcutButton {
	idc = 51011;
	x = -0.1;
	y = 0.135;
	w = 0.2;
	h = 0.1;
	text = $STR_Airfield;
	action = "ctrlSetText [51010,format ['Аэродром']]; New_Base = 'A_1_1'; new_klik = true";
};
class Buts2 : RscShortcutButton {
	idc = 51012;
	x = -0.1;
	y = 0.235;
	w = 0.2;
	h = 0.1;
	text = $STR_Airport;
	action = "ctrlSetText [51010,format ['Аэропорт']]; New_Base = 'A_2_2'; new_klik = true";
};
class Buts3 : RscShortcutButton {
	idc = 51013;
	x = -0.1;
	y = 0.335;
	w = 0.2;
	h = 0.1;
	text = $STR_Artillery;
	action = "ctrlSetText [51010,format ['Артилерия']]; New_Base = 'Arti_pos'; new_klik = true";
};
class Tx_h : RscText {
	x = -0.08;
	y = 0.8;
	w = 0.18;
	h = 0.04;
	sizeEx = 0.039;
	colorBackground[] = {0,0,0,0};
	text = $STR_Teleport;
};
class Buts4 : RscShortcutButton {
	x = -0.1;
	y = 0.85;
	w = 0.2;
	h = 0.1;
	text = $STR_WithAI;
	action = "pres = 1;new_klik = true;closeDialog 0;end_dial = true;  ";
};
class exits : Buts4 {
	y = 0.95;
	text = $STR_Alone;
	action = "closeDialog 0; end_dial = true; new_klik = true";
};	
	
};