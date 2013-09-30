{$M 10000, 0, 0}
program CS7_pro;
uses crt, dos, matrix;
var
 int09, int28, int1b : pointer;   { pointer to keyboard interrupt }

 x, y : byte;       { save scr var }
 wmin, wmax : word;
 video_mem : psv;
 saved_scr : tsv;
 dos_flag : ^word;
 activated, inuse : boolean;
 regs : registers;
 yc : integer;
 choice : char;     { save scr var }
 x1, x2 : integer;
 count : integer;

procedure save_em;  { save the scr }
 begin
  x := wherex;
  y := wherey;
   wmin := windmin;
   wmax := windmax;
    video_mem := ptr($B800, 0);
     saved_scr := video_mem^;
 end;               { save the scr }


procedure restore_em; { restore the scr }
 begin
  video_mem^:= saved_scr;
   window(lo(wmin)+1, hi(wmin)+1, lo(wmax)+1, hi(wmax)+1);
  gotoxy(x, y);
 end;                 { restore the scr }


procedure wind;
 begin

 save_em;

 x1 := 38;
 x2 := 38;

 for count := 1 to 30 do
  begin
   sound(random(50));
   delay(10);
   textbackground(cyan);
   window(x1, 4, x2, 21);
    clrscr;
    inc(x2, 1);
    dec(x1, 1);
  end;

   nosound;

  textcolor(blue);
  writeln(' ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');

   for count := 1 to 16 do
    begin
     writeln(' ³                                                       ³');
    end;
     write(' ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');


 readln;

   restore_em;

 end;

procedure get_choice;
 begin

{   choice := readkey;

  restore_em;

     case choice of

          #59 : begin
                  wind;
                end;
          #60 : begin
                  wind;
                end;
          #61 : begin
                  wind;
                end;
          #62 : begin
                  wind;
                end;
          #63 : begin
                  wind;
                end;
          #64 : begin
                  wind;
                end;
          #65 : begin
                  wind;
                end;
          #66 : begin
                end;
          end;}

   repeat
    choice := readkey
   until (choice = #59) or (choice = #60) or (choice = #61) or (choice = #62);

  restore_em;

     case choice of

          #59 : begin
                  wind;
                end;
          #60 : begin
                  wind;
                end;
          #61 : begin
                  wind;
                end;
          #62 : begin
                  wind;
                end;
          #63 : begin
                  wind;
                end;
          #64 : begin
                  wind;
                end;
          #65 : begin
                  wind;
                end;
          #66 : begin
                end;
          end;

  end;


procedure menu;
 var
  count, x1, x2 : integer;

 begin

 save_em;

 nocur;

 x1 := 38;
 x2 := 38;

 for count := 1 to 15 do
  begin
   sound(random(50));
   delay(10);
   textbackground(cyan);
   window(x1, 7, x2, 18);
    clrscr;
    inc(x2, 1);
    dec(x1, 1);
  end;

  textcolor(blue);
  writeln(' ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');

   for count := 1 to 10 do
    begin
     writeln(' ³                         ³');
    end;
     write(' ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');


  yc := 3;
   for count := 1 to 8 do
    begin
     gotoxy(8, yc);textcolor(red);write('F',count);
      inc(yc, 1);
    end;

   textcolor(black);
   gotoxy(14, 3);write('Add');
   gotoxy(14, 4);write('Edit');
   gotoxy(14, 5);write('Search');
   gotoxy(14, 6);write('Browse');
   gotoxy(14, 7);write('(un)Delete');
   gotoxy(14, 8);write('Sort');
   gotoxy(14, 9);write('Pack');
   gotoxy(14, 10);write('Exit');

   nosound;

      get_choice;


{  restore_em; }

   oncur;

 end;

procedure do_popup;
 begin

   menu;

 end;

procedure myint1b;assembler;   { disable interrupt 1B }
 asm
  IRET
 end;                          { disable interrupt 1B }


procedure myint09(flags, cs, ip, ax, bx, cx, dx,
                  si, di, ds, es, bp : word);interrupt;  { keyboard interrupt handler }
    var
     scancode : byte absolute $40:$18;
    begin
     call(int09);

      if not inuse then
          begin

         if (scancode and 3) = 3 then
           begin
             inuse := true;
             if (dos_flag^ = 0) then
               begin
                activated := false;
                   do_popup;
                inuse := false;
               end else
                begin
                 activated := true;
                end;
           end;
          end;                             { keyboard interrupt handler }
    end;

procedure myint28;interrupt;         { DOSOK interrupt handler }
 begin

  call(int28);

   if activated then
     begin
      inuse := true;
      activated := false;
        do_popup;
      inuse := false;
     end;
 end;                           { DOSOK interrupt handler }

procedure do_install;
 begin

   disable;

     getintvec($1b, int1b);
     setintvec($1b, @myint1b);

      getintvec($28, int28);
      setintvec($28, @myint28);

       getintvec($09, int09);
       setintvec($09, @myint09);

       regs.ah := $34;
       intr($21, regs);
        dos_flag := ptr(regs.es, regs.bx);

   enable;

     writeln;
     writeln('RAGE(r) Copyright by Damage Inc. 1998 - 2000');
     writeln;
     writeln('Press Ctrl + Alt');

 end;

begin

   do_install;


 keep(0);

end.

