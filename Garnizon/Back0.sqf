_pos = getMarkerPos (_this select 0);
_ls = [];
_grp = _this select 2;
{
_un = _grp createUnit [_x, _pos, [], 30, "FORM"];
_ls = _ls + [_un];
}forEach Bot_otr_L;
_un = _grp createUnit ["rhsusf_usmc_recon_marpat_wd_officer", _pos, [], 0, "FORM"];
_grp selectLeader _un;
_grp setFormation "DIAMOND";
_ls = _ls + [_un];
_grp Move getMarkerPos (_this select 1);
List_WE_c = List_WE_c + _ls;

