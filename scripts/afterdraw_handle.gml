if view_current == 0
{
 if State == SUPERJUMP && (global.TickP mod 6=0) && !SuperBall && !global.PausedGame
 {
  if ShineDir = 0 
  {
   myspark=instance_create(x,y-32,oSpeedSplash);
   myspark.image_angle=90;
   myspark.Additive=1;
   myspark.Hue = BoostBlend[Num];  myspark.sprite_index=sSSpeedShine;
  }
 if Facing=1 {
 if ShineDir=2 {myspark=instance_create(x+12,y-16,oSpeedSplash) myspark. Hue = BoostBlend[Num]; myspark.sprite_index=sSSpeedShine;}
 if ShineDir=1 {myspark=instance_create(x+12,y-22,oSpeedSplash);myspark.image_angle=20 myspark.Hue = BoostBlend[Num] myspark.sprite_index=sSSpeedShine;}}
 if Facing=-1 {
 if ShineDir=4 {myspark=instance_create(x-12,y-16,oSpeedSplash) myspark.Hue = BoostBlend[Num] myspark.image_angle=180 myspark.sprite_index=sSSpeedShine;}
 if ShineDir=3 {myspark=instance_create(x-12,y-22,oSpeedSplash);myspark.image_angle=340 myspark.Hue = BoostBlend[Num] myspark.image_xscale=-1 myspark.sprite_index=sSSpeedShine;}}
 myspark.image_speed=1
 myspark.Additive=1
 myspark.Hue = BoostBlend[Num] myspark.sprite_index=sSSpeedShine;}
 if (SuperBall  && (State==SUPERJUMP)) and global.TickP mod 6=0 && !global.PausedGame {
 myspark=instance_create(x,y-10-((State==RUNNING)*11),oSpeedSplash)
 myspark.image_angle=point_direction(xprevious,yprevious,x,y)
 myspark.Additive=1
 myspark.image_alpha=1;
 myspark.Hue = BoostBlend[Num] myspark.sprite_index=sSSpeedShine;}
 
 
 if State = SJSTART && SuperBall = 1 && yVel == 0
 {
  draw_sprite(sSBallCharge,StateTime/2,x,y-8);
 }
 
 if State == JUMPING && Spinning && !InWater && global.Power[P_SCREW] && global.Suit != 3
 {
  Color = choose(
  make_color_rgb(248,248,168),
  make_color_rgb(0,248,112),
  make_color_rgb(0,120,248),
  make_color_rgb(248,120,248),
  make_color_rgb(32,168,56), 
  make_color_rgb(24,40,248)); 
  
  if global.PausedGame == 0 ang = floor(random(360)/90)*90;
  
 //draw_set_blend_mode(bm_add);
  draw_sprite_ext(sScrew,global.TickP,x,y-14,min(StateTime/10,1),min(StateTime/10,1),ang,Color,1);
  draw_set_blend_mode(bm_normal);
 }
 
 if ChargeIndex > 0
 if !(Spinning && image_index > .5)
  draw_sprite_ext(ChargeSprite, real(string_char_at(global.CBI,ChargeIndex+1)),x+ChargeX, y+ChargeY, ArmFacing, image_yscale, image_angle, image_blend, image_alpha);
 }
