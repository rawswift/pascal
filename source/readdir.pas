program testpro;
uses dos, crt;
type
  searchrec = record
    fill : array [1..21] of byte;
    attr : byte;
    time : longint;
    size : longint;
    name : string[12];
  end;
var
  dirdata : searchrec;
begin
  findfirst ('c:\test\*.*',0,dirdata);
  while doserror = 0 do
  begin
    writeln (dirdata.name);
    findnext (dirdata);
end;
