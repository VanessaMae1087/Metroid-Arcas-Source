TorsoSprite = sBlank;
TorsoIndex = 0;
TorsoX = 0;
TorsoY = 0;

if State != BALL
 Morphing = 0;
if State != DUCKING
 Unmorphing = 0;

if State == HURT
{
 image_speed = 1;
 TorsoSprite =sBlank;
 sprite_index=sSHurtRight;
 if Facing == -1
  sprite_index = sSHurtLeft; 
 if image_index >= 14
  State = JUMPING;
 if on_ground(0,1)
  State = STANDING; 
}

if State == SJSTART
{
 if StateTime <= 0
 {
  ShineDir = 0;// up
  // 0 up
  // 1 upright
  // 2 right
  // 3 upleft
  // 4 left
 }
 else
 {
  if global.KeyPushed[0,KEY_LEFT] && global.KeyPushed[0,KEY_UP]
   ShineDir = 3;
  if global.KeyPushed[0,KEY_LEFT] && !global.KeyPushed[0,KEY_UP]
   ShineDir = 4;
  if !global.KeyPushed[0,KEY_LEFT] && global.KeyPushed[0,KEY_UP] && !global.KeyPushed[0,KEY_RIGHT]
   ShineDir = 0;
  if global.KeyPushed[0,KEY_UP] && global.KeyPushed[0,KEY_RIGHT]
   ShineDir = 1;
  if !global.KeyPushed[0,KEY_UP] && global.KeyPushed[0,KEY_RIGHT]
   ShineDir = 2;  
 }
// 2,2,16,6
 if StateTime <= 2
 {
  if Facing = RIGHT
   image_index = 0;
   else
   image_index = 1;   
 }
 else
 if StateTime <= 4
 {
  if Facing = RIGHT
   image_index = 2;
   else
   image_index = 3;
 }
 else
 if StateTime <= 20
 {
  if Facing = RIGHT
   image_index = 4;
   else
   image_index = 5;
 }
 else
 if StateTime <= 26
 {
  if Facing = RIGHT
   image_index = 6;
   else
   image_index = 7;
 } 

 
 if StateTime == 1
 {
  if SuperBall == 0
  sound_play_pos(sndJumpStart,x,y);
  else
  sound_play_pos(sndJumpStartBall,x,y); 
 }
 if SuperBall == 0
 {
  if StateTime == 0 && on_ground(0,1)
  repeat (12) 
  {
   if !collision_top(0,1)
    y -= 1;
  }
 }
 else
 {
  if StateTime == 0 && on_ground(0,1)
  {
   yVel = 0;
   yMP = 0;
   yMN = 0;
  }
 }
 
 
  xVel = 0;
  if !SuperBall
  yVel = 0;
  else
  if StateTime < 3
  {
   repeat (4)
   {
    if !collision_top(0,1)
     y -= 1;
   }  
  }
  
 if SuperBall == 0
 sprite_index = sSJumpStart;
 else
 {
  sprite_index = sSAirBallRight;
  if Facing == -1
   sprite_index = sSAirBallLeft;
  image_index = 1;
 }
 
 TorsoSprite = sBlank;
 
 if StateTime == 30 + 34*SuperBall
 {
  sound_play_pos(sndShineStart,x,y);
  State = SUPERJUMP;
  StateTime = 0;
  if ShineDir == 3 or ShineDir == 4
   Facing = -1;
  if ShineDir == 1 or ShineDir == 2
   Facing = 1;
  yVel = 0;
 }
}




if State == SUPERJUMP
{
  AimDirection = 4;
  AimTarget = 4;

 if ShineDir == 0
  yVel = -6;
 if ShineDir == 1
 {
  yVel = -3;
  xVel = 5;
 }
 if ShineDir == 2
 {
  xVel = 6;
 } 
 if ShineDir == 3
 {
  yVel = -3;
  xVel = -5;
 }
 if ShineDir == 4
 {
  xVel = -6;
 } 
 
 

 if !SuperBall
 {
  if ShineDir == 0
  {
   image_speed = 0;
   if global.TickP mod 3 == 0
    image_index += 1;
   if image_index > 8+2/3
    image_index = 1;
   if StateTime < 1
    image_index = 0;
   if Facing == -1
    sprite_index = sSJumpUpLeft;
    else
    sprite_index = sSJumpUpRight;
   TorsoSprite = sBlank;
  }
  else
  {
   image_index = min(StateTime/3,2);
   if StateTime > 9 && floor(global.TickP/3) mod 2 == 0
    image_index = 3;
   if Facing == 1
   {
    sprite_index = sSShineRight;
   }
   else
   {
    sprite_index = sSShineLeft;
   }
  }
 }
 
 if SuperBall
 {
  sprite_index = sSAirBallRight;
  if Facing == -1
   sprite_index = sSAirBallLeft;
  image_speed = .75;
  TorsoSprite = sBlank;
 }
 
 
 
 if (((xVel < 0 && collision_left(0,1)) or (xVel > 0 && collision_right(0,1)) && (ShineDir = 3 or ShineDir = 1)) or (InPlace > 0) or (collision_top(0,1) && yVel < 0))
 if StateTime > 1 && State == SUPERJUMP
 {
  State = SJEND;
  sound_play_pos(sndShineStop,x,y);
  audio_stop_sound(sndShineStart);
  audio_stop_sound(sndShineLoop);
  StateTime = 0;
  Quake = instance_create(x,y,oQuake);
  Quake . Duration = 16;
  Quake . Intensity = 4;
  AimDirection = 4;
  AimTarget = 4;
 }
 
 if x == ds_list_find_value(xPrevv,1) 
 && y == ds_list_find_value(yPrevv,1)
 && StateTime > 0
  InPlace += .5;
  else
  Inplace = 0;
  
 if ShineDir != 0
 if ((collision_rectangle(x+8,y+3*(ShineDir=1)-1,x+7,y-3,oSlope,1,1)>0 && Facing == 1) or (Facing == -1 && collision_rectangle(x-14,y+3*(ShineDir==3)-1,x-7,y-3,oSlope,1,1)>0))
 && State = SUPERJUMP && ((Facing == -1 && global.KeyPushed[0,KEY_LEFT]) or (Facing == 1 && global.KeyPushed[0,KEY_RIGHT]))
 {
  if SuperBall = 0
   State = RUNNING;
   else
   State = BALL;

      
  L = 0; Limat = abs(ceil(xVel))-2;  
  while ((!collision_right(0,1) && Facing == 1) or (!collision_left(0,1) && Facing == -1)) 
  && L < Limat{ L += 1; x += Facing;}  L = 0; Limat = 3; yy = y; y--;
  if !(collision_right(0,1) && Facing == 1) or (collision_left(0,1) && Facing == -1)
  x+=Facing; while !on_ground(0,1) && L < Limat{y += 1;L += 1;}if !on_ground(0,1) y = yy;
  while (on_ground(0,0)) y -= 1;

   
  xVel = 5 * Facing;
  yVel = 0;
  RushBoost = 2;
  
  Dash = DashMax;

  DashSound = audio_play_sound_on(DashEmitter,sndDashStart,0,1);
  audio_stop_sound(sndShineStart);
  audio_stop_sound(sndShineLoop);

  StateTime = DashReq + DashMax;
 } 
}
else
InPlace = 0;

  
  
  
  
  
  
  
  
if State == SJEND
{    
 HurtFlash = 8;
 xVel = 0;
 yVel = 0;
 image_speed = 0;
 
 if SuperBall = 1
 {
  image_index = 1;
  sprite_index = sSAirBallRight;
  if Facing == -1
   sprite_index = sSAirBallLeft;
 }
 else
 if StateTime < 17
 {
  if ShineDir != 0
   image_index = 2;
 }
 if StateTime > 16 && SuperBall == 0
 {
  if !spin_sprite() image_index = 0;
  
  if Facing = RIGHT
   sprite_index = sSSpinRight;
   else
   sprite_index = sSSpinLeft;

   image_index += 1;
   
   if image_index == 13
   {
    image_index = 0;
   }
   
   if StateTime > 30
   {
    sprite_index = sSJumpStart;
    
    if Facing = RIGHT
    {
     if StateTime > 30
      image_index = 4;
     if StateTime > 32
      image_index = 0;    
    }
    else
    {
     if StateTime > 30
      image_index = 5;
     if StateTime > 32
      image_index = 1;    
    }
   }
   
   if StateTime > 40
   {
    State = JUMPING;
    Spinning = 0;
    SuperBall = 0;
    yVel = 0;
   }
   
 }
  // 0 up
  // 1 upright
  // 2 right
  // 3 upleft
  // 4 left 
 if StateTime < 17
 {
  if ShineDir = 0
  {
   image_index = 0;
  }
  else
  {
   image_index = 2;
  } 
 }
 
 
 if SuperBall == 1 && StateTime > 20
 {
  State = BALL;
  yVel = 0;
  Spinning = 0;
  Turning = 0;
  SuperBall = 0;
 }
} 




if State == IDLE
{
 TorsoSprite = sBlank;
 if !Turning
 {
  sprite_index = sSIdle;
  image_speed = 1/20;
  
  if ElevUpTime
  {
   image_index = 4-ElevUpTime/2;
   sprite_index = sSIdleUp;
  }
  if ElevDownTime
  {
   image_index = 4-ElevDownTime/2;
   sprite_index = sSIdleDown;
  }
  
  if !Fanfare && global.CanControl && oControl.GotSuit == 0 && Elevator == noone
  {
   if global.KeyPushed[0,KEY_RIGHT] && !Turning
   {
    image_index = 0;
    Turning = 1;
    Facing = 1;
    StopIdle = 1;
    global.PausedEnemies = 0;
    sprite_control();
   }
   if global.KeyPushed[0,KEY_LEFT] && !Turning
   {
    image_index = 0;
    Turning = 1;
    Facing = -1;
    StopIdle = 1;
    global.PausedEnemies = 0;
    sprite_control();
   }  
  }
 }
 else
 {
  if Facing == 1
   sprite_index = sSIdleRight;
   else
   sprite_index = sSIdleLeft; 
   
  image_speed = .5;
  
  if image_index >= 1
  {
   if StopIdle == 1
   {
    State = STANDING;
    image_index = 0;
    Turning = 0;
    StopIdle = 0;
   }
   else
   {
    Turning = 0;
    image_index = 0;
    sprite_index = sSIdle;
    image_speed = 1/20;
   }
  }
 }
}
else
{
 StopIdle = 0;
 ElevUpTime = 0;
 ElevDownTime = 0;
}

if State == BRAKING
{
 TorsoSprite = sBlank;
 sprite_index = sSBrakeRight;
 if Facing == -1
  sprite_index = sSBrakeLeft;
 image_speed = 1/4;
 if image_index > 2 image_index = 2;
 if StateTime >= 16
  State = STANDING;
}
 
if State == WALL
{
 if image_index >= 3
 {
  image_index = 2;
  State = JUMPING;
  Spinning = 1;
  xVel = 0;
  if !InWater
   yVel = -JumpHeight;
   else
   yVel = -JumpHeightWater/1.76;
  
  MoveTick = 1;
  yMP = 0;
  yMN = 0;
  JustWall = 3;
 }
 
 image_speed = 1/2;
 sprite_index = sSWallRight;
 if Facing == -1
  sprite_index = sSWallLeft;
}

if State == BALL
{
 Turning = 0;
 
 if Facing == 1
 {
  if sprite_index == sSBallLeft or sprite_index == sSAirBallLeft
  {
   image_index = 1; 
   if on_ground(0,1)
   xVel = 0;
  }
  sprite_index = sSBallRight; 
  if !on_ground(0,1)
   sprite_index = sSAirBallRight;
  if global.KeyPressed[0,KEY_RIGHT] or global.KeyReleased[0,KEY_RIGHT]
   image_index = 1;
 }

 if Facing == -1
 {
  if sprite_index == sSBallRight or sprite_index == sSAirBallRight
  {
   image_index = 1;   if on_ground(0,1)

   xVel = 0;
  }
  sprite_index = sSBallLeft;
  if !on_ground(0,1)
   sprite_index = sSAirBallLeft;
  if global.KeyPressed[0,KEY_LEFT] or global.KeyReleased[0,KEY_LEFT]
   image_index = 1;
 }
 
 image_speed = 1/3;
 
 if InWater image_speed = 1/6;
 
 if Morphing
 {
  image_speed = 1;
  if Facing == 1
   sprite_index = sSMorphRight;
   else
   sprite_index = sSMorphLeft;  
   
  if image_index >= 2
  {
   image_index = 0;
   Morphing = 0;
   sprite_control();
  }
 }
}


if !Turning
{
 if State == STANDING && !Landing
 {
  if global.Suit == 3
  {
   if sprite_index != sSStandRight
   && sprite_index != sSStandLeft
   && sprite_index != sSStandRightUp
   && sprite_index != sSStandLeftUp 
   && sprite_index != sSStandRightUpAim 
   && sprite_index != sSStandLeftUpAim    
   && sprite_index != sSStandRightDownAim            
   && sprite_index != sSStandLeftDownAim           
    image_index = 0;  
  }
  
  sprite_index = sSStandRight;
  if Facing == -1
   sprite_index = sSStandLeft;
   
  if AimDirection == 8
  {
   sprite_index = sSStandRightUp;
   if Facing == -1
    sprite_index = sSStandLeftUp;
  }
  if AimDirection == 6
  {
   sprite_index = sSStandRightUpAim;
   if Facing == -1
    sprite_index = sSStandLeftUpAim;
  }
  if AimDirection == 2
  {
   sprite_index = sSStandRightDownAim;
   if Facing == -1
    sprite_index = sSStandLeftDownAim;
  }

     
  if global.Suit != 3
  {
   image_speed = 1/20;
   if image_index >= 4
    image_index = 0;
  }
  else
  {
   if image_index >= 9
    image_index = 5;
   if image_index > 5
    image_speed = 1/20;
    else
    image_speed = 1/3;  
  }
 }
 
 if State == STANDING && Landing
 {
  sprite_index = sSLandRight;
  if Facing == -1
   sprite_index = sSLandLeft;
   
  if AimDirection == 8
  {
   sprite_index = sSLandRightUp;
   if Facing == -1
    sprite_index = sSLandLeftUp;
  }
  if AimDirection == 6
  {
   sprite_index = sSLandRightUpAim;
   if Facing == -1
    sprite_index = sSLandLeftUpAim;
  }   
  if AimDirection == 2
  {
   sprite_index = sSLandRightDownAim;
   if Facing == -1
    sprite_index = sSLandLeftDownAim;
  }    
   
  image_speed = 1/2;
  if image_index >= 3
  { 
   image_index = 0;
   Landing = 0;
   sprite_control();
  }
 }
 
 if State != STANDING or abs(xVel) > 0
 {
  if Landing
  {
   image_index = 0;
   Landing = 0;
   sprite_control();
  }
 }
 
 if State == DUCKING
 {
  if !Unmorphing
  {
   if global.Suit == 3
   {
    if sprite_index != sSCrouchRight
    && sprite_index != sSCrouchLeft
    && sprite_index != sSCrouchRightUpAim
    && sprite_index != sSCrouchLeftUpAim  
    && sprite_index != sSCrouchRightDownAim  
    && sprite_index != sSCrouchLeftDownAim          
     image_index = 0;  
   }
   sprite_index = sSCrouchRight;
   if Facing == -1
    sprite_index = sSCrouchLeft;
    
   if AimDirection == 6
   {
    sprite_index = sSCrouchRightUpAim;
    if Facing == -1
     sprite_index = sSCrouchLeftUpAim;   
   }
   if AimDirection == 2
   {
    sprite_index = sSCrouchRightDownAim;
    if Facing == -1
     sprite_index = sSCrouchLeftDownAim;
   }
   
   
   Landing = 0;   
   if global.Suit != 3
   {
    image_speed = 1/20;
    if image_index >= 4
     image_index = 0;
   }
   else
   {
    if image_index >= 9
     image_index = 5;
    if image_index > 5
     image_speed = 1/20;
     else
     image_speed = 1/3;  
   }
  }
  else
  if Unmorphing
  {
   image_speed = 1;
   if Facing == 1
    sprite_index = sSUnmorphRight;
    else
    sprite_index = sSUnmorphLeft;  
    
   if image_index >= 3
   {
    image_index = 0;
    Unmorphing = 0;
    ForceAim = 1;
    sprite_control();
   }
  }
 }
}
else
{
 Landing = 0;
 if State == STANDING or State == RUNNING or State == JUMPING or State == DUCKING
 {
  sprite_index = sSTurnRight;
  if Facing == -1
   sprite_index = sSTurnLeft;
   
  if State == JUMPING
  {
   sprite_index = sSTurnJumpRight;
   if Facing == -1
    sprite_index = sSTurnJumpLeft; 
    
   if AimDirection == 0
   {
    sprite_index = sSTurnRightJumpDown;
    if Facing == -1
     sprite_index = sSTurnLeftJumpDown;    
   }
  }
  if State == DUCKING
  {
   sprite_index = sSTurnRightCrouch;
   if Facing == -1
    sprite_index = sSTurnLeftCrouch; 
  }
  
  
   
  TorsoSprite = sSTurnTorso;
  if AimDirection == 8
   TorsoSprite = sSTurnTorsoUp;
  if AimDirection == 6
   TorsoSprite = sSTurnTorsoUpAim;
  if AimDirection == 2
   TorsoSprite = sSTurnTorsoDownAim;
   
  if State == JUMPING
  { 
   TorsoSprite = sSTurnTorsoJump;
   if AimDirection == 8
    TorsoSprite = sSTurnTorsoJumpUp;   
   if AimDirection == 6
    TorsoSprite = sSTurnTorsoJumpUpAim;   
   if AimDirection == 2
    TorsoSprite = sSTurnTorsoJumpDownAim;       
   if AimDirection == 0
    TorsoSprite = sBlank;    
  }
  
  if State == DUCKING
  {
   TorsoSprite = sSTurnTorsoCrouch;
   if AimDirection == 6
    TorsoSprite = sSTurnTorsoCrouchUpAim;     
   if AimDirection == 2
    TorsoSprite = sSTurnTorsoCrouchDownAim;       
  }
   
  TorsoY = 0;
  
  if State == DUCKING
  {
   TorsoY = 11; 
  }
  
  if Facing == 1
   TorsoIndex = image_index;
   else
   {
    if image_index < 1
     TorsoIndex = 1;
     else
     TorsoIndex = 0;
   }
   
  image_speed = 1/2;
  
  if image_index >= 2
  {
   image_index = 0;
   Turning = 0;
   JustTurned = 3;
   sprite_control();
  }
 
 }
 else
 if State != GRIP && State != CRAWLING && State != IDLE
  Turning = 0;
 else
 if State == CRAWLING
 {
  if image_index >= 4
  {
   Turning = 0;
   image_index = 0;
   sprite_control();
   JustTurned = 3;
  }
 
  if Facing == 1
   sprite_index = sSCrawlTurnRight;
   else
   sprite_index = sSCrawlTurnLeft;
  image_speed = 1/2;
  TorsoSprite = sBlank; 
 }
}

if State == CRAWL
{
 if image_index >= 4
 {
  image_index = 0;
  State = CRAWLING;
  sprite_control();
  x += Facing;
 }

 sprite_index = sSCrawlRight;
 if Facing == -1
  sprite_index = sSCrawlLeft;
 image_speed = 1/2;
 TorsoSprite = sBlank; 
}

if State == UNCRAWL
{
 if image_index >= 4
 {
 // image_index = 0;
  State = DUCKING;
  //sprite_control();
 }

 sprite_index = sSUncrawlRight;
 if Facing == -1
  sprite_index = sSUncrawlLeft;
 image_speed = 1/2;
 TorsoSprite = sBlank; 
}

if !Turning
if State == CRAWLING
{
 sprite_index = sSCrawlDownRight;
 if Facing == -1
  sprite_index = sSCrawlDownLeft;

 image_speed = 1/4;
 if xVel == 0 image_index = 0;
 TorsoSprite = sBlank;
 
 if CanStep == 0 && floor(image_index) == 2
 {
  sound_play_pos(sndCrawl,x,y);
  CanStep = 8;
 }
}

if State == RUNNING && !Turning
{
 if sprite_index != sSRunRight
 && sprite_index != sSRunLeft
 && sprite_index != sSDashRight
 && sprite_index != sSDashLeft
 && sprite_index != sSRunRightUpAim 
 && sprite_index != sSRunLeftUpAim  
 && sprite_index != sSRunRightDownAim  
 && sprite_index != sSRunLeftDownAim 
 && sprite_index != sSRunRightAim  
 && sprite_index != sSRunLeftAim  
 && sprite_index != sSDashRightUpAim  
 && sprite_index != sSDashLeftUpAim  
 && sprite_index != sSDashRightDownAim 
 && sprite_index != sSDashLeftDownAim  
 && sprite_index != sSDashLeftAim
 && sprite_index != sSDashRightAim    
  image_index = 0;
  
 sprite_index = sSRunRight;
 if Facing == -1
  sprite_index = sSRunLeft;
  
 if Aiming
 {   
  sprite_index = sSRunRightAim;
  if Facing == -1
   sprite_index = sSRunLeftAim; 
 }
  
 if AimDirection == 6
 {
  sprite_index = sSRunRightUpAim;
  if Facing == -1
   sprite_index = sSRunLeftUpAim;  
 }
 if AimDirection == 2
 {
  sprite_index = sSRunRightDownAim;
  if Facing == -1
   sprite_index = sSRunLeftDownAim;  
 }
 
 if Dash >= DashTime
 {
  sprite_index = sSDashRight;
  if Facing == -1
   sprite_index = sSDashLeft;
     
  if Aiming
  {   
   sprite_index = sSDashRightAim;
   if Facing == -1
    sprite_index = sSDashLeftAim; 
  }
   
  if AimDirection == 6
  {
   sprite_index = sSDashRightUpAim;
   if Facing == -1
    sprite_index = sSDashLeftUpAim;  
  }
  if AimDirection == 2
  {
   sprite_index = sSDashRightDownAim;
   if Facing == -1
    sprite_index = sSDashLeftDownAim;  
  }   
 }
  
 image_speed = 1/2;
 if InWater image_speed = 1/4;
 
 if Dash > 0 image_speed = 2/3;

 {
  if !InWater
  {
   if floor(image_index) == 4 && !CanStep
   {
    if global.Suit != 3
    {
     if !place_meeting(x,y,oSplashArea)
      sound_play_pos(sndStep,x,y);
      else
      {
       sound_play_pos(sndStepWetZero,x,y);
       if place_meeting(x+7*Facing,y+1,oSolid)
       {
        Sp = instance_create(x + 5*Facing, y, oSplash);
        Sp . sprite_index = sWaterSplash4;
        Sp . Creator = Sp;   
       }
      }
    }
    else
    {
     if !place_meeting(x,y,oSplashArea)
      sound_play_pos(sndStepZero,x,y);
      else
      {
       sound_play_pos(sndStepWetZero,x,y); 
       if place_meeting(x+7*Facing,y+1,oSolid)
       {  
        Sp = instance_create(x + 5*Facing, y, oSplash);
        Sp . sprite_index = sWaterSplash4;
        Sp . Creator = Sp;  
       }
      }  
    }

    CanStep = 3;
   }
   if floor(image_index) == 9 && !CanStep
   {
    if global.Suit != 3
    {
     if !place_meeting(x,y,oSplashArea)
      sound_play_pos(sndStep2,x,y);
      else
      {
       sound_play_pos(sndStepWetZero2,x,y); 
       if place_meeting(x+7*Facing,y+1,oSolid)
       {
        Sp = instance_create(x + 5*Facing, y, oSplash);
        Sp . sprite_index = sWaterSplash4;
        Sp . Creator = Sp;
       }
      }  
    }
    else
    {
     if !place_meeting(x,y,oSplashArea)
      sound_play_pos(sndStepZero2,x,y);
      else
      {
       sound_play_pos(sndStepWetZero2,x,y); 
       if place_meeting(x+7*Facing,y+1,oSolid)
       {
        Sp = instance_create(x + 5*Facing, y, oSplash);
        Sp . sprite_index = sWaterSplash4;
        Sp . Creator = Sp; 
       }   
      }  
    }
    CanStep = 3;  
   }
  }
  else
  if (floor(image_index) == 4 or floor(image_index) == 9)
  && !CanStep
  {
   CanStep = 6;
   sound_play_pos(sndStepWater,x,y);   
  }
 }
}


if State == JUMPING && !Spinning && !Turning
{
 sprite_index = sSJumpRight;
 if Facing == -1
  sprite_index = sSJumpLeft;
  
 if AimDirection == 8
 {
  sprite_index = sSJumpRightUp;
  if Facing == -1
   sprite_index = sSJumpLeftUp;
 }
 if AimDirection == 5
 {
  sprite_index = sSJumpRightUpAimTrans;
  if Facing == -1
   sprite_index = sSJumpLeftUpAimTrans;
 }
 if AimDirection == 6
 {
  sprite_index = sSJumpRightUpAim;
  if Facing == -1
   sprite_index = sSJumpLeftUpAim;
 }
 if AimDirection == 2
 {
  sprite_index = sSJumpRightDownAim;
  if Facing == -1
   sprite_index = sSJumpLeftDownAim;
 }
 if AimDirection == 0
 {
  sprite_index = sSJumpRightDown;
  if Facing == -1
   sprite_index = sSJumpLeftDown;
 }
 
 
 image_speed = 1/4;
 if InWater image_speed = 1/8;

 if yVel < 0
  image_index = min(image_index,2); 
 image_index = min(image_index,4);
 
 if yVel > 0 && image_index < 2
 {
  if JustTurned == 1
  {
   image_index = 2;
   JustTurned = 0;
  }
  else
  image_index = 2;
 }

 if JustTurned == 2
 {
  JustTurned = 1;
  image_index = 0;
 }
 
 if JustTurned == 3
  JustTurned = 2;
}

if State != JUMPING or Spinning
 JustTurned = 0;

if State == JUMPING && Spinning
{
 sprite_index = sSSpinRight;
 if Facing == -1
  sprite_index = sSSpinLeft;
  
 if global.Power[P_SPACE] && !InWater && global.Suit != 3
 {
  sprite_index = sSSpaceRight;
  if Facing == -1
   sprite_index = sSSpaceLeft;
  
  if image_index >= 10
   image_index = 2;   
 }
  
 image_speed = 1;
 if InWater && image_index > 1 image_speed = 1/2;
 if image_index >= 14
  image_index = 2;
  
 Turning = 0;
}

// CLIMB

if State == CLIMBING 
{
 image_speed = 0;
 image_index = min(6, StateTime/3);
 
 sprite_index = sSClimbRight;
 if Facing == -1
  sprite_index = sSClimbLeft;                            
}

// GRIP

if State == GRIP && !Turning
{
 if Facing == TrueFacing
 {   
  if global.Suit != 3
  {
   image_speed = 1/20;
   if image_index >= 4
    image_index = 0;
  }
  else
  {
   if image_index >= 9
    image_index = 5;
   if image_index > 5
    image_speed = 1/20;
    else
    image_speed = 1/3;  
  }

  sprite_index = sSGripRight;
  if TrueFacing == -1
   sprite_index = sSGripLeft;
 }
 else
 {
  image_speed = 1/20;
  if image_index >= 4
   image_index = 0;
  
  sprite_index = sSGripRightAim;
  if TrueFacing == -1
   sprite_index = sSGripLeftAim;  
   
  if AimDirection == 8
  {
   sprite_index = sSGripRightAimUp;
   if TrueFacing == -1
    sprite_index = sSGripLeftAimUp;    
  }
  if AimDirection == 6
  {
   sprite_index = sSGripRightUpAim;
   if TrueFacing == -1
    sprite_index = sSGripLeftUpAim;    
  }
  if AimDirection == 2
  {
   sprite_index = sSGripRightDownAim;
   if TrueFacing == -1
    sprite_index = sSGripLeftDownAim;    
  }
  if AimDirection == 0
  {
   sprite_index = sSGripRightDown
   if TrueFacing == -1
    sprite_index = sSGripLeftDown;  
  }
  
  
 }
}


if State == GRIP && Turning
{
 image_speed = 1;
 if InWater image_speed = 1/2;
 if image_index >= 1
 {
  Turning = 0;
  image_index = 0;
  sprite_control();  
  ForceAim = 2;
 }
 
 sprite_index = sSGripTurnRight;
 if TrueFacing == -1
  sprite_index = sSGripTurnLeft;                            
}


if Spinning TorsoSprite = sBlank;
if (State == DUCKING or State == STANDING or (State == GRIP && Facing != TrueFacing)) && !Turning && Firing > 0
{
 if State != GRIP
 {
  if global.Suit == 3
   image_index = min(9+(Firing-1)/3,10);
   else
   image_index = min(4+(Firing-1)/2,5);
 }
 else
 {
  if global.Suit == 3
   image_index = min(4+(Firing-1)/2,5);
   else
   image_index = min(4+(Firing-1)/2,5);
 } 
}
if !(State == DUCKING or State == STANDING or (State == GRIP && Facing != TrueFacing))
 Firing = 0;                                             
weapon_pos();
