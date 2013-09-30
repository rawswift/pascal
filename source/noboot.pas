program noboot;
uses dos;
var
 int09 : pointer;
procedure myint09(flags, CS, IP, AX, BX, CX, DX,
                  SI, DI, DS, ES, BP : word);interrupt;
   var
    scancode : byte absolute $40:$18;
   begin
     if (scancode and 6) = 6 then
      begin
       writeln('Reboot could kill');
      end;
   end;
begin
  asm
   CLI
  end;
   getintvec($19, int09);
   setintvec($19, @myint09);
  asm
   STI
  end;
end.

