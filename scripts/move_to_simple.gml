// Code for entities with 1 collision box

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
 if collision_right(0,1)
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
 
 y += (4);
 
 Shet = collision_right(0,1);
 
 y -= (4);
  
 collision_bounds(0);
 if object_index == oPlayer
 if ONTHEGROUND == 1 && !on_ground(0,4) && yVel >= 0 && Shet
 {
  yVel = max(.25,yVel);
  y += 1;
  xVel *= .5;
  break;
 } 
}

if xVelInteger < 0
for(x = x; x > mtXPrev + xVelInteger;x -= 1)
{
 if collision_left(0,1)
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
 
 y += (4);
 
 Shet = collision_left(0,1);
 
 y -= (4);
 
 collision_bounds(0);
 if object_index == oPlayer
 {
  if ONTHEGROUND == 1 && !on_ground(0,4) && yVel >= 0 && Shet
  {
   yVel = max(.25,yVel);
   y += 1;
   xVel *= .5;

   break;
  }
 }
}  

if yVelInteger > 0
for(y = y; y < mtYPrev+yVelInteger; y += 1)
{   
 if collision_bottom(0,1) or on_platform(0,1)
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
 
 collision_bounds(0);
 y -= 12;
 Swag = collision_line(round(lb-1),round(tb-1),round(rb),round(tb-1),oSolid,1,1)>0
 y += 12; 
  
 if object_index == oPlayer
 if State == BALL or State == JUMPING
 if (global.KeyPushed[0,KEY_RIGHT] xor global.KeyPushed[0,KEY_LEFT]) && !collision_left(0,1) && !collision_right(0,1) && !collision_bottom(0,yVel + 6) 
 && collision_line(round(lb-1),round(bb+1),round(rb),round(bb+1),oSolid,1,1)>0 && Swag
 && yVel >= 1 
 {
  if State == BALL && yVel > 0
  {
   if yVel > 5 && !InWater
    yVel = -1.5;
    
   xVel = 0;
   image_index = 1;
   if !PlayBounce
   {
    sound_play_pos(sndBounce,x,y);
    PlayBounce = 5;
   }
  }
  else
  yVel = 0;
  
  Down = 0;
  x += Facing;
  
  while !collision_bottom(0,1) && Down < 3
  {
   y += 1;
   Down += 1;
  }
  
  break;
 }
}

if yVelInteger < 0
for(y = y; y > mtYPrev + yVelInteger; y -= 1)
{
 if object_index == oPlayer
 {   
  SOLID = oSolidBlock;
  YOFF = -1;
  EASE = 4;
  if State == JUMPING or State == BALL or State == SUPERJUMP
  if yVel < 0
  {
   collision_bounds(0);   
   while collision_line(round(lb)+9-EASE,round(tb-1+YOFF),round(rb-1),round(tb-1+YOFF),SOLID,1,1) > 0
   && !collision_line(round(lb-1),round(tb+YOFF),round(lb-1),round(bb-1+YOFF),SOLID,1,1) && !collision_line(round(lb),round(tb-1+YOFF),round(rb-1-9+EASE),round(tb-1+YOFF),SOLID,1,1) > 0
   {
    x--;
    collision_bounds(0);    
    if !collision_line(round(lb)+9-EASE,round(tb-1+YOFF),round(rb-1),round(tb-1+YOFF),SOLID,1,1)
    if !collision_line(round(lb)+9-EASE,round(tb-2+YOFF),round(rb-1),round(tb-1+YOFF),oSlope,1,1)
    {
     y -= (1 - YOFF);
     collision_bounds(0);  
    }
   }
   while collision_line(round(lb),round(tb-1+YOFF),round(rb-1-9+EASE),round(tb-1+YOFF),SOLID,1,1) > 0
   && !collision_line(round(rb+1-1),round(tb+YOFF),round(rb+1-1),round(bb-1+YOFF),SOLID,1,1) && !collision_line(round(lb)+9-EASE,round(tb-1+YOFF),round(rb-1),round(tb-1+YOFF),SOLID,1,1) > 0
   {
    x++;
    collision_bounds(0);  
    if !collision_line(round(lb),round(tb-1+YOFF),round(rb-1-9+EASE),round(tb-1+YOFF),SOLID,1,1)
    if !collision_line(round(lb),round(tb-2+YOFF),round(rb-1-9+EASE),round(tb-1+YOFF),oSlope,1,1)
    {
     y -= (1 - YOFF);
     collision_bounds(0);
    }
   }   
  }   
 }
 
 if collision_top(0,1)
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

 if object_index == oPlayer
 if State == BALL or State == JUMPING
 if (global.KeyPushed[0,KEY_RIGHT] xor global.KeyPushed[0,KEY_LEFT]) && !collision_left(0,1) && !collision_right(0,1) && !collision_bottom(0,5) 
 && collision_line(round(lb-1),round(tb-1),round(rb),round(tb-1),oSolid,1,1)>0
 && yVel <= -1 
 {
  yVel = 0;
  x += Facing;
  if collision_bottom(0,3)
  while !collision_bottom(0,1) y++;
  break;
 }
}
