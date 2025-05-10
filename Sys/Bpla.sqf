


_pm = [];

Switch (_this select 0) do {
	case 0 : {_pm = getPos Pos_UAV1;};
	case 1 : {_pm = getPos Pos_UAV0;};};

_pm set [2, 100];
_bp1 = createVehicleLocal ["O_UAV_02_dynamicLoadout_F", _pm, [], 50, "FLY"];
_bp1 setPos _pm;
_bp1 setDir 90;
_bp1 engineOn true;
_bp1 setVelocity [100, 0, 1];
_bp1 allowDamage false;
_un = _gr createUnit ["rhs_pilot", _pm, [], 0, "FORM"];
_un moveInDriver _bp1;
_un = _gr createUnit ["rhs_pilot", _pm, [], 0, "FORM"];
_un moveInGunner _bp1;
_bp1  flyInHeight 200;
sleep 1;

_ok = createDialog "Bpla_dil";
