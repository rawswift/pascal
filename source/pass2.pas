{$M $1000, 0, 0}
program testpro;
uses dos, crt;
const
  pass = 'exit';
var
  cdir, ans : string;
begin
 checkbreak := false;
  getdir (0,cdir);
repeat
  write (cdir,'>');
  readln (ans);
if (ans = 'cls') or (ans = 'CLS') then
  begin
    clrscr;
  end else
if (ans = 'dir') or (ans = 'DIR') then
  begin
    swapvectors;
    exec ('c:\command.com','/c dir *.*');
    swapvectors;
  end else
   writeln ('Bad command or file name');
   writeln;
until ans = pass;
end.