class Frame : RscText {
	style = 64;
	w = 0.25;h = 0.11;
	colorText[] = {0,0,0,1};
	text = "";
	};
class Ipg : RscText {style = 48;w = 0.09;h = 0.09;text = "";};
class Ico : RscText {style = 48;w = 0.03;h = 0.03;text = "";};
class But : RscShButMain {w = 0.09;h = 0.03;text = "";};

class RscCo  {
	access = 1;
	movingEnable = 0;
	enableSimulation = 1;
	enableDisplay = 1;
	atomic = 0;
	vocabulary = "";
	contexsensitive = 1;
	idd = 6;
		
	
	class Controls  {
class FrL : Frame {idc = 5000;
x = -0.01;y = -0.03;w = 0.27;text = $STR_AvailableAI;
h = 0.05;
};
class FrP : Frame {idc = 5001;
x = 0.49;y = -0.03;w = 0.27;text = $STR_PlayersGroup;
h = 0.05;
};

class BtOk : RscShortcutButton {
	x = 0.8;y = 0.9;w = 0.25;h = 0.1;
	text = "OK";
	action = "Ok = true";};

class Bt0 : But {idc = 5080;x = 0.15;y = 0.07;action = "Klb = 0";};
class Bt1 : But {idc = 5081;x = 0.15;y = 0.19;action = "Klb = 1";};
class Bt2 : But {idc = 5082;x = 0.15;y = 0.31;action = "Klb = 2";};
class Bt3 : But {idc = 5083;x = 0.15;y = 0.43;action = "Klb = 3";};
class Bt4 : But {idc = 5084;x = 0.15;y = 0.55;action = "Klb = 4";};
class Bt5 : But {idc = 5085;x = 0.15;y = 0.67;action = "Klb = 5";};
class Bt6 : But {idc = 5086;x = 0.15;y = 0.79;action = "Klb = 6";};
class Bt7 : But {idc = 5087;x = 0.15;y = 0.91;action = "Klb = 7";};
class Bt8 : But {idc = 5088;x = 0.15;y = 1.01;action = "Klb = 8";};

class Ip0 : Ipg {idc = 5060;x = 0;y = 0.02;};
class Ip1 : Ipg {idc = 5061;x = 0;y = 0.14;};
class Ip2 : Ipg {idc = 5062;x = 0;y = 0.26;};
class Ip3 : Ipg {idc = 5063;x = 0;y = 0.38;};
class Ip4 : Ipg {idc = 5064;x = 0;y = 0.5;};
class Ip5 : Ipg {idc = 5065;x = 0;y = 0.62;};
class Ip6 : Ipg {idc = 5066;x = 0;y = 0.74;};
class Ip7 : Ipg {idc = 5067;x = 0;y = 0.86;};
class Ip8 : Ipg {idc = 5068;x = 0;y = 0.98;};

class Ic0 : Ico {idc = 5070;x = 0.065;y = 0.08;};
class Ic1 : Ico {idc = 5071;x = 0.065;y = 0.2;};
class Ic2 : Ico {idc = 5072;x = 0.065;y = 0.32;};
class Ic3 : Ico {idc = 5073;x = 0.065;y = 0.44;};
class Ic4 : Ico {idc = 5074;x = 0.065;y = 0.56;};
class Ic5 : Ico {idc = 5075;x = 0.065;y = 0.68;};
class Ic6 : Ico {idc = 5076;x = 0.065;y = 0.80;};
class Ic7 : Ico {idc = 5077;x = 0.065;y = 0.92;};
class Ic8 : Ico {idc = 5078;x = 0.065;y = 1.04;};

class Ip10 : Ipg {idc = 5160;x = 0.65;y = 0.02;};
class Ip11 : Ipg {idc = 5161;x = 0.65;y = 0.14;};
class Ip12 : Ipg {idc = 5162;x = 0.65;y = 0.26;};
class Ip13 : Ipg {idc = 5163;x = 0.65;y = 0.38;};
class Ip14 : Ipg {idc = 5164;x = 0.65;y = 0.5;};
class Ip15 : Ipg {idc = 5165;x = 0.65;y = 0.62;};
class Ip16 : Ipg {idc = 5166;x = 0.65;y = 0.74;};
class Ip17 : Ipg {idc = 5167;x = 0.65;y = 0.86;};
class Ip18 : Ipg {idc = 5168;x = 0.65;y = 0.98;};

class Ic10 : Ico {idc = 5170;x = 0.715;y = 0.08;};
class Ic11 : Ico {idc = 5171;x = 0.715;y = 0.2;};
class Ic12 : Ico {idc = 5172;x = 0.715;y = 0.32;};
class Ic13 : Ico {idc = 5173;x = 0.715;y = 0.44;};
class Ic14 : Ico {idc = 5174;x = 0.715;y = 0.56;};
class Ic15 : Ico {idc = 5175;x = 0.715;y = 0.68;};
class Ic16 : Ico {idc = 5176;x = 0.715;y = 0.8;};
class Ic17 : Ico {idc = 5177;x = 0.715;y = 0.92;};
class Ic18 : Ico {idc = 5178;x = 0.715;y = 1.04;};
};
class controlsBackground  {
class FnL : RscText {idc = 5002;x = 0;y = 0;w = 0;h = 0;
colorBackground[] = {0.7109,0.6406,0.5351,0.91};
text = "";};
class FnP : FnL {idc = 5003;};
	
class Fr0 : Frame {idc = 5050;x = 0;y = 0;};
class Fr1 : Frame {idc = 5051;x = 0;y = 0.12;};
class Fr2 : Frame {idc = 5052;x = 0;y = 0.24;};
class Fr3 : Frame {idc = 5053;x = 0;y = 0.36;};
class Fr4 : Frame {idc = 5054;x = 0;y = 0.48;};
class Fr5 : Frame {idc = 5055;x = 0;y = 0.6;};
class Fr6 : Frame {idc = 5056;x = 0;y = 0.72;};
class Fr7 : Frame {idc = 5057;x = 0;y = 0.84;};
class Fr8 : Frame {idc = 5058;x = 0;y = 0.96;};

class Fr10 : Frame {idc = 5150;x = 0.5;y = 0;};
class Fr11 : Frame {idc = 5151;x = 0.5;y = 0.12;};
class Fr12 : Frame {idc = 5152;x = 0.5;y = 0.24;};
class Fr13 : Frame {idc = 5153;x = 0.5;y = 0.36;};
class Fr14 : Frame {idc = 5154;x = 0.5;y = 0.48;};
class Fr15 : Frame {idc = 5155;x = 0.5;y = 0.6;};
class Fr16 : Frame {idc = 5156;x = 0.5;y = 0.72;};
class Fr17 : Frame {idc = 5157;x = 0.5;y = 0.84;};
class Fr18 : Frame {idc = 5158;x = 0.5;y = 0.96;};
};	
};

