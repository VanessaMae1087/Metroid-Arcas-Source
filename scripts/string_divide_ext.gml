//argument 0 - string
//argument 1 - divider
//str_divided[] - results
var cstring, nextpos, i1;
i1 = 0
cstring = argument0
str_divided2[15] = "";
if cstring == "" then
{
  str_divided2[i] = ""
  return i1
}
while string_pos(argument1, cstring)
{
  if string_char_at(cstring,1) == '"' then
  {
    str_divided2[i1] = '"'
    cstring = string_delete(cstring, 1, 1)
    nextpos = string_pos('"', cstring)
    str_divided2[i1] += string_copy(cstring,1,nextpos)  
    cstring = string_delete(cstring, 1, nextpos+1)
  }
  else
  {  
    nextpos = string_pos(argument1, cstring)
    str_divided2[i1] = string_copy(cstring,1,nextpos-1)  
    cstring = string_delete(cstring, 1, nextpos)
  }
  i1 += 1
}
if string_length(cstring) then
{
  str_divided2[i1] = cstring
  i1 += 1
}
return i1;
