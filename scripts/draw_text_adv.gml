// Arg 0: x
// Arg 1: y
// Arg 2: string
// Arg: A

var String = argument2;
var Length = string_length(String);

PosX = argument0;
PosY = argument1;

var Sprite = -1;
var Color = 0;

//@: Col 
//$: Spr

draw_set_font(global.FontMain);

for (i=1;i<=Length;i++)
{
 Char = string_char_at(String,i);
 
 if Char == "#"
 {
  PosX = argument0;
  PosY += 11;
 }
 else
 if Char == "@"
 {
  Color = real(string_char_at(String,i+1));
  i += 1;
 }
 else
 if Char == "$"
 {
  Sprite = real(string_char_at(String,i+1));
  if string_length(String) != i
  draw_sprite_ext(sFontSprite,Sprite,PosX,PosY,1,1,0,c_white,argument3);
  i += 2;
  PosX += global.FontLength[Sprite];
 }
 else
 {
  draw_sprite_ext(sFontMain,ord(Char)-32,PosX,PosY,1,1,0,global.FontColor[Color],argument3);
  if Char != " "
   PosX += real(string_char_at(global.FontSize,ord(Char)-31))-1;
   else
   PosX += 8;
 }
}

global.TEXTX = PosX;
global.TEXTY = PosY;
