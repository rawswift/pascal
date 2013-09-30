{do not run this program}
program testpro;
uses dos;
var
 thefile : text;
begin
{$I-}
 assign (thefile, 'c:\moveme\moveme.txt');
 rename (thefile, 'c:\readme\moveme.txt');
 if ioresult <> 0 then writeln ('could not move file');
{$I+}
readln;
end.