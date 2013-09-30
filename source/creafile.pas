{this program requires a diskette in drive a:}
program testpro;
uses dos;
var
  nof : string;
  thefile : text;
begin
  nof := 'a:\$$$$$$$$.$$$';
  assign (thefile , nof);
  {$i-}
  rewrite (thefile);
  if ioresult <> 0 then writeln ('Not ready reading drive a:')
  {$i+}
  else writeln ('shit !');
readln;
end.