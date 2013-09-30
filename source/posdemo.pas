program testpro;
uses crt;
var
 cdir : string[66];
 cdirl : byte absolute cdir;
begin
 getdir(0, cdir);
    if pos('\', cdir) <> cdirl then
       begin
         cdir := cdir + '\';
         cdir := cdir + '*.*';
       end else
           begin
             cdir := cdir + '*.*';
           end;
writeln (cdir);
readln;
end.