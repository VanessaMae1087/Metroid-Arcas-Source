if view_current == 0
{
 PBeamCurrent = global.Power[P_PBEAM];
 
 if global.Suit == 3
  global.Power[P_PBEAM] = 0;
 
 if State == IDLE && !Turning Legs = 1;
 
 if !global.PausedGame
 {
  tPrevv += 1;
  if Dash >= DashTime tPrevv += 1;
  if (tPrevv > 4 + (2*(Dash >= DashTime)))
   tPrevv = 0;
 }
 Mult = 2;
 
 
 CC = make_color_rgb(225,220,255);
 AA = .5;
 
 xPrevious[0] = x;
 yPrevious[0] = y;
 
 Num = 0;
 
 if floor(global.Tick/2) mod 3 == 0
  Num = 0;
 if floor(global.Tick/2) mod 3 == 1
  Num = 1;
 if floor(global.Tick/2) mod 3 == 2
  Num = 2;
  
 Num2 = 0;
 if floor(global.Tick/2) mod 5 == 0
  Num2 = 0;
 if floor(global.Tick/2) mod 5 == 1
  Num2 = 1;
 if floor(global.Tick/2) mod 5 == 2
  Num2 = 2;
 if floor(global.Tick/2) mod 5 == 3
  Num2 = 3;
 if floor(global.Tick/2) mod 5 == 4
  Num2 = 4;
                 
 Num3 = 0;
 
 if floor(global.Tick/2) mod 2 == 0
  Num3 = 0;
 if floor(global.Tick/2) mod 2 == 1
  Num3 = 1;
      
 Rushing = (Dash>DashTime or Charge or State=SJSTART or State=SUPERJUMP);
 
 BeamHue = merge_color(c_orange,c_red,.35);
 BeamBlend = c_red;
 
 if global.Power[P_LBEAM]
 {
  BeamHue = c_red;
  BeamBlend = c_orange;
 }
 if global.Power[P_WBEAM]
 {
  BeamHue = make_color_rgb(32,32,200);
  BeamBlend = make_color_rgb(72,72,240);
 }
 if global.Power[P_HBEAM]
 {
  BeamHue = make_color_rgb(20,198,124);
  BeamBlend = make_color_rgb(0,195,126);
 }
 
 if global.Power[P_IBEAM]
 {
  BeamHue = merge_color(c_aqua,c_blue,.5);
  BeamBlend = make_color_rgb(70,190,250);           
 }
 
 if !global.Power[P_PBEAM]
 {
  BeamHue = c_fuchsia
  BeamBlend = c_purple;
 }
 
 if ChargeIndex > 46 && global.Tick mod 2 == 0 BeamFade = 1;
 
 if BeamFade
  CC = BeamBlend;
  
 if HurtPalette //&& Num3 == 0
 {
  AA = image_alpha/1.15;
  if Num3 == 1
   AA = image_alpha*1.35;
 }
 else
 AA=.5;
 if Rushing
 {
  CC = c_white;
  AA = image_alpha;
 }
 
 global.Power[P_PBEAM] = PBeamCurrent;
}
