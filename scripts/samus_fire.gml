// Charge

PBeamCurrent = global.Power[P_PBEAM];

if global.Suit == 3
 global.Power[P_PBEAM] = 0;
 
if State != BALL && State != SJSTART && State != HURT && State != SJEND && State != SUPERJUMP 
&& State != WALL && State != CLIMBING && State != IDLE && State != BRAKING && State != UNCRAWL && State != CRAWL
&& Unmorphing == 0 && Morphing == 0
{
 if global.KeyPushed[0,KEY_B] && CantCharge <= 0
 {
  ChargeIndex += 1;
  CTime ++;
  if ChargeIndex < 3 && !audio_is_playing(ChargeSound)
  {
   CType = 0;
   CTime = 0;
   Chg = sndCharge;
   Typ = sndCharge;
   if global.Power[P_LBEAM]
   {
    Chg = sndChargeLong;
    Typ = sndChargeLong;
   }   
   if global.Power[P_IBEAM]
   {
    Chg = sndChargeIce;
    Typ = sndChargeIce;
    if global.Power[P_LBEAM]
    {
     Chg = sndChargeIceLong;
     Typ = sndChargeIceLong;
    }   
   }
   
   if global.Power[P_WBEAM]
   {
    Chg = sndChargeWave;
    Typ = sndChargeWave;
    if global.Power[P_LBEAM]
    {
     Chg = sndChargeWaveLong;
     Typ = sndChargeWaveLong;
    }   
    if global.Power[P_IBEAM]
    {
     Chg = sndChargeIceWave;
     Typ = sndChargeIceWave;
     if global.Power[P_LBEAM]
     {
      Chg = sndChargeIceWaveLong;
      Typ = sndChargeIceWaveLong;
     }   
    }   
   }
   
   if global.Power[P_HBEAM]
   {
    Chg = sndChargePlasma;
    Typ = sndChargePlasma;
    if global.Power[P_LBEAM]
    {
     Chg = sndChargePlasmaLong;
     Typ = sndChargePlasmaLong;
    }   
    if global.Power[P_IBEAM]
    {
     Chg = sndChargePlasmaIce;
     Typ = sndChargePlasmaIce;
     if global.Power[P_LBEAM]
     {
      Chg = sndChargePlasmaIceLong;
      Typ = sndChargePlasmaIceLong;
     }   
    }  
    if global.Power[P_WBEAM]
    {
     Chg = sndChargePlasmaWave;
     Typ = sndChargePlasmaWave;
     if global.Power[P_LBEAM]
     {
      Chg = sndChargePlasmaWaveLong;
      Typ = sndChargePlasmaWaveLong;
     }   
     if global.Power[P_IBEAM]
     {
      Chg = sndChargePlasmaIce;
      Typ = sndChargePlasmaIce;
      if global.Power[P_LBEAM]
      {
       Chg = sndChargePlasmaIceLong;
       Typ = sndChargePlasmaIceLong;
      }   
     }   
    } 
   }
   
   if !global.Power[P_PBEAM]
   {
    Chg = sndCharge;
    Typ = sndCharge;
   }
   
   ChargeSound = audio_play_sound_on(ChargeEmitter,Chg,0,1);
   ChargeType = Typ;
  }
  if CType == 0 && ChargeIndex >= 46 && (CTime/60 >= audio_sound_length(ChargeSound)-2/60 or !audio_is_playing(ChargeSound))
  {
   Chg = sndCharged;
   Typ = sndCharge;
   if global.Power[P_LBEAM]
   {
    Chg = sndChargedLong;
    Typ = sndChargeLong;
   }
   if global.Power[P_IBEAM]
   {
    Chg = sndChargedIce;
    Typ = sndChargeIce;
    if global.Power[P_LBEAM]
    {
     Chg = sndChargedIceLong;
     Typ = sndChargeIceLong;
    }   
   }
   if global.Power[P_WBEAM]
   {
    Chg = sndChargedWave;
    Typ = sndChargeWave;
    if global.Power[P_LBEAM]
    {
     Chg = sndChargedWaveLong;
     Typ = sndChargeWaveLong;
    }   
    if global.Power[P_IBEAM]
    {
     Chg = sndChargedIceWave;
     Typ = sndChargeIceWave;
     if global.Power[P_LBEAM]
     {
      Chg = sndChargedIceWaveLong;
      Typ = sndChargeIceWaveLong;
     }   
    }   
   }
   
   if global.Power[P_HBEAM]
   {
    Chg = sndChargedPlasma;
    Typ = sndChargePlasma;
    if global.Power[P_LBEAM]
    {
     Chg = sndChargedPlasmaLong;
     Typ = sndChargePlasmaLong;
    }   
    if global.Power[P_IBEAM]
    {
     Chg = sndChargedPlasmaIce;
     Typ = sndChargePlasmaIce;
     if global.Power[P_LBEAM]
     {
      Chg = sndChargedPlasmaIceLong;
      Typ = sndChargePlasmaIceLong;
     }   
    }  
    if global.Power[P_WBEAM]
    {
     Chg = sndChargedPlasmaWave;
     Typ = sndChargePlasmaWave;
     if global.Power[P_LBEAM]
     {
      Chg = sndChargedPlasmaWaveLong;
      Typ = sndChargePlasmaWaveLong;
     }   
     if global.Power[P_IBEAM]
     {
      Chg = sndChargedPlasmaIce;
      Typ = sndChargePlasmaIce;
      if global.Power[P_LBEAM]
      {
       Chg = sndChargedPlasmaIceLong;
       Typ = sndChargePlasmaIceLong;
      }   
     }   
    } 
   }
   
   
   if !global.Power[P_PBEAM]
   {
    Chg = sndCharged;
    Typ = sndCharge;
   }
   audio_stop_sound(ChargeSound);  
   ChargeSound = audio_play_sound_on(ChargeEmitter,Chg,1,1);
   ChargeType = Typ;
   CType = 1;
  }
 }
}
else
{
 {
  if ChargeIndex > 0
   ChargeIndex += 1;
  CTime ++;
  if ChargeIndex < 3 && !audio_is_playing(ChargeSound)
  {
   CType = 0;
   CTime = 0;
   Chg = sndCharge;
   Typ = sndCharge;
   if global.Power[P_LBEAM]
   {
    Chg = sndChargeLong;
    Typ = sndChargeLong;
   }
   if global.Power[P_IBEAM]
   {
    Chg = sndChargeIce;
    Typ = sndChargeIce;
    if global.Power[P_LBEAM]
    {
     Chg = sndChargeIceLong;
     Typ = sndChargeIceLong;
    }   
   }
   if global.Power[P_WBEAM]
   {
    Chg = sndChargeWave;
    Typ = sndChargeWave;
    if global.Power[P_LBEAM]
    {
     Chg = sndChargeWaveLong;
     Typ = sndChargeWaveLong;
    }   
    if global.Power[P_IBEAM]
    {
     Chg = sndChargeIceWave;
     Typ = sndChargeIceWave;
     if global.Power[P_LBEAM]
     {
      Chg = sndChargeIceWaveLong;
      Typ = sndChargeIceWaveLong;
     }   
    }   
   }
   if global.Power[P_HBEAM]
   {
    Chg = sndChargePlasma;
    Typ = sndChargePlasma;
    if global.Power[P_LBEAM]
    {
     Chg = sndChargePlasmaLong;
     Typ = sndChargePlasmaLong;
    }   
    if global.Power[P_IBEAM]
    {
     Chg = sndChargePlasmaIce;
     Typ = sndChargePlasmaIce;
     if global.Power[P_LBEAM]
     {
      Chg = sndChargePlasmaIceLong;
      Typ = sndChargePlasmaIceLong;
     }   
    }  
    if global.Power[P_WBEAM]
    {
     Chg = sndChargePlasmaWave;
     Typ = sndChargePlasmaWave;
     if global.Power[P_LBEAM]
     {
      Chg = sndChargePlasmaWaveLong;
      Typ = sndChargePlasmaWaveLong;
     }   
     if global.Power[P_IBEAM]
     {
      Chg = sndChargePlasmaIce;
      Typ = sndChargePlasmaIce;
      if global.Power[P_LBEAM]
      {
       Chg = sndChargePlasmaIceLong;
       Typ = sndChargePlasmaIceLong;
      }   
     }   
    } 
   }
   
   
   if !global.Power[P_PBEAM]
   {
    Chg = sndCharge;
    Typ = sndCharge;
   }
   
   ChargeSound = audio_play_sound_on(ChargeEmitter,Chg,0,1);
   ChargeType = Typ;
  }
  if CType == 0 && ChargeIndex >= 46 && (CTime/60 >= audio_sound_length(ChargeSound)-2/60 or !audio_is_playing(ChargeSound))
  {
   CType = 1;
   audio_stop_sound(ChargeSound);  
   Chg = sndCharged;
   Typ = sndCharge;
   if global.Power[P_LBEAM]
   {
    Chg = sndChargedLong;
    Typ = sndChargeLong;
   }
   if global.Power[P_IBEAM]
   {
    Chg = sndChargedIce;
    Typ = sndChargeIce;
    if global.Power[P_LBEAM]
    {
     Chg = sndChargedIceLong;
     Typ = sndChargeIceLong;
    }   
   }
   if global.Power[P_WBEAM]
   {
    Chg = sndChargedWave;
    Typ = sndChargeWave;
    if global.Power[P_LBEAM]
    {
     Chg = sndChargedWaveLong;
     Typ = sndChargeWaveLong;
    }   
    if global.Power[P_IBEAM]
    {
     Chg = sndChargedIceWave;
     Typ = sndChargeIceWave;
     if global.Power[P_LBEAM]
     {
      Chg = sndChargedIceWaveLong;
      Typ = sndChargeIceWaveLong;
     }   
    }   
   }
   
   if global.Power[P_HBEAM]
   {
    Chg = sndChargedPlasma;
    Typ = sndChargePlasma;
    if global.Power[P_LBEAM]
    {
     Chg = sndChargedPlasmaLong;
     Typ = sndChargePlasmaLong;
    }   
    if global.Power[P_IBEAM]
    {
     Chg = sndChargedPlasmaIce;
     Typ = sndChargePlasmaIce;
     if global.Power[P_LBEAM]
     {
      Chg = sndChargedPlasmaIceLong;
      Typ = sndChargePlasmaIceLong;
     }   
    }  
    if global.Power[P_WBEAM]
    {
     Chg = sndChargedPlasmaWave;
     Typ = sndChargePlasmaWave;
     if global.Power[P_LBEAM]
     {
      Chg = sndChargedPlasmaWaveLong;
      Typ = sndChargePlasmaWaveLong;
     }   
     if global.Power[P_IBEAM]
     {
      Chg = sndChargedPlasmaIce;
      Typ = sndChargePlasmaIce;
      if global.Power[P_LBEAM]
      {
       Chg = sndChargedPlasmaIceLong;
       Typ = sndChargePlasmaIceLong;
      }   
     }   
    } 
   }
   
   
   if !global.Power[P_PBEAM]
   {
    Chg = sndCharged;
    Typ = sndCharge;
   }
   ChargeSound = audio_play_sound_on(ChargeEmitter,Chg,1,1);
   ChargeType = Typ;
  }
 }
}

if ChargeIndex > 50
 ChargeIndex = 47;
 
if (global.Power[P_CBEAM] == 0 && ChargeIndex > 0) or global.Suit == 3
 ChargeIndex = 0;
 
if global.MainSelected
if ChargeIndex > 0
{
 CantCharge = 16;
 ChargeIndex = 0;
}

TargetType = sndCharge;
ChargeSprite = sCharge;

if global.Power[P_LBEAM]
{
 TargetType = sndChargeLong;
 ChargeSprite = sChargeLong;
}
if global.Power[P_IBEAM]
{
 TargetType = sndChargeIce;
 ChargeSprite = sChargeIce;
 if global.Power[P_LBEAM]
 {
  TargetType = sndChargeIceLong;
 }
}

if global.Power[P_WBEAM]
{
 TargetType = sndChargeWave;
 ChargeSprite = sChargeWave;
 if global.Power[P_LBEAM]
 {
  TargetType = sndChargeWaveLong;
 }
 if global.Power[P_IBEAM]
 {
  TargetType = sndChargeIceWave;
  ChargeSprite = sChargeIce;
  if global.Power[P_LBEAM]
  {
   TargetType = sndChargeIceWaveLong;
  }
 }
}

if global.Power[P_HBEAM]
{
 TargetType = sndChargePlasma;
 ChargeSprite = sChargePlasma;
 if global.Power[P_LBEAM]
 {
  TargetType = sndChargePlasmaLong;
 }

 if global.Power[P_IBEAM]
 {
  TargetType = sndChargePlasmaIce;
  ChargeSprite = sChargeIce;
  if global.Power[P_LBEAM]
  {
   TargetType = sndChargePlasmaIceLong;
  }
 }
 
 if global.Power[P_WBEAM]
 {
  TargetType = sndChargePlasmaWave;
  ChargeSprite = sChargePlasma;
  if global.Power[P_LBEAM]
  {
   TargetType = sndChargePlasmaWaveLong;
  }
  if global.Power[P_IBEAM]
  {
   TargetType = sndChargePlasmaIce;
   ChargeSprite = sChargeIce;
   if global.Power[P_LBEAM]
   {
    TargetType = sndChargePlasmaIceLong;
   }
  }
 }
}

if !global.Power[P_PBEAM]
{
 TargetType = sndCharge;
 ChargeSprite = sChargePistol;
}

if ChargeIndex == 0 or TargetType != ChargeType
{
 audio_stop_sound(ChargeSound);
}
else
Aiming = 1;

Inst = instance_number(oBeam)+instance_number(oMissile);

if ((global.KeyPressed[0,KEY_B]) && CantFire == 0 && Firing == 0 && !(global.MainSelected && ((global.MainSelect==0 && global.Missiles<=0) or (global.MainSelect==1 && global.SMissiles<=0)))) or (ChargeIndex > 0 && ChargeIndex < 47 && (!global.KeyPushed[0,KEY_B] or State == BALL))
if !(State == BALL && ChargeIndex == 0) && State != SJSTART && State != HURT && State != SJEND && State != SUPERJUMP 
&& State != WALL && State != CLIMBING && State != IDLE && State != BRAKING && Inst < 4 && State != CRAWL && State != UNCRAWL
&& Unmorphing == 0 && Morphing == 0
{
 AimDirection = AimTarget;
 ChargeIndex = 0;
 audio_stop_sound(ChargeSound);
// if /*global.Power[P_PBEAM] or */global.MainSelected 
  Firing = 1;
 if Turning Turning = 0;
 if Landing Landing = 0;
 if State == GRIP Facing = TrueFacing*-1;
 Aiming = 1;
 CantFire = 8;
 CantCharge = 16;
 
 if /*global.Power[P_PBEAM] &&*/ !global.MainSelected
  BeamFade = 4;
 
 sprite_control();
 
 if Spinning
 {
  Spinning = 0;
  xVel = 0;
  yVel = 0;
  sprite_control();
  set_collision(0,-7,-31,8,0);
  mask_index = sMask; 
  
  while collision_top(0,0) y++;
 }
 
 
 if /*global.Power[P_PBEAM] && */!global.MainSelected
 { 
  Beam = instance_create(x + ChargeX,y + ChargeY,oBeam);
  Beam.direction = ArmAngle;
  Beam.image_angle = ArmAngle;

  Beam.Speed = ((global.Power[P_HBEAM] or global.Power[P_WBEAM]) && global.Power[P_PBEAM])*3 + 5;
  Beam.IBeam = global.Power[P_IBEAM]
  Beam.WBeam = global.Power[P_WBEAM]
  Beam.PBeam =  global.Power[P_HBEAM]
  Beam.LBeam = global.Power[P_LBEAM]
  Beam.CBeam = global.Power[P_CBEAM]
  Beam.PowerBeam = global.Power[P_PBEAM];
  if !global.Power[P_PBEAM]
  {
   Beam.IBeam = 0
   Beam.WBeam = 0
   Beam.PBeam = 0
   Beam.CBeam = 0
  }
  
  Beam.Charged = 0;  
  Beam.Damage = 1;
  
  Snd = sndBeam;
  Beam.TrailSprite = sBeamTrail;
  Beam.sprite_index = sBeam;
  if global.Power[P_LBEAM]
  {
   Snd = sndBeamLong;
   Beam.TrailSprite = sBeamTrailLong;
   Beam.sprite_index = sBeamLong;
  }
  
  if global.Power[P_IBEAM]
  {
   Snd = sndBeamIce;
   Beam.TrailSprite = sBeamTrailIce;
   Beam.sprite_index = sBeamIce;
   if global.Power[P_LBEAM]
   {
    Snd = sndBeamIceLong;
    Beam.TrailSprite = sBeamTrailIce;
    Beam.sprite_index = sBeamIce;
   }
  }
  
  if global.Power[P_WBEAM]
  {
   Snd = sndBeamWave;
   Beam.TrailSprite = sBeamTrailWaveCharged;
   Beam.sprite_index = sBeamWave;
   if global.Power[P_LBEAM]
   {
    Snd = sndBeamWaveLong;
    Beam.TrailSprite = sBeamTrailWaveCharged;
    Beam.sprite_index = sBeamWave;
   }
   
   if global.Power[P_IBEAM]
   {
    Snd = sndBeamIceWave;
    Beam.TrailSprite = sBeamTrailIce;
    Beam.sprite_index = sBeamIceWave;
    if global.Power[P_LBEAM]
    {
     Snd = sndBeamIceWaveLong;
     Beam.TrailSprite = sBeamTrailIce;
     Beam.sprite_index = sBeamIceWave;
    }      
   }
  }  
  
  if global.Power[P_HBEAM]
  {
   Snd = sndBeamPlasma;
   Beam.TrailSprite = sBeamTrailPlasmaCharged;
   Beam.sprite_index = sBeamPlasma;
   if global.Power[P_LBEAM]
   {
    Snd = sndBeamPlasmaLong;
    Beam.TrailSprite = sBeamTrailPlasmaCharged;
    Beam.sprite_index = sBeamPlasma;
   }
   
   if global.Power[P_IBEAM]
   {
    Snd = sndBeamPlasmaIce;
    Beam.TrailSprite = sBeamTrailIce;
    Beam.sprite_index = sBeamPlasmaIce;
    if global.Power[P_LBEAM]
    {
    Snd = sndBeamPlasmaIceLong;
    Beam.TrailSprite = sBeamTrailIce;
    Beam.sprite_index = sBeamPlasmaIce;
    }      
   }
   
   if global.Power[P_WBEAM]
   {
    Snd = sndBeamPlasmaWave;
    Beam.TrailSprite = sBeamTrailPlasmaCharged;
    Beam.sprite_index = sBeamPlasmaWave;
    if global.Power[P_LBEAM]
    {
     Snd = sndBeamPlasmaWaveLong;
     Beam.TrailSprite = sBeamTrailPlasmaCharged;
     Beam.sprite_index = sBeamPlasmaWave;
    }
    
    if global.Power[P_IBEAM]
    {
     Snd = sndBeamPlasmaWaveIce;
     Beam.TrailSprite = sBeamTrailIce;
     Beam.sprite_index = sBeamPlasmaWaveIce;
     if global.Power[P_LBEAM]
     {
     Snd = sndBeamPlasmaWaveIceLong;
     Beam.TrailSprite = sBeamTrailIce;
     Beam.sprite_index = sBeamPlasmaWaveIce;
     }      
    }
   }     
  }  
  
  if !global.Power[P_PBEAM]
  {
   Snd = sndBeamPistol;
   Beam.TrailSprite = sBeamPistolDie;
   Beam.sprite_index = sBeamPistol;
  }
  
  if global.Suit == 3
  {
   Beam.Charged = (global.PistolCharge == 1);
   if Beam.Charged
   {
    Snd = sndBeamPistolCharged;
    Beam.TrailSprite = sBeamPistolDie;
    Beam.sprite_index = sBeamPistolCharged;   
    Beam.Damage = 5;
   }
  }
  
  global.PistolCharge = 0;

   
  audio_stop_sound(BeamSound);
  BeamSound = audio_play_sound_on(ChargeEmitter,Snd,0,1);
  
  BeamFlash = instance_create(x + ChargeX,y + ChargeY,oFXBeam);
  
  BeamFlash.image_index = 0;
 
  if global.Power[P_LBEAM]
   BeamFlash.image_index = 3;
  if global.Power[P_WBEAM]
   BeamFlash.image_index = 12;
  if global.Power[P_HBEAM]
   BeamFlash.image_index = 9;
  if global.Power[P_IBEAM]
   BeamFlash.image_index = 6;
  if !global.Power[P_PBEAM]
   BeamFlash.image_index = 15;
   
  BeamFlash.Ind = BeamFlash.image_index;  
  BeamFlash.image_angle = ArmAngle; 
 }
 else
 if global.MainSelected
 {
  Beam = instance_create(x + ChargeX,y + ChargeY,oMissile);
  Beam.direction = ArmAngle;
  Beam.image_angle = ArmAngle;
  Beam.Speed = 2;
  Beam.Damage = 5;
  Beam.Super = (global.MainSelect==1);
  if Beam.Super 
  {
   Beam.sprite_index = sSMissile;
   Beam.Damage = 25;
  }
  
  if global.MainSelect == 0
   global.Missiles --;
   else
   global.SMissiles --;
   
  CantFire = 11;
 }
/*else
 if !global.Power[P_PBEAM]
 {
  d = instance_create(x+ChargeX,y+ChargeY,oFXAnim);
  d. sprite_index = sMissileSmoke;
  d. image_speed = 0.5;
  d. gravity_direction = 90;   
  d.depth=depth-1;
 }      */
}





// chrged

if (ChargeIndex > 46 && (!global.KeyPushed[0,KEY_B] or State == BALL))
if !(State == BALL && ChargeIndex == 0) && State != SJSTART && State != HURT && State != SJEND && State != SUPERJUMP 
&& State != WALL && State != CLIMBING && State != IDLE && State != BRAKING && State != CRAWL && State != UNCRAWL
{
 AimDirection = AimTarget;
 ChargeIndex = 0;
 audio_stop_sound(ChargeSound);
// if global.Power[P_PBEAM]  
  Firing = 1;
 if Turning Turning = 0;
 if Landing Landing = 0;
 if State == GRIP Facing = TrueFacing*-1;
 Aiming = 1;
 CantFire = 8;
 CantCharge = 16;
 
// if global.Power[P_PBEAM] 
  BeamFade = 4;
 
 sprite_control();
 
 if Spinning
 {
  Spinning = 0;
  xVel = 0;
  yVel = 0;
  sprite_control();
  set_collision(0,-7,-31,8,0);
  mask_index = sMask; 
  
  while collision_top(0,0) y++;
 }

// if global.Power[P_PBEAM]
 {
  Beam = instance_create(x + ChargeX,y + ChargeY,oBeam);
  Beam.direction = ArmAngle;
  Beam.image_angle = ArmAngle;
  Beam.Speed = ((global.Power[P_HBEAM] or global.Power[P_WBEAM]) && global.Power[P_PBEAM])*3 + 5;
  Beam.IBeam = global.Power[P_IBEAM]
  Beam.WBeam = global.Power[P_WBEAM]
  Beam.PBeam =  global.Power[P_HBEAM]
  Beam.LBeam = global.Power[P_LBEAM]
  Beam.CBeam = global.Power[P_CBEAM]
  Beam.PowerBeam = global.Power[P_PBEAM];
  if !global.Power[P_PBEAM]
  {
   Beam.IBeam = 0
   Beam.WBeam = 0
   Beam.PBeam = 0
   Beam.CBeam = 0
  }

  Beam.Charged = 1;
  Beam.Damage = 5;
  
  Snd = sndBeamCharged;
  Beam.TrailSprite = sBeamTrail;
  Beam.sprite_index = sBeamCharged;
  if global.Power[P_LBEAM]
  {
   Snd = sndBeamLongCharged;
   Beam.TrailSprite = sBeamTrailLong;
   Beam.sprite_index = sBeamLongCharged;
  }
  if global.Power[P_IBEAM]
  {
   Snd = sndBeamIceCharged;
   Beam.TrailSprite = sBeamTrailIceCharged;
   Beam.sprite_index = sBeamIceCharged;
   if global.Power[P_LBEAM]
   {
    Snd = sndBeamIceLongCharged;
    Beam.TrailSprite = sBeamTrailIceCharged;
    Beam.sprite_index = sBeamIceCharged;
   }
  }
  if global.Power[P_WBEAM]
  {
   Snd = sndBeamWaveCharged;
   Beam.TrailSprite = sBeamTrailWaveCharged;
   Beam.sprite_index = sBeamWaveCharged;
   if global.Power[P_LBEAM]
   {
    Snd = sndBeamWaveLongCharged;
    Beam.TrailSprite = sBeamTrailWaveCharged;
    Beam.sprite_index = sBeamWaveCharged;
   }
   
   if global.Power[P_IBEAM]
   {
    Snd = sndBeamIceWaveCharged;
    Beam.TrailSprite = sBeamTrailIceCharged;
    Beam.sprite_index = sBeamIceWaveCharged;
    if global.Power[P_LBEAM]
    {
     Snd = sndBeamIceWaveLongCharged;
     Beam.TrailSprite = sBeamTrailIceCharged;
     Beam.sprite_index = sBeamIceWaveCharged;
    }      
   }
  }
  if global.Power[P_HBEAM]
  {
   Snd = sndBeamPlasmaCharged;
   Beam.TrailSprite = sBeamTrailPlasmaCharged;
   Beam.sprite_index = sBeamPlasmaCharged;
   if global.Power[P_LBEAM]
   {
    Snd = sndBeamPlasmaLongCharged;
    Beam.TrailSprite = sBeamTrailPlasmaCharged;
    Beam.sprite_index = sBeamPlasmaCharged;
   }
   
   if global.Power[P_IBEAM]
   {
    Snd = sndBeamPlasmaIceCharged;
    Beam.TrailSprite = sBeamTrailIceCharged;
    Beam.sprite_index = sBeamPlasmaIceCharged;
    if global.Power[P_LBEAM]
    {
    Snd = sndBeamPlasmaIceLongCharged;
    Beam.TrailSprite = sBeamTrailIceCharged;
    Beam.sprite_index = sBeamPlasmaIceCharged;
    }      
   }
   
   if global.Power[P_WBEAM]
   {
    Snd = sndBeamPlasmaWaveCharged;
    Beam.TrailSprite = sBeamTrailPlasmaCharged;
    Beam.sprite_index = sBeamPlasmaWaveCharged;
    if global.Power[P_LBEAM]
    {
     Snd = sndBeamPlasmaWaveLongCharged;
     Beam.TrailSprite = sBeamTrailPlasmaCharged;
     Beam.sprite_index = sBeamPlasmaWaveCharged;
    }
    
    if global.Power[P_IBEAM]
    {
     Snd = sndBeamPlasmaWaveIceCharged;
     Beam.TrailSprite = sBeamTrailIceCharged;
     Beam.sprite_index = sBeamPlasmaWaveIceCharged;
     if global.Power[P_LBEAM]
     {
     Snd = sndBeamPlasmaWaveIceLongCharged;
     Beam.TrailSprite = sBeamTrailIceCharged;
     Beam.sprite_index = sBeamPlasmaWaveIceCharged;
     }      
    }
   }  
  }  
  
  if !global.Power[P_PBEAM]
  {
   Snd = sndBeamPistolCharged;
   Beam.TrailSprite = sBeamPistolDie;
   Beam.sprite_index = sBeamPistolCharged;
  }

  audio_stop_sound(BeamSound);
  BeamSound = audio_play_sound_on(ChargeEmitter,Snd,0,1);
  
  BeamFlash = instance_create(x + ChargeX,y + ChargeY,oFXBeam);
  
  BeamFlash.image_index = 0;
 
  if global.Power[P_LBEAM]
   BeamFlash.image_index = 3;
  if global.Power[P_WBEAM]
   BeamFlash.image_index = 12;
  if global.Power[P_HBEAM]
   BeamFlash.image_index = 9;
  if global.Power[P_IBEAM]
   BeamFlash.image_index = 6;
  if !global.Power[P_PBEAM]
   BeamFlash.image_index = 15;
   
  BeamFlash.Ind = BeamFlash.image_index;  
  BeamFlash.image_angle = ArmAngle; 
  
 }
/* else
 if !global.Power[P_PBEAM]
 {
  d = instance_create(x+ChargeX,y+ChargeY,oFXAnim);
  d. sprite_index = sMissileSmoke;
  d. image_speed = 0.5;
  d. gravity_direction = 90;   
  d.depth=depth-1;
 }  */
}

// BOMBS

if global.MainSelected == 0
if State == BALL && global.KeyPressed[0,KEY_B] && instance_number(oBomb) < 3 && !CanBomb && global.Power[P_BOMB]
{
 instance_create(x,y-5,oBomb);
 CanBomb = 4;
}

global.Power[P_PBEAM] = PBeamCurrent;
