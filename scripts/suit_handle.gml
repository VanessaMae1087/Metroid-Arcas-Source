// FINAL SUIT

global.ShoulderPads = (global.Suit == 2);

if view_current == 0
{
 if !instance_exists(oSubscreen)
 {
  global.FinalSuit = 3;
  if global.Power[P_PSUIT]
   global.FinalSuit = 0;
  if global.Power[P_VSUIT]
   global.FinalSuit = 1;
  if global.Power[P_GSUIT]
   global.FinalSuit = 2;
   global.Suit = global.FinalSuit;
  if instance_exists(oSuitEffect)
   global.FinalSuit = global.LastSuit;
 }

 // SUIT SPRITE
 
 if !(global.FinalSuit == 0 && !global.ShoulderPads)
 {
  global.FinalSuitS = global.FinalSuit;
  
  CheckFinal = asset_get_index(sprite_get_name(sprite_index)+Str[global.FinalSuitS]);
  if CheckFinal != -1
   FinalSprite = CheckFinal;
  CheckFinal = asset_get_index(sprite_get_name(TorsoSprite)+Str[global.FinalSuitS]);
  if CheckFinal != -1
  FinalTorso = CheckFinal; 
 }   
 
 HurtPalette = 0;
 if HurtFlash or (Spinning && State == JUMPING && global.Power[P_SCREW] && !InWater && global.Tick mod 2 == 0 && global.Suit != 3) 
 or Invincible HurtPalette = 1;
 
 Mirror = Facing;
 Legs = Facing;
 
 if State != GRIP
 {
  if (Turning or (State == BALL && !Morphing)) && !(State == IDLE && Turning)
  {
   Legs = 1;
   Mirror = 1;
  }
 }
 else
 {
  Legs = TrueFacing;
  Mirror = TrueFacing;
 }
}
