// compress(string)
return argument0
Str = argument0;
Str2 = "";
Entries = 0;

for (ii=1;ii<=string_length(Str);ii++)
{
 Char = string_char_at(Str,ii);
 Num = 0;
 Off = 1;
 Str3 = Char;
 
 do
 {Str3 += Char; Num ++; Off ++;}
 until
 string_char_at(Str,ii+Off) != Char

 if ii != 1
 Str2 += ","+string(Num)+","+Char; 
 else
 Str2 += string(Num)+","+Char; 

  
 ii += Num-1; 
 Entries += 1;
}

Str4 = string(Entries)+",";
Str5 = Str4 + Str2;
 
return Str5;
