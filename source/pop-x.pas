{$M 10000, 0, 0}
program POP_UP;
uses crt, dos, macro;
type
 tvs = array[1..79, 1..24] of word;
 pvs = ^tvs;
var
 int09 : pointer;
 saved_video : tvs;
 video_mem : pvs;
 x, y : byte;
 wmin, wmax : word;
 inuse : boolean;
procedure save_em;
 begin
  x := wherex;
  y := wherey;
   wmin := windmin;
   wmax := windmax;
    video_mem := ptr($B800, 0);
    saved_video := video_mem^;
 end;
procedure restore_em;
 begin
  video_mem^ := saved_video;
   window(lo(wmin)+1, hi(wmin)+1, lo(wmax)+1, hi(wmax)+1);
  gotoxy(x, y);
 end;
procedure pop;
 begin
  save_em;
    nocur;
   win(19, 9, 62, 15, 0, 1);
  textcolor(lightgreen+blink);
   writeln('ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');
   writeln('³                                         ³');
   writeln('³                                         ³');
   writeln('³                                         ³');
   writeln('³                                         ³');
   writeln('³                                         ³');
   write('ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
    textcolor(lightred);
     gotoxy(16, 3);write('Ryan Yonzon ');
     gotoxy(4, 5);write('POP, Copyright 98 - 99 by Damage Inc. ');
 repeat
 until keypressed;
  restore_em;
    oncur;
 end;
procedure myint09(flags, cs, ip, ax, bx, cx, dx,
                  si, di, ds, es, bp : word);interrupt;
     var
      key : byte absolute $40:$18;
     begin
      asm
       PUSHF
       CALL int09
      end;
        if not inuse then
         begin
          if (key and 3) = 3 then
           begin
             inuse := true;
             pop;
             inuse := false;
           end;
         end;
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
writeln('...resident');
keep(0);
end.