program testpro;
uses dos, crt ;
var
  dospath : string[128];
begin
   clrscr;
     dospath := getenv('path');
     writeln (dospath);
   readln;
end.