program fx;
uses crt, macro;
type
 tsv = array[0..24, 0..79] of word;
 psv = ^tsv;
var
  savedvideo : tsv;
  videomem : psv;
  x : byte;
  y : byte;
  swmin : word;
  swmax : word;
  OrigMode : Word;
begin
 nocur;
  OrigMode:=LastMode;                  { Remember original video mode }
  TextMode(lo(LastMode)+Font8x8);      { use 43 or 50 lines on EGA/VGA }
  x := wherex;
  y := wherey;
   swmin := windmin;
   swmax := windmax;
    videomem := ptr($B800, 0);
   savedvideo := videomem^;
  textbackground(black);window(65, 2, 75, 11);
  clrscr;
  repeat
   textcolor(green);
   delay(3);
   write(Chr(Random(256-32)+32));
  until keypressed;
   videomem^ := savedvideo;
   window(lo(swmin)+1, hi(swmin)+1, lo(swmax)+1, hi(swmax)+1);
   gotoxy(x, y);
  TextMode(OrigMode);
   oncur;
end.