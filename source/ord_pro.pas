program ord_pro;
uses crt;
var
  thechar : char;
  thenum : integer;
begin
  clrscr;
  thechar := 'a';
  thenum := ord(thechar);
  writeln(thenum);
  readln;
end.