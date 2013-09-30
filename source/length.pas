program the_length;
uses crt;
var
  thelength : integer;
  thestr : string;
begin
  clrscr;
  write(' Enter string : ');
  readln(thestr);
   thelength := length(thestr);
  writeln('The length of the string is ',thelength);
 readln;
end.