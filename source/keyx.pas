{$M 10000, 0, 0}
program key_int;
uses crt, dos;
var
 int09 : pointer;
 x, y : byte;
procedure myint09(flags, cs, ip, ax, bx, cx, dx,
                  si, di, ds, es, bp : word);interrupt;
    begin
     asm
      PUSHF
      CALL int09
     end;
      x := wherex;
      y := wherey;
       gotoxy(random(79), random(24));textcolor(lightgreen);write(chr(random(256-32)+32));
       textcolor(lightgray);
      gotoxy(x, y);
    end;

begin
 asm
  CLI
 end;
  getintvec($09, int09);
  setintvec($09, @myint09);
 asm
  STI
 end;
keep(0);
end.