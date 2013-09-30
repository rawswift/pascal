program testpro;
uses crt;
var
 thefile : file;
 buffer : array[1..10] of byte;
 int : integer;
begin
  clrscr;
  assign(thefile, 'C:\TESTPRO\TEST.PRO');
  reset(thefile);
    blockread(thefile, buffer, int);
    writeln(int);
    readln;
end.