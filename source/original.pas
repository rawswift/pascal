program testpro;
uses dos, crt;
const
  originalname = 'original';
  originaldrv = 'A:\TEST';
var
  com : string[128];
  pathstr : string;
begin
    com := getenv ('cmdline');
      begin
      if com = originalname then
        writeln ('original program name')
       else writeln ('this program has been renamed');
  getdir (0,pathstr);
      if pathstr = originaldrv then writeln ('original program')
       else writeln ('this program is a clone');
readln;
end;
end.