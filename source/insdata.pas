program testpro;
uses dos, crt;
var
  insertext : string;
  thefile : text;
begin
  clrscr;
 {i-}
  insertext := 'this is a test';
  assign (thefile, 'a:\test.pro');
  rewrite (thefile);
  write (thefile, insertext);
  close (thefile);
 if ioresult <> 0 then writeln ('Cannot create file');
 {i+}
  assign (thefile, 'a:\test.pro');
  setfattr(thefile,0);
  setfattr(thefile,1);
  setfattr(thefile,2);
writeln ('this program is a test');
readln;
end.