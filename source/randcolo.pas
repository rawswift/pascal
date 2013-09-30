program black;
uses crt, macro;
begin
nocur;
 randomize;
  repeat
   delay(100);
   gotoxy(random(79), random(24));write(' ');
  until keypressed;
 oncur;
end.
