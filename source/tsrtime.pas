{$M 10000, 0, 0}
program tsr_time;

uses dos;

var
 int08 : pointer;

procedure handler(flags, cs, ip, ax, bx, cx, dx,
                  si, di, ds, es, bp : word);interrupt;
    begin
     asm
      pushf
      call int08
     end;
    end;

begin

  asm
   cli
  end;

    getintvec($08, int08);
    setintvec($08, @handler);

  asm
   sti
  end;

 keep(0);

end.
