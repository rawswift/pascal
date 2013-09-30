program testpro;
uses dos, crt;
var
  srec : searchrec;
  thename : text;
  attr : word;
begin
  clrscr;
  findfirst('A:\*.*', 8, srec);
    while doserror = 0 do
      begin
        writeln(srec.name);
        assign(thename, srec.name);
        getfattr(thename, attr);
         if attr <> 8 then writeln('Volume');
           setfattr(thename, 0);
         readln;
         halt;
        findnext(srec);
        readln;
      end;
end.