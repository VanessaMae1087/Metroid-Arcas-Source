/// -- transition_begin(dire);

with (oControl)
{
 if argument1 == 180 or argument1 == 0
 with (oPlayer) {repeat (SlopeChange) if !collision_bottom(0,1) y ++;}
 with (oRoomBox) instance_destroy();
 
 if global.JustTrans exit;
 if global.Transition != -1 exit;
 global.HatchID = argument0;
 global.TransitionType = !global.HatchID.Transition;
 global.ChangeLayer = global.HatchID.Layer;
 global.ShowMessage = global.HatchID.RoomName;
 if global.ShowMessage
 {
  global.RoomString = global.HatchID.String;
 }
 global.RoomMusic = global.HatchID.Music;
 
 Direction = argument1;
 global.Direction = Direction;
 Bullshit = argument2;
 TransOffX = 0;
 TransOffY = 0;
 global.SAVEX = oPlayer.x;
 global.SAVEY = oPlayer.y;
 
 global.SamusStartX = oPlayer.x - (global.MapX - global.RoomX)*view_wview;
 global.SamusStartY = oPlayer.y - (global.MapY - global.RoomY)*view_hview;
 global.SamusStartXA = oPlayer.x - view_xview;
 global.SamusStartYA = oPlayer.y - view_yview;
 global.HatchStartXA = global.HatchID.x - view_xview;
 global.HatchStartYA = global.HatchID.y - view_yview;
 global.HatchOffX = 0;
 global.HatchOffY = 0;
 global.Transition = 0; // step 1
 global.PausedGame = 1;
 global.view_xview2 = view_xview;
 global.view_yview2 = view_yview;
 global.Elevator = oPlayer.Elevator;
 if global.Elevator != noone
 {
  global.ElevatorVel = oPlayer.Elevator.yVel;
 
 }
  oPlayer.Elevator=noone;
 if global.HatchID != noone
 switch (global.HatchID.object_index)
 {
  case oDoorU:
  case oDoorUNT:
   global.HatchOffY = -16;
   global.HatchSprite = sHatchVert;
   global.HatchOffX2 = 0;
   global.HatchOffY2 = 16;
  break;
  case oDoorD:
  case oDoorDNT:
   global.HatchOffY = 0;
   global.HatchSprite = sHatchVert;
   global.HatchOffX2 = 0;
   global.HatchOffY2 = -16;
  break; 
  case oDoorL:
  case oDoorLNT:
   global.HatchOffX = -16;
   global.HatchSprite = sHatchHor;
   global.HatchOffX2 = 16;
   global.HatchOffY2 = 0;
  break; 
  case oDoorR:
  case oDoorRNT:
   global.HatchOffX = 0;  
   global.HatchSprite = sHatchHor;
   global.HatchOffX2 = -16;
   global.HatchOffY2 = 0;
  break; 
 }
 switch (Direction)
 {
  case 90:
   TransOffY =- 1;
   break;
  case 270:
   TransOffY = 1;
   break;
  case 180:
   TransOffX =- 1;
   break;
  case 0:
   TransOffX = 1;
   break;
 }
 global.TargetRoom = rBaseRoom;
 
 // Find Target Room
 
 buffer_seek(MapBuffer, buffer_seek_start, 512+(global.MapWorld<<10)+(global.MapWorld<<12)+((global.MapX+TransOffX+((global.MapY+TransOffY)<<5))*5));  
 
 for (bb=0;bb<5;bb++)
 {
  Byte[bb] = buffer_read(MapBuffer,buffer_u8)
 }
  
 MainByte = (Byte[0]<<32)+(Byte[1]<<24)+(Byte[2]<<16)+(Byte[3]<<8)+Byte[4];  
  
 if MainByte != 0
 {
  global.TargetRoom = get_room(map_get_info(MainByte, 0));
 }
 
 global.ChangeWorld = 0;
 
 // Uncover target destination even if it's a portal - so that we can display the arrow
 
 MPX = global.MapX;
 MPY = global.MapY;
 global.MapX += TransOffX;
 global.MapY += TransOffY;
 map_set_disc(global.MapWorld,global.MapX,global.MapY,2);
 global.MapX = MPX;
 global.MapY = MPY;
 
 // World changer!
 
 for (i=0;i<60;i++)
 {
  // DDDD = Direction. 0: No Exist, 1 L, 2 T, 3 R, 4 B
  // 4 bytes per TP Bits: WWWWTTTT XXXXXYYY YYxxxxxy yyyyDDDD 
  
  buffer_seek(MapBuffer, buffer_seek_start, 272 + (i<<2));
  
  TByte = (buffer_read(MapBuffer,buffer_u8)<<24)+(buffer_read(MapBuffer,buffer_u8)<<16)
         + (buffer_read(MapBuffer,buffer_u8)<<8)+(buffer_read(MapBuffer,buffer_u8)) 
         
  PWorld = (TByte & $F0000000) >> 28;
  PD = (TByte & $F);
  
  if global.MapWorld == PWorld
  if PD != 0
  {
   PTWorld = (TByte & $F000000) >> 24;
   PX = (TByte & $F80000) >> 19;
   PY = (TByte & $7C000) >> 14;
   PTX = (TByte & $3E00) >> 9;
   PTY = (TByte & $1F0) >> 4;
   
   if PX == global.MapX + TransOffX
   if PY == global.MapY + TransOffY
   {
    global.MapWorld = PTWorld;
    TWX = PTX;
    TWY = PTY;
    
    // Target room 
    
    buffer_seek(MapBuffer, buffer_seek_start, 512+(PTWorld<<10)+(PTWorld<<12)+((PTX+(PTY<<5))*5));  
    
    for (bb=0;bb<5;bb++)
    {
     Byte[bb] = buffer_read(MapBuffer,buffer_u8)
    }
     
    MainByte = (Byte[0]<<32)+(Byte[1]<<24)+(Byte[2]<<16)+(Byte[3]<<8)+Byte[4];  
     
    if MainByte != 0
    {
     global.TargetRoom = get_room(map_get_info(MainByte, 0));
    }  
    
    map_set_disc(PTWorld,PTX,PTY,2);
    
    switch (PD)
    {
     case 1:
      map_set_disc(PTWorld,PTX+1,PTY,2);
     break;
     case 2:
      map_set_disc(PTWorld,PTX,PTY+1,2);
     break;
     case 3:
      map_set_disc(PTWorld,PTX-1,PTY,2);
     break;
     case 4:
      map_set_disc(PTWorld,PTX,PTY-1,2);
     break;
    }
    
    global.ChangeWorld = 1;
    break;
   }
  }
 }
   
 global.TargetRoomX = global.RBX[get_room_id(global.TargetRoom)];
 global.TargetRoomY = global.RBY[get_room_id(global.TargetRoom)];
 
 global.MapXPrev = global.MapX;
 global.MapYPrev = global.MapY;
 global.MapX += TransOffX;
 global.MapY += TransOffY;
 map_set_disc(global.MapWorld,global.MapX,global.MapY,2);
 MPX = global.MapX;
 MPY = global.MapY;
 global.MapX -= TransOffX;
 global.MapY -= TransOffY;
 map_set_disc(global.MapWorld,global.MapX,global.MapY,2);
 global.MapX = MPX;
 global.MapY = MPY;
 
 if global.ChangeWorld == 0
 {
  MapOffX = (TransOffX*8);
  MapOffY = (TransOffY*8);
 }
 
 if Direction == 0
 {
  global.TX = (global.MapX - global.TargetRoomX) * view_wview + 48;
  global.TY = (global.MapY - global.TargetRoomY) * view_hview + global.SamusStartY;
  global.HX = -64;
  global.HY = 0;
 }
 if Direction == 180
 {
  global.TX = (global.MapX - global.TargetRoomX) * view_wview + view_wview - 48;
  global.TY = (global.MapY - global.TargetRoomY) * view_hview + global.SamusStartY;
  global.HX = 48;
  global.HY = 0;
 }
 if Direction == 90
 {
  global.TX = (global.MapX - global.TargetRoomX) * view_wview + global.SamusStartX;
  global.TY = (global.MapY - global.TargetRoomY) * view_hview + view_hview - 32;
  global.HX = 0;
  global.HY = 32;
 }
 if Direction == 270
 {
  global.TX = (global.MapX - global.TargetRoomX) * view_wview + global.SamusStartX;
  global.TY = (global.MapY - global.TargetRoomY) * view_hview + 48;
  global.HX = 0;
  global.HY = -64;
 }
 if global.ChangeWorld
 {
  global.MapX = TWX;
  global.MapY = TWY;
  if Direction = 0
  {
   global.TX = (global.MapX - global.TargetRoomX) * view_wview + 48;
   global.TY = (global.MapY - global.TargetRoomY) * view_hview + global.SamusStartY;
   global.HX = -48-16;
   global.HY = 0;
  }
  if Direction = 180
  {
   global.TX = (global.MapX - global.TargetRoomX) * view_wview + view_wview - 48;
   global.TY = (global.MapY - global.TargetRoomY) * view_hview + global.SamusStartY;
   global.HX = 48;
   global.HY = 0;
  }                           
  if Direction = 90
  {
   global.TX = (global.MapX - global.TargetRoomX) * view_wview + global.SamusStartX;
   global.TY = (global.MapY - global.TargetRoomY) * view_hview + view_hview - 32;
   global.HX = 0;
   global.HY = 32;
  }
  if Direction = 270
  {
   global.TX = (global.MapX - global.TargetRoomX) * view_wview + global.SamusStartX;
   global.TY = (global.MapY - global.TargetRoomY) * view_hview + 48;
   global.HX = 0;
   global.HY = -48-16;
  }
 }
 global.JustTrans = 1;
 global.Direction = Direction;
 
 if surface_exists(MapSurface)
 hud_map_redraw();
 else
 {
  MapSurface = surface_create(56,40);
  hud_map_redraw();
 }
}
