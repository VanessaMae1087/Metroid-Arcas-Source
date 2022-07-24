view_xview2 = view_xview;
 view_yview2 = view_yview;
 
 if global.Transition == 0
 {
  BX = global.HatchStartXA+view_xview+global.HatchOffX-8;
  BY = global.HatchStartYA+view_yview+global.HatchOffY;
  
  if global.HatchSprite == sHatchHor
  {
   W = 48;
   H = 64;
  }
  else
  {
   W = 64;   
   H = 48;
  }
 }
 if global.Transition == 4
 {
  BX = HatchX+global.HatchOffX-8;
  BY = HatchY+global.HatchOffY;
  
  if global.HatchSprite == sHatchHor
  {
   W = 48;
   H = 64;
  }
  else
  {
   H = 48;
   W = 64;
  }
 }
 
 draw_set_color(c_black)
 draw_set_alpha(global.Fade);
 
 if global.TransitionType == 0 
 &&(global.Transition == 0 or global.Transition == 4)
 {
  draw_rectangle(BX,BY-1,BX + W,BY-view_hview,0); //t  
  draw_rectangle(BX,BY+H,BX + W,BY+H+view_hview,0); //b 
  draw_rectangle(BX-1,BY,BX-view_wview,BY+H,0); //l 
  draw_rectangle(BX+W,BY,BX+W+view_wview,BY+H,0); //r   
  
  draw_rectangle(BX+W+1,BY-1,BX+W+view_wview,BY-view_hview,0); //tr    
  draw_rectangle(BX-1,BY-1,BX-view_wview,BY-view_hview,0); //tl   
  
  draw_rectangle(BX+W+1,BY+H+1,BX+W+view_wview,BY+view_hview,0); //br    
  draw_rectangle(BX-1,BY+H+1,BX-view_wview,BY+view_hview,0); //bl  
 }
 else
 {
  draw_rectangle(view_xview,view_yview,view_xview+view_wview,view_yview+view_hview,0);
 }
  
 draw_set_alpha(1);
 draw_set_color(c_white);
 
 if global.Transition == 0 // Hit door
 {
  global.Fade += 1/16;
 
  if global.TransitionType == 0
   draw_sprite_ext(global.HatchSprite,0,global.HatchStartXA+view_xview+global.HatchOffX,global.HatchStartYA+view_yview+global.HatchOffY,1,1,0,c_white,global.Fade);

  if global.Fade > 1
  {
  
   SX = oPlayer.x;
   SY = oPlayer.y;
   
   with (oPlayer)
   {
    x = global.TX;
    y = global.TY;
    
    for (i=0;i<32;i++)
    {
     xP[i] = ds_list_find_value(xPrevv,i);
     yP[i] = ds_list_find_value(yPrevv,i);             
    }     
       
    ds_list_clear(xPrevv);
    ds_list_clear(yPrevv);
        
    for (i=0;i<32;i++)
    {
     ds_list_add(xPrevv,xP[i] - (oControl.SX - x))
     ds_list_add(yPrevv,yP[i] - (oControl.SY - y))       
    }     
   }
   with (oCamera)
   {
    x = global.TX + xOff + xOffL;
    y = global.TY - 16 + yOff + yOffL;
   }
   with (id)
   {
    x = global.TX;
    y = global.TY;
   }
 
   global.TTX = global.TX;
   global.TTY = global.TY;
   
   global.Transition = 1;
   room_goto(global.TargetRoom);
  }
 }
 else
 if global.Transition == 1 // Faded and just moved to next room
 { 
  map_update();
  
  ENDX = global.TTX+global.HX+16*(global.HX=-64);
  ENDY = global.TTY+global.HY+16*(global.HY=-64);
  
  with (oPlayer)
  if State != IDLE     
    while collision_bottom(0,0) y--;
  
  if global.Direction == 180 or global.Direction == 0
  {
   with (oDoor)
   {
    xx = x;
    yy = y;
    y += 32;
   }
  }
  else
  {
   with (oDoor)
   {
    xx = x;
    yy = y;
    x += 32;
   }
  }      
  
  // ELEVATOR
  
  if global.Elevator != noone
  {
   with oElevator
    instance_destroy();
    
   Elev = instance_create(oPlayer.x,oPlayer.y,oElevator);
   Elev . yVel = global.ElevatorVel;
   if Elev.yVel > 0 Elev.Direction = 0;
   else Elev.Direction = 1;
   Elev.Active = 1;
   oPlayer.Elevator=Elev;    
  }
    
  global.HatchEnd = noone;  
  if instance_number(oDoor) > 0
  {
   global.HatchEnd = instance_nearest(ENDX,ENDY,oDoor); 
   global.HatchEndX = global.HatchEnd.xx + global.HatchOffX2;
   global.HatchEndY = global.HatchEnd.yy + global.HatchOffY2; 
  }
  else
  {
   Obj = instance_create(x,y,oTextBoxDouble);
   Obj . String[0] = "No @1exit door@0 found.@0";
   Obj . String[1] = "@4Report to creator.@0";    
   global.Transition = -1;
   exit;
  }
  
  if global.Direction == 180 or global.Direction == 0
  {
   with (oDoor)
   {
    x = xx;
    y = yy;
   }
  }
  else
  {
   with (oDoor)
   {
    x = xx;
    y = yy;
   }
  }
 
  HatchX = global.HatchStartXA + view_xview;
  HatchY = global.HatchStartYA + view_yview;
 
  global.Transition = 3;
   
  if global.TransitionType == 0
   draw_sprite(global.HatchSprite,0,HatchX+global.HatchOffX,HatchY+global.HatchOffY);
  
  Step = 0;                        
  TransSpeed = 0;
 }
 else
 if global.Transition == 3   // Time for animation
 {
  if Step == 1
   if TransSpeed < point_distance(HatchX,HatchY,global.HatchEndX,global.HatchEndY)/17+.25
    TransSpeed += .5;
    else
    TransSpeed = point_distance(HatchX,HatchY,global.HatchEndX,global.HatchEndY)/17+.25;   
 
  //TransSpeed = 6;
  
  if global.TransitionType == 0
   draw_sprite(global.HatchSprite,0,HatchX+global.HatchOffX,HatchY+global.HatchOffY);
   else
   {
    HatchX = global.HatchEndX;
    HatchY = global.HatchEndY;
   }
  if global.Direction == 180 or global.Direction == 0
  {
   if Step == 0 // Align vertically
   {
    if HatchY > global.HatchEndY
    {
     HatchY = max(HatchY-2,global.HatchEndY);  
    }
    else
    if HatchY < global.HatchEndY
    {
     HatchY = min(HatchY+2,global.HatchEndY);  
    }
    else
    if HatchY == global.HatchEndY
     Step = 1;
   }
   else
   if Step == 1 // Move across the screen
   {
    if HatchX > global.HatchEndX
    {
     HatchX = max(HatchX-TransSpeed,global.HatchEndX);  
    }
    else
    if HatchX < global.HatchEndX
    {
     HatchX = min(HatchX+TransSpeed,global.HatchEndX);  
    }
    else
    if HatchX == global.HatchEndX
    {
     global.Transition = 4; 
    if global.RoomMusic != -2 && !global.Demo
     global.TargetTrack = global.RoomMusic;  
    }
   } 
  }
  else
  {
   if Step == 0 // Align horiz
   {
    if HatchX > global.HatchEndX
    {
     HatchX = max(HatchX-2,global.HatchEndX);  
    }
    else
    if HatchX < global.HatchEndX
    {
     HatchX = min(HatchX+2,global.HatchEndX);  
    }
    else
    if HatchX == global.HatchEndX
     Step = 1;    
   }
   else
   if Step == 1 // Move across the screen
   {    
    if HatchY > global.HatchEndY
    {
     HatchY = max(HatchY-(TransSpeed*3/4),global.HatchEndY);  
    }
    else
    if HatchY < global.HatchEndY
    {
     HatchY = min(HatchY+(TransSpeed*3/4),global.HatchEndY);  
    }
    else
    if HatchY == global.HatchEndY
    {
     global.Transition = 4; 
    if global.RoomMusic != -2 && !global.Demo
     global.TargetTrack = global.RoomMusic;  
    }
   } 
  }
 }
 else
 if global.Transition == 4 // Fade away
 {
  global.Fade -= 1/16;
  
  if global.TransitionType == 0
   draw_sprite_ext(global.HatchSprite,0,HatchX+global.HatchOffX,HatchY+global.HatchOffY,1,1,0,c_white,global.Fade);

  if global.Fade <= 0
  {
   global.Transition = -1;
   global.PausedGame = 0;
   global.JustTrans = 0;
   
   if global.ShowMessage
   {
    Room = instance_create(x,y,oRoomBox);
    Room . String = global.RoomString;   
   }
   
   if global.ChangeLayer >= 0
    global.Layer = global.ChangeLayer;
  }
 }
