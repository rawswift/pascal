{$M 10000, 0, 0}
program tsr;
uses crt, dos;
var
 int08 : pointer;
 count : integer;
procedure myint(flags, CS, IP, AX, BX, CX, DX,
                SI, DI, DS, ES, BP : word);interrupt;
    var
     x, y : byte;
      begin
       asm
        PUSHF
        CALL INT08
       end;
         x := wherex;
         y := wherey;
           if count >= 1092 then
            begin
             gotoxy(random(79), random(24));write(' ');
            end else
             begin
              inc(count, 1);
             end;
         gotoxy(x, y);
      end;
begin
  asm
   CLI
  end;
    getintvec($08, int08);
    setintvec($08, @myint);
     count := 0;
  asm
   STI
  end;
keep(0);
end.

