program Read;
uses crt, dos, macro;
type
 tsv = array[0..24, 0..79] of word;
 psv = ^tsv;
var
  param : string;
  thefile : file;
  videomem : psv;
  savedvideo : tsv;
  x, y, x2, y2 : byte;
  wmin, wmax, attr : word;
  buffer, thechar, tmpchar, thecharx : char;
  rec, delay_run : integer;
begin
   param := paramstr(1);
    if param = '' then
     begin
      writeln('Required paramreter missing');
      halt;
     end;
  assign(thefile, param);
    getfattr(thefile, attr);
    setfattr(thefile, 0);
   {$I-}
    reset(thefile, 1);
     if ioresult <> 0 then
      begin
       {$I+}writeln('File not found');
        halt;
      end;
   {$I+}
  writeln('Read, Macrohard software, Copyright 1998 - 1999 by Damage Inc.');
    x := wherex;
    y := wherey;
     wmin := windmin;
     wmax := windmax;
      videomem := ptr($B800, 0);
      savedvideo := videomem^;
      textbackground(blue);
       window(2, 2, 76, 15);
      clrscr;
         gotoxy(4, 1);textcolor(yellow);write('Esc');textcolor(lightcyan);write(' : Exit  ');
         textcolor(yellow);write('   P');textcolor(lightcyan);write(' : Pause ');textcolor(yellow);
         write('   S');textcolor(lightcyan);write(' : Increase speed ');textcolor(yellow);write('   D');
         textcolor(lightcyan);write(' : Decrease speed');
       textbackground(black);
        window(3, 3, 75, 14);
       clrscr;
    seek(thefile, 0);
    textcolor(green);
    delay_run := 75;
     while not eof(thefile) do
      begin
       nocur;
       delay(delay_run);
        blockread(thefile, buffer, sizeof(buffer), rec);
        write(buffer);
         if keypressed then
           begin
             thechar := readkey;
              if thechar = chr(27) then
               begin
                 nocur;
                 window(2, 2, 76, 15);
                 gotoxy(31, 14);textbackground(blue);textcolor(white);write('Terminated');
                  delay(1000);
                 setfattr(thefile, attr);
                 oncur;
                 videomem^ := savedvideo;
                 window(lo(wmin)+1, hi(wmin)+1, lo(wmax)+1, hi(wmax)+1);
                 gotoxy(x, y);
                 halt;
               end else if upcase(thechar) = chr(80) then
                begin
                 nocur;
                  x2 := wherex;
                  y2 := wherey;
                 window(2, 2, 76, 15);
                gotoxy(32, 14);textbackground(blue);textcolor(white+blink);write('Paused');
                 delay(1500);
                gotoxy(32, 14);textcolor(blue);write('Paused');
                gotoxy(24, 14);textbackground(blue);textcolor(white+blink);write('Press any key to continue');
                 tmpchar := readkey;
                 gotoxy(24, 14);textcolor(blue);write('Press any key to continue');
                 textbackground(black);textcolor(green);
                  window(3, 3, 75, 14);
                   gotoxy(x2, y2);
                end else if upcase(thechar) = chr(83) then
                 begin
                  dec(delay_run, 5);
                 end else if upcase(thechar) = chr(68) then
                  begin
                   inc(delay_run, 5);
                  end;
           end;
      end;
      nocur;
      window(2, 2, 76, 15);
       gotoxy(30, 14);textbackground(blue);textcolor(white);write('End of file');
     setfattr(thefile, attr);
     repeat
      thecharx := readkey;
     until thecharx = chr(27);
      oncur;
     videomem^ := savedvideo;
      window(lo(wmin)+1, hi(wmin)+1, lo(wmax)+1, hi(wmax)+1);
       gotoxy(x, y);
end.
