program test;
uses crt;
var
  w1, w2 : byte;
begin
  w1 := whereY;
  w2 := whereX;
    writeln(w1,' : ',w2);
    readln;
end.