program testpro;
uses dos;
var
 dosver : word;
begin
  dosver := dosversion;
  writeln ('the dos version is ',lo(dosver),'.',hi(dosver));
  writeln;
  readln;
end.