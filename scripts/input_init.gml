// PLAYER ONE INPUT
global.KeyButton[0,KEY_LEFT] = vk_left;
global.KeyButton[0,KEY_RIGHT] = vk_right;
global.KeyButton[0,KEY_UP] = vk_up;
global.KeyButton[0,KEY_DOWN] = vk_down;
global.KeyButton[0,KEY_ESC] = vk_escape;
global.KeyButton[0,KEY_ENTER] = vk_enter;
global.KeyButton[0,KEY_A] = ord("Z"); // JUMP
global.KeyButton[0,KEY_B] = ord("X"); // SHOOT
global.KeyButton[0,KEY_POWER] = ord("C");
global.KeyButton[0,KEY_MISSILE] = vk_control;
global.KeyButton[0,KEY_SELECT] = ord("A");

global.KeyJoystickButton[0,KEY_LEFT] = 8;
global.KeyJoystickButton[0,KEY_RIGHT] = 6;
global.KeyJoystickButton[0,KEY_UP] = 5;
global.KeyJoystickButton[0,KEY_DOWN] = 7;
global.KeyJoystickButton[0,KEY_ESC] = 17;
global.KeyJoystickButton[0,KEY_ENTER] = 4;
global.KeyJoystickButton[0,KEY_A] = 15;
global.KeyJoystickButton[0,KEY_B] = 14;
global.KeyJoystickButton[0,KEY_POWER] = 16;

// JOYSTICK
                    
global.KeyJoy[0,KEY_UP] = 5;
global.KeyJoy[0,KEY_DOWN] = 7;
global.KeyJoy[0,KEY_LEFT] = 8;
global.KeyJoy[0,KEY_RIGHT] = 6;
global.KeyJoy[0,KEY_A] = 18;
global.KeyJoy[0,KEY_B] = 17;
global.KeyJoy[0,KEY_MISSILE] = 15;
global.KeyJoy[0,KEY_POWER] = 16;
global.KeyJoy[0,KEY_ENTER] = 4;
global.KeyJoy[0,KEY_ESC] = 19;
global.KeyJoy[0,KEY_SELECT] = 20;

DEADZONE = .5;

JoyStick[0] = -1;
JoyStick[1] = -1;

if os_type == os_windows
or os_type == os_win32
for (var i = 1; i < 3; i++)
{
 if joystick_exists(i)
 {
  if JoyStick[0] == -1
  {
   JoyStick[0] = i;
  }
  else
  if JoyStick[1] == -1
  {
   JoyStick[1] = i;
  }
 }
}          

/// GAMEPAD

// Load gamepad keys

global.KeyPad[0,KEY_UP] = gp_padu;
global.KeyPad[0,KEY_DOWN] = gp_padd;
global.KeyPad[0,KEY_LEFT] = gp_padl;
global.KeyPad[0,KEY_RIGHT] = gp_padr;
global.KeyPad[0,KEY_A] = gp_face1;
global.KeyPad[0,KEY_B] = gp_face4;
global.KeyPad[0,KEY_MISSILE] = gp_face2;
global.KeyPad[0,KEY_POWER] = gp_face3;
global.KeyPad[0,KEY_ENTER] = gp_start;
global.KeyPad[0,KEY_SELECT] = gp_select;
global.KeyPad[0,KEY_ESC] = gp_shoulderl;

GamePad[0] = -1;
GamePad[1] = -1;

if gamepad_is_supported()
for (var i = gamepad_get_device_count()-1; i >= 0; i--)
{
 if gamepad_is_connected(i)
 {
  if GamePad[0] == -1
  {
   GamePad[0] = i;
  }
  else
  if GamePad[1] == -1
  {
   GamePad[1] = i;
  }
 }
}              

// NULL VARS
for (i = 0; i < 1; i += 1)
{
 for (j = 0; j <= 10; j += 1)
 {
  global.KeyPushed[i,j] = 0;
  global.KeyPressed[i,j] = 0;
  global.KeyReleased[i,j] = 0;
  global.KeyOn[j] = 0;
  global.KeyOnRec[j] = 0;
  // Demo
  global.KeyPushedD[j] = 0;
  global.KeyPressedD[j] = 0;
  global.KeyReleasedD[j] = 0;
 }
}

for (j=0;j<1;j+=1)
for (i=0;i<=30;i+=1)
{
 global.JoystickHeld[j,i] = 0;
}
