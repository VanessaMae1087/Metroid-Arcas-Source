collision_bounds(0);
if !collision_line(round(lb+1*argument0+sign(1*argument0)*1),round(bb+1),round(rb-1+1*argument0+sign(1*argument0)*1),round(bb+1),oSolid,1,1)>0
or !collision_line(round(lb+1*argument0+sign(1*argument0)*2),round(bb+1),round(rb-1+1*argument0+sign(1*argument0)*2),round(bb+1),oSolid,1,1)>0
or !collision_line(round(lb+1*argument0+sign(1*argument0)*3),round(bb+1),round(rb-1+1*argument0+sign(1*argument0)*3),round(bb+1),oSolid,1,1)>0
or !collision_line(round(lb+1*argument0+sign(1*argument0)*4),round(bb+1),round(rb-1+1*argument0+sign(1*argument0)*4),round(bb+1),oSolid,1,1)>0
{
  return 1
}
return 0
