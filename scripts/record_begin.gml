// record_begin();

global.SoundVolSafe = global.SoundVol;
global.SoundVol = 0;

global.Recording = 1;
global.RecordingTime = 0;
                        
global.JsonMap = ds_map_create();

for (i=0;i<30;i++)
{
 ds_map_add(global.JsonMap, "Power"+string(i), global.Power[i]);
}

for (var ih=0;ih<16;ih++)
{
 ds_map_add(global.JsonMap, "Disc"+string(ih),string(global.WorldDiscovered[ih]));
}

ds_map_add(global.JsonMap, "Map", buffer_base64_encode(oControl.MapBuffer,0,82432));
ds_map_add(global.JsonMap, "DiscBuffer", buffer_base64_encode(oControl.DiscBuffer,0,4096));

ds_map_add(global.JsonMap, "IDSTACK", ds_list_write(global.IDStack));


global.EnemyList = ds_list_create();

global.ENum = 0;

with (oEnemy)
{
 ID = id;
 if Demo == 1
 {
  global.EMap[global.ENum] = ds_map_create();

  for (i=0;i<ds_list_size(VarList);i++)
  {
   Key = ds_list_find_value(VarList,i);
   ds_map_add(global.EMap[global.ENum], Key, variable_read(Key));
  }       
 } 
  
 ds_list_add(global.EnemyList,global.EMap[global.ENum]);
 ds_list_mark_as_map(global.EnemyList,ds_list_size(global.EnemyList)-1); 
 
 global.ENum ++;
}

for (i=0;i<5;i++)
ds_map_add(global.JsonMap, "Unlock"+string(i), global.Unlock[i]);

ds_map_add_list(global.JsonMap, "Enemies", global.EnemyList);
ds_map_add(global.JsonMap, "MainSelect", global.MainSelect);
ds_map_add(global.JsonMap, "MainSelected", global.MainSelected);

ds_map_add(global.JsonMap, "Missiles", global.Missiles);
ds_map_add(global.JsonMap, "MissilesMax", global.MissilesMax);
ds_map_add(global.JsonMap, "PBombs", global.PBombs);
ds_map_add(global.JsonMap, "PBombsMax", global.PBombsMax);
ds_map_add(global.JsonMap, "SMissiles", global.SMissiles);
ds_map_add(global.JsonMap, "SMissilesMax", global.SMissilesMax);

ds_map_add(global.JsonMap, "Tick", global.Tick);
ds_map_add(global.JsonMap, "TickP", global.TickP);

ds_map_add(global.JsonMap, "Energy", global.Energy);
ds_map_add(global.JsonMap, "EnergyMax", global.EnergyMax);

ds_map_add(global.JsonMap, "Room", room_get_name(room));
ds_map_add(global.JsonMap, "MapX", global.MapX);
ds_map_add(global.JsonMap, "MapY", global.MapY);

ds_map_add(global.JsonMap, "Suit", global.Suit);

ds_map_add(global.JsonMap, "Spinning", oPlayer.Spinning);
ds_map_add(global.JsonMap, "SamusX", oPlayer.x);
ds_map_add(global.JsonMap, "SamusY", oPlayer.y);
ds_map_add(global.JsonMap, "SamusF", oPlayer.Facing);
ds_map_add(global.JsonMap, "SamusS", oPlayer.State);
ds_map_add(global.JsonMap, "SamusSP", oPlayer.StatePrev);
ds_map_add(global.JsonMap, "SamusST", oPlayer.StateTime);
ds_map_add(global.JsonMap, "SamusI", oPlayer.image_index);
ds_map_add(global.JsonMap, "SamusT", oPlayer.Turning);
ds_map_add(global.JsonMap, "SamusL", oPlayer.Landing);
ds_map_add(global.JsonMap, "SamusXV", oPlayer.xVel);
ds_map_add(global.JsonMap, "SamusYV", oPlayer.yVel); 
ds_map_add(global.JsonMap, "SamusW", oPlayer.InWater); 
ds_map_add(global.JsonMap, "SamusWP", oPlayer.InWaterPrev); 
ds_map_add(global.JsonMap, "SamusWF", oPlayer.InWaterFX); 
ds_map_add(global.JsonMap, "SamusWFP", oPlayer.InWaterPrevFX);
ds_map_add(global.JsonMap, "SamusD", oPlayer.Dash);
ds_map_add(global.JsonMap, "xMP", oPlayer.xMP);
ds_map_add(global.JsonMap, "xMN", oPlayer.xMN); 
ds_map_add(global.JsonMap, "yMP", oPlayer.yMP);
ds_map_add(global.JsonMap, "yMN", oPlayer.yMN); 
ds_map_add(global.JsonMap, "SamusC", oPlayer.Charge);

for (i=0;i<=10;i++)
{
 global.JsonKeyP[i] = ds_list_create();
 global.JsonKeyR[i] = ds_list_create(); 
 
 if global.KeyPushed[0,i] 
 {
  ds_list_add(global.JsonKeyP[i],"0");
 }
}
