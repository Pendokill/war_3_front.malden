class RscListBox  {
	access = 0;
	type = 5;
	style = 0;
	x = 0.00000;
	y = 0.200000;
	w = 0.300000;
	h = 0.60000;
	font = "TahomaB";
	sizeEx = 0.040000;
	rowHeight = 0;
	colorText[] = {0.1,1,1,1 };
	colorDisabled[] = {0.1,1,1,1 };
	colorScrollbar[] = {1,1,1,1 };
	colorSelect[] = {0,0,0,1 };
	colorSelect2[] = {0.1,1,1,0.6 };
	colorSelectBackground[] = {0.600000,0.600000,0.600000,1 };
	colorSelectBackground2[] = {0.200000,0.200000,0.200000,1 };
	colorBackground[] = {0,0,0,0 };
	maxHistoryDelay = 1.000000;
	soundSelect[] = {"",0.100000,1 };
	period = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; 
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; 

	class ListScrollBar  {
		color[] = {1,1,1,0.600000 };
		colorActive[] = {1,1,1,1 };
		colorDisabled[] = {1,1,1,0.300000 };
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; 
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; 
	};
};

class RscListNBox  {
	access = 0;
	type = 102;
	style = 0;
    x = 0; 
    y = 0.2; 
    w = 0.5; 
    h = 0.6;
	font = "TahomaB";
	sizeEx = 0.040000;
	rowHeight = 0;
	colorText[] = {1,1,1,1 };
	colorScrollbar[] = {1,1,1,1 };
	colorSelect[] = {0,0,0,1 };
	colorSelect2[] = {1,0.500000,0,1 };
	colorSelectBackground[] = {0.600000,0.600000,0.600000,1 };
	colorSelectBackground2[] = {0.200000,0.200000,0.200000,1 };
	colorBackground[] = {0,0,0,1 };
	maxHistoryDelay = 1.000000;
	soundSelect[] = {"",0.100000,1 };
	period = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; 
	drawSideArrows = 0;
	columns[] = {0.300000,0.600000,0.700000 };
	idcLeft = -1;
	idcRight = -1;

	class ScrollBar  {
		color[] = {1,1,1,0.600000 };
		colorActive[] = {1,1,1,1 };
		colorDisabled[] = {1,1,1,0.300000 };
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; 
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; 
	};
};

class MySlider {
    idc = -1;
    type = 43;
    style = 1024;
    x = 0.4;
    y = 0.3;
    w = 0.3;
    h = 0.04;
    arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
    thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
    color[] = {1,1,1,0.5};
    coloractive[] = {1,1,1,1};
    sliderPosition = 5;
    sliderRange[] = {1,10};
    sliderStep = 1;
    lineSize = 1;
    onSliderPosChanged = "Slayd_nm = _this select 1;ctrlSetText [51006, format ['%1 %2',localize 'STR_ViewDistance', Slayd_nm]];";
};

class RscShortcutButton  {
type = 16;
idc = -1;
style = 0;
default = 0;
w = 0.183825;
h = 0.104575;
color[] = {0.94999999,0.94999999,0.94999999,1.000000 };
color2[] = {0.950000,0.950000,0.950000,1 };
colorFocused[] = {0.94999999,0.94999999,0.94999999,1.000000 };
colorBackgroundFocused[] = {0.94999999,0.94999999,0.94999999,1.000000 };
colorBackground[] = {1,1,1,1 };
colorbackground2[] = {1,1,1,0.400000 };
colorDisabled[] = {1,1,1,0.250000 };
periodFocus = 1.200000;
periodOver = 0.800000;

class HitZone  {
	left = 0.004000;
	top = 0.029000;
	right = 0.004000;
	bottom = 0.029000;
};

class ShortcutPos  {
	left = 0.014500;
	top = 0.026000;
	w = 0.039216;
	h = 0.052288;
};

class TextPos  {
	left = 0.025000;
	top = 0.034000;
	right = 0.015000;
	bottom = 0.005000;
};
animTextureDefault="\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureNormal="\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureDisabled="\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureOver="\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
	animTextureFocused="\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
	animTexturePressed="\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
TextureNoShortcut = "";
period = 0.400000;
font = "RobotoCondensed";
size = 0.039210;
sizeEx = 0.039210;
text = "";
soundEnter[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.090000004,
		1
	};
	soundPush[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.090000004,
		1
	};
	soundClick[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.090000004,
		1
	};
	soundEscape[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.090000004,
		1
	};
action = "";

class Attributes  {
	font = "RobotoCondensed";
	color = "#E5E5E5";
	align = "left";
	shadow = "true";
};

class AttributesImage  {
	font = "RobotoCondensed";
	color = "#E5E5E5";
	align = "left";
};
};

class RscShButMain : RscShortcutButton {
	class HitZone  {
	left = 0;
	top = 0;
	right = 0;
	bottom = 0;
};

class ShortcutPos  {
	left = 0;
	top = 0;
	w = 0;
	h = 0;
};

	animTextureNormal = "img\3s.JPG";
	animTextureDisabled = "img\3s.JPG";
	animTextureOver = "img\0s.JPG";
	animTextureFocused = "img\2s.JPG";
	animTexturePressed = "img\1s.jpg";
	animTextureDefault = "img\3s.JPG";
	
	class TextPos  {
	left = 0;
	top = 0;
	right = 0;
	bottom = 0;
};
};

class MyRscCombo {
  idc = 0;
  type = 4;
  style = 256;

  x = 0;
  y = 0.22;
  w = 0.5;
  h = 0.05;
    
  font = "TahomaB";
  sizeEx = 0.045;
  
rowHeight = 0.025;
wholeHeight = 10 * 0.05;
maxHistoryDelay = 1.000000;
autoScrollSpeed = -1;
autoScrollDelay = 10;
autoScrollRewind = 0;

color[] = {1,1,1,1};
colorSelect[] = {0.023529,0,0.031372,1 };
colorText[] = {0.023529,0,0.031372,1 };
colorBackground[] = {0.950000,0.950000,0.950000,1 };
colorSelectBackground[] = {0.543000,0.574200,0.410200,1.000000 };
colorScrollbar[] = {0.023529,0,0.031372,1 };
colorActive[] = {0,0,0,1 };
colorDisabled[] = {0,0,0,0.300000 };
arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; 

soundSelect[] = {"\ca\ui\data\sound\mouse2",0.090000,1};
soundExpand[] = {"\ca\ui\data\sound\new1",0.090000,1};
soundCollapse[] = {"\ca\ui\data\sound\mouse1",0.090000,1 };
  
  	class ScrollBar  {
		color[] = {1,1,1,0.600000 };
		colorActive[] = {1,1,1,1 };
		colorDisabled[] = {1,1,1,0.300000 };
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; 
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; 
	};
};
 
class RscEdit  {
	access = 0;
	type = 2;
	style = 0;
	idc = 0;
	colorBackground[] = {0,0,0,0 };
	colorText[] = {1,1,1,1 };
	colorSelection[] = {1,1,1,0.250000 };
	colorDisabled[] = {1,1,1,0.250000 };
	font = "TahomaB";
	sizeEx = 0.080000;
	autocomplete = "";
	text = "";
	size = 0.200000;
};

class RscText  {
	idc = -1;
	type = 0;
	style = 256;
	colorBackground[] = {0.1882,0.2588,0.149,0.76 };
	font = "RobotoCondensed";
	SizeEx = 0.040000;
	colorText[] = {1,1,1,1.000000 };
};

class RscPicture
{
  access = 0;
  type = CT_STATIC;
  idc = -1;
  style = 48;//ST_PICTURE
  colorBackground[] = {0,0,0,0};
  colorText[] = {1,1,1,1};
  font = "TahomaB";
  sizeEx = 0;
  lineSpacing = 0;
  text = "";
  fixedWidth = 0;
  shadow = 0;
};

class RscMapControl  {
	idc = -1;
	type = 101;
	style = 48;
	moveOnEdges = 1;
	widthRailWay = 1;
	x = "SafeZoneX";
	y = "SafeZoneY";
	w = "SafeZoneW";
	h = "SafeZoneH";
	ptsPerSquareSea = 8;
	ptsPerSquareTxt = 10;
	ptsPerSquareCLn = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareFor = "6.0f";
	ptsPerSquareForEdge = "15.0f";
	ptsPerSquareRoad = "3f";
	ptsPerSquareObj = 15;
	showCountourInterval = "false";
	scaleMin = 0.001;
	scaleMax = 1.0;
	scaleDefault = 0.16;
	maxSatelliteAlpha = 0.750000;
	alphaFadeStartScale = 0.150000;
	alphaFadeEndScale = 0.290000;
	colorLevels[] = {0.650000,0.600000,0.450000,1 };
	colorSea[] = {0.460000,0.650000,0.740000,0.500000 };
	colorForest[] = {0.450000,0.640000,0.330000,0.500000 };
	colorRocks[] = {0,0,0,0.300000 };
	colorCountlines[] = {0.850000,0.800000,0.650000,1 };
	colorMainCountlines[] = {0.450000,0.400000,0.250000,1 };
	colorCountlinesWater[] = {0.250000,0.400000,0.500000,0.300000 };
	colorMainCountlinesWater[] = {0.250000,0.400000,0.500000,0.900000 };
	colorPowerLines[] = {0.100000,0.100000,0.100000,1 };
	colorRailWay[] = {0.800000,0.200000,0,1 };
	colorForestBorder[] = {0,0,0,0 };
	colorRocksBorder[] = {0,0,0,0 };
	colorNames[] = {0.100000,0.100000,0.100000,0.900000 };
	colorInactive[] = {1,1,1,0.500000 };
	colorOutside[] = {0,0,0,1 };
	colorBackground[] = {0.188200,0.258800,0.149000,0.360000 };
	colorText[] = {0.543000,0.574200,0.410200,1.000000 };
	colorTracks[] = {0.84,0.76,0.65,0.15};
	colorTracksFill[] = {0.84,0.76,0.65,1.0};
	colorRoads[] = {0.7,0.7,0.7,1.0};
	colorRoadsFill[] = {1.0,1.0,1.0,1.0};
	colorMainRoads[] = {0.9,0.5,0.3,1.0};
	colorMainRoadsFill[] = {1.0,0.6,0.4,1.0};
	colorGrid[] = {0.1,0.1,0.1,0.6};
	colorGridMap[] = {0.1,0.1,0.1,0.6};
	font = "RobotoCondensed";
	SizeEx = 0.040000;
	fontLabel = "RobotoCondensed";
	sizeExLabel = 0.034000;
	fontGrid = "RobotoCondensed";
	sizeExGrid = 0.030000;
	fontUnits = "RobotoCondensed";
	sizeExUnits = 0.034000;
	fontNames = "RobotoCondensed";
	sizeExNames = 0.056000;
	fontInfo = "RobotoCondensed";
	sizeExInfo = 0.034000;
	fontLevel = "RobotoCondensed";
	sizeExLevel = 0.024000;
	text = "\ca\ui\data\map_background2_co.paa";

	class Task  {
		icon = "\ca\ui\data\ui_taskstate_current_CA.paa";
		iconCreated = "\ca\ui\data\ui_taskstate_new_CA.paa";
		iconCanceled = "#(argb,8,8,3)color(0,0,0,0)";
		iconDone = "\ca\ui\data\ui_taskstate_done_CA.paa";
		iconFailed = "\ca\ui\data\ui_taskstate_failed_CA.paa";
		color[] = {0.863000,0.584000,0.000000,1 };
		colorCreated[] = {0.950000,0.950000,0.950000,1 };
		colorCanceled[] = {0.606000,0.606000,0.606000,1 };
		colorDone[] = {0.424000,0.651000,0.247000,1 };
		colorFailed[] = {0.706000,0.074500,0.019600,1 };
		size = 27;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	
	class LineMarker
	{
		lineWidthThin = 0.008;
		lineWidthThick = 0.014;
		lineDistanceMin = 3e-005;
		lineLengthMin = 5;
	};
	
	class ActiveMarker  {
		color[] = {0.300000,0.100000,0.900000,1 };
		size = 50;
	};

	class CustomMark  {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		color[] = {0.647100,0.670600,0.623500,1.000000 };
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};

	class Legend  {
		x = "SafeZoneX";
		y = "SafeZoneY";
		w = 0.340000;
		h = 0.152000;
		font = "RobotoCondensed";
		sizeEx = 0.039210;
		colorBackground[] = {0.906000,0.901000,0.880000,0 };
		color[] = {0,0,0,1 };
	};

	class Bunker  {
		icon = "\ca\ui\data\map_bunker_ca.paa";
		color[] = {0.450000,0.640000,0.330000,0.400000 };
		size = 14;
		importance = "1.5 * 14 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Bush  {
		icon = "\ca\ui\data\map_bush_ca.paa";
		color[] = {0.450000,0.640000,0.330000,0.400000 };
		size = 14;
		importance = "0.2 * 14 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class BusStop  {
		icon = "\ca\ui\data\map_busstop_ca.paa";
		color[] = {0.150000,0.260000,0.870000,1 };
		size = 12;
		importance = "1 * 10 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Command  {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		color[] = {0,0.900000,0,1 };
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};

	class Cross  {
		icon = "\ca\ui\data\map_cross_ca.paa";
		size = 16;
		color[] = {0,0.900000,0,1 };
		importance = "0.7 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Fortress  {
		icon = "\ca\ui\data\map_bunker_ca.paa";
		size = 16;
		color[] = {0,0.900000,0,1 };
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Fuelstation  {
		icon = "\ca\ui\data\map_fuelstation_ca.paa";
		size = 16;
		color[] = {0,0.900000,0,1 };
		importance = "2 * 16 * 0.05";
		coefMin = 0.750000;
		coefMax = 4;
	};

	class Fountain  {
		icon = "\ca\ui\data\map_fountain_ca.paa";
		color[] = {0.200000,0.450000,0.700000,1 };
		size = 11;
		importance = "1 * 12 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Hospital  {
		icon = "\ca\ui\data\map_hospital_ca.paa";
		color[] = {0.780000,0,0.050000,1 };
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.500000;
		coefMax = 4;
	};

	class Chapel  {
		icon = "\ca\ui\data\map_chapel_ca.paa";
		color[] = {0.450000,0.640000,0.330000,0.400000 };
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class Church  {
		icon = "\ca\ui\data\map_church_ca.paa";
		size = 16;
		color[] = {0,0.900000,0,1 };
		importance = "2 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class Lighthouse  {
		icon = "\ca\ui\data\map_lighthouse_ca.paa";
		size = 14;
		color[] = {0,0.900000,0,1 };
		importance = "3 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class Quay  {
		icon = "\ca\ui\data\map_quay_ca.paa";
		size = 16;
		color[] = {0,0.900000,0,1 };
		importance = "2 * 16 * 0.05";
		coefMin = 0.500000;
		coefMax = 4;
	};

	class Rock  {
		icon = "\ca\ui\data\map_rock_ca.paa";
		color[] = {0.100000,0.100000,0.100000,0.800000 };
		size = 12;
		importance = "0.5 * 12 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Ruin  {
		icon = "\ca\ui\data\map_ruin_ca.paa";
		size = 16;
		color[] = {0,0.900000,0,1 };
		importance = "1.2 * 16 * 0.05";
		coefMin = 1;
		coefMax = 4;
	};

	class SmallTree  {
		icon = "\ca\ui\data\map_smalltree_ca.paa";
		color[] = {0.450000,0.640000,0.330000,0.400000 };
		size = 12;
		importance = "0.6 * 12 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Stack  {
		icon = "\ca\ui\data\map_stack_ca.paa";
		size = 20;
		color[] = {0,0.900000,0,1 };
		importance = "2 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class Tree  {
		icon = "\ca\ui\data\map_tree_ca.paa";
		color[] = {0.450000,0.640000,0.330000,0.400000 };
		size = 12;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};

	class Tourism  {
		icon = "\ca\ui\data\map_tourism_ca.paa";
		color[] = {0.450000,0.640000,0.330000,0.400000 };
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.700000;
		coefMax = 4;
	};

	class Transmitter  {
		icon = "\ca\ui\data\map_transmitter_ca.paa";
		color[] = {0,0.900000,0,1 };
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class ViewTower  {
		icon = "\ca\ui\data\map_viewtower_ca.paa";
		color[] = {0,0.900000,0,1 };
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.500000;
		coefMax = 4;
	};

	class Watertower  {
		icon = "\ca\ui\data\map_watertower_ca.paa";
		color[] = {0.200000,0.450000,0.700000,1 };
		size = 20;
		importance = "1.2 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};

	class Waypoint  {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		color[] = {0.0000,0.0000,0.0000,0.400000 };
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.500000;
		coefMax = 4;
	};

	class WaypointCompleted  {
		icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
		color[] = {0.0000,0.0000,0.0000,0.400000 };
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.500000;
		coefMax = 4;
	};
	
	class powersolar
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1,1,1,1};
	};
	
	class powerwave
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1,1,1,1};
	};
	
	class powerwind
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {1,1,1,1};
	};
	
	class Shipwreck
	{
		icon = "\A3\ui_f\data\map\mapcontrol\Shipwreck_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1.0;
		color[] = {0,0,0,1};
	};
};
