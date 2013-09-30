program testpro;
uses crt;
type
 tsv = array[0..24, 0..79] of word;
 psv = ^tsv;
var
  savedvideo : tsv;
  videomem : psv;
  x, y : byte;
  swmin : word;
  swmax : word;
begin
   x := wherex;
   y := wherey;
   swmin := windmin;
   swmax := windmax;
  videomem := ptr($B800, 0);
  savedvideo := videomem^;
  textbackground(blue);
   window(20, 9, 57, 15);
  clrscr;
readln;
  videomem^ := savedvideo;
  window(lo(swmin)+1, hi(swmin)+1, lo(swmax)+1, hi(swmax)+1);
  gotoxy(x, y);
end.

