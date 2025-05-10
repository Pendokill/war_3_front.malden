player setUnitLoadout (player getVariable ["respawnLoadout",getUnitLoadout player]);
player enableFatigue false;
//playMusic "";
cutRSC ["overlay","PLAIN"];
/*
Mi_vdv joinSilent group player;
(group player) selectLeader Player;
*/
{if !(alive _x) then {Mi_vdv = Mi_vdv - [_x]}} forEach Mi_vdv;
