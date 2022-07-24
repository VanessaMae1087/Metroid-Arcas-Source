/// - log_refresh();
// Refreshes logbook surface

surface_set_target(LogSurface);
draw_clear_alpha(c_black,0);
draw_text_log(0,0,global.LogInfo[LogMenu,ds_list_find_value(global.Log[LogMenu],LogIndex[LogMenu])],1,200); 
surface_reset_target(); 
