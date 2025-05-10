
class RscSelGrp  {
	idd = 51000;
	movingEnable = 1;
	duration = 15;
	objects[] = {};
	controlsBackground[] = {Fon};
	controls[] = {But0, Hed, But1, But2, Tx, Tx1};

class Fon : RscText {
colorBackground[] = {0.7109,0.6406,0.5351,0.85};
	x = -1;y = -1;w = 3;h = 3;text = "";
};

class Hed : RscListBox {
	idc = 51001;
	onLBSelChanged = "id_lb = _this select 1;	ctrlSetText [51002, lbText [51001, id_lb]];";
	};
class Tx : RscText  {
	colorBackground[] = {0,0,0,0 };
	font = "RobotoCondensed";
	SizeEx = 0.065000;
	x = 0;y = 0;w = 1;h = 0.1;
	text = $STR_SelectGL;
};
class Tx1 : Tx  {idc = 51002;x = 0.3;y = 0.06;text = "";};
class But0 : RscShortcutButton {x = 0.65;y = 0.35;w = 0.3;h = 0.1;
	text = $STR_Select;
	action = "pres = 1;Ok = true;";
};
class But1 : But0 {y = 0.45;text = $STR_Leave;
	action = "ctrlSetText [51002, name Player];pres = 0;";
};
class But2 : But0 {y = 0.55;text = $STR_Exit;
	action = "Ok = true;";
};

};