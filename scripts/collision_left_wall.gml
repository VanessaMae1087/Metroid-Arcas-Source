collision_bounds(argument0);

if (object_index == oPlayer)
if State == JUMPING && Spinning && global.Power[P_SCREW] 
&& InWater == 0 && global.Suit != 3
{
 with (oBreakScrew)
 {
  xx = x;
  yy = y;
  y -= 100000;
 } 
 with (oPlatformBlock)
 {
  xx = x;
  yy = y;
  y -= 100000;
 }  
}
if (object_index == oPlayer)
if (Dash >= DashTime or State == SUPERJUMP) 
&& InWater == 0 && global.Suit != 3
{
 with (oBreakSpeed)
 {
  xx = x;
  yy = y;
  y -= 100000;
 }
 with (oBreakShoot)
 {
  xx = x;
  yy = y;
  y -= 100000;
 } 
 with (oPlatformBlock)
 {
  xx = x;
  yy = y;
  y -= 100000;
 }
}


var Ret = 0;
var Col = collision_line(round(lb-argument1),round(tb),round(lb-argument1),round(bb-3),oSolid,1,1)
if Col > 0 
  Ret = 1;
  
if Col > 0  
if ((Col . object_index == oBreakScrew or Col . object_index == oBreakShoot or Col . object_index == oBreakBomb) && object_index == oPlayer) 
if State == JUMPING && Spinning && global.Power[P_SCREW] && InWater == 0 && global.Suit != 3
{
 with (oBreakScrew)
 {
  x = xx;
  y = yy;
 }
 with (oPlatformBlock)
 {
  x = xx;
  y = yy;
 }
}
if Col > 0
if ((Col . object_index == oBreakSpeed or Col . object_index == oBreakShoot) && object_index == oPlayer)
if (Dash >= DashTime or State == SUPERJUMP) && InWater == 0 && global.Suit != 3
{
 with (oBreakSpeed)
 {
  x = xx;
  y = yy;
 }
 with (oBreakShoot)
 {
  x = xx;
  y = yy;
 } 
 with (oPlatformBlock)
 {
  x = xx;
  y = yy;
 }
}

return Ret;
