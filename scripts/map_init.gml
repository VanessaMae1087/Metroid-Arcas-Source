// -- map_init(creates buffers)

MapBuffer = buffer_create(82432,buffer_fast,1);
DiscBuffer = buffer_create(4096, buffer_fast, 1);

// Load mapbuffer from file

NewFile = file_text_open_read("MapBuffer.buf");
BufferString = file_text_read_string(NewFile);
file_text_close(NewFile);

buffer_base64_decode_ext(MapBuffer,BufferString,0);

// Room X/Y's

for (i=4096;i>=0;i--)
{
 global.RBX[i] = 32;
 global.RBY[i] = 32; 
}

for (w=0;w<16;w++)
{
 global.WorldDiscovered[w] = 0;
 
 for (i=0;i<32;i++)
 for (j=0;j<32;j++)
 {
  buffer_seek(MapBuffer, buffer_seek_start, 512+(w<<10)+(w<<12)+((i+(j<<5))*5));  
  
  for (bb=0;bb<5 ;bb++)
  {
   Byte[bb] = buffer_read(MapBuffer,buffer_u8);
  }
   
  MainByte = (Byte[0]<<32)+(Byte[1]<<24)+(Byte[2]<<16)+(Byte[3]<<8)+Byte[4];  
   
  if MainByte != 0
  {
   ByteRoomID = map_get_info(MainByte,0);
   
   if i < global.RBX[ByteRoomID]
    global.RBX[ByteRoomID] = i;
   if j < global.RBY[ByteRoomID]
    global.RBY[ByteRoomID] = j;   
  }
 } 
}

// Spawn Point Coords

global.MapStartW = 0;
global.MapStartX = 10;
global.MapStartY = 9;

//////////////////////////////////////////

global.MapWorld = global.MapStartW;
global.MapX = global.MapStartX;
global.MapY = global.MapStartY;

global.WorldDiscovered[global.MapWorld] = 1;

map_position();
