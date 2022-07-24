// demo_begin(string)

global.JsonMap = json_decode(argument0);
global.DemoFrame = -1;
global.Demo = 1;
global.SoundVolSafe = global.SoundVol;
global.SoundVol = 0;
global.InGameSafe = global.InGame;
global.InGame = 1;

for (i=0;i<30;i++)
{ 
 global.Power[i] = ds_map_find_value(global.JsonMap, "Power"+string(i));
}

for (i=0;i<=10;i++)
{ 
 global.KeyListP[i] = ds_map_find_value(global.JsonMap,"KeyP"+string(i));
 global.KeyListR[i] = ds_map_find_value(global.JsonMap,"KeyR"+string(i)); 
 global.KeyOn[i] = (ds_list_find_index(global.KeyListP[i],"0")!=-1);
}
 
for (var ig=0;ig<16;ig++)
{
 global.WorldDiscovered[ig] = real(ds_map_find_value(global.JsonMap,"Disc"+string(ig)));
}    
                    


buffer_base64_decode_ext(oControl.MapBuffer, ds_map_find_value(global.JsonMap, "Map"), 0);
buffer_base64_decode_ext(oControl.DiscBuffer, ds_map_find_value(global.JsonMap, "DiscBuffer"), 0);
 
 
global.EnemyListD = ds_map_find_value(global.JsonMap, "Enemies");

ds_list_read(global.IDStack,ds_map_find_value(global.JsonMap, "IDSTACK"));

with (oEnemy) if Demo == 1 instance_destroy();

// Stores a list of maps

for (j=0;j<ds_list_size(global.EnemyListD);j++)
{
 Map = ds_list_find_value(global.EnemyListD,j);
 
 xE = ds_map_find_value(Map, "x");
 yE = ds_map_find_value(Map, "y");
 oE = ds_map_find_value(Map, "Object");
 
 ID = instance_create(xE,yE,asset_get_index(oE));
 
 First = ds_map_find_first(Map);
 for (i=0;i<ds_map_size(Map);i++)
 {
  if First != "x" && First != "y" && First != "Object"
  {
   with (ID) variable_set(other.First, ds_map_find_value(other.Map, other.First));
  }
  First = ds_map_find_next(Map,First); 
 } 
 
// ds_map_destroy(Map);
}

//ds_list_destroy(global.EnemyList);
for (i=0;i<5;i++)
global.Unlock[i] = ds_map_find_value(global.JsonMap, "Unlock"+string(i));


global.MainSelect = ds_map_find_value(global.JsonMap, "MainSelect");
global.MainSelected = ds_map_find_value(global.JsonMap, "MainSelected");

global.Missiles = ds_map_find_value(global.JsonMap, "Missiles");
global.MissilesMax = ds_map_find_value(global.JsonMap, "MissilesMax");
global.SMissiles = ds_map_find_value(global.JsonMap, "SMissiles");
global.SMissilesMax = ds_map_find_value(global.JsonMap, "SMissilesMax");
global.PBombs = ds_map_find_value(global.JsonMap, "PBombs");
global.PBombsMax = ds_map_find_value(global.JsonMap, "PBombsMax");

global.Tick = ds_map_find_value(global.JsonMap, "Tick");
global.TickP = ds_map_find_value(global.JsonMap, "TickP");

global.Energy = ds_map_find_value(global.JsonMap, "Energy");
global.EnergyMax = ds_map_find_value(global.JsonMap, "EnergyMax");
global.Suit = ds_map_find_value(global.JsonMap, "Suit");

if room != asset_get_index(ds_map_find_value(global.JsonMap, "Room"))
room_goto(asset_get_index(ds_map_find_value(global.JsonMap, "Room")));

global.MapX = ds_map_find_value(global.JsonMap, "MapX");
global.MapY = ds_map_find_value(global.JsonMap, "MapY");

if instance_exists(oPlayer) with (oPlayer) instance_destroy();

with (instance_create(ds_map_find_value(global.JsonMap, "SamusX"),ds_map_find_value(global.JsonMap, "SamusY"), oPlayer))
{
 Dash = ds_map_find_value(global.JsonMap, "SamusD");
 x = ds_map_find_value(global.JsonMap, "SamusX");
 y = ds_map_find_value(global.JsonMap, "SamusY");
 Facing = ds_map_find_value(global.JsonMap, "SamusF");
 State = ds_map_find_value(global.JsonMap, "SamusS");
 StatePrev = ds_map_find_value(global.JsonMap, "SamusSP");
 Turning = ds_map_find_value(global.JsonMap, "SamusT");
 Landing = ds_map_find_value(global.JsonMap, "SamusL");
 xVel = ds_map_find_value(global.JsonMap, "SamusXV");
 yVel = ds_map_find_value(global.JsonMap, "SamusYV");
 image_index = ds_map_find_value(global.JsonMap, "SamusI");
 StateTime = ds_map_find_value(global.JsonMap, "SamusST");
 InWater = ds_map_find_value(global.JsonMap, "SamusW");
 InWaterFX = ds_map_find_value(global.JsonMap, "SamusWFX");
 InWaterPrev = ds_map_find_value(global.JsonMap, "SamusWF");
 InWaterPrevFX = ds_map_find_value(global.JsonMap, "SamusWFP");
 Spinning = ds_map_find_value(global.JsonMap, "Spinning");
 
 xMP = ds_map_find_value(global.JsonMap, "xMP");
 yMP = ds_map_find_value(global.JsonMap, "yMP");
 xMN = ds_map_find_value(global.JsonMap, "xMN");
 yMN = ds_map_find_value(global.JsonMap, "yMN");
 
 Charge = ds_map_find_value(global.JsonMap, "SamusC");
 
}
with (oCamera)
{
 x=oPlayer.x;
 y=oPlayer.y-16;
 view_xview=min(max(0,x-view_wview/2),room_width-view_wview);
 view_yview=min(max(0,y-view_hview/2),room_height-view_hview);
}
