program testpro;
uses crt;
var
  x, y, color, back : integer;
begin
 x := random(72);
 y := random(25);
 color := random(15);
 back := random(15);
 clrscr;
 repeat
   gotoxy (x,y);textcolor(color);textbackground(back);writeln ('test');
   delay (200);
   x := random(76);
   y := random(25);
   color := random(15);
   back := random(15);
 until keypressed;
end.