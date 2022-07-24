var Hide = sprite_get_height(sSubSamus);

if SuitAnim < Hide
 SuitAnim += 3; 
 else
 {
  SuitAlpha += .0333;
 }
 
if SuitAnim < Hide 
{
// draw_sprite_ext(sSubSamus,Suite,view_xview+view_wview/2,view_yview+view_hview/2,1,1,0,c_white,FinalAlpha[1]*max(0,1-(SuitAnim/40)));
 draw_sprite_ext(sSubSamus,newSuite,view_xview+view_wview/2,view_yview+view_hview/2,1,1,0,c_white,FinalAlpha[1]);

 //draw_sprite_part_ext(sSubSamus,Suite+4,0,0,sprite_get_width(sSubSamus),Hide-SuitAnim,view_xview+view_wview/2-sprite_get_width(sSubSamus)/2,view_yview+view_hview/2-Hide/2,1,1,c_white,FinalAlpha[1]*min(SuitAnim/30,1));
// draw_sprite_part_ext(sSubSamus,newSuite+4,0,Hide - SuitAnim,sprite_get_width(sSubSamus),SuitAnim,view_xview+view_wview/2-sprite_get_width(sSubSamus)/2,view_yview+view_hview/2-SuitAnim+Hide/2,1,1,c_white,FinalAlpha[1]);
// Sweet =1 ;
}
else
{
 draw_sprite_ext(sSubSamus,newSuite,view_xview+view_wview/2,view_yview+view_hview/2,1,1,0,c_white,FinalAlpha[1]);

 //Sweet -= 1/10;
// draw_sprite_ext(sSubSamus,newSuite,view_xview+view_wview/2,view_yview+view_hview/2,1,1,0,c_white,FinalAlpha[1]);
// draw_sprite_ext(sSubSamus,newSuite+4,view_xview+view_wview/2,view_yview+view_hview/2,1,1,0,c_white,FinalAlpha[1]*Sweet);
}

 
/* 
draw_sprite_ext(sSubSamus,Suite,view_xview+view_wview/2,view_yview+view_hview/2,1,1,0,c_white,FinalAlpha[1]*(1-SuitAlpha));

draw_sprite_ext(sSubSamus,newSuite,view_xview+view_wview/2,view_yview+view_hview/2,1,1,0,c_white,FinalAlpha[1]*SuitAlpha);
