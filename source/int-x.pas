{$M 10000, 0, 0}
program test_int;
uses crt, dos;
type
  tsv = array[1..79, 1..24] of word;
  psv = ^tsv;
var
 int08, int1b, int09 : pointer;
 count : integer;
  savedvideo : tsv;
  videomem : psv;
  x : byte;
  y : byte;
  wmin : word;
  wmax : word;
procedure save_em;
 begin
{   xcur := wherex;
   ycur := wherey;}
    wmin := windmin;
    wmax := windmax;
      videomem := ptr($B800, 0);
      savedvideo := videomem^;
  end;
procedure restore_em;
 begin
  videomem^ := savedvideo;
   window(lo(wmin)+1, hi(wmin)+1, lo(wmax)+1, hi(wmax)+1);
{  gotoxy(xcur, ycur);}
 end;
procedure myint1b;assembler;
 asm
  IRET
 end;
{procedure myint08(flags, cs, ip, ax, bx, cx, dx,
                  si, di, ds, es, bp : word);interrupt;
   var
    x, y : byte;
   begin
    asm
     PUSHF
     CALL int08
    end;
      x := wherex;
      y := wherey;
      if count > 1092 then
       begin
        save_em;
         gotoxy(random(79), random(24));write('');
        restore_em;
       end else
        begin
         inc(count, 1);
        end;
      gotoxy(x, y);
    end;}
procedure myint09(flags, cs, ip, ax, bx, cx, dx,
                  si, di, ds, es, bp : word);interrupt;
   begin
    asm
     PUSHF
     CALL int09
    end;
     x := wherex;
     y := wherey;
      gotoxy(random(79), random(24));textcolor(lightgreen);write('');
     gotoxy(x, y);
   end;
begin
 asm
  CLI
 end;
  getintvec($1b, int1b);
   setintvec($1b, @myint1b);
  getintvec($09, int09);
   setintvec($09, @myint09);
    count := 0;
  asm
   STI
  end;
keep(0);
end.
