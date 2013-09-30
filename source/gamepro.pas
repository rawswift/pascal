program gamepro;
uses crt;
var
  num, num2 : integer;
  winum1, winum2, int, count : integer;
  ans : char;
begin
  repeat
  clrscr;
  write('Enter a number (1/8) : ');
  readln(num);
  clrscr;
  write('Enter another number (1/8) : ');
  readln(num2);
  int := num + num2;
  randomize;
  for count := 1 to 2 do
     begin
       write(random(int):3);
     end;
 writeln;
 write('play again(y/n) : ');
 repeat
 ans := readkey;
 until upcase(ans) in ['Y', 'N'];
 until upcase(ans) = 'N';
end.
