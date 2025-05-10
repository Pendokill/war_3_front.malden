

sleep 5;
Switch  (_this select 0) do {
	case 0 :{
	Switch (ActL) do {
		case 1 : {_as = ["w_l_0", "b_l_0", grp_R0] execVM "Garnizon\Back0.sqf";};
		case 2 : {_as = ["w_l_1", "b_l_1", grp_R0] execVM "Garnizon\Back1.sqf";};
		case 3 : {_as = ["w_l_2", "b_l_2", grp_R0] execVM "Garnizon\Back2.sqf";};
		case 4 : {_as = ["w_l_3", "b_l_3", grp_R0] execVM "Garnizon\Post2.sqf";};
		case 5 : {_as = ["w_l_4", "b_l_4", grp_R0] execVM "Garnizon\Back2.sqf";};
		case 6 : {_as = ["w_l_5", "b_l_5", grp_R0] execVM "Garnizon\Post0.sqf";};	
		};
	};
	case 1 :{
	Switch (ActC) do {
		case 1 : {_as = ["w_c_0", "b_c_0", grp_R1] execVM "Garnizon\Back0.sqf";};
		case 2 : {_as = ["w_c_1", "b_c_1", grp_R1] execVM "Garnizon\Back2.sqf";};
		case 3 : {_as = ["w_c_2", "b_c_2", grp_R1] execVM "Garnizon\Post2.sqf";};
		case 4 : {_as = ["w_c_3", "b_c_3", grp_R1] execVM "Garnizon\Back2.sqf";};
		case 5 : {_as = ["w_c_4", "b_c_4", grp_R1] execVM "Garnizon\Back1.sqf";};
		case 6 : {_as = ["w_c_5", "b_c_5", grp_R1] execVM "Garnizon\Post1.sqf";};	
		};		
	};
	case 2 :{
	Switch (ActP) do {
		case 1 : {_as = ["w_p_0", "b_p_0", grp_R2] execVM "Garnizon\Back2.sqf";};
		case 2 : {_as = ["w_p_1", "w_p_1", grp_R5] execVM "Garnizon\Post0.sqf";};
		case 3 : {_as = ["w_p_2_1", "w_p_2_1", grp_R5] execVM "Garnizon\Post2.sqf";};
		case 4 : {_as = ["w_p_3", "b_p_3", grp_R2] execVM "Garnizon\Back2.sqf";};
		case 5 : {_as = ["w_p_4", "b_p_4", grp_R2] execVM "Garnizon\Post1.sqf";};
		case 6 : {_as = ["w_p_5", "b_p_5", grp_R2] execVM "Garnizon\Back0.sqf";};
		case 7 : {_as = ["w_p_6", "b_p_6", grp_R2] execVM "Garnizon\Post2.sqf";};
		case 8 : {_as = ["w_p_7", "b_p_7", grp_R2] execVM "Garnizon\Post1.sqf";};
		case 9 : {_as = ["w_p_8", "b_p_8", grp_R2] execVM "Garnizon\Back1.sqf";};
		case 10: {_as = ["w_p_9", "b_p_9", grp_R2] execVM "Garnizon\Back2.sqf";};	
		};
	};
};

/*
контр атака  !  блок пост
grp_R0,      !  grp_R3    - линия 0
grp_R1,      !  grp_R4    - линия 1
grp_R2,      !  grp_R5    - линия 2

Back0.sqf - пешка
Back1.sqf - хамеры
Back2.sqf - Лав

Post0.sqf - отряд
Post1.sqf - пушки
Post2.sqf - ракеты
*/