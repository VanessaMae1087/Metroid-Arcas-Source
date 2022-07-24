/// -- map_position();

global.RoomX = global.RBX[get_room_id(room)];
global.RoomY = global.RBY[get_room_id(room)];

global.WorldDiscovered[global.MapWorld] = 1;
