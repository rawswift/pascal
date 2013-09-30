program testpro;
uses crt, dos;
var
  thename, new : file;
  attr : word;
  srec : searchrec;
begin
  clrscr;
   findfirst('fuk', 8, srec);
     while doserror = 0 do
       begin
        assign(thename, srec.name);
        setfattr(thename, 0);
        assign(new, 'devil');
        setfattr(new, 8);
        readln;
        exit;
       end;
end.