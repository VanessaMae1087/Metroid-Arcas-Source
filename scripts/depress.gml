// Format: # of segments, #ofa, a, #ofb, b, #ofc, c, etc.
return argument0
String = argument0;
string_divide(String,",");

Amount = real(str_divided[0]);
Return = "";

for (k=0;k<Amount;k++) 
 Return += string_repeat(str_divided[k*2 + 2], real(str_divided[k*2 + 1])); 

return Return;
