{$M 30000, 0, 0}
program tsr_pro;
uses crt, dos;
var
 int08 : pointer;
procedure myint(flags, CS, IP, AX, BX, CX, DX,
                SI, DI, DS, ES, BP : word);interrupt;
 var
  x, y : byte;
 begin
   asm
    PUSHF
    CALL  INT08;
   end;
    x := wherex;
    y := wherey;
     gotoxy(65, 2);textcolor(red+blink);writeln('Devil Wind');
    gotoxy(x, y);
  end;
begin
   asm
    CLI
   end;
    getintvec($08, int08);
    setintvec($08, @myint);
   asm
    STI
   end;
keep(0);
end.