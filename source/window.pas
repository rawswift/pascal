program window_pro;
uses crt;
var
 count : integer;
begin
  textbackground(black);window(65, 2, 75, 11);
  clrscr;
 for count := 1 to 1000 do
  begin
   textcolor(green);
   delay(3);
   write(Chr(Random(256-32)+32));
  end;
  textbackground(black);window(65, 2, 75, 11);
  clrscr;
end.