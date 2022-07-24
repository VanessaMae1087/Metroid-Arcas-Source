/// -- map_set_disc(world,x,y,value)

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

with (oControl)
{
 buffer_seek(DiscBuffer,buffer_seek_start,(argument0<<8)+(argument2<<3)+(argument1>>2));
 
 var DiscByte = buffer_read(DiscBuffer,buffer_u8);
 buffer_seek(DiscBuffer,buffer_seek_relative,-1);
 
 var DiscBit = argument1 % 4;
 
 DiscByte &= global.N[DiscBit];
 DiscByte += (argument3<<(DiscBit<<1));
 
 buffer_write(DiscBuffer,buffer_u8, DiscByte);
}
