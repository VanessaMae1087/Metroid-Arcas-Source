/// -- map_get_disc(world,x,y)

// 2 bits per disc...
// 16 worlds
// 256 bytes per world
// 0 0 0 0 0 0 0 0    ---- 32 disc values
// 0 0 0 0 0 0 0 0
// 0 0 0 0 0 0 0 0
// 0 0 0 0 0 0 0 0
// 0 0 0 0 0 0 0 0    
// 0 0 0 0 0 0 0 0
// 0 0 0 0 0 0 0 0
// 0 0 0 0 0 0 0 0    4x
// 0 0 0 0 0 0 0 0    4x

with (oControl)
{
 buffer_seek(oControl.DiscBuffer,buffer_seek_start,(argument0<<8)+(argument2<<3)+(argument1>>2));
 return (buffer_read(oControl.DiscBuffer,buffer_u8) & (global.U[argument1 % 4])) >> global.H[argument1 % 4];
}
