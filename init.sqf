/*
if (format ["%1",Param1] == format ["%1",a]) then {Param1 = 50};
if (format ["%1",Param2] == format ["%1",a]) then {Param2 = 1};
*/
Param1 = "paramGrass" call BIS_fnc_getParamValue;
Param2 = "paramAI" call BIS_fnc_getParamValue;
Param3 = "paramLoad" call BIS_fnc_getParamValue;
Param4 = "paramResp" call BIS_fnc_getParamValue;
Param5 = "paramERank" call BIS_fnc_getParamValue;
Param6 = "paramLock" call BIS_fnc_getParamValue;
Param7 = "paramTimeMulti" call BIS_fnc_getParamValue;
Param8 = "paramStartTime" call BIS_fnc_getParamValue;
Param9 = "paramRandomWeather" call BIS_fnc_getParamValue;
Param10 = "paramHardArtillery" call BIS_fnc_getParamValue;
Param11 = "paramAllowedSavedLoadouts" call BIS_fnc_getParamValue;
ActP = 0;
ActL = 0;
ActC = 0;
ArtOperator = objNull;
ArtCrew = [];
UnitsWithEH = [];
lockStatus = "UNLOCKED";
if(Param6 == 1) then
{
	lockStatus = "LOCKED";
};
if(Param3 == 0 and isServer) then
{
	profileNamespace setVariable ["war3front_actl",0];
	profileNamespace setVariable ["war3front_actc",0];
	profileNamespace setVariable ["war3front_actp",0];
	profileNamespace setVariable ["war3front_players",[]];
	profileNamespace setVariable ["war3front_veh1",[]];
	profileNamespace setVariable ["war3front_time",10];
};
if(isServer) then
{
	setTimeMultiplier Param7;
	if(Param8 == -1) then {
		Param8 = profileNamespace getVariable ["war3front_time",10];
	};
	skipTime (Param8 - daytime + 24 ) % 24;
	if(Param10 == 0) then
	{
		deleteVehicle tr_arti;
	}
	else
	{
		deleteVehicle supReq;
		deleteVehicle artSup;
	};
};
if(Param3 == 2 and isServer) then
{
	profileNamespace setVariable ["war3front_veh1",[]];
};
if(Param4 == 0) then
{
	deleteMarkerLocal "respawn_east2";
	deleteMarkerLocal "respawn_east3";
	deleteMarkerLocal "respawn_east4";
};
if(Param5 == 1) then
{
	rankThres = [4,9,29,59,79,99,129,159,179];
}
else
{
	rankThres = [4,9,29,59,99,149,199,299,499];
};
if(Param9 == 1) then
{
	_null = [] execVM "setRandomWeather.sqf";
};
"Zarplaz0" setMarkerTextLocal localize "STR_AirRepair";
"Zarplaz1" setMarkerTextLocal localize "STR_AirRepair";
"Zarplaz2" setMarkerTextLocal localize "STR_AirRepair";
"Zarplaz3" setMarkerTextLocal localize "STR_AirRepair";
"Zarplaz4" setMarkerTextLocal localize "STR_AirRepair";
"Zarplaz5" setMarkerTextLocal localize "STR_AirRepair";
"Arti_pos" setMarkerTextLocal localize "STR_Artillery";
"Res_start" setMarkerTextLocal localize "STR_OnTheWay";
"Sup_Avi" setMarkerTextLocal localize "STR_AviaSupport";
"bt0" setMarkerTextLocal localize "STR_AIHire";
"bt1" setMarkerTextLocal localize "STR_Teleport";
"Arti_pos_1" setMarkerTextLocal localize "STR_UAV";
"Arti_pos_1_1" setMarkerTextLocal localize "STR_UAV";
"bt0_1" setMarkerTextLocal localize "STR_UAV";

fnc_textInf = compileFinal preprocessFile "Updat\texts.sqf";
player exec "Sys\radioru.sqs";

setTerrainGrid Param1;
player addItem "ACE_key_lockpick";
serverTime;
Mi_Dostup = [["RHS_UAZ_MSV_01","rhs_tigr_sts_msv","rhs_kamaz5350_vdv","C_Offroad_01_F","C_SUV_01_F",
"C_Van_01_transport_F","C_Quadbike_01_F","rhs_tigr_sts_msv","rhs_gaz66_repair_msv",
"O_Truck_03_fuel_F","RHS_Mi8mtv3_Cargo_vvs","ParachuteEast"],
["rhs_tigr_sts_vdv","rhs_tigr_vdv","rhsgref_ins_g_uaz_ags","rhs_tigr_sts_msv","rhs_btr80_vv","RHS_Mi8mt_Cargo_vvs"],
["RHS_Ural_Zu23_MSV_01","rhs_btr80_msv","rhs_bmp2_vdv","rhs_zsu234_aa","RHS_Mi8AMT_vvsc"],
["rhs_bmp3_msv"],["rhs_t72bd_tv"],["rhs_t90a_tv"],
["RHS_Mi8MTV3_heavy_vvs","RHS_Su25SM_vvs"],["RHS_Mi8AMTSh_vvs"],
["RHS_T50_vvs_blueonblue"],["RHS_Ka52_vvs"]];
//"Private", "Sergeant", "Foreman", "Second lieutenant", "Lieutenant", "Senior lieutenant", "Captain", "Major", "Lieutenant colonel", "Colonel"
Mi_bots = [0,1,1,2,2,2,3,4,5,6,6];
Mi_tach_bot = ["rhs_vdv_flora_at","rhs_vdv_flora_medic","rhs_vdv_flora_aa","rhs_vdv_flora_machinegunner",
"rhs_vdv_flora_marksman","rhs_vdv_flora_RShG2","rhs_vdv_flora_crew","rhs_pilot","rhs_vdv_flora_engineer",
"rhs_vdv_flora_grenadier","rhs_vdv_flora_grenadier"];
Mi_rang = [localize "STR_Private", localize "STR_Sergeant", localize "STR_Foreman", localize "STR_SecLieutenant", localize "STR_Lieutenant", 
localize "STR_SenLieutenant", localize "STR_Captain", localize "STR_Major", localize "STR_LieColonel", localize "STR_Colonel"];

Mi_pic = ["img\1.paa","img\2.paa","img\3.paa","img\4.paa","img\5.paa","img\6.paa","img\7.paa","img\8.paa","img\9.paa","img\10.paa"];
Mi_ord = [
"img\11.paa","img\12.paa","img\13.paa","img\14.paa",
"img\15.paa","img\16.paa","img\17.paa","img\18.paa",
"img\19.paa","img\20.paa","img\21.paa","img\22.paa",
"img\23.paa","img\24.paa","img\25.paa","img\26.paa"];
WepnBox = [["rhs_weap_rpg26","rhs_weap_ak74","rhs_weap_ak103","rhs_weap_pkm"],
["rhs_weap_aks74u","rhs_weap_ak74_gp25","rhs_weap_pkp","rhs_weap_igla","rhs_weap_rpg7"],
["rhs_weap_ak103_gp25","rhs_weap_svdp","rhs_weap_pp2000","rhs_weap_makarov_pm"],
["rhs_weap_fim92","rhs_weap_svds_npz","rhs_weap_asval_grip_npz","rhs_weap_m136"],
["rhs_weap_pya"],
["rhs_weap_ak74n_2_gp25_npz"],
["rhs_weap_vss_grip_npz"],
["rhs_weap_m32","rhs_weap_m79","rhs_weap_m38_rail","rhs_weap_m1garand_sa43"],
["rhs_weap_m590_8RD","rhs_weap_mg42","rhs_weap_lzh18"],
["rhs_weap_fgm148"]];

MagBox = [["PG7VR","OG7","HandGrenade","30Rnd_545x39_AK","75Rnd_545x39_RPK"],
["1Rnd_HE_GP25","100Rnd_762x54_PK","Strela","RPG18"],
["10Rnd_762x54_SVD","30Rnd_545x39_AK","8Rnd_9x18_Makarov"],
["Igla","30Rnd_545x39_AKSD","AT13"],
["8Rnd_9x18_MakarovSD"],
["64Rnd_9x19_Bizon","64Rnd_9x19_SD_Bizon"],
["20Rnd_9x39_SP5_VSS"],
["5Rnd_127x108_KSVK"],
["30Rnd_762x39_AK47"],
["30Rnd_762x39_AK47"]];

Dorf0 = [localize "STR_Base",localize "STR_Pavlovo",localize "STR_Zelenogorsk",localize "STR_Sosnovka",localize "STR_Pustoshka",localize "STR_Vybor",localize "STR_Airport",localize "STR_Grishino",localize "STR_Gvozdno",localize "STR_Krasnostav",localize "STR_VPP"];
Dorf1 = [localize "STR_Base",localize "STR_Bor",localize "STR_Kozlovka",localize "STR_Pulkovo",localize "STR_Rogovo",localize "STR_NovySobor",localize "STR_Gorka",localize "STR_Dubrovka",localize "STR_Krasnostav",localize "STR_VPP"];
Dorf2 = [localize "STR_Base",localize "STR_Komarovo",localize "STR_Airfield",localize "STR_Chernogorsk",localize "STR_Prigorodki",localize "STR_Elektrozavodsk",localize "STR_Kamyshovo",localize "STR_Solnechny",localize "STR_Nizhnoe",localize "STR_Berezino",localize "STR_Khelm",localize "STR_Krasnostav",localize "STR_VPP"];
Dorf3 = [localize "STR_ComN",localize "STR_ComC",localize "STR_ComS",localize "STR_GenN",localize "STR_GenC",localize "STR_GenS"];
BasLin0 = ["Res","B_l_0","B_l_1","B_l_2","B_l_3","B_l_4","B_l_5","B_l_6","B_l_7"];
BasLin1 = ["Res","B_c_0","B_c_1","B_c_2","B_c_3","B_c_4","B_c_5","B_c_6","B_c_7"];
BasLin2 = ["Res","B_p_0","B_p_1","B_p_2","B_p_3","B_p_4","B_p_5","B_p_6","B_p_7","B_p_8","B_p_9","B_p_10"];
New_Base = "Base";
Sa_UAV_cam = [];
Init_bac = [];
Arti_list = [];
Arti_dial = false;
//Art_Stat = false;
Pos_dell = getMarkerPos "pol";
Re_pos = getMarkerPos "Res";
Kr_str = ["0","0"];
Kr_num = [0,0];
pres = 0;
pres_b = 0;
player_in = true;
Nik_num_al = [];
Orders = false;
Orders1 = false;
End_game = false;
Rec_srv = false;
botcamp_ok = false;
Rem_ret = ObjNull;
Rem_mas = ObjNull;
id_lb = 0;
Slayd_nm = 0;
sleep 1;
TitleRsc ["Intro","BLACK",1];
cutRSC ["overlay","PLAIN"];
_am = [] execVM "Sys\Updat.sqf";
_n = pogost getVariable "Mass_Pl";
if (isNil "_n") then {
pogost setVariable ["Mass_Pl", [], true];
pogost setVariable ["Rec_bot",[] , true];
//pogost setVariable ["Kor_num", [[0,0],0], true];
pogost setVariable ["Add_Sc_pl", [[Player,0]], true];
};
if !(isServer) exitWith {};
_as = [] execVM "Sys\Lin_Kontakt.sqf";
sleep 3;
_an = [] execVM "Start.sqf";
sleep 1;
_as = [] execVM "Sys\Resp_Veh.sqf";



