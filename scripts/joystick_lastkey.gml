var Ret;
Ret = -1;
if joystick_exists(argument0)
{
 var Count = 30;//gamepad_button_count(argument0);
 for(var i=0; i<Count; i++)
 {
  if joystick_check_button(argument0,i) && global.JoystickHeld[argument0,i] < 3
  {
   Ret = i;
   break;
   Rest = 3;
  }
 }
}
return Ret;
