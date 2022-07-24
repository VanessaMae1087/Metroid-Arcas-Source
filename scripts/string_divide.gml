//argument 0 - string
//argument 1 - divider
//str_divided[] - results
var cstring, nextpos, i;
i = 0
cstring = argument0
for(jk=0;jk<15;jk++)
str_divided[jk] = "";
if cstring == "" then
{
  str_divided[i] = ""
  return i
}
while string_pos(argument1, cstring)
{
  if string_char_at(cstring,1) == '"' then
  {
    str_divided[i] = '"'
    cstring = string_delete(cstring, 1, 1)
    nextpos = string_pos('"', cstring)
    str_divided[i] += string_copy(cstring,1,nextpos)  
    cstring = string_delete(cstring, 1, nextpos+1)
  }
  else
  {  
    nextpos = string_pos(argument1, cstring)
    str_divided[i] = string_copy(cstring,1,nextpos-1)  
    cstring = string_delete(cstring, 1, nextpos)
  }
  i += 1
}
if string_length(cstring) then
{
  str_divided[i] = cstring
  i += 1
}
return i;
