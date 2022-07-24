collision_bounds(argument0);
if collision_line(round(lb),round(tb-argument1),round(rb-1),round(tb-argument1),argument2,1,1) > 0
  return 1;
return 0;
