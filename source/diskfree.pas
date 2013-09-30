program sucks;
uses crt, dos;
var
  regs : registers;

  sec_per_clus : word;  { AX }
  bytes_per_sec : word; { CX }
  avia_clus : word;     { BX }
  num_clus : word;      { DX }

begin

 clrscr;

 regs.ah := $36;
 regs.dl := $00;
 intr($21, regs);

 sec_per_clus := regs.ax;
 bytes_per_sec := regs.cx;
 avia_clus := regs.bx;
 num_clus := regs.dx;

 writeln(num_clus);

 readln;

end.
