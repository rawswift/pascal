program run_time;
uses crt, dos, macro;
var
  x, y : integer;
  hour, min, sec, sec100 : word;
  echox, echosec, echomin, echo100 : string;
begin
 x := wherex;
 y := wherey;
 nocur;
 repeat
  gettime(hour, min, sec, sec100);
  if hour = 13 then hour := 01; if hour = 14 then hour := 02;
  if hour = 15 then hour := 03; if hour = 16 then hour := 04;
  if hour = 17 then hour := 05; if hour = 18 then hour := 06;
  if hour = 19 then hour := 07; if hour = 20 then hour := 08;
  if hour = 21 then hour := 09; if hour = 22 then hour := 10;
  if hour = 23 then hour := 11;if hour = 24 then hour := 12;
   if hour < 10 then echox := '0' else echox := '';
   if sec100 < 10 then echo100 := ':0' else echo100 := ':';
   if sec < 10 then echosec := ':0' else echosec := ':';
   if min < 10 then echomin := ':0' else echomin := ':';
  gotoxy(x, y);write('The time is - ');textcolor(lightgreen);write(echox, hour, echomin, min, echosec, sec, echo100, sec100);
  textcolor(lightgray);
 until keypressed;
 oncur;
 writeln;
end.

