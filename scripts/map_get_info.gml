/// map_get_info(Byte value, which value?)

switch (argument1)
{
 case 0: return ((argument0) >> 24); break;
 case 1: return ((argument0 & $FC0000) >> 18); break;
 case 2: return ((argument0 & global.D[0])) >> 15; break;
 case 3: return ((argument0 & global.D[1])) >> 12; break;
 case 4: return ((argument0 & global.D[2])) >> 9; break;
 case 5: return ((argument0 & global.D[3])) >> 6; break;
 case 6: return (argument0 & $3F); break;
}
