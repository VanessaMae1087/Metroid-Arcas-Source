switch(argument0)
{
    case $00: { return "<none>"; } //none
    case $01: { return "LBUTTON"; } //Left mouse button
    case $02: { return "RBUTTON"; } //Right mouse button
    case $03: { return "CANCEL"; } //Control-break processing
    case $04: { return "MBUTTON"; } //Middle mouse button (three-button mouse: { return ""; } //
    case $05: { return "XBUTTON1"; } //Windows 2000/XP: { return ""; } X1 mouse button
    case $06: { return "XBUTTON2"; } //Windows 2000/XP: { return ""; } X2 mouse button
    case $08: { return "BACK"; } //BACKSPACE key
    case $09: { return "TAB"; } //TAB key
    case $0C: { return "CLEAR"; } //CLEAR key
    case $0D: { return "RETURN"; } //ENTER key
    case $10: { return "SHIFT"; } //SHIFT key
    case $11: { return "CONTROL"; } //CTRL key
    case $12: { return "MENU"; } //ALT key
    case $13: { return "PAUSE"; } //PAUSE key
    case $14: { return "CAPITAL"; } //CAPS LOCK key
    case $15: { return "HANGUL"; } //IME Hangul mode
    case $17: { return "JUNJA"; } //IME Junja mode
    case $18: { return "FINAL"; } //IME final mode
    case $19: { return "HANJA"; } //IME Hanja mode
    case $1B: { return "ESCAPE"; } //ESC key
    case $1C: { return "CONVERT"; } //IME convert
    case $1D: { return "NONCONVERT"; } //IME nonconvert
    case $1E: { return "ACCEPT"; } //IME accept
    case $1F: { return "MODECHANGE"; } //IME mode change request
    case $20: { return "SPACE"; } //SPACEBAR
    case $21: { return "PRIOR"; } //PAGE UP key
    case $22: { return "NEXT"; } //PAGE DOWN key
    case $23: { return "END"; } //END key
    case $24: { return "HOME"; } //HOME key
    case $25: { return "LEFT"; } //LEFT ARROW key
    case $26: { return "UP"; } //UP ARROW key
    case $27: { return "RIGHT"; } //RIGHT ARROW key
    case $28: { return "DOWN"; } //DOWN ARROW key
    case $29: { return "SELECT"; } //SELECT key
    case $2A: { return "PRINT"; } //PRINT key
    case $2B: { return "EXECUTE"; } //EXECUTE key
    case $2C: { return "SNAPSHOT"; } //PRINT SCREEN key
    case $2D: { return "INSERT"; } //INS key
    case $2E: { return "DELETE"; } //DEL key
    case $2F: { return "HELP"; } //HELP key
    case $30: { return "0"; } //0 key
    case $31: { return "1"; } //1 key
    case $32: { return "2"; } //2 key
    case $33: { return "3"; } //3 key
    case $34: { return "4"; } //4 key
    case $35: { return "5"; } //5 key
    case $36: { return "6"; } //6 key
    case $37: { return "7"; } //7 key
    case $38: { return "8"; } //8 key
    case $39: { return "9"; } //9 key
    case $41: { return "A"; } //A key
    case $42: { return "B"; } //B key
    case $43: { return "C"; } //C key
    case $44: { return "D"; } //D key
    case $45: { return "E"; } //E key
    case $46: { return "F"; } //F key
    case $47: { return "G"; } //G key
    case $48: { return "H"; } //H key
    case $49: { return "I"; } //I key
    case $4A: { return "J"; } //J key
    case $4B: { return "K"; } //K key
    case $4C: { return "L"; } //L key
    case $4D: { return "M"; } //M key
    case $4E: { return "N"; } //N key
    case $4F: { return "O"; } //O key
    case $50: { return "P"; } //P key
    case $51: { return "Q"; } //Q key
    case $52: { return "R"; } //R key
    case $53: { return "S"; } //S key
    case $54: { return "T"; } //T key
    case $55: { return "U"; } //U key
    case $56: { return "V"; } //V key
    case $57: { return "W"; } //W key
    case $58: { return "X"; } //X key
    case $59: { return "Y"; } //Y key
    case $5A: { return "Z"; } //Z key
    case $5B: { return "LWIN"; } //Left Windows key (Microsoft Natural keyboard: { return ""; } 
    case $5C: { return "RWIN"; } //Right Windows key (Natural keyboard: { return ""; } //
    case $5D: { return "APPS"; } //Applications key (Natural keyboard: { return ""; } //
    case $5F: { return "SLEEP"; } //Computer Sleep key
    case $60: { return "NUMPAD0"; } //Numeric keypad 0 key
    case $61: { return "NUMPAD1"; } //Numeric keypad 1 key
    case $62: { return "NUMPAD2"; } //Numeric keypad 2 key
    case $63: { return "NUMPAD3"; } //Numeric keypad 3 key
    case $64: { return "NUMPAD4"; } //Numeric keypad 4 key
    case $65: { return "NUMPAD5"; } //Numeric keypad 5 key
    case $66: { return "NUMPAD6"; } //Numeric keypad 6 key
    case $67: { return "NUMPAD7"; } //Numeric keypad 7 key
    case $68: { return "NUMPAD8"; } //Numeric keypad 8 key
    case $69: { return "NUMPAD9"; } //Numeric keypad 9 key
    case $6A: { return "MULTIPLY"; } //Multiply key
    case $6B: { return "ADD"; } //Add key
    case $6C: { return "SEPARATOR"; } //Separator key
    case $6D: { return "SUBTRACT"; } //Subtract key
    case $6E: { return "DECIMAL"; } //Decimal key
    case $6F: { return "DIVIDE"; } //Divide key
    case $70: { return "F1"; } //F1 key
    case $71: { return "F2"; } //F2 key
    case $72: { return "F3"; } //F3 key
    case $73: { return "F4"; } //F4 key
    case $74: { return "F5"; } //F5 key
    case $75: { return "F6"; } //F6 key
    case $76: { return "F7"; } //F7 key
    case $77: { return "F8"; } //F8 key
    case $78: { return "F9"; } //F9 key
    case $79: { return "F10"; } //F10 key
    case $7A: { return "F11"; } //F11 key
    case $7B: { return "F12"; } //F12 key
    case $7C: { return "F13"; } //F13 key
    case $7D: { return "F14"; } //F14 key
    case $7E: { return "F15"; } //F15 key
    case $7F: { return "F16"; } //F16 key
    case $80: { return "F17"; } //F17 key
    case $81: { return "F18"; } //F18 key
    case $82: { return "F19"; } //F19 key
    case $83: { return "F20"; } //F20 key
    case $84: { return "F21"; } //F21 key
    case $85: { return "F22"; } //F22 key
    case $86: { return "F23"; } //F23 key
    case $87: { return "F24"; } //F24 key
    case $90: { return "NUMLOCK"; } //NUM LOCK key
    case $91: { return "SCROLL"; } //SCROLL LOCK key
    case $A0: { return "LSHIFT"; } //Left SHIFT key
    case $A1: { return "RSHIFT"; } //Right SHIFT key
    case $A2: { return "LCONTROL"; } //Left CONTROL key
    case $A3: { return "RCONTROL"; } //Right CONTROL key
    case $A4: { return "LMENU"; } //Left MENU key
    case $A5: { return "RMENU"; } //Right MENU key
    case $A6: { return "BRBACK"; } //Windows 2000/XP: { return ""; } Browser Back key
    case $A7: { return "BRFORWARD"; } //Windows 2000/XP: { return ""; } Browser Forward key
    case $A8: { return "BRREFRESH"; } //Windows 2000/XP: { return ""; } Browser Refresh key
    case $A9: { return "BRSTOP"; } //Windows 2000/XP: { return ""; } Browser Stop key
    case $AA: { return "BRSEARCH"; } //Windows 2000/XP: { return ""; } Browser Search key 
    case $AB: { return "BRFAVORITES"; } //Windows 2000/XP: { return ""; } Browser Favorites key
    case $AC: { return "BRHOME"; } //Windows 2000/XP: { return ""; } Browser Start and Home key
    case $AD: { return "VOLMUTE"; } //Windows 2000/XP: { return ""; } Volume Mute key
    case $AE: { return "VOLDOWN"; } //Windows 2000/XP: { return ""; } Volume Down key
    case $AF: { return "VOLUP"; } //Windows 2000/XP: { return ""; } Volume Up key
    case $B0: { return "MEDNEXT"; } //Windows 2000/XP: { return ""; } Next Track key
    case $B1: { return "MEDPREV"; } //Windows 2000/XP: { return ""; } Previous Track key
    case $B2: { return "MEDSTOP"; } //Windows 2000/XP: { return ""; } Stop Media key
    case $B3: { return "MEDPLAY"; } //Windows 2000/XP: { return ""; } Play/Pause Media key
    case $B4: { return "MAIL"; } //Windows 2000/XP: { return ""; } Start Mail key
    case $B5: { return "MEDIA"; } //Windows 2000/XP: { return ""; } Select Media key
    case $B6: { return "APP1"; } //Windows 2000/XP: { return ""; } Start Application 1 key
    case $B7: { return "APP2"; } //Windows 2000/XP: { return ""; } Start Application 2 key
    case $BA: { return "OEM (:)"; } //Used for miscellaneous characters; it can vary by keyboard.
    case $BB: { return "OEM (+)"; } //Windows 2000/XP: { return ""; } For any country/region, the '+' key
    case $BC: { return "OEM (,)"; } //Windows 2000/XP: { return ""; } For any country/region, the ',' key
    case $BD: { return "OEM (-)"; } //Windows 2000/XP: { return ""; } For any country/region, the '-' key
    case $BE: { return "OEM (.)"; } //Windows 2000/XP: { return ""; } For any country/region, the '.' key
    case $BF: { return "OEM (?)"; } //Used for miscellaneous characters; it can vary by keyboard.
    case $C0: { return "OEM (~)"; } //Used for miscellaneous characters; it can vary by keyboard. 
    case $DB: { return "OEM ([)"; } //Used for miscellaneous characters; it can vary by keyboard. 
    case $DC: { return "OEM (\)"; } //Used for miscellaneous characters; it can vary by keyboard. 
    case $DD: { return "OEM (])"; } //Used for miscellaneous characters; it can vary by keyboard. 
    case $DE: { return "OEM (')"; } //Used for miscellaneous characters; it can vary by keyboard. 
    case $E5: { return "PROCESS"; } //Windows 95/98/Me, Windows NT 4.0, Windows 2000/XP: { return ""; } IME PROCESS key
    case $E7: { return "PACKET"; } //Windows 2000/XP: { return ""; } Used to pass Unicode characters as if they were keystrokes. The PACKET key is the low word of a 32-bit Virtual Key value used for non-keyboard input methods. For more information, see Remark in KEYBDINPUT, SendInput, WM_KEYDOWN, and WM_KEYUP
    case $F6: { return "ATTN"; } //Attn key
    case $F7: { return "CRSEL"; } //CrSel key
    case $F8: { return "EXSEL"; } //ExSel key
    case $F9: { return "EREOF"; } //Erase EOF key
    case $FA: { return "PLAY"; } //Play key
    case $FB: { return "ZOOM"; } //Zoom key
    case $FD: { return "PA1"; } //PA1 key
    case $FE: { return "CLEAR"; } //Clear key
    default: { return "OEM ("+ string(argument0)+")"; }
}
