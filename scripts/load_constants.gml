global.sbrungraphes = 3;
global.sbrungraphs[0,1] = 0;

for(nnnnnnnnnn=0;nnnnnnnnnn<global.sbrungraphes;nnnnnnnnnn+=1)
{
 global.sbrungraphs[nnnnnnnnnn,0] = 0;
 global.sbrungraph[nnnnnnnnnn,0] = 0;
 global.sbrungraph[nnnnnnnnnn,1] = 0;
}

global.boostlights[0] = make_color_rgb(255,0,0);
global.boostlights[1] = make_color_rgb(255,75,50);
global.boostlights[2] = make_color_rgb(255,150,100);
global.boostlights[3] = make_color_rgb(255,225,150);
global.boostlights[4] = make_color_rgb(255,225,150);

global.FontColor[0] = c_white; // Normal
global.FontColor[1] = c_aqua; // Area name
global.FontColor[2] = make_color_rgb(0,255,0);
global.FontColor[3] = c_yellow;
global.FontColor[4] = c_red;
global.FontColor[5] = c_orange;
global.FontColor[6] = c_gray;

global.FontLength[0] = 19; // L
global.FontLength[1] = 19; // T
global.FontLength[2] = 19; // R
global.FontLength[3] = 19; // B
global.FontLength[4] = 19; // Fire
global.FontLength[5] = 19; // Jump 
global.FontLength[6] = 21; // Start
global.FontLength[7] = 40; // Select
global.FontLength[8] = 21; // Aim
global.FontLength[9] = 21; // Weapon

global.FontMain = font_add_sprite(sFontMain,32,1,-1);
global.FontSize = "88777884667788887777777777888888888888888788898888887899978676888777777773764777776767777778688888";

MapX = view_wview - 42;
MapY = 2;
