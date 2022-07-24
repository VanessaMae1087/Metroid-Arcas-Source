// variable_begin(enable?);
// Used for enemies to record their positions
// All mapped variables go to Json for demos


// Mainly save object_index, image_index, sprite_index, x, y
// The rest is for custom enemies.

if argument0 == 1
{
 VarList = ds_list_create();
 Demo = 1;
}
else
Demo = 0;
