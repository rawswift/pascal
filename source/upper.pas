program uppercase;
uses crt;
var
 thestr : string;
 thelength : integer;
function up(str : string; count : integer) : string;
 var
  thechar : char;
  thestring : string;
 begin
   thestring := '';
  repeat
   move(str[1], thechar, 1);
   thestring := thestring + upcase(thechar);
    delete(str, 1, 1);
   count := count - 1;
  until count = 0;
   up := thestring;
 end;
begin
 write('Enter string : ');
 readln(thestr);
  writeln;
  thelength := length(thestr);
  writeln(up(thestr, thelength));
end.