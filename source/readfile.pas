program testpro;
type
  stringtype = string[80];
var
  testfile : text;
  stringarray : array[1..100] of stringtype;
  arrayptr : word;
begin
  arrayptr := 1;
  assign (testfile, 'c:\testdir\testpro.txt');
  reset (testfile);
   while not eof (testfile) do
     begin
       readln (testfile,stringarray[arrayptr]);
       arrayptr := arrayptr + 1;
     end;
readln;
end.