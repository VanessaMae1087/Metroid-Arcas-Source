voffset=-37;hoffset=7;hoffsetb=1

if State=BALL{voffset=-18;hoffset=7;hoffsetb=1}

if position_meeting(x+hoffsetb,y+voffset,oSolid)=0 and position_meeting(x+5,y+(voffset/2),oSolid)=0 and position_meeting(x+hoffset,y+voffset,oSolid)=1 
 return 1
else return 0
