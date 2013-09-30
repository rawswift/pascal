{$M 10000, 0, 0}
program POP_TSR;
uses crt, dos, macro;
type
 tvs = array[1..79, 1..24] of word;
 pvs = ^tvs;
var
 int09 : pointer;
 int28 : pointer;
 int1b : pointer;
 saved_video : tvs;
 video_mem : pvs;
 x, y : byte;
 wmin, wmax : word;
 inuse, activated : boolean;
 dos_flag : ^word;
 regs : registers;
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
procedure myint1b;assembler;
 asm
  IRET
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
             if (dos_flag^ = 0) then
              begin
               activated := false;
               pop;
               inuse := false;
              end else
               begin
                activated := true;
               end;
           end;
         end;
     end;
procedure myint28;interrupt;
 begin
  asm
   PUSHF
   CALL int28
  end;
    if activated then
     begin
      inuse := true;
      activated := false;
      pop;
      inuse := false;
     end;
 end;
begin
 asm
  CLI
 end;
  getintvec($1b, int1b);
  getintvec($09, int09);     { GET INTERRUPT IN THE VECTOR TABLE }
  getintvec($28, int28);

   setintvec($1b, @myint1b);
   setintvec($28, @myint28); { SET INTERRUPT MY INTERRUPT }
   setintvec($09, @myint09);
    regs.ah := $34;
     intr($21, regs);
    dos_flag := ptr(regs.es, regs.bx);
 asm
  STI
 end;
writeln('...POP is resident');
keep(0);
end.