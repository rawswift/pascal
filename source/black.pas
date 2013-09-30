program black;
uses crt, macro;
var
 x, y : byte;
begin
nocur;
 x := wherex;
 y := wherey;
 randomize;
  repeat
   delay(10);
   gotoxy(random(79), random(24));write(' ');
  until keypressed;
 oncur;
 gotoxy(x, y);
end.
