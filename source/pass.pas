program testpro;
uses dos, crt;
const
  pass = 'exit';
var
  cdir, ans : string;
begin
  getdir (0,cdir);
repeat
  write (cdir,'>');
  readln (ans);
  writeln ('Bad command or file name');
  writeln;
until ans = pass;
end.
