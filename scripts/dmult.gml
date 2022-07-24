// Damage multiplier to Samus

Ret = 1;

if global.Suit == 3
 Ret *= 3; 
if global.Power[P_VSUIT]
 Ret *= .8;
if global.Power[P_GSUIT]
 Ret *= .8;
 
if global.Difficulty == 0
 Ret *= .75;
if global.Difficulty == 2
 Ret *= 2;
 
return Ret;
