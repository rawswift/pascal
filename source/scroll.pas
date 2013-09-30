program testpro;
uses crt, dos;
var
 regs : registers;
begin
  regs.ah := 6;
  regs.al := 5;
  regs.ch := 0;
  regs.cl := 0;
  regs.dh := 20;
  regs.dl := 79;
  regs.bh := 7;
   intr($10, regs);
readln;
end.