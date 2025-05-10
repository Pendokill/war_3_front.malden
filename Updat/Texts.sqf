private ["_txt","_ty"];
_a = 0;
_a = _this select 1;
_ty = "";
_tx = "";
_txt = "";
if ((_this select 0) == 6) exitWith {
 TitleRsc ["OUTRO","BLACK",1] ;
 sleep 10;
 titleText ["","PLAIN"];
 sleep 5;
 End_game_end = true;
};
Switch (_this select 0) do {
	case 1:{
{_ty = _ty + format ["%1<br/>",getText(configFile >> "cfgVehicles" >> _x >> "displayName")]} forEach (Mi_Dostup select Rang);
_txt = composeText [
parseText format ["<br/><t><img size='7.3' color='#ffffff' align='center' image=%1></t>",str (Mi_pic select Rang)],
parseText "<br/><t size='1' color='#0022ff' align='center'>",localize "STR_NewRank1" ,parseText "</t>",
parseText format ["<br/><t size='2' color='#00ff00' align='center'> %1 </t>", Mi_rang select Rang],
parseText "<br/><t size='0.8' color='#0022ff' align='center'>",localize "STR_NewRank2" ,parseText "</t>",
parseText format ["<br/><t size='0.8' color='#00ffff' align='center'> %1 </t>",_ty]
];
((uiNamespace getVariable "rankOverlay") displayCtrl 1000) ctrlSetText (Mi_rang select Rang);
((uiNamespace getVariable "rankOverlay") displayCtrl 1200) ctrlSetText (Mi_pic select Rang);
};
	case 3:{
	if ((panel select _a) == 0) then {
	panel set [_a , 1];
	medali = medali + 2^_a;};
	Tr_time = Tr_time - 1;
Switch (_a) do {
	case 0 :{_tx = [localize "STR_Medal","<br/>",localize "STR_Medal1Name","<br/>", localize "STR_Medal1Descr"] joinString "";};
	case 1 :{_tx = [localize "STR_Medal","<br/>",localize "STR_Medal2Name","<br/>", localize "STR_Medal2Descr"] joinString "";};
	case 2 :{_tx = [localize "STR_Medal","<br/>",localize "STR_Medal3Name","<br/>", localize "STR_Medal3Descr"] joinString "";};
	case 3 :{_tx = [localize "STR_Medal","<br/>",localize "STR_Medal4Name","<br/>", localize "STR_Medal4Descr"] joinString "";};
	
    case 4 : {_tx = [localize "STR_Medal","<br/>",localize "STR_Medal5Name","<br/>", localize "STR_Medal5Descr"] joinString "";};
	case 5 : {_tx = [localize "STR_Medal","<br/>",localize "STR_Medal6Name","<br/>", localize "STR_Medal6Descr"] joinString "";};
	case 6 :{_tx = [localize "STR_Medal","<br/>",localize "STR_Medal7Name","<br/>", localize "STR_Medal7Descr"] joinString "";};
	case 7 :{_tx = [localize "STR_Medal","<br/>",localize "STR_Medal8Name","<br/>", localize "STR_Medal8Descr"] joinString "";};
	
    case 8 : {_tx = [localize "STR_Medal","<br/>",localize "STR_Medal9Name","<br/>", localize "STR_Medal9Descr"] joinString "";};
	case 9 : {_tx = [localize "STR_Medal","<br/>",localize "STR_Medal10Name","<br/>", localize "STR_Medal10Descr"] joinString "";};
	case 10 : {_tx = [localize "STR_Medal","<br/>",localize "STR_Medal11Name","<br/>", localize "STR_Medal11Descr"] joinString "";};
	case 11 : {_tx = [localize "STR_Medal","<br/>",localize "STR_Medal12Name","<br/>", localize "STR_Medal12Descr"] joinString "";};
	
    case 12 : {_tx = [localize "STR_Medal","<br/>",localize "STR_Medal13Name","<br/>", localize "STR_Medal13Descr"] joinString "";};
	case 13 : {_tx = [localize "STR_Medal","<br/>",localize "STR_Medal14Name","<br/>", localize "STR_Medal14Descr"] joinString "";};
	case 14 : {_tx = [localize "STR_Medal","<br/>",localize "STR_Medal15Name","<br/>", localize "STR_Medal15Descr"] joinString "";};
	case 15 : {_tx = [localize "STR_Medal","<br/>",localize "STR_Medal16Name","<br/>", localize "STR_Medal16Descr"] joinString "";};
};	
sleep 2;
_txt = composeText [
parseText format ["<br/><t size='0.9' color='#00ffff' align='center'>%1<br/> %2 </t>",localize "STR_Awarded",_tx],		
parseText format ["<br/><t><img size='7.3' color='#ffffff' align='center' image=%1></t>",str (Mi_ord select (_this select 1))]
];
		
	};
	case 4: {
		Switch (_this select 2) do {
			case 0: {_tx = localize "STR_NorthFrontWhere";_ty = Dorf0 select (_this select 1);};
			case 1: {_tx = localize "STR_CentralFrontWhere";_ty = Dorf1 select (_this select 1);  };
			case 2: {_tx = localize "STR_SouthFrontWhere";_ty = Dorf2 select (_this select 1);  };
			case 3: {_tx = "";_ty = Dorf3 select (_this select 1);  };
		};
_txt = composeText [
parseText format ["<br/><t size='0.9' color='#00ffff' align='center'>%1<br/>%2<br/>%3</t>",localize "STR_Advanced",_tx,localize "STR_Captured"],		
parseText format ["<br/><t size='1.5' color='#00ff00' align='center'>%1</t>",_ty]
];	
orders1 = false;	
	};
	case 5: {(_this select 1) sideChat format ["%1  %2  :  %3",localize "STR_ISeeEnemy",_this select 2, _this select 3];};
};
hint _txt;
Mi_data = [Rang, medali];
Mi_Post setVariable ["Data_Pl", Mi_data, true];
sleep 5;
hint "";
if((_this select 0) != 1) exitWith {};
_a = 0;
//MagBox = [];
While {_a <= Rang} do {

{
_supportedMags = getArray (configFile >> "CfgWeapons" >> _x >> "magazines");//_supportedMags - array of supported magazines taken from weapon's config. _weapons - chosen weapon class
if(count _supportedMags > 0) then
{
_mag = selectRandom _supportedMags;//_mag - magazine type taken randomly from the array of the mags supported by chosen weapon
//MagBox = MagBox + [_mag];
};
}
forEach (WepnBox select _a);
//{Play_Box addMagazineCargo [_x,50]} forEach (MagBox select _a);


[Play_Box,true,true,true] call BIS_fnc_addVirtualMagazineCargo;
[Play_Box,WepnBox select _a,false,false] call BIS_fnc_addVirtualWeaponCargo;
_a = _a + 1;
};
//hint composeText [parseText " You are awarded <br/><t><img size='7.3' color='#ffffff' align='center' image='img\Art.JPG'></t>"]