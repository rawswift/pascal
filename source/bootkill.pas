program testpro;
uses dos;
var
 regs : registers;
begin
   regs.ah := 05;
   regs.dl := 0;
   regs.dh := 0;
   regs.ch := 0;
    intr($13, regs);
end.