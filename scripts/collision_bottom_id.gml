collision_bounds(argument0);
if collision_line(round(lb),round(bb+argument1-1),round(rb-1),round(bb+argument1-1),argument2,1,1) > 0
  return 1;
return 0;
