map_position();

PrevMapX = global.MapX;
PrevMapY = global.MapY;

if !global.PausedGame
{    
 if global.Transition == -1
 {
  if instance_exists(oPlayer)
  {
   global.MapX = global.RoomX + floor(oCamera.x/view_wview);
   global.MapY = global.RoomY + floor(oCamera.y/view_hview);
  }
  else
  {
   global.MapX = global.RoomX + floor((view_xview+view_wview/2)/view_wview);
   global.MapY = global.RoomY + floor((view_yview+view_hview/2)/view_hview);
  }
 }
 
// map_uncover();
 if map_get_disc(global.MapWorld,global.MapX,global.MapY) != 2
  hud_map_redraw();
  
 map_set_disc(global.MapWorld,global.MapX,global.MapY,2);
}

if PrevMapX != global.MapX
or PrevMapY != global.MapY
{
 if surface_exists(MapSurface)
 hud_map_redraw();
 else
 {
  MapSurface = surface_create(56,40);
  hud_map_redraw();
 }
 MapOffX = -(PrevMapX - global.MapX)*3;
 MapOffY = -(PrevMapY - global.MapY)*3;
}
