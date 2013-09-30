program testpro;
uses crt, dos, macro;
type
  tsv = array[0..24, 0..79] of word;
  psv = ^tsv;
var
  command : string;
  videomem : psv;
  savedvideo : tsv;
  x, y : byte;
  wmin, wmax : word;
begin
  x := wherex;
  y := wherey;
   wmin := windmin;
   wmax := windmax;
   videomem := ptr($B800, 0);
   savedvideo := videomem^;
    textbackground(lightblue);
    window(50, 19, 73, 24);
    clrscr;
    textbackground(black);
    window(51, 20, 72, 23);
    clrscr;
  repeat
   textcolor(green);write('');
   readln(command);
  until upper(command) = 'QUIT';
  videomem^ := savedvideo;
  window(lo(wmin)+1, hi(wmin)+1, lo(wmax)+1, hi(wmax)+1);
  gotoxy(x, y);
end.





