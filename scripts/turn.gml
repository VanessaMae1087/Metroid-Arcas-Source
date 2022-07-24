var dif; dif = ((argument1 - argument0) mod 360 - 540) mod 360 + 180;
return median(argument0 + dif, argument0 - argument2, argument0 + argument2);

/*
var dir; dir = point_direction(x, y, mouse_x, mouse_y);
image_angle = turn(image_angle, dir, 5);
