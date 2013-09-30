program testpro;
uses crt;
var
  thefile : text;
  thetext : string;
begin
 clrscr;
 assign(thefile, 'C:\TESTDIR\TESTPRO.TXT');
 reset(thefile);
   readln(thefile, thetext);
   writeln (thetext);
readln;
end.