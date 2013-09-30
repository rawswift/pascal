{$M 10000, 0, 0}
program testpro;
uses crt, dos, macro;
var
 int28, int09 : pointer;
 activated, inuse : boolean;
 indosflag : ^word;
 regs : registers;
procedure runproc;
 var
  x, y : byte;
  count : integer;
 begin
  x := wherex;
  y := wherey;
  count := 100;
  repeat
   gotoxy(random(79), random(24));textcolor(random(15));writeln('Devil Wind');
   count := count - 1;
  until count = 0 ;
  gotoxy(x, y);
 end;
procedure myint28(flags, cs, ip, ax, bx, cx, dx,
                si, di, ds, es, bp : word);interrupt;
   begin
     asm
      pushf
      call int28
     end;
      if activated then
       begin
        inuse := true;
        activated := false;
        runproc;
        inuse := false;
       end;
   end;
procedure myint09(flags, cs, ip, ax, bx, cx, dx,
                si, di, ds, es, bp : word);interrupt;
   const
    call_em = 6;
   var
    scancode : byte absolute $40:$18;
   begin
    asm
     pushf
     call int09
    end;
      if not inuse then
        if (scancode and call_em) = call_em then
       begin
         inuse := true;
          if (indosflag^ = 0) then
           begin
            activated := false;
            runproc;
            inuse := false;
           end else
            activated := true;
       end;
   end;
begin
 stop;
  getintvec($28, int28);
  getintvec($09, int09);
  setintvec($28, @myint28);
  setintvec($09, @myint09);
   regs.ah := $34;
   intr($21, regs);
   indosflag :=  ptr(regs.es, regs.bx);
 go;
keep(0);
end.








