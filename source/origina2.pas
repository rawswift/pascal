program testpro;
uses dos, crt;
const
  originalname = 'original';
  originaldrv = 'C:\';
var
  com : string[128];
  pathstr : string;
label
  renamed, terminate;
begin
    com := getenv ('cmdline');
      begin
      if com = originalname then
        writeln ('This is in it''s original program name')
       else goto renamed;
  writeln;
  writeln;
  getdir (0,pathstr);
      if pathstr = originaldrv then
       begin
         writeln ('This is the original program')
       end else
          begin
            writeln ('This program is a clone');
            writeln ('please purcase the original copy');
            writeln ('Copyright(C) Yonzon(R)')
       end; goto terminate;
end;
 renamed:
  writeln ('This program has been altered');
  writeln ('please return to it''s original');
  writeln ('file name.');writeln;writeln ('Program terminated');
 terminate:
end.