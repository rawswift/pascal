program testpro;
uses dos;
type
  filerec = record
     name : string[80];
     age : byte;
     weight : integer;
  end;
var
  thefile : file of filerec;
  file1 : file;
  file2 : text;
begin
  assign (file1, 'c:\testdir\testpro.txt');
  assign (file2, 'randfile.txt');
  reset (file1);
  rewrite (file2);
  close (file1);
readln;
end.