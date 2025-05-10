_dir = 220;
private ["_gr", "_pos", "_pm", "_list", "_bp0", "_bp1"];

Switch (_this select 0) do {
	case 0 : {
		_list = ["RHS_T50_vvs_blueonblue","RHS_T50_vvs_blueonblue","RHS_Ka52_vvs","RHS_Mi8AMTSh_vvs","RHS_Su25SM_vvs","RHS_Su25SM_vvs","RHS_Mi8mtv3_Cargo_vvs","rhs_tigr_vdv","rhs_kamaz5350_vdv","rhs_btr80_msv","rhs_tigr_vdv","O_Truck_03_ammo_F","rhs_gaz66_repair_msv"];
		_pos = [Ver_0,Ver_1,Ver_2,Ver_3,Ver_4,Ver_5,Ver_6,Ver_7,Ver_8,Ver_9,Ver_10,Ver_11,Ver_12];
		_dir = 240;
		_pm = getPos Pos_UAV1;
	};
	case 1 : {
		_list = ["RHS_Ka52_vvs","RHS_Mi8MTV3_heavy_vvs","RHS_T50_vvs_blueonblue","RHS_Mi8mtv3_Cargo_vvs","RHS_Mi8AMTSh_vvs","RHS_Su25SM_vvs","rhs_tigr_vdv","rhs_tigr_vdv","O_Truck_03_ammo_F","rhs_gaz66_repair_msv","rhs_tigr_vdv"];
		_pos = [Ver_3_0,Ver_3_1,Ver_3_2,Ver_3_3,Ver_3_4,Ver_3_5,Ver_3_6,Ver_3_7,Ver_3_8,Ver_3_9,Ver_3_10];
		_pm = getPos Pos_UAV0;
	};
};
_ns = count List_All;
List_Typ = List_Typ + _list;
_a = 0;
{
	_veh = (_list select _a) createVehicle (getPos _x);
	_veh setDir _dir;
	List_Resp set [_ns , 7];
	List_Pos set [_ns , getPos _x];
	List_Dir set [_ns , _dir];
	List_Text set [_ns, "Non"];
	List_All set [_ns, _veh];
	Q_ret  set [_ns, 0];
	Q_liv  set [_ns, 0];
	_ns = _ns + 1;
	_a = _a + 1;
} forEach _pos;

_bp0 = "RU_WarfareBUAVterminal" createVehicle _pm;
_bp0 allowDamage false;