// PLAYER ONE UPDATE
for (i = 0; i <= 10; i += 1)
{
 p = 0;
 // RESET PRESSED AND RELEASED
 global.KeyPressed[0,i] = 0;
 global.KeyReleased[0,i] = 0;
 
 if global.Demo
 { 
  if (ds_list_find_index(global.KeyListP[i], string(global.DemoFrame))!=-1)
   global.KeyOn[i] = 1;
  if (ds_list_find_index(global.KeyListR[i], string(global.DemoFrame))!=-1)
   global.KeyOn[i] = 0;
 }
  
 {
  if ((keyboard_check_direct(global.KeyButton[p,i])
  or gamepad_get_key(p,global.KeyPad[p,i])
  or joystick_get_key(p,global.KeyJoy[p,i])
  or (i == KEY_LEFT && (joystick_get_key(p,500) or gamepad_get_key(p,500) or joystick_get_key(p,600) or gamepad_get_key(p,600)))
  or (i == KEY_RIGHT && (joystick_get_key(p,501) or gamepad_get_key(p,501) or joystick_get_key(p,601) or gamepad_get_key(p,601)))
  or (i == KEY_UP && (joystick_get_key(p,502) or gamepad_get_key(p,502) or joystick_get_key(p,602) or gamepad_get_key(p,602)))
  or (i == KEY_DOWN && (joystick_get_key(p,503) or gamepad_get_key(p,503) or joystick_get_key(p,603) or gamepad_get_key(p,603)))) 
  && !global.Demo)
  or (global.Demo && global.KeyOn[i])
  {
   if (global.KeyPushed[0,i] == 0)
   {
    global.KeyPressed[0,i] = 1;
   }   
   global.KeyPushed[0,i] += 1;  
  }
  else
  {
   if (global.KeyPushed[0,i] > 0)                                  
    global.KeyReleased[0,i] = 1;
   global.KeyPushed[0,i] = 0;
  }
 }
}         

if global.KeyPushed[0,KEY_LEFT]
{ 
 global.KeyPushed[0,KEY_RIGHT] = 0;
}

if global.KeyPushed[0,KEY_UP] 
{
 global.KeyPushed[0,KEY_DOWN] = 0;
}
