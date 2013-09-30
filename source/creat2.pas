program testpro;
uses dos;
type
  filerec = record
    name : string [20];
    age : byte;
    weight : integer;
  end;
var
  thefile : file of filerec;
  file1 : file;
begin
  assign (file1, 'c:\testdir\testpro');
  reset (file1);
  readln;
  close (file1);
