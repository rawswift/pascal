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
procedure init;
  begin
    textbackground(lightblue);
    window(0, 0, 80, 25);
    clrscr;
    textbackground(lightgray);
    window(1, 1, 80, 1);
    clrscr;
    textbackground(black);
    window(50, 18, 73, 24);
    clrscr;
    textbackground(lightgray);
    window(49, 17, 72, 23);
    clrscr;
    textbackground(lightred);
    window(50, 18, 71, 22);
    clrscr;
  end;
begin
  x := wherex;
  y := wherey;
   wmin := windmin;
   wmax := windmax;
   videomem := ptr($B800, 0);
   savedvideo := videomem^;
   init;
  repeat
   textcolor(lightcyan);write('');
   readln(command);
  until upper(command) = 'QUIT';
  videomem^ := savedvideo;
  window(lo(wmin)+1, hi(wmin)+1, lo(wmax)+1, hi(wmax)+1);
  gotoxy(x, y);
end.





