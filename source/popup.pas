program testpro;
uses crt, macro;
type
 tsv = array[0..24, 0..79] of word;
 psv = ^tsv;
var
  savedvideo : tsv;
  videomem : psv;
  x, y : byte;
  swmin : word;
  swmax : word;
  thestr01, thestr02 : string;
begin
  nocur;
   x := wherex;
   y := wherey;
   swmin := windmin;
   swmax := windmax;
  videomem := ptr($B800, 0);
  savedvideo := videomem^;
 repeat
  textbackground(lightblue);
   window(21, 8, 57, 16);
  clrscr;
   gotoxy(13, 3);textcolor(lightgreen);writeln('Access key');
  oncur;
   gotoxy(15, 5);write;
  readln(thestr01);
   clrscr;
   gotoxy(9, 3);textcolor(lightgreen);writeln('Confirm access key');
   gotoxy(15, 5);write;
  readln(thestr02);
   if thestr01 <> thestr02 then
     begin
      nocur;
      clrscr;
      gotoxy(7, 5);textcolor(red+blink);writeln('Access key do not match');
      readln;
     end else
      begin
       nocur;
       clrscr;
       gotoxy(15, 5);textcolor(yellow);writeln('Success');
       readln;
      end;
 until thestr01 = thestr02;
  videomem^ := savedvideo;
  window(lo(swmin)+1, hi(swmin)+1, lo(swmax)+1, hi(swmax)+1);
  gotoxy(x, y);
  oncur;
end.

