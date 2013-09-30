program testpro;
var
  i : integer;
begin
  for i := 1 to paramcount do writeln (paramstr(i));
  if i = 0 then writeln ('no parameter');
end.