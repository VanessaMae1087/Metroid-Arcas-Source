var String = "";

if ds_grid_width(argument0) < 10
String += "0";
String += string(ds_grid_width(argument0));
if ds_grid_height(argument0) < 10
String += "0";
String += string(ds_grid_height(argument0));


for (i=0;i<ds_grid_width(argument0);i++)
for (j=0;j<ds_grid_height(argument0);j++)
{
 String += string(ds_grid_get(argument0,i,j));
}

return String;
