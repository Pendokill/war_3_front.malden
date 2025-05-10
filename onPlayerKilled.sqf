sleep 1;
_myPlace1 = selectBestPlaces [position player, 200, "trees", 1, 1];
_myPlace2 = selectBestPlaces [position player, 100, "houses", 1, 1];
_myPlace3 = selectBestPlaces [position player, 300, "meadow", 1, 1];
if(Param4 == 1) then
{
	"respawn_east2" setMarkerPosLocal ((selectRandom _myPlace1) select 0);
	"respawn_east3" setMarkerPosLocal ((selectRandom _myPlace2) select 0);
	"respawn_east4" setMarkerPosLocal ((selectRandom _myPlace3) select 0);
};
//playMusic "CUP_A2_Organ_Works";