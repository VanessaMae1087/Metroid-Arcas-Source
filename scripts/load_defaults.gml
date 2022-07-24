ds_list_clear(global.IDStack);
map_init();
load_constants();
global.Layer = 0;
global.Transition = -1;
global.JustTrans = 0;
global.TransitionType = 0;// 0 yt, 1 nt
global.Fade = 0;
global.CanControl = 1;
global.HudOff = 0;
global.MapFade = 00;
global.MapStep = 0;
global.MapColor = c_white;
global.Difficulty = 1;

for (i=0;i<3;i++)
ds_list_destroy(global.Log[i]);
global.Log[0] = ds_list_create();
global.Log[1] = ds_list_create();
global.Log[2] = ds_list_create();

global.Energy = 99;
global.EnergyMax = 99;

global.Missiles = 0;
global.MissilesMax = 0;
global.PBombs = 20;
global.PBombsMax = 20;
global.SMissiles = 0;
global.SMissilesMax = 0;

global.RememberSelect = 0;
global.MainSelect = 0;
global.HudSelect = 0; // 0 ZM, 1 SM
global.MainSelected = 0;
global.HaveMissiles = 0;
global.HaveSMissiles = 0;
global.HavePBombs = 0;

global.Suit = 0; // 0 p, 1 v, 2 g, 3 z
global.LastItem = noone; // For flashing

global.Unlock[U_BEAM] = "P"; //P:POWER //6, power, long, charge, ice, wave, plasma, 
global.Unlock[U_MISC] = ""; //G:GRIP,B:BALL,S:SCREW,P:SPRING
global.Unlock[U_BOMB] = ""; //N:NORM 
global.Unlock[U_BOOTS] = ""; //S:SPEED,H:HIGHJUMP,P:SPACEJ
global.Unlock[U_SUIT] = "P"; //P:POWER
global.Unlock[U_MISSILE] = ""; //N:NORMAL

global.Power[30] = 0;

global.Power[P_MORPHBALL] = 0;
global.Power[P_GRIP] = 0;
global.Power[P_SPRINGBALL] = 0;
global.Power[P_PBOMB] = 0;
global.Power[P_PSUIT] = 1;
global.Power[P_VSUIT] = 0;
global.Power[P_GSUIT] = 0;
global.Power[P_BOMB] = 0;
global.Power[P_PBOMB] = 0;
global.Power[P_MISSILE] = 0;
global.Power[P_SMISSILE] = 0;
global.Power[P_SPEEDBOOSTER] = 0;
global.Power[P_SCREW] = 0;
global.Power[P_HIJUMP] = 0;
global.Power[P_SPACE] = 0;

global.Power[P_LBEAM] = 0;
global.Power[P_PBEAM] = 1;
global.Power[P_CBEAM] = 0;
global.Power[P_WBEAM] = 0;
global.Power[P_IBEAM] = 0;
global.Power[P_HBEAM] = 0
