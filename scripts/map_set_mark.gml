/// -- map_set_mark (world, x, y, value)

buffer_seek(oControl.MapBuffer, buffer_seek_start, 512+(argument0<<10)+(argument0<<12)+((argument1+(argument2<<5))*5));

for (bb=0;bb<5;bb++)
{
 Byte[bb] = buffer_read(oControl.MapBuffer,buffer_u8)
}
 
MainByte = (Byte[0]<<32)+(Byte[1]<<24)+(Byte[2]<<16)+(Byte[3]<<8)+Byte[4];  

for (i=0;i<7;i++)
{
 BI[i] = map_get_info(MainByte, i);
}
 
FinalByte = map_make_byte(BI[0],BI[1],BI[2],BI[3],BI[4],BI[5],argument3);

buffer_seek(oControl.MapBuffer, buffer_seek_start, 512+(argument0<<10)+(argument0<<12)+((argument1+(argument2<<5))*5));

for (i=0;i<5;i++)
 buffer_write(oControl.MapBuffer,buffer_u8,map_get_byte(FinalByte,i));
