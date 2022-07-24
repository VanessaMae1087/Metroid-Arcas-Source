 // DRAW MAP
 surface_set_target(MapSurface)
 
 draw_clear_alpha(c_black,0);

 for (ii=-3;ii<=3;ii++)
 for (jj=-2;jj<=2;jj++)
 {
  // Positions where to draw
  
 // XX = view_xview2 + MapX + ii*8 + 16;
//  YY = view_yview2 + MapY + jj*8 + 8+global.HudOff;
  XX = ii*8 + 24;
  YY = jj*8 + 16;
  
  MX = global.MapX + ii;
  MY = global.MapY + jj;
  
  buffer_seek(MapBuffer, buffer_seek_start, 512+(global.MapWorld<<10)+(global.MapWorld<<12)+((MX+(MY<<5))*5));  
  
  for (bb=0;bb<5;bb++)
  {
   Byte[bb] = buffer_read(MapBuffer,buffer_u8)
  }
   
  MainByte = (Byte[0]<<32)+(Byte[1]<<24)+(Byte[2]<<16)+(Byte[3]<<8)+Byte[4];  
   
  if MainByte != 0
  {
   if map_get_disc(global.MapWorld,MX,MY) != 0
   {
    TileColor = map_get_info(MainByte, 1);
    for (dd=0;dd<4;dd++)
     TileDoor[dd] = map_get_info(MainByte, 2+dd);
    
    TileMark = map_get_info(MainByte, 6);
    
    if map_get_disc(global.MapWorld,MX,MY) == 1
    {
     TileMark = 0;
     for (dd=0;dd<4;dd++)
      TileDoor[dd] = min(TileDoor[dd],1);
     TileColor = 4; 
    }
    
    draw_sprite(sMMapColor, TileColor, XX, YY);
    
    for (iij=0;iij<4;iij++)
    {
     if TileDoor[iij] != 0
      draw_sprite(sMMapSides, (TileDoor[iij]<<2)+iij, XX, YY);
    }             
    
    if TileMark != 0
     draw_sprite(sMMapMarks, TileMark, XX, YY); 
   }
  }
 }

 surface_reset_target();
