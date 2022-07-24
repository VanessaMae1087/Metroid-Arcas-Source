var Grid = argument0;
var String = argument1;
var Len = string_divide(String,",");

cr = ds_list_create();
for (i = 0; i < Len; i+=3)
{
 ds_list_add(cr,str_divided[i] +  "," + str_divided[i+1] + "," + str_divided[i+2]);
}

var Width = ds_grid_width(argument0);
var Height = ds_grid_height(argument0);

for (var i = 0; i < ds_list_size(cr); i ++)
{
 string_divide_ext(ds_list_find_value(cr,i),",");
  xxx = real(str_divided2[0]);
  yyy = real(str_divided2[1]);
  mmm = real(str_divided2[2]);
 var Stringer = ds_grid_get(argument0,xxx,yyy);
 string_divide(string(Stringer),",");
 Str = "";
 for (ij=0;ij<=15;ij++)
 {
  if ij != 6
   Str += str_divided[ij]
   else
   Str += string(mmm);
  if ij < 15
   Str += ","
 }
 ds_grid_set(argument0,xxx,yyy,Str);
}


ds_list_destroy(cr);
