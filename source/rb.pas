program REBOOT;
uses crt, dos;
begin
 asm
  MOV AX,40
  MOV DS,AX
  MOV AX,1234
  MOV [72],AX
  INT 19
 end;
end.