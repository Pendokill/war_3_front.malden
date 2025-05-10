class Bpla_dial  {
idd = 61000;
movingEnable = 0;
objects[] = {};
controlsBackground[] = {MiniMap};
controls[] = {But0, But1, Metka};
onLoad = "as = [] execVM 'UAV\Mk_fli.sqf'";
class But0 : RscShortcutButton {sizeEx = 0.025*(safeZoneH+safeZoneW)/2;x = 0 * safezoneW + safezoneX;y = 0.78* safezoneH + safezoneY;w = 0.3 * safezoneW;h = 0.1 * safezoneH;text = $STR_NewPos;action = "if(count Kl_pos > 0) then {Cam_pos = Kl_pos;}; nmN = true;";};
class But1 : But0 {y = 0.88* safezoneH + safezoneY;text = $STR_RepCoord;action = "[5, Player, (floor (Kl_pos select 0)), (floor (Kl_pos select 1))] remoteExec [""fnc_textInf""];";};
class MiniMap : RscMapControl {idc = 61101;onMouseButtonClick = "Kl_pos = ((finddisplay 61000) displayCtrl 61101) ctrlMapScreenToWorld [_this select 2,_this select 3];ctrlSetText [61100, format ['%1 : %2',(floor (Kl_pos select 0)), (floor (Kl_pos select 1))]];";x = 0* safezoneW + safezoneX;y = 0* safezoneH + safezoneY;w = 1* safezoneW;h = 1* safezoneH;};
class Metka : RscText {idc = 61100;colorText[] = {1,1,1,1};style = 2;sizeEx = 0.060000*(safeZoneH+safeZoneW)/2;x = 0.35* safezoneW + safezoneX;y = 0.865* safezoneH + safezoneY;w = 0.5* safezoneW;h = 0.07 * safezoneH;text = $STR_ClickOnMap;};
};