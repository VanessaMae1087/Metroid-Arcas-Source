/// -- gamepad_get_key(P, INDEXor500+600+)

if oInput.GamePad[argument0] != -1
{
 if argument1 < 500
 return gamepad_button_check(oInput.GamePad[argument0], argument1);
 else
 {
  switch argument1
  {
   case 500: // lrud
    return gamepad_axis_value(oInput.GamePad[argument0], gp_axislh)<-oInput.DEADZONE;
   break;
   case 501:
    return gamepad_axis_value(oInput.GamePad[argument0], gp_axislh)>oInput.DEADZONE;
   break;   
   case 502:
    return gamepad_axis_value(oInput.GamePad[argument0], gp_axislv)<-oInput.DEADZONE;
   break;   
   case 503:
    return gamepad_axis_value(oInput.GamePad[argument0], gp_axislv)>oInput.DEADZONE;
   break;  
               
   case 600:
    return gamepad_axis_value(oInput.GamePad[argument0], gp_axisrh)<-oInput.DEADZONE;
   break;
   case 601:
    return gamepad_axis_value(oInput.GamePad[argument0], gp_axisrh)>oInput.DEADZONE;
   break;   
   case 602:
    return gamepad_axis_value(oInput.GamePad[argument0], gp_axisrv)<-oInput.DEADZONE;
   break;   
   case 603:
    return gamepad_axis_value(oInput.GamePad[argument0], gp_axisrv)>oInput.DEADZONE;
   break;   
  }
 }
}

return 0;
