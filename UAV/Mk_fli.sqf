((finddisplay 61000) displayCtrl 61101) ctrlMapAnimAdd [1, 0.1, getPos f_cam];
ctrlMapAnimCommit ((finddisplay 61000) displayCtrl 61101);

_mk = createMarkerLocal ["Mk_UAV",getPos f_cam];
_mk setMarkerTypeLocal "n_plane";
_mk setMarkerColorLocal "ColorGreen";
While {dialog} do {
	_mk setMarkerPosLocal (getPos f_cam);
	sleep 2;
};
deleteMarkerLocal _mk;