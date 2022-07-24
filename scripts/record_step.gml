// PLAYER ONE UPDATE
for (i = 0; i <= 10; i += 1)
{
 if (global.KeyPushed[0,i] == 0 && global.KeyOnRec[i]) or global.KeyReleased[0,i]
 {
  ds_list_add(global.JsonKeyR[i], string(global.RecordingTime));  
  global.KeyOnRec[i] = 0;
 } 
 if (global.KeyPushed[0,i] == 1 && !global.KeyOnRec[i]) or global.KeyPressed[0,i]
 {
  ds_list_add(global.JsonKeyP[i], string(global.RecordingTime)); 
  global.KeyOnRec[i] = 1;
 }
} 

global.RecordingTime ++;
