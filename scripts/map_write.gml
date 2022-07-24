var String = "";

for (var i=0;i<ds_grid_width(argument0);i++)
for (var j=0;j<ds_grid_height(argument0);j++)
{
 var Stringm = ds_grid_get(argument0,i,j);
 if string(Stringm) != "0"
 {
  string_divide(Stringm,",");

  if str_divided[6] != "0"
  {
   String += string(i) + ",";
   String += string(j) + ",";
   String += str_divided[6] + ",";
  }
 }
}

return String;
