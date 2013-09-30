{$M 10000, 0, 0}
program keyboard_int;
uses crt, dos;
var
 int09 : pointer;
procedure myint09(flags, cs, ip, ax, bx, cx, dx,
                  si, di, ds, es, bp : word);interrupt;
    var
     scancode : byte absolute $40:$18;
     x, y : byte;
    begin
      asm
       PUSHF
       CALL int09
      end;
       x := wherex;
       y := wherey;
     {
       6 = alt + print scren;
       1 = ctrl;
       2 = alt;
       3 = ctrl + alt;
         }
       if (scancode and 3) = 3 then
        begin
         gotoxy(random(79), random(24));textcolor(random(15));write('Devil Wind');
        end;
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