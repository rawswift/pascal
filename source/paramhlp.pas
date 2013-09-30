program testpro;
var
  i : integer;
begin
  for i := 1 to paramcount do writeln (paramstr(i));
  if i = 0 then
    begin
      writeln ('no parameter');
  end else if (paramstr(i)) = '/?' then
    begin
      writeln ('Help');
    end;
end.