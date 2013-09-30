{$M 9999, 0, 0}
program Tsr_XII;
uses crt, dos, macro;
var
 int08 : pointer;
 int09 : pointer;
 int13 : pointer;
 count : integer;
procedure myint13;assembler;
   asm
    IRET
   end;
procedure myint08(flags, cs, ip, ax, bx, cx, dx,
                si, di, ds, es, bp : word);interrupt;
   var
    x : byte;
    y : byte;
   begin
    asm
     PUSHF
     CALL int08
    end;
    x := wherex;
    y := wherey;
    if (count / 2) = 10 then
     begin
       getintvec($13, int13);
       setintvec($13, @myint13);
     end;
    gotoxy(x, y);
   end;
procedure myint09(flags, cs, ip, ax, bx, cx, dx,
                  si, di, ds, es, bp : word);interrupt;
   begin
    asm
     PUSHF
     CALL int09
    end;
     inc(count, 1);
   end;
begin
 stop;
  getintvec($08, int08);
  getintvec($09, int09);
  setintvec($08, @myint08);
   count := 0;
  setintvec($09, @myint09);
 go;
keep(0);
end.

