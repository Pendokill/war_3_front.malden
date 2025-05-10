class pic0 : RscText {
	colorText[]={1,1,1,1};
	colorBackground[] = {0.7109,0.6406,0.5351,0.4};
	style = 48 + 0x02;
	x=0.6;h=0.16;w=0.07;
	y=0.23;
	text = "";
	};
class pic1 : pic0 {y=0.4;};
class pic2 : pic0 {y=0.57;};
class pic3 : pic0 {y=0.74;};
class pic4 : pic0 {y=0.91;};

class End_dial  {
	idd = 61000;
	movingEnable = 1;
	objects[] = {};
	duration = 15;
	name = "End_dial";
	controlsBackground[] = {FonD};
	controls[] = {Hed0,Hed1,Hed2,Hed3,Hed4,Hed5,ic40,ic41,ic42,ic43,ic30,ic31,ic32,ic33,ic20,ic21,ic22,ic23,ic10,ic11,ic12,ic13};
	
class FonD : RscText {colorBackground[] = {0.7109,0.6406,0.5351,0.4};x = -1;y = -1;w = 3;h = 3;text = "";};

class Hed0 : RscText {
	idc = 61001;
	style = 256 + 0x02;
	colorBackground[] = {0.1882,0.2588,0.149,0};
	sizeEx = 0.09;
	x = 0.1;y = -0.05;w = 0.8;h = 0.1;
	text = "";
};	
class Hed1 : Hed0 {idc = 61002;y = 0.03;text = "";};
class Hed2 : Hed0 {idc = 61003;y = 0.11;text = "";};
class Hed3 : pic0 {idc = 61004;x = 0;y = -0.05;w = 0.1;h = 0.24;text = "img\2.paa";};	
class Hed4 : pic0 {idc = 61005;x = 0.9;y = -0.05;w = 0.1;h = 0.24;text = "img\2.paa";};

//class Hed5 : MyRscCombo {idc = 61006;onLBSelChanged = "id_lb = _this select 1";};

class ic10 : pic0 {idc = 61010;};
class ic11 : pic0 {idc = 61011;x=0.7;};
class ic12 : pic0 {idc = 61012;x=0.8;};
class ic13 : pic0 {idc = 61013;x=0.9;};

class ic20 : pic1 {idc = 61020;};
class ic21 : pic1 {idc = 61021;x=0.7;};
class ic22 : pic1 {idc = 61022;x=0.8;};
class ic23 : pic1 {idc = 61023;x=0.9;};

class ic30 : pic2 {idc = 61030;};
class ic31 : pic2 {idc = 61031;x=0.7;};
class ic32 : pic2 {idc = 61032;x=0.8;};
class ic33 : pic2 {idc = 61033;x=0.9;};

class ic40 : pic3 {idc = 61040;};
class ic41 : pic3 {idc = 61041;x=0.7;};
class ic42 : pic3 {idc = 61042;x=0.8;};
class ic43 : pic3 {idc = 61043;x=0.9;};

};