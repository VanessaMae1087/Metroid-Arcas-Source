// argument 0 world
// argument 1 x
// argument 2 y
// argument 3 ind

var String = ds_grid_get(global.Map[argument0],argument1,argument2);
string_divide(String,",");
var Str = "";
for (i=0;i<=15;i++)
{
 if i != 6
  Str += str_divided[i]
  else
  Str += string(argument3);
 if i < 15
  Str += ","
}
ds_grid_set(global.Map[argument0],argument1,argument2,Str);
