program testpro;
uses crt;
var
  ryan : string;
  imann : integer;
begin
  clrscr;
  ryan := paramstr(0);
  repeat
    imann := pos('\', ryan);
    delete(ryan, 1, imann);
  until imann = 0;
  writeln(ryan);
  readln;
end.