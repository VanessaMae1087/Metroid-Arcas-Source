var Grid = argument0;
var String = argument1;

var Width = real(string_char_at(String,1)+string_char_at(String,2));
var Height = real(string_char_at(String,3)+string_char_at(String,4));

ii = 0;

for (i=0;i<Width;i++)
for (j=0;j<Height;j++)
{
 ds_grid_set(argument0,i,j,real(string_char_at(String,ii+5)));
 ii ++;
}
