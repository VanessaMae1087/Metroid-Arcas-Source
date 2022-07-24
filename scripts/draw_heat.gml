/// -- draw_heat();
// Draw heat effect in room

{
 draw_sprite_tiled_ext(sHeat,image_index,x,y,1,1,c_white,.25);
 draw_set_blend_mode(bm_add)
 draw_sprite_tiled_ext(sHeat,image_index,x,y,1,1,c_white,1);
 draw_set_blend_mode(bm_normal)
}
