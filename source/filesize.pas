program testpro;
uses dos, crt;
var
  thefile : file of byte;
  sizeoffile : longint;
begin
 clrscr;
 {i-}
 assign(thefile, 'c:\pascal7\turbo.exe');
 reset(thefile);
 if ioresult <> 0 then
  begin
    writeln ('Could not find the file');
    halt;
  end;
sizeoffile := filesize(thefile);
writeln ('the file size is ',sizeoffile,' bytes.');
close(thefile);
{i+}
readln;
end.