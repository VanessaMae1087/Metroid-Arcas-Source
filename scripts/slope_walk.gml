// Code for entities with 4 collision boxes;

if abs(xVel) < 0.01 
 xVel = 0;
if abs(yVel) < 0.01 
 yVel = 0;
 
// Init
  
OnGround = on_ground(DOWN,1);
Slope = 1;
SlopeChange = 0;
SlopePrev = y;
                   
// Go top;

if OnGround && abs(xVel) > 0 && yVel == 0
{
 Iteration = 0;
 SlopeY = y;
 
 while (Iteration < Slope)
 {
  Iteration ++;
  if !collision_top(UP,1) && !collision_top(RIGHT,1) && !collision_top(LEFT,1)
  {
   y -= 1;  
  }
  else
  break;
 }

 SlopeChange = SlopeY - y;
}

// Go back down and walk forward

if (OnGround && abs(xVel) > 0 && yVel == 0)
{
 xPrev = x;
 yPrev = SlopePrev;    
 yPrevHigh = y;  
                         
 move_to(xVel,yVel+SlopeChange); 
  
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
   if abs(Sloper.image_xscale) >= 1
    Ratio = 2/3;
   if abs(Sloper.image_xscale) >= 2
    Ratio = 3/4;
   if abs(Sloper.image_xscale) >= 3
    Ratio = 4/5;  
  } 
  
  move_to((xVel*Ratio),(yVel*Ratio+SlopeChange));
 } 
// move_to(xVel,yVel + SlopeChange);
}
else
{ 
 move_to(xVel,yVel);
}

// Walk down slopes

if OnGround && abs(xVel) > 0 && yVel == 0 && !on_ground(DOWN,1)
{
 Iteration = 0;
 SlopeY = y;
 
 while (Iteration < Slope)
 {
  Iteration ++;
  if !on_ground(DOWN,1) && !on_ground(RIGHT,1) && !on_ground(LEFT,1)
  {
   y += 1;  
  }
  else
  break;
 }

 if !on_ground(DOWN,1)
  y = SlopeY;
 
 SlopeChange = SlopeY - y;
}

while (collision_bottom(DOWN,0))
{
 y --;
 collision_bounds(DOWN);
}      
