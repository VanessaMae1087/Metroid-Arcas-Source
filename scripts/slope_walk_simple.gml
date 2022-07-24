// Code for entities with 1 collision box;

if abs(xVel) < 0.01 
 xVel = 0;
if abs(yVel) < 0.01 
 yVel = 0;
 
// Init
  
OnGround = on_ground(0,1);

MaxSlope = 2;
Slope = 0;

xx = x;
yy = y;

repeat (abs(ceil(xVel)))
{
 if sign(xVel) > 0
 {
  if !collision_right(0,1)
   x += sign(xVel);   
 }  
 if sign(xVel) < 0
 {
  if !collision_left(0,1)
   x += sign(xVel);   
 }   
}     

for (y=yy;y>yy-ceil(abs(xVel)+1);y--)
{
 if collision_top(0,1)
  break;
 Slope ++;
}

if Slope > MaxSlope
 Slope = MaxSlope;

x = xx;
y = yy;  


SlopeChange = 0;
SlopePrev = y;
                   
xVelFinal = xVel///*2;
yVelFinal = yVel///*2;

CanSlope = 0;
if object_index == oPlayer
{
 if State == SUPERJUMP
  CanSlope = 1;
  if State == IDLE
  if Elevator > 0 
  if instance_exists(Elevator)
  {
  yVelFinal = Elevator.yVel;
  }
 
}
if object_index == oPlayer
if InWater 
{
 if yVelFinal > 1.25
  yVelFinal = 1.25;
 if yVelFinal < -1.25
  yVelFinal = -1.25;
}
 if yVelFinal > 5
  yVelFinal = 5;

if State != SUPERJUMP
 if yVelFinal < -5
  yVelFinal = -5;
              
if OnGround && abs(xVel) > 0 && yVel == 0 && !CanSlope
{
 Iteration = 0;
 SlopeY = y;
 
 while (Iteration < (Slope))
 {
  Iteration ++;
  if !collision_top(0,1)
  {
   y -= 1;  
  }
  else
  break;
 }

 SlopeChange = SlopeY - y;
}


if (OnGround && abs(xVel) > 0 && yVel == 0) && !CanSlope
{
 xPrev = x;
 yPrev = SlopePrev;    
 yPrevHigh = y;  
                         
 move_to_simple(xVelFinal,yVelFinal+SlopeChange); 
  
 Dist = point_distance(xPrev,yPrev,x,y);
 
 if Dist > abs(xVelInteger)
 {
  Excess = Dist-abs(xVelInteger);
  if(xVelInteger<0)
   Excess *= -1;
   
  x = xPrev;
  y = yPrevHigh; 
  
  Ratio = 1;
  
  Sloper = instance_place(x,y+8,oSlope);
  
  if Sloper > 0
  {
   Ratio = (Sloper.image_xscale+1)/(Sloper.image_xscale+2)
  }       
  
  move_to_simple((xVelFinal*Ratio),(yVelFinal*Ratio+SlopeChange));
 }       
}
else
{ 
 move_to_simple(xVelFinal,yVelFinal);
}

if OnGround && yVel >= 0 && !on_ground(0,1) && !CanSlope
{
 Iteration = 0;
 SlopeY = y;
 
 while ( Iteration < (2*(ceil(abs(xVel)+2)))+3 )
 {
  Iteration ++;
  if !on_ground(0,1)
  {
   y += 1;  
  }
  else
  break;
 }

 if !on_ground(0,1)
  y = SlopeY;
 
 SlopeChange = SlopeY - y;
}

if object_index == oPlayer
{
  if State == IDLE
   if Elevator != noone
    y=Elevator.y;
}
