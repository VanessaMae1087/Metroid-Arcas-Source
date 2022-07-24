// record_end();

global.Recording = 0;
global.SoundVol = global.SoundVolSafe;

for (i=0;i<=10;i++)
{
 ds_map_add_list(global.JsonMap, "KeyP"+string(i), global.JsonKeyP[i]);
 ds_map_add_list(global.JsonMap, "KeyR"+string(i), global.JsonKeyR[i]); 
}

ds_map_add(global.JsonMap, "Length", global.RecordingTime);

clipboard_set_text(json_encode(global.JsonMap));

for (i=0;i<=10;i++)
{
 ds_list_destroy(global.JsonKeyR[i]);
 ds_list_destroy(global.JsonKeyP[i]); 
}

ds_list_destroy(global.EnemyList);

for (i=0;i<global.ENum;i++)
{
 ds_map_destroy(global.EMap[i]);
}     

ds_map_destroy(global.JsonMap);
