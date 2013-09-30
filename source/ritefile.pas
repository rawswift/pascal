program testpro;
type
  stringtype = string[80];
var
  testfile : text;
  stringarray : array [1..100] of stringtype;
  arrayptr : word;
begin
  arrayptr := 1;
  assign (testfile, 'c:\testdir\testpro.txt');
  rewrite (testfile);
  while stringarray[arrayptr] <> '' do
    begin
      writeln (testfile, stringarray[arrayptr]);
      arrayptr := arrayptr + 1;
 end;
readln;
end.