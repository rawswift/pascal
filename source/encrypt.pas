program inc_string;
uses crt;
var
 thelength, thecount : integer;
 thestr : string;
function encrypt(str : string; count, xcount : integer) : string;
 var
  thechar : char;
  thestring : string;
  begin
   thestring := '';
    repeat
      move(str[1], thechar, 1);
      inc(thechar, xcount);
       thestring := thestring + thechar;
      delete(str, 1, 1);
       count := count - 1;
    until count = 0;
  encrypt := thestring;
  end;
begin
  write('Enter string : ');
  readln(thestr);
  write('Enter count of encryption : ');
  readln(thecount);
   thelength := length(thestr);
  writeln;
  writeln(encrypt(thestr, thelength, thecount));
end.