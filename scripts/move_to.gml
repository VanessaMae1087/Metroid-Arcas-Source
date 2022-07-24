// Code for entities with 4 collision boxes;

mtXPrev = x;
mtYPrev = y;
xVelFrac = frac(abs(argument0));
yVelFrac = frac(abs(argument1));
xVelInteger = 0;
yVelInteger = 0;

if argument0 > 0
xMP += xVelFrac;
else
xMN += xVelFrac;

if argument1 > 0
yMP += yVelFrac;
else
yMN += yVelFrac;


if xMP >= 1
{
 xMP -= 1;
 xVelInteger = 1;
}

if yMP >= 1
{
 yMP -= 1;
 yVelInteger = 1;
}

if xMN >= 1
{
 xMN -= 1;
 xVelInteger = 1;
}

if yMN >= 1
{
 yMN -= 1;
 yVelInteger = 1;
}

if argument0 > 0
xMN = 0;
if argument0 < 0
xMP = 0;
if argument1 > 0
yMN = 0;
if argument1 < 0
yMP = 0;


xVelInteger += floor(abs(argument0));
yVelInteger += floor(abs(argument1));

if argument0<0
 xVelInteger *= -1;
 
if argument1<0
 yVelInteger *= -1;
 
xVelInteger = round(xVelInteger);
yVelInteger = round(yVelInteger);



if xVelInteger > 0
for(x = x; x < mtXPrev + xVelInteger; x += 1)
{ 
 if collision_right(RIGHT,1)
  break;
 else
 if object_index == oPlayer
 {
  if place_meeting(x+1,y,oDoor)
  {
   transition_begin(instance_place(x+1,y,oDoor),0,0);  
   global.JustTrans = 1;
   break;
  }
 }
  
 while (collision_right(UP,1))
 {
  y += 1;
  collision_bounds(UP);
 }
 while (collision_right(DOWN,1)) && yVel < 0 
 {
  y -= 1;
  collision_bounds(DOWN);
 } 
}
    

if xVelInteger < 0
for(x = x; x > mtXPrev + xVelInteger;x -= 1)
{
 if collision_left(LEFT,1)
  break;  
 else
 if object_index == oPlayer
 {
  if place_meeting(x-1,y,oDoor)
  {
   transition_begin(instance_place(x-1,y,oDoor),180,0);  
   global.JustTrans = 1;
   break;
  }
 }

  
 while (collision_left(UP,1))
 {
  y += 1;
  collision_bounds(UP);
 }
 while (collision_left(DOWN,1)) && yVel < 0
 {
  y -= 1;
  collision_bounds(DOWN);
 } 
}  




if yVelInteger > 0
for(y = y; y < mtYPrev+yVelInteger; y += 1)
{   
 if collision_bottom(DOWN,1) or on_platform(DOWN,1)
  break;
 else
 if object_index == oPlayer
 {
  if place_meeting(x,y+1,oDoor)
  {
   transition_begin(instance_place(x,y+1,oDoor),270,0);  
   global.JustTrans = 1;
   break;
  }
 }

 while (collision_bottom(RIGHT,1))
 {
  x -= 1;
  collision_bounds(RIGHT);
 }
 while (collision_bottom(LEFT,1))
 {
  x += 1;
  collision_bounds(LEFT);
 }              
}




if yVelInteger < 0
for(y = y; y > mtYPrev + yVelInteger; y -= 1)
{
 if collision_top(UP,1)
  break;
 else
 if object_index == oPlayer
 {
  if place_meeting(x,y-1,oDoor)
  {
   transition_begin(instance_place(x,y-1,oDoor),90,0);  
   global.JustTrans = 1;
   break;
  }
 }

   
 while (collision_top(RIGHT,1))
 {
  x -= 1;
  collision_bounds(RIGHT);
 }
 while (collision_top(LEFT,1))
 {
  x += 1;
  collision_bounds(LEFT);
 } 
}
