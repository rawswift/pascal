program testpro;
uses dos, crt;
var
  hour, minute, second, hundredths : word;
begin
 textbackground (blue);
 textcolor (lightgreen);
 repeat
  clrscr;
  gettime (hour,minute,second,hundredths);
  if hour = 13 then hour := 1; if hour = 14 then hour := 2;
  if hour = 15 then hour := 3; if hour = 16 then hour := 4;
  if hour = 17 then hour := 5; if hour = 18 then hour := 6;
  if hour = 19 then hour := 7; if hour = 20 then hour := 8;
  if hour = 24 then hour := 9; if hour = 25 then hour := 10;
  if hour = 26 then hour := 11;
  writeln (hour,':',minute,':',second);
  delay (500);
 until keypressed;
end.