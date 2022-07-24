// explode(x,y,type)

// 0 Screw Impact, 1 Shine Impact, 2 Pseudo, 3 small exp
// 4 ice

switch argument2
{
 case 0: 
  sound_play_pos(sndExplodeScrew,argument0,argument1);
  Eff = instance_create(argument0,argument1,oFXAnim);
  Eff . sprite_index = sExplosion;
  Eff . depth = -201;
  Eff . image_speed = .5;
  for (i=0;i<4;i++)
  {
   Eff = instance_create(argument0,argument1,oExplosionSpawner);
   Eff . sprite_index = sExplosion2;
   Eff . image_speed = .5;
   Eff . Speed = 6;
   Eff . Direction = i*90 + 45
   Eff . Mod = 2;
   Eff . Amount = 4;
  }
  repeat (3)
   instance_create(argument0-random(10)+5,argument1-random(5)+2.5,oPebble);
 break;
 
 case 1: 
  sound_play_pos(sndExplode2,argument0,argument1);
  Eff = instance_create(argument0,argument1,oFXAnim);
  Eff . sprite_index = sExplosion;
  Eff . depth = -201;
  Eff . image_speed = .5;
  for (i=0;i<4;i++)
  {
   Eff = instance_create(argument0,argument1,oExplosionSpawner);
   Eff . sprite_index = sExplosion2;
   Eff . image_speed = .5;
   Eff . Speed = 6;
   Eff . Direction = i*90 + 45
   Eff . Mod = 2;
   Eff . Amount = 4;
  }
  repeat (3)
   instance_create(argument0-random(10)+5,argument1-random(5)+2.5,oPebble);
 break;

 case 2: 
  sound_play_pos(sndExplodeScrew,argument0,argument1);
  Eff = instance_create(argument0,argument1,oFXAnim);
  Eff . sprite_index = sExplosion;
  Eff . depth = -201;
  Eff . image_speed = .5;
  Eff = instance_create(argument0-5,argument1,oFXAnim);
  Eff . sprite_index = sExplosion2;
  Eff . depth = -201;
  Eff . image_speed = .5;
  Eff = instance_create(argument0+5,argument1,oFXAnim);
  Eff . sprite_index = sExplosion2;
  Eff . depth = -201;
  Eff . image_speed = .5;
  for (i=0;i<2;i++)
  {
   Eff = instance_create(argument0,argument1,oExplosionSpawner);
   Eff . sprite_index = sExplosion2;
   Eff . image_speed = .5;
   Eff . Speed = 5;
   Eff . Direction = i*180;
   Eff . Mod = 2;
   Eff . Amount = 4;
  }
  repeat (3)
   instance_create(argument0-random(10)+5,argument1-random(5)+2.5,oPebble);
 break;
 
 case 3: 
  sound_play_pos(sndExplode2,argument0,argument1);
  Eff = instance_create(argument0,argument1+6,oFXAnim);
  Eff . sprite_index = sExplosion3;
  Eff . depth = -201;
  Eff . image_speed = .5;
  
  instance_create(argument0,argument1,oSmallExplosion);
 break;

 case 4: 
  Eff = instance_create(argument0,argument1+6,oFXAnim);
  Eff . sprite_index = sExplosionIce;
  Eff . depth = -201;
  Eff . image_speed = .5;
  
  instance_create(argument0,argument1,oSmallIce);
 break;


}
