program temppro;
uses crt;
var
   kill : string;
   preccom : integer;
   precexe : integer;
   thefile : file;
   i : integer;
procedure proc;
   var
      resp : char;
   begin
     writeln('The file to be kill is an executable');
     writeln('are you sure you want to delete the file (y/n) :');
     repeat
     resp := readkey;
     until (upcase(resp) = 'Y') or (upcase(resp) = 'N');
      if (upcase(resp) = 'Y') then
        begin
         writeln ('the file is delete');
        end else if (upcase(resp) = 'N') then
          begin
           halt;
          end;
   end;
begin
   for i := 1 to paramcount do writeln(paramstr(i));
   kill := (paramstr(i));
   preccom := pos('com', kill);
   precexe := pos('exe', kill);
if (preccom = 0) and (precexe = 0) then
   begin
   writeln('the file has been deleted');
   end else
   begin
   proc;
   end;
end.