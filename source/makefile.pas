program testpro;
uses dos;
var
  thefile1 : file;
  thefile2 : text;
begin
   assign (thefile1, 'c:\testdir\randfile.xyz');
   assign (thefile2, 'c:\testdir\textfile.txt');
readln;
end.