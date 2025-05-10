_pos = getMarkerPos (_this select 0);
_dir = MarkerDir (_this select 0);
_gr = _this select 2;
_xp = _pos select 0;
_yp = _pos select 1;
_ls = [];
_ob = "Land_BagFenceRound" createVehicle [_xp + sin (_dir - 12) * 15,_yp + cos (_dir - 12) * 15];
_ob setDir _dir + 180;
_ob = "Land_BagFenceRound" createVehicle [_xp + sin (_dir + 5) * 25,_yp + cos (_dir + 5) * 25];
_ob setDir _dir + 180;
_ob = "Land_fortified_nest_small" createVehicle [_xp + sin (_dir - 90) * 6,_yp + cos (_dir - 90) * 6];
_ob setDir (_dir + 180);
_ob = "LAV25_HQ_unfolded" createVehicle [_xp + sin (_dir + 90) * 9,_yp + cos (_dir + 90) * 9];
_ob setDir _dir;
_ob = "Mine" createVehicle _pos;

{
_un = _gr createUnit [_x, _pos, [], 30, "FORM"];
_ls = _ls + [_un];
}forEach ["rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_usmc_marpat_wd_grenadier","rhsusf_usmc_marpat_wd_squadleader","rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_smaw",
"rhsusf_usmc_marpat_wd_grenadier","rhsusf_usmc_marpat_wd_squadleader","rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_smaw"];
_un = _gr createUnit ["rhsusf_usmc_recon_marpat_wd_officer", _pos, [], 5, "FORM"];
_gr selectLeader _un;
_gr Move _pos;
_ls = _ls + [_un];
List_WE_c = List_WE_c + _ls;
{_x doWatch [_xp + sin _dir * 100,_yp + cos _dir * 100,5];} forEach (units _gr);
sleep 6;
_gr setFormDir _dir;
_gr setFormation "DIAMOND";

