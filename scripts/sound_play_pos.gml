if global.SoundVol == 0 exit;

Xx = argument1;
Yy = argument2;
Zz = 0;
var Sound = argument0;

if audio_system() == audio_old_system
{
 sound_play(argument0);
}
else
{
 if !audio_emitter_exists(global.EmitterID[global.CurrentEmitter])
 global.EmitterID[global.CurrentEmitter] = audio_emitter_create();  
 
 Xx = 0;
 Yy = 0;
 
 audio_emitter_position(global.EmitterID[global.CurrentEmitter], Xx, Yy, Zz);
 audio_emitter_gain(global.EmitterID[global.CurrentEmitter], global.SoundVol);
 //audio_emitter_falloff(global.EmitterID[global.CurrentEmitter], 250, 500, 1);
 
 Pitch = 1;  
  
 audio_emitter_pitch(global.EmitterID[global.CurrentEmitter], Pitch);
                                               
 global.SoundID[global.CurrentSound] = audio_play_sound_on(global.EmitterID[global.CurrentEmitter], Sound, 0, global.CurrentSound);

 global.CurrentSound ++;
 if global.CurrentSound > 15
  global.CurrentSound = 0;
  
 global.CurrentEmitter ++;
 if global.CurrentEmitter > 15
  global.CurrentEmitter = 0; 
}
