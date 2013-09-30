program read;
uses crt, dos, macro;
type
 tsv = array[0..24, 0..79] of word;
 psv = ^tsv;
var
  param : string;
  thefile : file;
  videomem : psv;
  savedvideo : tsv;
  x, y : byte;
  wmin, wmax, attr : word;
  buffer, thechar, tmpchar : char;
  rec : integer;
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
      textbackground(lightblue);
       window(2, 2, 76, 15);
      clrscr;
        gotoxy(27, 1);textcolor(lightcyan);write('Press Esc to Exit');
        gotoxy(30, 14);textcolor(lightred);write('Press P to pause');
        textbackground(black);
         window(3, 3, 75, 14);
        clrscr;
    seek(thefile, 0);
    textcolor(green);
    while not eof(thefile) do
      begin
       delay(50);
        blockread(thefile, buffer, sizeof(buffer), rec);
        write(buffer);
         if keypressed then
          begin
           thechar := readkey;
            if thechar = chr(27) then
             begin
              nocur;
              window(2, 2, 76, 15);
              gotoxy(32, 14);textcolor(lightred);write('Terminated');
               delay(1000);
               setfattr(thefile, attr);
              oncur;
               videomem^ := savedvideo;
               window(lo(wmin)+1, hi(wmin)+1, lo(wmax)+1, hi(wmax)+1);
                gotoxy(x, y);
                 halt;
             end else if upcase(thechar) = chr(80) then
              begin
                window(2, 2, 76, 15);
                gotoxy(33, 14);textcolor(lightred);write('Pause');
                tmpchar := readkey;
                window(3, 3, 75, 14);
              end;
          end;
      end;
     nocur;
      window(2, 2, 76, 15);
       gotoxy(34, 14);textcolor(lightred);write('End');
     readln;
     setfattr(thefile, attr);
      oncur;
     videomem^ := savedvideo;
      window(lo(wmin)+1, hi(wmin)+1, lo(wmax)+1, hi(wmax)+1);
       gotoxy(x, y);
end.
