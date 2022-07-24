// Arg 0: x
// Arg 1: y
// Arg 2: string
// Arg 3: part or not

var String = argument2;
var Length = string_length(String);

PosX = argument0;
PosY = argument1;

var Sprite = -1;
var Color = 0;
var Number = 0;
string_divide(String,"#");

PosX -= round(text_width(str_divided[Number])/2)

//@: Col 
//$: Spr

draw_set_font(global.FontMain);

for (i=1;i<=Length;i++)
{
 Char = string_char_at(String,i);
 
 if Char == "#"
 {
  PosX = argument0 - round(text_width(str_divided[Number+1])/2);
  PosY += 11;
  Number += 1;
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
  if argument3 == 0  
   draw_sprite(sFontSprite,Sprite,PosX,PosY);
   else
  if argument3 == 1  
   draw_sprite_part(sFontSprite,Sprite,0,0,sprite_get_width(sFontSprite),8,PosX,PosY);
   else
  if argument3 == 2  
   draw_sprite_part(sFontSprite,Sprite,0,8,sprite_get_width(sFontSprite),6,PosX,PosY+8);
   else
  if argument3 == 3  
   draw_sprite_part(sFontSprite,Sprite,0,0,sprite_get_width(sFontSprite),6,PosX,PosY);
   else
  if argument3 == 4  
   draw_sprite_part(sFontSprite,Sprite,0,10,sprite_get_width(sFontSprite),6,PosX,PosY+8);
   
  i += 2;
  PosX += global.FontLength[Sprite];
 }
 else
 {
  if argument3 == 0
   draw_sprite_ext(sFontMainWhite,ord(Char)-32,PosX,PosY,1,1,0,global.FontColor[Color],1);
   else
  if argument3 == 1   
   draw_sprite_part_ext(sFontMainWhite,ord(Char)-32,0,0,8,8,PosX,PosY,1,1,global.FontColor[Color],1); 
   else
  if argument3 == 2   
   draw_sprite_ext(sFontMainWhite2,ord(Char)-32,PosX,PosY,1,1,0,global.FontColor[Color],1);
   else
  if argument3 == 3  
   draw_sprite_part_ext(sFontMainWhite,ord(Char)-32,0,0,8,6,PosX,PosY,1,1,global.FontColor[Color],1); 
   else
  if argument3 == 4   
   draw_sprite_ext(sFontMainWhite3,ord(Char)-32,PosX,PosY,1,1,0,global.FontColor[Color],1);   
     
  if Char != " "
   PosX += real(string_char_at(global.FontSize,ord(Char)-31))-1;
   else
   PosX += 8;
 }
}
