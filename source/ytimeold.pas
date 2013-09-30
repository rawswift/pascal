program YTime;
uses dos, crt;
const
 origname = 'ytime';
 origname2 = 'YTIME';
 origname3 = 'Ytime';
procedure box;
 begin
  gotoxy (31,12);textcolor(lightcyan+blink);writeln ('ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');
  gotoxy (31,13);writeln ('³                 ³');
  gotoxy (31,14);writeln ('ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
  gotoxy (30,23);textcolor(lightgreen);writeln ('Press any key to exit');
 end;
var
  hour, minute, second, hundredths : word;
  com : string;
  escape : char;
  ntd, x1, x2 : integer;
  ampm : string[2];
begin
 com := getenv('cmdline');
 if (com = origname) or (com = origname2) or (com = origname3) then
begin
 repeat
  clrscr;
  gotoxy (10,2);textcolor(white);
  writeln ('Ytime(R) version 3.11, Copyright(C) 97 - 98 Yonzon International');
  gettime (hour,minute,second,hundredths);
  if hour >= 13 then ampm := 'pm' else ampm := 'am';
  if hour = 13 then hour := 1; if hour = 14 then hour := 2;
  if hour = 15 then hour := 3; if hour = 16 then hour := 4;
  if hour = 17 then hour := 5; if hour = 18 then hour := 6;
  if hour = 19 then hour := 7; if hour = 20 then hour := 8;
  if hour = 21 then hour := 9; if hour = 22 then hour := 10;
  if hour = 23 then hour := 11;if hour = 24 then hour := 12;
  box;
  gotoxy (34,13);textcolor(lightgray);write (hour,':',minute,':',second,' ',ampm);
  delay (500);
 until keypressed;
clrscr;
gotoxy(23,3);textcolor(white);write('Thank you for using');
gotoxy(43,3);textcolor(lightgreen+blink);write('Yonzon Time');
gotoxy(55,3);textcolor(white);write('(R)');
gotoxy(65,3);textcolor(black);write('ÿ');
gotoxy(23,5);textcolor(yellow);writeln('This program is a Shareware product');
textcolor(black);writeln('ÿ');
repeat
 escape := readkey;
until escape = chr(13);
ntd := 36;
x1 := 23;
x2 := 58;
repeat
  gotoxy (x1,3);write('ÿ');
  gotoxy (x2,5);write('ÿ');
  delay(50);
  ntd := ntd - 1;
  x1 := x1 + 1;
  x2 := x2 - 1;
until ntd = 0;
end else begin
           textcolor(red+blink);writeln('Warning : Warning : Warning');
           writeln;
           textcolor(white);writeln('  Copyright protection');
           writeln;
           textcolor(lightgray);writeln ('The program''s file name');
           writeln ('have been altered to "',com, '"');
           writeln ('please return to it''s original file name, " Ytime "');
         end;
textcolor(lightgray);
clrscr;
end.