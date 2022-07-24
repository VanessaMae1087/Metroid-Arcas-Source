/// -- joystick_get_key(P, INDEXor500+600+)

if oInput.JoyStick[argument0] != -1
{
 if argument1 < 500
 return joystick_check_button(oInput.JoyStick[argument0], argument1);
 else
 {
  switch argument1
  {              
   case 500: // lrud
    return joystick_xpos(oInput.JoyStick[argument0])<-oInput.DEADZONE;
   break;
   case 501:
    return joystick_xpos(oInput.JoyStick[argument0])>oInput.DEADZONE;
   break;   
   case 502:
    return joystick_ypos(oInput.JoyStick[argument0])<-oInput.DEADZONE;
   break;   
   case 503:
    return joystick_ypos(oInput.JoyStick[argument0])>oInput.DEADZONE;
   break;  
               
   case 600:
    return joystick_zpos(oInput.JoyStick[argument0])<-oInput.DEADZONE;
   break;
   case 601:
    return joystick_zpos(oInput.JoyStick[argument0])>oInput.DEADZONE;
   break;   
   case 602:
    return joystick_rpos(oInput.JoyStick[argument0])<-oInput.DEADZONE;
   break;   
   case 603:
    return joystick_rpos(oInput.JoyStick[argument0])>oInput.DEADZONE;
   break;   
  }
 }
}

return 0;
