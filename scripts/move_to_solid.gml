// Code for moving solids

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
  
 global.Solid = id;
 
 with (oPlatformEntity)
 {
  ToLeftOfMe = 0;
  BelowMe = 0;
  
  if Complex == 1
  {
   if collision_left_id(LEFT,1,global.Solid) or collision_left_id(UP,1,global.Solid) or collision_left_id(DOWN,1,global.Solid)
    ToLeftOfMe = 1; 
   if collision_bottom_id(DOWN,1,global.Solid)
    BelowMe = 1;     
  }
  else
  {
   if collision_left_id(0,1,global.Solid)
    ToLeftOfMe = 1;  
   if collision_bottom_id(0,1,global.Solid)
    BelowMe = 1;     
  }
  
  if BelowMe == 1 or ToLeftOfMe == 1 
  {
   if Complex == 1
   {
    if ToLeftOfMe
    {
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
    
    if !collision_right(RIGHT,1) && !collision_right(UP,1) && !collision_right(DOWN,1)
     x ++;
     else
     if (collision_left_id(LEFT,1,global.Solid) or collision_left_id(UP,1,global.Solid) or collision_left_id(DOWN,1,global.Solid)) 
     && Break == 1
     {
      global.Solid.xVel *= -1;
      with (global.Solid) break;  
      global.Solid.x --;   
      global.Solid.xVelInteger = 0; 
     }
   }
   else
   {
    if !collision_right(0,1)
     x ++;  
     else
     if ToLeftOfMe && Break == 1
     {
      global.Solid.xVel *= -1;
      with (global.Solid) break;
      global.Solid.x --; 
      global.Solid.xVelInteger = 0; 
     }
   } 
  }
 }
}




if xVelInteger < 0
for(x = x; x > mtXPrev + xVelInteger;x -= 1)
{
 if collision_left(0,1)
  break;  
  
 global.Solid = id;
 
 with (oPlatformEntity)
 {
  ToRightOfMe = 0;
  BelowMe = 0;
  
  if Complex == 1
  {
   if collision_right_id(RIGHT,1,global.Solid) or collision_right_id(UP,1,global.Solid) or collision_right_id(DOWN,1,global.Solid)
    ToRightOfMe = 1; 
   if collision_bottom_id(DOWN,1,global.Solid)
    BelowMe = 1;     
  }
  else
  {
   if collision_right_id(0,1,global.Solid)
    ToRightOfMe = 1;  
   if collision_bottom_id(0,1,global.Solid)
    BelowMe = 1;     
  }
  
  if BelowMe == 1 or ToRightOfMe == 1 
  {
   if Complex == 1
   {
    if ToRightOfMe
    {
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

    if !collision_left(LEFT,1) && !collision_left(UP,1) && !collision_left(DOWN,1)
     x --;
     else
     if (collision_right_id(RIGHT,1,global.Solid) or collision_right_id(UP,1,global.Solid) or collision_right_id(DOWN,1,global.Solid)) 
     && Break == 1
     {
      global.Solid.xVel *= -1;
      with (global.Solid) break;  
      global.Solid.x ++;   
      global.Solid.xVelInteger = 0; 
     }
   }
   else
   {
    if !collision_left(0,1)
     x --;   
     else
     if ToRightOfMe && Break == 1
     {
      global.Solid.xVel *= -1;
      with (global.Solid) break;  
      global.Solid.x ++;   
      global.Solid.xVelInteger = 0; 
     }
   } 
  }
 }
}  



if yVelInteger > 0
for(y = y; y < mtYPrev+yVelInteger; y += 1)
{   
 if collision_bottom(0,1)
  break;  
 if on_platform(0,1)
  break;
  
 global.Solid = id;
 
 with (oPlatformEntity)
 {
  global.Entity = id;
  
  AboveMe = 0;
  BelowMe = 0;
  
  if Complex == 1
  {
   if collision_top_id(UP,1,global.Solid) or collision_top_id(RIGHT,1,global.Solid) or collision_top_id(LEFT,1,global.Solid)
    AboveMe = 1; 
   if collision_bottom_id(DOWN,1,global.Solid)
    BelowMe = 1;     
  }
  else
  {
   if collision_top_id(0,1,global.Solid)
    AboveMe = 1;  
   if collision_bottom_id(0,1,global.Solid)
    BelowMe = 1;     
  }
  
  if BelowMe == 1 
  {
   y ++;
   
   if Complex == 1
   {
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
  }
  
  if AboveMe == 1 
  {
   if Complex == 1
   {        
    if AboveMe == 1
    {  
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
    
    if !collision_bottom(DOWN,1)
     y ++;
     else
     if (collision_top_id(UP,1,global.Solid) or collision_top_id(RIGHT,1,global.Solid) or collision_top_id(LEFT,1,global.Solid)) 
     && Break == 1
     {
      global.Solid.yVel *= -1;
      with (global.Solid) break;  
      global.Solid.y --;   
      global.Solid.yVelInteger = 0; 
     }
   }
   else
   {
    if !collision_bottom(0,1)
     y ++;   
     else
     if AboveMe && Break == 1
     {
      global.Solid.yVel *= -1; 
      with (global.Solid) break;  
      global.Solid.y --;   
      global.Solid.yVelInteger = 0; 
     }
   } 
  }    
 }
}




if yVelInteger < 0
for(y = y; y > mtYPrev + yVelInteger; y -= 1)
{
 if collision_top(0,1)
  break;
  
 global.Solid = id;
 
 with (oPlatformEntity)
 {
  global.Entity = id;
  
  AboveMe = 0;
  BelowMe = 0;
  
  if Complex == 1
  {
   if collision_top_id(UP,1,global.Solid)
    AboveMe = 1; 
   if collision_bottom_id(DOWN,1,global.Solid)
    BelowMe = 1;     
  }
  else
  {
   if collision_top_id(0,1,global.Solid)
    AboveMe = 1;  
   if collision_bottom_id(0,1,global.Solid)
    BelowMe = 1;     
  }
  
  if BelowMe == 1 
  {
   if Complex == 1
   {
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
    
   if Complex == 1
   {
    if !collision_top(UP,1)
     y --;
     else
     if (collision_bottom_id(DOWN,1,global.Solid)) 
     && Break == 1
     {
      global.Solid.yVel *= -1;
      with (global.Solid) break;  
      global.Solid.y ++;   
      global.Solid.yVelInteger = 0;
     }
   }
   else
   {
    if !collision_top(0,1)
     y --;   
     else
     if BelowMe && Break == 1
     {
      global.Solid.yVel *= -1;
      with (global.Solid) break;  
      global.Solid.y ++;   
      global.Solid.yVelInteger = 0; 
     }
   }
  }
  
  if AboveMe == 1 
  {
   //
  }    
 }
}
