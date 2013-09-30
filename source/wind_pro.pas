uses crt, matrix;
var
 count : integer;
begin

 save_em;

 textbackground(lightgray);
  window(1, 1, 80, 25);
   clrscr;

  gotoxy(1, 2);
   textcolor(lightblue);
    for count := 1 to 1840 do
     begin
      write('Û');
     end;

     win(38, 12, 19, 15, 1, 0);


 readln;

  restore_em;

end.