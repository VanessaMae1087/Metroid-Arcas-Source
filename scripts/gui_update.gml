// First, missile selections

global.HaveMissiles = global.Power[P_MISSILE] && global.Suit != 3;
global.HaveSMissiles = global.Power[P_SMISSILE] && global.Suit != 3;
global.HavePBombs = global.Power[P_PBOMB] && global.Suit != 3;

draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_font(AmmoFont);

MSel = global.MainSelected;

// MOFF = 62 + 26 * i;
// BOFF = MOFF + 32;
// y = +3+global.HudOff;

// global.MainSelect
// global.RememberSelect
// on or off: global.MainSelected

if global.HudSelect == 0
{
 global.MainSelected = 0;
 if instance_exists(oPlayer)
 if global.KeyPushed[0,KEY_MISSILE]
 if !(oPlayer.State == oPlayer.GRIP && oPlayer.Facing == oPlayer.TrueFacing)
 if !(oPlayer.State == oPlayer.BALL && (global.PBombs < 0 or !global.HavePBombs))
 if !((global.Missiles <= 0 or global.HaveMissiles==0) && global.MainSelect == 0 && oPlayer.State != oPlayer.BALL)
 if !((global.SMissiles <= 0 or global.HaveSMissiles==0) && global.MainSelect == 1 && oPlayer.State != oPlayer.BALL) 
 {
  global.MainSelected = 1;
 }
 
 if global.HaveMissiles or global.HaveSMissiles
 if global.Missiles > 0 or global.SMissiles > 0
 if global.KeyPressed[0,KEY_SELECT]
 {
  if global.MainSelect == 0
  {
   if global.HaveSMissiles && global.SMissiles > 0
   {
    global.MainSelect = 1;
    sound_play_pos(sndMissileChange,view_xview+view_wview/2,view_yview+view_hview/2);
   }
  }
  else
  if global.MainSelect == 1
  {
   if global.HaveMissiles && global.Missiles > 0
   {
    global.MainSelect = 0;
    sound_play_pos(sndMissileChange,view_xview+view_wview/2,view_yview+view_hview/2);
   }
  } 
 }
 
 if !(global.HaveSMissiles && global.SMissiles > 0)
  global.MainSelect = 0; 
 if !(global.HaveMissiles && global.Missiles > 0)
  global.MainSelect = 1;  
}


if global.HaveMissiles
{
 Ind = 2;
 if global.Missiles > 0
 {                        
  if instance_exists(oPlayer) 
  if global.MainSelect == 0
  {
   Ind = 0;
   if global.MainSelected == 1 && oPlayer.State != oPlayer.BALL
    Ind = 1;
  }
 }
 draw_sprite(sHBoxes,Ind,view_xview + 62, view_yview + 3 + global.HudOff);
 Col = c_white;
 if Ind == 2
  Col = c_gray;
 if Ind == 1
  Col = c_black;
 
 draw_text_colour(view_xview + 86, view_yview + global.HudOff + 5, string(global.Missiles),Col,Col,Col,Col,1);  
}

if global.HaveSMissiles
{
 Ind = 2;
 if global.SMissiles > 0
 {                         
  if instance_exists(oPlayer) 
  if global.MainSelect == 1
  {
   Ind = 0;
   if global.MainSelected == 1 && oPlayer.State != oPlayer.BALL
    Ind = 1;
  }
 }
 draw_sprite(sHBoxes,Ind + 3,view_xview + 88, view_yview + 3 + global.HudOff);
 
 Col = c_white;
 if Ind == 2
  Col = c_gray;
 if Ind == 1
  Col = c_black;
 
 draw_text_colour(view_xview + 112, view_yview + global.HudOff + 5, string(global.SMissiles),Col,Col,Col,Col,1);  
}

if global.HavePBombs
{
 Ind = 2;
 if global.PBombs > 0
 {      
  Ind = 0;                   
  if instance_exists(oPlayer) 
  if oPlayer.State == oPlayer.BALL
  {
   if global.MainSelected == 1
    Ind = 1;
  }
 }
 draw_sprite(sHBoxes,Ind + 6,view_xview + 120, view_yview + 3 + global.HudOff);
 
 Col = c_white;
 if Ind == 2
  Col = c_gray;
 if Ind == 1
  Col = c_black;
 
 draw_text_colour(view_xview + 144, view_yview + global.HudOff + 5, string(global.PBombs),Col,Col,Col,Col,1);  
}

if MSel != global.MainSelected
&& MSel == 0
sound_play_pos(sndMissileSelect,view_xview+view_wview/2,view_yview+view_hview/2);
