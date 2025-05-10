
_ob = "";
_nm = 0;
_ng = [];
_rn = 0;
_ms = [];
_id = 0;
_rs = [];
nam_Data = pogost getVariable "Mass_Pl";

disableSerialization;
_ok = createDialog "End_dial";
_nm = Namb_Pl;
While {visibleScoretable} do {
_ob = [20*_nm,1000] nearestObject "Suitcase";
_ms = _ob getVariable "Data_Pl";
_rn = _ms select 0;
_rs = _ms select 1;
_a = 15;
While {_a >= 0} do {
if ((2^_a) <= _rs) then {_ng set [_a,1];_rs = _rs - 2^_a;} else {_ng set [_a,0];};
_a = _a - 1;
};
_a = 0;
While {_a < 4} do {
_b = 0;
While {_b < 4} do {
	_id = 61010 + _b + _a * 10;
if ((_ng select (_b + _a * 4)) != 0) then {
	ctrlSetText [_id, Mi_ord select (_b + _a * 4)];
	} else {
	ctrlSetText [_id,""];
	};
_b = _b + 1;
};
_a = _a + 1;
};

ctrlSetText [61001, Mi_rang select _rn];
ctrlSetText [61002, nam_Data select _nm];

ctrlSetText [61004, Mi_pic select _rn];
ctrlSetText [61005, Mi_pic select _rn];


WaitUntil {!visibleScoretable};

};