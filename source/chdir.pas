program testpro;
begin
{$i-}
 chdir('A:\');
  if ioresult <> 0 then writeln('Not ready reading drive A');
{$i+}
end.