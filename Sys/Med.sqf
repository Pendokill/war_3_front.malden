if (Lekar) exitWith {};
_ob = objNull;
_mas = (nearestObjects [player, ["Man"], 3]) - [Player];
_ob = _mas select 0;
if ( format ["%1", _ob] == "<Null>") exitWith {hint "Healthy";};
if (damage _ob < 0.05) exitWith {hint "It is rescued";};
Lekar = true;
player playMove "AinvPknlMstpSlayWrflDnon_medic";
_a = damage _ob;
While {_a > 0} do {
	_a = _a - 0.03;
	_ob setDamage _a;
	sleep 0.5;
	hint "Помогаю";
};
hint "Готово";
_as = [Vehicle Player, 4] Spawn Fun_Orden;
sleep 2;
Lekar = False;