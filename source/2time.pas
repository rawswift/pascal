program YTime;
uses dos, crt;
procedure box;
 begin
  gotoxy (31,12);textcolor(lightcyan+blink);writeln ('旼컴컴컴컴컴컴컴컴�');
  gotoxy (31,13);writeln ('�                 �');
  gotoxy (31,14);writeln ('읕컴컴컴컴컴컴컴컴�');
  gotoxy (30,23);textcolor(lightgreen);writeln ('Press any key to exit');
 end;
var
  hour, minute, second, hundredths : word;
  com : string;
  escape : char;
  ntd, x1, x2 : integer;
  attr : word;
  thefile : text;
begin
{$i-}
 assign(thefile, 'YTIME.EXE');
 reset(thefile);
  if ioresult <> 0 then
      begin
textcolor(lightred+blink);writeln('The program''s file name has been altered');
writeln('please return to it''s original file name');
{$i+}
       halt;
  end else
      begin
        close(thefile);
        assign(thefile, 'YTIME.EXE');
        getfattr(thefile,attr);
      if (attr and archive) > 0 then
begin
  textcolor(white);writeln ('Copyright protection');
  writeln('This program is performed illegal and will be shutdown');
  halt;
end else
begin
 repeat
  clrscr;
  gotoxy (10,2);textcolor(white);
  writeln ('Ytime(R) version 4.10, Copyright(C) 97 - 98 Yonzon International');
  gettime (hour,minute,second,hundredths);
  if hour = 13 then hour := 1; if hour = 14 then hour := 2;
  if hour = 15 then hour := 3; if hour = 16 then hour := 4;
  if hour = 17 then hour := 5; if hour = 18 then hour := 6;
  if hour = 19 then hour := 7; if hour = 20 then hour := 8;
  if hour = 21 then hour := 9; if hour = 22 then hour := 10;
  if hour = 23 then hour := 11;if hour = 24 then hour := 12;
  box;
  gotoxy (36,13);textcolor(lightgray);write (hour,':',minute,':',second);
  delay (500);
 until keypressed;
clrscr;
gotoxy(23,3);textcolor(white);write('Thank you for using');
gotoxy(43,3);textcolor(lightgreen+blink);write('Yonzon Time');
gotoxy(55,3);textcolor(white);write('(R)');
gotoxy(65,3);textcolor(black);write('�');
gotoxy(22,5);textcolor(yellow);writeln('This program is not Shareware product');
textcolor(black);writeln('�');
repeat
 escape := readkey;
until escape = chr(13);
ntd := 36;
x1 := 23;
x2 := 58;
repeat
  gotoxy (x1,3);write('�');
  gotoxy (x2,5);write('�');
  delay(50);
  ntd := ntd - 1;
  x1 := x1 + 1;
  x2 := x2 - 1;
until ntd = 0;
textcolor(lightgray);
clrscr;
end;
end;
end.