program testpro;
uses crt;
var
  ans : char;
begin
 clrscr;
 repeat
  writeln ('press Esc to exit or press any key to continou');
  writeln;
  ans := readkey;
 until ans = chr(27);
end.