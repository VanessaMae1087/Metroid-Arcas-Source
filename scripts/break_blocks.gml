if object_index == oPlayer
{
 with (oBreakScrew)
 if oPlayer.State == oPlayer.JUMPING && oPlayer.Spinning && global.Power[P_SCREW] && oPlayer.InWater == 0 && global.Suit != 3
 if place_meeting(xstart,ystart,oPlayer)
 {
  event_user(0);
  if Index <= 1 && Dying
  if !audio_is_playing(sndBreakScrew)
   sound_play_pos(sndBreakScrew,xstart,ystart); 
 }
 with (oBreakSpeed)
 if (oPlayer.Dash >= oPlayer.DashTime or oPlayer.State == oPlayer.SUPERJUMP) && oPlayer.InWater == 0 && global.Suit != 3
 if place_meeting(xstart,ystart,oPlayer)
 {
  event_user(0);
  if Index <= 1 && Dying
  if !audio_is_playing(sndBreakSpeed)
   sound_play_pos(sndBreakSpeed,xstart,ystart); 
 }
 with (oBreakShoot)
 if (oPlayer.Dash >= oPlayer.DashTime or oPlayer.State == oPlayer.SUPERJUMP) && oPlayer.InWater == 0 && global.Suit != 3
 if place_meeting(xstart,ystart,oPlayer)
 {
  event_user(0);
  if Index <= 1 && Dying
  { 
   if sprite_index != sBreakBig
   {
    if !audio_is_playing(sndBreakSpeed)
     sound_play_pos(sndBreakSpeed,xstart,ystart); 
   }
   else
   {
    if !audio_is_playing(sndBreakBig)
     sound_play_pos(sndBreakBig,xstart,ystart);  
   }
  }
 }
}
