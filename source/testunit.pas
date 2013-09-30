program test_unit;
uses macro;
var
 thestr, toenc : string;
 count : integer;
begin
  write('Enter string : ');
  readln(thestr);
 writeln;
  writeln('Convert all character to uppercase');
  writeln(upper(thestr));
 readln;
 writeln;
  write('Enter string to encrypt : ');
   readln(toenc);
  write('Enter count of encryption : ');
   readln(count);
    writeln('Encrypt the the character');
    writeln(crypt(toenc, count));
end.




