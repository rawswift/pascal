{$M 10000, 0, 0}
program int_pro;
uses crt, dos, macro;
var
 int08 : pointer;
 count : integer;
 x, y : byte;
procedure myint(flags, cs, ip, ax, bx, cx, dx,
                si, di, ds, es, bp : word);interrupt;
  begin
    x := wherex;
    y := wherey;
    call(int08);
     if count > 1092 then
      begin
       gotoxy(random(79), random(24));write(' ');
      end else
       begin
        inc(count, 1);
       end;
    gotoxy(x, y);
  end;
begin
 stop;
  getintvec($08, int08);
  setintvec($08, @myint);
   count := 0;
 go;
keep(0);
end.

