sm=1;
 
/*   for(po=0;po<=point_distance(argument2,argument3,argument10,argument11);po+=1)
  if point_distance(argument2,argument3,argument10-lengthdir_x(po,point_direction(argument10,argument11,argument2,argument3)),argument11-lengthdir_y(po,point_direction(argument10,argument11,argument2,argument3)))>0
  if point_distance(x,y,argument10,argument11) > 0
   draw_sprite_ext(argument0,argument1,argument2-lengthdir_x(po,point_direction(argument10,argument11,argument2,argument3)),
   argument3-lengthdir_y(po,point_direction(argument10,argument11,argument2,argument3)),argument4,argument5,argument6,argument7,
   (argument8)/max(point_distance(x,y,argument10,argument11)/sm,1)*po/argument9) 
*/   

if !global.OptionBlur
{
 draw_sprite_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8)   
 sw=argument9
 sww=argument10
 swww=argument11
}
else for(po=0;po<=point_distance(argument2,argument3,argument10,argument11);po+=1)
if point_distance(x,y,argument10+lengthdir_x(po,point_direction(argument10,argument11,x,y)),argument11+lengthdir_y(po,point_direction(argument10,argument11,x,y)))>0
 draw_sprite_ext(argument0,argument1,argument2-x+argument10+lengthdir_x(po,point_direction(argument10,argument11,x,y)),argument3-y+argument11+lengthdir_y(po,point_direction(argument10,argument11,x,y)),argument4,argument5,argument6,argument7,(argument8)/(max(1,point_distance(x,y,argument10,argument11)))*po/argument9) 
