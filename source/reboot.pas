program reboot;
uses dos;
var
 regs : registers;
begin
 asm
  CLI
 end;
  regs.ah := 00;
  intr($19, regs);
end.