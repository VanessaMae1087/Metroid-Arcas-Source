// Index

Index = floor(image_index);
TIndex = floor(TorsoIndex);

ArmVis = 0;
FFrame[1] = 0;
FFrame[0] = 0;
if (Index == 4 && (global.Suit != 3 or State == GRIP)) or (Index == 5 && (global.Suit != 3 or State == GRIP)) or Index == 9 or Index == 10
 FFrame[0] = 1;
if (Index == 5 && (global.Suit != 3 or State == GRIP)) or Index == 10
 FFrame[1] = 1;

// Sprite

switch (sprite_index)
{
 // STANDING
 
 case sSStandRight:
  ArmVis = 1;
  ArmSprite = sSArm;
  ArmX = 12;
  ArmY = -26;
  if FFrame[0] ArmX --;
  if FFrame[1]  ArmX --;
  ArmAngle = 0;  
 break;
 case sSStandRightUpAim:
  ArmVis = 1;
  ArmSprite = sSArmUp;
  ArmX = 7;
  ArmY = -34;
  if FFrame[0] {ArmX --; ArmY++;}
  if FFrame[1]  {ArmX --; ArmY++;}
  ArmAngle = 45;  
 break; 
 case sSStandRightUp:
  ArmVis = 1;
  ArmSprite = sSArmUpUp;
  ArmX = 3;
  ArmY = -39;
  if FFrame[0] {ArmY++;}
  if FFrame[1]  {ArmY++;}
  ArmAngle = 90;  
 break; 
 case sSStandRightDownAim:
  ArmVis = 1;
  ArmSprite = sSArmDown;
  ArmX = 7;
  ArmY = -21;
  if FFrame[0] {ArmX--;ArmY--;}
  if FFrame[1]  {ArmX--;ArmY--;}
  ArmAngle = 315;  
 break; 
 
 case sSStandLeft:
  ArmVis = 1;
  ArmSprite = sSArm;
  ArmX = -12;
  ArmY = -26;
  if FFrame[0] ArmX ++;
  if FFrame[1]  ArmX ++;
  ArmAngle = 180;  
 break;
 case sSStandLeftUpAim:
  ArmVis = 1;
  ArmSprite = sSArmUp;
  ArmX = -7;
  ArmY = -34;
  if FFrame[0] {ArmX ++; ArmY++;}
  if FFrame[1]  {ArmX ++; ArmY++;}
  ArmAngle = 135;  
 break; 
 case sSStandLeftUp:
  ArmVis = 1;
  ArmSprite = sSArmUpUp;
  ArmX = -3;
  ArmY = -39;
  if FFrame[0] {ArmY++;}
  if FFrame[1] {ArmY++;}
  ArmAngle = 90;  
 break; 
 case sSStandLeftDownAim:
  ArmVis = 1;
  ArmSprite = sSArmDown;
  ArmX = -7;
  ArmY = -21;
  if FFrame[0] {ArmX++;ArmY--;}
  if FFrame[1]  {ArmX++;ArmY--;}
  ArmAngle = 225;  
 break; 
 
 
 // CROUCHING
 
 case sSCrouchRight:
  ArmVis = 1;
  ArmSprite = sSArm;
  ArmX = 11;
  ArmY = -12;
  if FFrame[0] ArmX --;
  if FFrame[1]  ArmX --;
  ArmAngle = 0;  
 break;
 case sSCrouchRightUpAim:
  ArmVis = 1;
  ArmSprite = sSArmUp;
  ArmX = 7;
  ArmY = -23;
  if FFrame[0] {ArmX --; ArmY++;}
  if FFrame[1]  {ArmX --; ArmY++;}
  ArmAngle = 45;  
 break; 
 case sSCrouchRightDownAim:
  ArmVis = 1;
  ArmSprite = sSArmDown;
  ArmX = 7;
  ArmY = -10;
  if FFrame[0] {ArmX--;ArmY--;}
  if FFrame[1]  {ArmX--;ArmY--;}
  ArmAngle = 315;  
 break; 
 
 case sSCrouchLeft:
  ArmVis = 1;
  ArmSprite = sSArm;
  ArmX = -11;
  ArmY = -12;
  if FFrame[0] ArmX ++;
  if FFrame[1]  ArmX ++;
  ArmAngle = 180;  
 break;
 case sSCrouchLeftUpAim:
  ArmVis = 1;
  ArmSprite = sSArmUp;
  ArmX = -7;
  ArmY = -23;
  if FFrame[0] {ArmX ++; ArmY++;}
  if FFrame[1]  {ArmX ++; ArmY++;}
  ArmAngle = 135;  
 break; 
 case sSCrouchLeftDownAim:
  ArmVis = 1;
  ArmSprite = sSArmDown;
  ArmX = -7;
  ArmY = -10;
  if FFrame[0] {ArmX++;ArmY--;}
  if FFrame[1]  {ArmX++;ArmY--;}
  ArmAngle = 225;  
 break; 

  
 // LANDING
 
 case sSLandRight:
  ArmVis = 1;
  ArmSprite = sSArm;
  ArmX = 12;
  ArmY = -26;
  if Index == 0{ArmX-=3;ArmY+=14;}
  if Index == 1{ArmX-=1;ArmY+=8;}  
  if Index == 2{ArmY+=3;}  
  ArmAngle = 0;  
 break;
 case sSLandRightUpAim:
  ArmVis = 1;
  ArmSprite = sSArmUp;
  ArmX = 7;
  ArmY = -34;
  if Index == 0{ArmY+=11;}  
  if Index == 1{ArmY+=8;} 
  if Index == 2{ArmX+=1;ArmY+=3;}
  ArmAngle = 45;  
 break;
 case sSLandRightUp:
  ArmVis = 1;
  ArmSprite = sSArmUpUp;
  ArmX = 3;
  ArmY = -39;
  if Index == 0{ArmY+=10;} 
  if Index == 1{ArmY+=7;}  
  if Index == 2{ArmX+=1;ArmY+=2;} 
  ArmAngle = 90;  
 break;
 case sSLandRightDownAim:
  ArmVis = 1;
  ArmSprite = sSArmDown;
  ArmX = 7;
  ArmY = -21;
  if Index == 0{ArmX-=3;ArmY+=11;}
  if Index == 1{ArmX-=2;ArmY+=8;}  
  if Index == 2{ArmX--;ArmY+=3;}  
  ArmAngle = 315;  
 break;
 
 
 case sSLandLeft:
  ArmVis = 1;
  ArmSprite = sSArm;
  ArmX = -12;
  ArmY = -26;
  if Index == 0{ArmX+=3;ArmY+=14;}
  if Index == 1{ArmX+=1;ArmY+=8;}  
  if Index == 2{ArmY+=3;}  
  ArmAngle = 180;  
 break; 
 case sSLandLeftUpAim:
  ArmVis = 1;
  ArmSprite = sSArmUp;
  ArmX = -7;
  ArmY = -34;
  if Index == 0{ArmY+=11;}  
  if Index == 1{ArmY+=8;} 
  if Index == 2{ArmX-=1;ArmY+=3;}
  ArmAngle = 135;  
 break;
 case sSLandLeftUp:
  ArmVis = 1;
  ArmSprite = sSArmUpUp;
  ArmX = -3;
  ArmY = -39;
  if Index == 0{ArmY+=10;} 
  if Index == 1{ArmY+=7;}  
  if Index == 2{ArmX-=1;ArmY+=2;} 
  ArmAngle = 90;  
 break;
 case sSLandLeftDownAim:
  ArmVis = 1;
  ArmSprite = sSArmDown;
  ArmX = -7;
  ArmY = -21;
  if Index == 0{ArmX+=3;ArmY+=11;}
  if Index == 1{ArmX+=2;ArmY+=8;}  
  if Index == 2{ArmX++;ArmY+=3;}  
  ArmAngle = 225;  
 break;

 // JUMPING
 
 case sSJumpRight:
  ArmVis = 1;
  ArmSprite = sSArm;
  ArmX = 9;
  ArmY = -24;
  ArmAngle = 0;  
 break;
 case sSJumpRightUpAim:
  ArmVis = 1;
  ArmSprite = sSArmUp;
  ArmX = 7;
  ArmY = -35;
  ArmAngle = 45;  
 break;
 case sSJumpRightUp:
  ArmVis = 1;
  ArmSprite = sSArmUpUp;
  ArmX = 3;
  ArmY = -41;
  ArmAngle = 90;  
 break;  
 case sSJumpRightDownAim:
  ArmVis = 1;
  ArmSprite = sSArmDown;
  ArmX = 5;
  ArmY = -22;
  ArmAngle = 315;  
 break; 
 case sSJumpRightDown:
  ArmVis = 1;
  ArmSprite = sSArmDownDown;
  ArmX = 3;
  ArmY = -9;
  ArmAngle = 270;  
 break; 
 
 case sSJumpLeft:
  ArmVis = 1;
  ArmSprite = sSArm;
  ArmX = -9;
  ArmY = -24;
  ArmAngle = 180;  
 break; 
 case sSJumpLeftUpAim:
  ArmVis = 1;
  ArmSprite = sSArmUp;
  ArmX = -7;
  ArmY = -35;
  ArmAngle = 135;  
 break;
 case sSJumpLeftUp:
  ArmVis = 1;
  ArmSprite = sSArmUpUp;
  ArmX = -3;
  ArmY = -41;
  ArmAngle = 90;  
 break;
 case sSJumpLeftDownAim:
  ArmVis = 1;
  ArmSprite = sSArmDown;
  ArmX = -5;
  ArmY = -22;
  ArmAngle = 225;  
 break; 
 case sSJumpLeftDown:
  ArmVis = 1;
  ArmSprite = sSArmDownDown;
  ArmX = -3;
  ArmY = -9;
  ArmAngle = 270;  
 break; 
 
 // SPINNING
 
 case sSSpinRight: 
 case sSSpaceRight:
 {
  ArmVis = 0;
  ArmSprite = sBlank;
  
  if Index < 2
   {
    ArmX = 7;
    ArmY = 16;
   }
  if Index = 2 or Index = 3
   {
    ArmX = 3;
    ArmY = 21;
   }
  if Index = 4
   {
    ArmX = -5;
    ArmY = 20;
   }
  if Index = 5 or Index = 6
   {
    ArmX = -8;
    ArmY = 18;
   }
  if Index = 7
   {
    ArmX = -7;
    ArmY = 9;
   }
  if Index = 8 or Index = 9
   {
    ArmX = -5;
    ArmY = 6;
   }
  if Index = 10
   {
    ArmX = 0;
    ArmY = 5;
   }
  if Index = 11 or Index = 12
   {
    ArmX = 2;
    ArmY = 7;
   }
  if Index = 13 or Index = 14
   {
    ArmX = 7;
    ArmY = 10;
   }
  ArmY -= 28;
  ArmAngle = 0;
 }
 break;
 
 case sSSpinLeft: 
 case sSSpaceLeft:
 {
  ArmVis = 0;
  ArmSprite = sBlank;
  
  if Index < 2
   {
    ArmX = -7;
    ArmY = 16;
   }
  if Index = 2 or Index = 3
   {
    ArmX = -3;
    ArmY = 21;
   }
  if Index = 4
   {
    ArmX = 5;
    ArmY = 20;
   }
  if Index = 5 or Index = 6
   {
    ArmX = 8;
    ArmY = 18;
   }
  if Index = 7
   {
    ArmX = 7;
    ArmY = 9;
   }
  if Index = 8 or Index = 9
   {
    ArmX = 5;
    ArmY = 6;
   }
  if Index = 10
   {
    ArmX = 0;
    ArmY = 5;
   }
  if Index = 11 or Index = 12
   {
    ArmX = -2;
    ArmY = 7;
   }
  if Index = 13 or Index = 14
   {
    ArmX = -7;
    ArmY = 10;
   }
  ArmAngle = 180;
  ArmY -= 28;
 } 
 break;

 // WALLJUMPING
 
 case sSWallRight:
 {
  ArmVis = 0;
  ArmSprite = sBlank;
  
  if Index = 0
  {
   ArmX = -8;
   ArmY = -14 + 28;
  }
  if Index = 1
  {
   ArmX = -8;
   ArmY = -13 + 28;
  }
  if Index > 1
  {
   ArmX = 0;
   ArmY = -10 + 28;
  }
  ArmY -= 28;  
  ArmAngle = 0;
 }
 break;
 
 case sSWallLeft:
 {
  ArmVis = 0;
  ArmSprite = sBlank;
 
  if Index = 0
  {
   ArmX = -9;
   ArmY = -6 + 28;
  }
  if Index = 1
  {
   ArmX = -8;
   ArmY = -5 + 28;
  }
  if Index > 1
  {
   ArmX = -2;
   ArmY = -5 + 28;
  }
  ArmY -= 28;  
  ArmAngle = 180;
 }
 break;
 
 // RUNNING
 
 case sSRunRightAim:
 case sSDashRightAim:
  ArmVis = 1;
  ArmSprite = sSArm;
  ArmX = 12;
  ArmY = -26; 
  if Index == 1{ArmX+=1;ArmY-=1;}
  if Index == 2{ArmX+=2;ArmY-=2;}
  if Index == 3{ArmX+=3;ArmY-=1;}
  if Index == 4{ArmX+=1;ArmY-=1;}
  if Index == 6{ArmY-=1;}
  if Index == 7{ArmX+=1;ArmY-=2;}
  if Index == 8{ArmX+=2;ArmY-=2;}
  if Index == 9{ArmX+=1;ArmY-=1;}    
  ArmAngle = 0;  
 break;
 case sSRunRight:
 case sSDashRight:
  ArmVis = 0;
  ArmSprite = sBlank;  
  if Index == 0{ArmX = 5;ArmY = 4;}
  if Index == 1{ArmX = 6;ArmY = 1;}
  if Index == 2{ArmX = 8;ArmY = -3;}
  if Index == 3{ArmX = 8;ArmY = -1;}
  if Index == 4{ArmX = 6;ArmY = 2;}
  if Index == 5{ArmX = 4;ArmY = 5;}
  if Index == 6{ArmX = 0;ArmY = 7;}
  if Index == 7{ArmX = -6;ArmY = 9;}
  if Index == 8{ArmX = -2;ArmY = 11;}
  if Index == 9{ArmX = 2;ArmY = 7;} 
  ArmY -= 28;      
  ArmX += 3;
  ArmAngle = 0;
 break;
 case sSRunRightUpAim:
 case sSDashRightUpAim:
  ArmVis = 1;
  ArmSprite = sSArmUp;
  ArmX = 8;
  ArmY = -34; 
  if Index == 1{ArmX+=1;ArmY-=1;}
  if Index == 2{ArmX+=2;ArmY-=2;}
  if Index == 3{ArmX+=3;ArmY-=1;}
  if Index == 4{ArmX+=1;ArmY-=1;}
  if Index == 6{ArmY-=1;}
  if Index == 7{ArmX+=1;ArmY-=2;}
  if Index == 8{ArmX+=2;ArmY-=2;}
  if Index == 9{ArmX+=1;ArmY-=1;}    
  ArmAngle = 45;  
 break;
 case sSRunRightDownAim:
 case sSDashRightDownAim:
  ArmVis = 1;
  ArmSprite = sSArmDown;
  ArmX = 6;
  ArmY = -21;
  if Index == 1{ArmX+=1;ArmY-=1;}
  if Index == 2{ArmX+=2;ArmY-=2;}
  if Index == 3{ArmX+=3;ArmY-=1;}
  if Index == 4{ArmX+=1;ArmY-=1;}
  if Index == 6{ArmY-=1;}
  if Index == 7{ArmX+=1;ArmY-=2;}
  if Index == 8{ArmX+=2;ArmY-=2;}
  if Index == 9{ArmX+=1;ArmY-=1;}    
  ArmAngle = 315;  
 break;
 
 case sSRunLeftAim:
 case sSDashLeftAim:
  ArmVis = 1;
  ArmSprite = sSArm;
  ArmX = -12;
  ArmY = -26; 
  if Index == 1{ArmX-=1;ArmY-=1;}
  if Index == 2{ArmX-=2;ArmY-=2;}
  if Index == 3{ArmX-=3;ArmY-=1;}
  if Index == 4{ArmX-=1;ArmY-=1;}
  if Index == 6{ArmY-=1;}
  if Index == 7{ArmX-=1;ArmY-=2;}
  if Index == 8{ArmX-=2;ArmY-=2;}
  if Index == 9{ArmX-=1;ArmY-=1;}    
  ArmAngle = 180;  
 break;
 case sSRunLeft:
 case sSDashLeft:
  ArmVis = 0;
  ArmSprite = sBlank;  
  if (Index + 5) mod 10 == 0{ArmX = -5;ArmY = 4;}
  if (Index + 5) mod 10 == 1{ArmX = -6;ArmY = 1;}
  if (Index + 5) mod 10 == 2{ArmX = -8;ArmY = -3;}
  if (Index + 5) mod 10 == 3{ArmX = -8;ArmY = -1;}
  if (Index + 5) mod 10 == 4{ArmX = -6;ArmY = 2;}
  if (Index + 5) mod 10 == 5{ArmX = -4;ArmY = 5;}
  if (Index + 5) mod 10 == 6{ArmX = 0;ArmY = 7;}
  if (Index + 5) mod 10== 7{ArmX = 6;ArmY = 9;}
  if (Index + 5) mod 10 == 8{ArmX = 2;ArmY = 11;}
  if (Index + 5) mod 10 == 9{ArmX = -2;ArmY = 7;} 
  ArmY -= 28;      
  ArmX -= 3;
  ArmAngle = 180;
 break;
 case sSRunLeftUpAim:
 case sSDashLeftUpAim:
  ArmVis = 1;
  ArmSprite = sSArmUp;
  ArmX = -8;
  ArmY = -34; 
  if Index == 1{ArmX-=1;ArmY-=1;}
  if Index == 2{ArmX-=2;ArmY-=2;}
  if Index == 3{ArmX-=3;ArmY-=1;}
  if Index == 4{ArmX-=1;ArmY-=1;}
  if Index == 6{ArmY-=1;}
  if Index == 7{ArmX-=1;ArmY-=2;}
  if Index == 8{ArmX-=2;ArmY-=2;}
  if Index == 9{ArmX-=1;ArmY-=1;}   
  ArmAngle = 135;  
 break;
 case sSRunLeftDownAim:
 case sSDashLeftDownAim:
  ArmVis = 1;
  ArmSprite = sSArmDown;
  ArmX = -6;
  ArmY = -21;
  if Index == 1{ArmX-=1;ArmY-=1;}
  if Index == 2{ArmX-=2;ArmY-=2;}
  if Index == 3{ArmX-=3;ArmY-=1;}
  if Index == 4{ArmX-=1;ArmY-=1;}
  if Index == 6{ArmY-=1;}
  if Index == 7{ArmX-=1;ArmY-=2;}
  if Index == 8{ArmX-=2;ArmY-=2;}
  if Index == 9{ArmX-=1;ArmY-=1;}     
  ArmAngle = 225;  
 break;
 
 // TURNING
 
 case sSTurnRightJumpDown:
  ArmSprite = sBlank;
  ArmVis = 0;
  ArmAngle = 270;
  ArmY=-6;
  if Index == 0{ArmX=-2;}
  if Index >= 1{ArmX=1;}  
 break;
 case sSTurnLeftJumpDown:
  ArmSprite = sBlank;
  ArmVis = 0;
  ArmAngle = 270;
  ArmY=-6;
  if Index == 0{ArmX=1;}
  if Index >= 1{ArmX=-2;}  
 break;
 
 // BALLS
 
 case sSMorphRight:
 case sSMorphLeft:
 case sSUnmorphRight:
 case sSUnmorphLeft:
 case sSBallRight:
 case sSBallLeft:
 case sSAirBallRight:
 case sSAirBallLeft:
 {
  ArmSprite = sBlank;
  ArmVis = 0;
  ArmAngle = (180*(Facing==-1));
  ArmX = 0;
  ArmY = -8; 
 }
 break; 
 
  // IDLE
  
 case sSIdle:
 {
  ArmVis = 0;
  ArmSprite = sBlank;
 
  ArmX = -8;
  ArmY = -14;
  
  ArmAngle = 270;
 }
 break;
 
  // IDLE up
  
 case sSIdleUp:
 {
  ArmVis = 0;
  ArmSprite = sBlank;
 
  ArmX = -8;
  ArmY = -15;
  
  if image_index >= 3
   ArmY = -13;
  
  ArmAngle = 270;
 }
 break;
 
  // IDLE up
  
 case sSIdleDown:
 {
  ArmVis = 0;
  ArmSprite = sBlank;
 
  ArmX = -8;
  ArmY = -13;

  ArmAngle = 270;
 }
 break;
 
 case sSIdleRight:
 {
  ArmVis = 0;
  ArmSprite = sBlank;
 
  ArmX = 4;
  ArmY = -20;
  
  ArmAngle = 0;
 }
 break;
 
 case sSIdleLeft:
 {
  ArmVis = 0;
  ArmSprite = sBlank;
 
  ArmX = -11;
  ArmY = -20;
  
  ArmAngle = 180;
 }
 break;
 
 // SHINE START/ BRAKING

 case sSBrakeRight:
 {
  ArmVis = 0;
  ArmSprite = sBlank;  
  if Index == 0{ArmX = -3;ArmY = -12;}
  if Index == 1{ArmX = 3;ArmY = -12;}
  if Index > 1{ArmX = 10;ArmY = -15;}    
  ArmAngle = 0;
 }
 break;
 
 case sSBrakeLeft:
 {
  ArmVis = 0;
  ArmSprite = sBlank;  
  if Index == 0{ArmX = 3-6;ArmY = -12;}
  if Index == 1{ArmX = -3-6;ArmY = -12;}
  if Index > 1{ArmX = -3-6;ArmY = -15;} 
  ArmAngle = 0;
 }
 break;
 
 case sSJumpStart:
 {
  ArmVis = 0;
  ArmSprite = sBlank;
  
  if Index == 0 or Index == 1
  {
   ArmX = 1;
   ArmY = -18;
  }
  if Index = 2 or Index == 3
  {
   ArmX = 1;
   ArmY = -17;
  } 
  if Index == 4 or Index == 5
  {
   ArmX = 1;
   ArmY = -18;
  }
  if Index == 6 or Index == 7
  {
   ArmX = 1;
   ArmY = -12;
  } 
  
  ArmAngle = 180*(Facing=LEFT);
 }
 break;
 
 // SHINE UP
 
 case sSJumpUpRight:
 {
  ArmVis = 0;
  ArmSprite = sBlank;
 
  if Index = 0
  {
   ArmX = -1;
   ArmY = -13;
  }
  if Index = 1
  {
   ArmX = 0;
   ArmY = -12;
  }
  if Index = 2
  {
   ArmX = -8;
   ArmY = -11;
  }
  if Index = 3
  {
   ArmX = -9;
   ArmY = -11;
  }
  if Index = 4
  {
   ArmX = -6;
   ArmY = -11;
  }
  if Index = 5
  {
   ArmX = 0;
   ArmY = -12;
  }
  if Index = 6
  {
   ArmX = 4;
   ArmY = -11;
  }
  if Index = 7
  {
   ArmX = 7;
   ArmY = -11;
  }
  if Index = 8
  {
   ArmX = 5;
   ArmY = -11;
  }
  
  ArmAngle = 270;
 }
 break;

 case sSJumpUpLeft:
 {
  ArmVis = 0;
  ArmSprite = sBlank;
 
  if Index = 0
  {
   ArmX = 1;
   ArmY = -13;
  }
  if Index = 1
  {
   ArmX = 0;
   ArmY = -12;
  }
  if Index = 2
  {
   ArmX = -8;
   ArmY = -11;
  }
  if Index = 3
  {
   ArmX = -9;
   ArmY = -11;
  }
  if Index = 4
  {
   ArmX = -6;
   ArmY = -11;
  }
  if Index = 5
  {
   ArmX = 0;
   ArmY = -12;
  }
  if Index = 6
  {
   ArmX = 4;
   ArmY = -11;
  }
  if Index = 7
  {
   ArmX = 7;
   ArmY = -11;
  }
  if Index = 8
  {
   ArmX = 5;
   ArmY = -11;
  }
  
  ArmAngle = 270;
 }
 break;
 
 // CLIMBING
 
 case sSClimbRight:
 {
  ArmVis = 0;
  ArmSprite = sBlank;
 
  if Index = 0
  {
   ArmX = 5;
   ArmY = 4;
  }
  if Index = 1
  {
   ArmX = 6;
   ArmY = 3;
  }
  if Index = 2
  {
   ArmX = 8;
   ArmY = 5;
  }
  if Index = 3
  {
   ArmX = 7;
   ArmY = 7;
  }
  if Index = 4
  {
   ArmX = 12;
   ArmY = -3;
  }
  if Index = 5
  {
   ArmX = 15;
   ArmY = -11;
  }
  if Index = 6
  {
   ArmX = 15;
   ArmY = -16;
  }
   ArmY -= 7;  
  ArmAngle = 0;
 }
 break;
 
 case sSClimbLeft:
 {
  ArmVis = 0;
  ArmSprite = sBlank;
 
  if Index = 0
  {
   ArmX = -5;
   ArmY = 4;
  }
  if Index = 1
  {
   ArmX = -6;
   ArmY = 3;
  }
  if Index = 2
  {
   ArmX = -8;
   ArmY = 5;
  }
  if Index = 3
  {
   ArmX = -7;
   ArmY = 7;
  }
  if Index = 4
  {
   ArmX = -12;
   ArmY = -3;
  }
  if Index = 5
  {
   ArmX = -15;
   ArmY = -11;
  }
  if Index = 6
  {
   ArmX = -15;
   ArmY = -16;
  }
   ArmY -= 7;
  ArmAngle = 180;
 }
 break;
 
 // SHINE RIGHT/LEFT
 
 case sSShineRight:
 {
  ArmVis = 0;
  ArmSprite = sBlank;  
  if Index == 0{ArmX = -7;ArmY = -19;}
  if Index == 1{ArmX = -13;ArmY = -22;}
  if Index == 2{ArmX = -1;ArmY = -21;}    
  if Index == 3{ArmX = 1;ArmY = -21;}     
  ArmAngle = 0;
 }
 break;
 case sSShineLeft:
 {
  ArmVis = 0;
  ArmSprite = sBlank;  
  if Index == 0{ArmX = -9;ArmY = -12;}
  if Index == 1{ArmX = -6;ArmY = -13;}
  if Index == 2{ArmX = -3;ArmY = -22;}    
  if Index == 3{ArmX = -5;ArmY = -22;}     
  ArmAngle = 180;
 }
 break;
 
 
 // GRIP
 case sSGripRight:
  ArmVis = 0;
  ArmSprite = sBlank;
  ArmX = -2;
  ArmY = -2;
  ArmAngle = 270;  
 break;
 case sSGripLeft:
  ArmVis = 0;
  ArmSprite = sBlank;
  ArmX = 2;
  ArmY = -2;
  ArmAngle = 270;  
 break;
 case sSGripTurnRight:
  ArmVis = 0;
  ArmSprite = sBlank;
  ArmX = -14;
  ArmY = -5;
  ArmAngle = 270;  
 break;
 case sSGripTurnLeft:
  ArmVis = 0;
  ArmSprite = sBlank;
  ArmX = 14;
  ArmY = -5;
  ArmAngle = 270;  
 break;
 case sSGripRightAim:
  ArmVis = 1;
  ArmSprite = sSArm;
  ArmX = -17;
  ArmY = -16;
  if FFrame[0]{ArmX++;}
  if FFrame[1]{ArmX++;}  
  ArmAngle = 180;  
 break;
 case sSGripLeftAim:
  ArmVis = 1;
  ArmSprite = sSArm;
  ArmX = 17;
  ArmY = -16;
  if FFrame[0]{ArmX--;}
  if FFrame[1]{ArmX--;}  
  ArmAngle = 0;  
 break; 
 case sSGripRightUpAim:
  ArmVis = 1;
  ArmSprite = sSArmUp;
  ArmX = -12;
  ArmY = -23;
  if FFrame[0]{ArmX++;ArmY++;}
  if FFrame[1]{ArmX++;}  
  ArmAngle = 135;  
 break;
 case sSGripLeftUpAim:
  ArmVis = 1;
  ArmSprite = sSArmUp;
  ArmX = 12;
  ArmY = -23;
  if FFrame[0]{ArmX--;ArmY++;}
  if FFrame[1]{ArmX--;}  
  ArmAngle = 45;  
 break;
 case sSGripRightDownAim:
  ArmVis = 1;
  ArmSprite = sSArmDown;
  ArmX = -11;
  ArmY = -11;
  if FFrame[0]{ArmX++;ArmY--;}
  if FFrame[1]{ArmX++;ArmY--;}  
  ArmAngle = 225;  
 break;
 case sSGripLeftDownAim:
  ArmVis = 1;
  ArmSprite = sSArmDown;
  ArmX = 11;
  ArmY = -11;
  if FFrame[0]{ArmX--;ArmY--;}
  if FFrame[1]{ArmX--;ArmY--;}  
  ArmAngle = 315;  
 break;

 case sSGripRightAimUp:
  ArmVis = 1;
  ArmSprite = sSArmUpUp;
  ArmX = -6;
  ArmY = -33;
  if FFrame[0]{ArmY++;}
  if FFrame[1]{ArmY++;} 
  ArmAngle = 90;  
 break;
 case sSGripLeftAimUp:
  ArmVis = 1;
  ArmSprite = sSArmUpUp;
  ArmX = 6;
  ArmY = -33;
  if FFrame[0]{ArmY++;}
  if FFrame[1]{ArmY++;}  
  ArmAngle = 90;  
 break;
 
 case sSGripRightDown:
  ArmVis = 1;
  ArmSprite = sSArmDownDown;
  ArmX = -4;
  ArmY = -3;
  if FFrame[0]{ArmY--;}
  if FFrame[1]{ArmY--;} 
  ArmAngle = 270;  
 break;
 case sSGripLeftDown:
  ArmVis = 1;
  ArmSprite = sSArmHang2;
  ArmX = 4;
  ArmY = -3;
  if FFrame[0]{ArmY--;ArmSprite = sSArmHang3;}
  if FFrame[1]{ArmY--;ArmSprite = sSArmHang4;}  
  ArmAngle = 270;  
 break;
 
 case sSHurtRight:
  ArmVis = 0;
  ArmSprite = sBlank;
  ArmX = 10;
  ArmY = -22;
  if Index >= 3
  && Index < 8
  {
   ArmX = 9;
   ArmY = -21;
  }
  ArmAngle = 0;  
 break;
 case sSHurtLeft:
  ArmVis = 0;
  ArmSprite = sBlank;
  ArmX = -10;
  ArmY = -22;
  if Index >= 3
  && Index < 8
  {
   ArmX = -9;
   ArmY = -21;
  }
  ArmAngle = 180;  
 break;
 
}












// TORSO TURNING


switch TorsoSprite
{
 case sSTurnTorso:
  ArmSprite = sBlank;
  ArmVis = 0;
  ArmAngle = (180*(Facing==-1));
  ArmY=TorsoY-26;
  if TIndex == 0{ArmX=TorsoX-9;}
  if TIndex == 1{ArmX=TorsoX+9;}  
 break;
 case sSTurnTorsoDownAim:
  ArmSprite = sBlank;
  ArmVis = 0;
  ArmAngle = (180*(Facing==-1));
  ArmY=TorsoY-15;
  if TIndex == 0{ArmX=TorsoX-7;}
  if TIndex == 1{ArmX=TorsoX+7;}  
 break;
 case sSTurnTorsoUpAim:
  ArmSprite = sBlank;
  ArmVis = 0;
  ArmAngle = (180*(Facing==-1));
  ArmY=TorsoY-39;
  if TIndex == 0{ArmX=TorsoX-7;}
  if TIndex == 1{ArmX=TorsoX+5;}  
 break;
 case sSTurnTorsoUp:
  ArmSprite = sBlank;
  ArmVis = 0;
  ArmAngle = 90;
  ArmY=TorsoY-42;
  if TIndex == 0{ArmX=TorsoX-2;}
  if TIndex == 1{ArmX=TorsoX+1;}  
 break;

 case sSTurnTorsoJump:
  ArmSprite = sBlank;
  ArmVis = 0;
  ArmAngle = (180*(Facing==-1));
  ArmY=TorsoY-24;
  if TIndex == 0{ArmX=TorsoX-8;}
  if TIndex == 1{ArmX=TorsoX+8;}  
 break;
 case sSTurnTorsoJumpDownAim:
  ArmSprite = sBlank;
  ArmVis = 0;
  ArmAngle = (180*(Facing==-1));
  ArmY=TorsoY-17;
  if TIndex == 0{ArmX=TorsoX-7;}
  if TIndex == 1{ArmX=TorsoX+7;}  
 break;
 case sSTurnTorsoJumpUpAim:
  ArmSprite = sBlank;
  ArmVis = 0;
  ArmAngle = (180*(Facing==-1));
  ArmY=TorsoY-41;
  if TIndex == 0{ArmX=TorsoX-7;}
  if TIndex == 1{ArmX=TorsoX+5;}  
 break;
 case sSTurnTorsoJumpUp:
  ArmSprite = sBlank;
  ArmVis = 0;
  ArmAngle = 90;
  ArmY=TorsoY-44;
  if TIndex == 0{ArmX=TorsoX-2;}
  if TIndex == 1{ArmX=TorsoX+1;}  
 break;

 // no aim +14 down, 11 down, 11 down

 case sSTurnTorsoCrouch:
  ArmSprite = sBlank;
  ArmVis = 0;
  ArmAngle = (180*(Facing==-1));
  ArmY=TorsoY-12;
  if TIndex == 0{ArmX=TorsoX-9;}
  if TIndex == 1{ArmX=TorsoX+9;}  
  ArmY -= 11;
 break;
 case sSTurnTorsoCrouchDownAim:
  ArmSprite = sBlank;
  ArmVis = 0;
  ArmAngle = (180*(Facing==-1));
  ArmY=TorsoY-4;
  if TIndex == 0{ArmX=TorsoX-7;}
  if TIndex == 1{ArmX=TorsoX+7;}  
  ArmY -= 11;
 break;
 case sSTurnTorsoCrouchUpAim:
  ArmSprite = sBlank;
  ArmVis = 0;
  ArmAngle = (180*(Facing==-1));
  ArmY=TorsoY-28;
  if TIndex == 0{ArmX=TorsoX-7;}
  if TIndex == 1{ArmX=TorsoX+5;}  
  ArmY -= 11;
 break;
}




if Dash >= DashTime
if State == RUNNING && !Turning
{
 ArmX += 2*Facing;
 ArmY += 2;
}

ArmFacing = Facing;
 
ChargeX = ArmX;
ChargeY = ArmY;

if ArmVis
{
 ChargeX += lengthdir_x(3,ArmAngle); 
 ChargeY += lengthdir_y(3,ArmAngle); 
 if ArmAngle == 225
 or ArmAngle == 315
 or ArmAngle == 135
 or ArmAngle == 45
 {
  ChargeX += lengthdir_x(3,ArmAngle); 
  ChargeY += lengthdir_y(3,ArmAngle);   
 }
}

ArmVis *= global.MainSelected;
