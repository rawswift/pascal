program testpro;
uses crt;
var
 wx, wy : integer;
 count : integer;
begin
  writeln;
  write(' Run number - ');
  delay(1000);
  wx := whereX;
  wy := whereY;
  count := 0;
   repeat
     gotoxy(wx,wy);write(count,'%');
      delay(75);
     count := count + 1;
   until count = 101;
  delay(1000);
  writeln;
end.
