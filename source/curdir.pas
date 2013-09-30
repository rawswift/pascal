program currentdir;
uses crt;
var
 curdir : string;
begin
  getdir(0, curdir);
  writeln('The current directory is ',curdir);
end.