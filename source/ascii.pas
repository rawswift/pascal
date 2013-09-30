program ASCII_code;
uses crt, dos;
var
 thefile : text;
 file_name : string;
 count : integer;
begin
 file_name := paramstr(1);
  if file_name = '' then
   begin
    writeln('Required parameter missing');
    halt;
   end;
  assign(thefile, file_name);
   rewrite(thefile);
    writeln(thefile, 'ASCII codes');
    for count := 1 to 255 do
     begin
      writeln(thefile, count,'  ',chr(count));
     end;
   close(thefile);
 writeln('...done');
end.

