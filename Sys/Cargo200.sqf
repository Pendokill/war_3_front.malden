_ms = [];
_p0 = Pos_dell select 0;
_p1 = Pos_dell select 1;
sleep 120;
While {true} do {
_ms = nearestObjects [Pos_dell, ["Man"],18];
_a = -5;
_b = -10;
{
if !(alive _x) then {
_x setPos [_p0 + _a, _p1 + _b];
_x setDir 180;
if (_a < 11) then {_a = _a + 1} else {_a = 0;_b = _b + 2};
} else {_ms = _ms - [_x]};
} forEach _ms;
sleep 120;
{deleteVehicle _x; sleep 2;} forEach _ms;
};
