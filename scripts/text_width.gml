// Arg 0: string

var Stringer = argument0;
var Lengther = string_length(Stringer);
var Width = 0;

//@: Col 
//$: Spr

draw_set_font(global.FontMain);

for (j=1;j<=Lengther;j++)
{
 Charer = string_char_at(Stringer,j);
 
 if Charer == "#"
 {
 }
 else
 if Charer == "@"
 {
  j += 1;
 }
 else
 if Charer == "$"
 {
  Sprite = real(string_char_at(Stringer,j+1));
  j += 2;
  Width += global.FontLength[Sprite];
 }
 else
 {
  if Charer != " "
   Width += real(string_char_at(global.FontSize,ord(Charer)-31))-1;
   else
   Width += 8;
 }
}

return Width;
