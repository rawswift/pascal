{$M 10000, 0, 0}
program int_pro;
uses crt, dos;
type
 tvs = array[1..79, 1..24] of word;
 pvs = ^tvs;
var
 int09 : pointer;
 saved_scr : tvs;
 video_mem : pvs;
 x, y : byte;
 wmin, wmax : word;
procedure myint09(flags, cs, ip, ax, bx, cx, dx,
                  si, di, ds, es, bp : word);interrupt;
    begin
     asm
      PUSHF
      CALL int09
     end;
       x := wherex;
       y := wherey;
        wmin := windmin;
        wmax := windmax;
         video_mem := ptr($B800, 0);
          saved_scr := video_mem^;
      textbackground(black);
      window(56, 2, 75, 5);
      clrscr;
       textcolor(lightgreen);write(chr(random(256-32)+32));
      video_mem^ := saved_scr;
     window(lo(wmin)+1, hi(wmin)+1, lo(wmax)+1, hi(wmax)+1);
     textcolor(lightgray);
     gotoxy(x, y);
    end;
begin
 asm
  CLI
 end;
  getintvec($09, int09);
  setintvec($09, @myint09);
 asm
  STI
 end;
keep(0);
end.

