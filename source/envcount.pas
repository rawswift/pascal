program testpro;
uses dos;
var
  i : integer;
begin
  for i := 1 to envcount do writeln (envstr(i));
  readln;
end.