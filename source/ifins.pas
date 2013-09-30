{$M 9999, 0, 0}
program test_if;
uses crt, dos;
var
 int08 : pointer;
procedure myint08(flags, cs, ip, ax, bx, cx, dx,
                  si, di, ds, es, bp : word);interrupt;
     begin
      asm
       PUSHF
       CALL int08
      end;
     end;
begin
  asm
   CLI
  end;
  getintvec($08, int08);
  asm
   STI
  end;
   if int08 = @int08 then
    begin
     writeln('WARNING :');
     writeln('TSR is already installed');
     halt;
    end else
     begin
  asm
   CLI
  end;
    setintvec($08, @myint08);
  asm
   STI
  end;
     writeln('TSR is installed');
     end;
keep(0);
end.
