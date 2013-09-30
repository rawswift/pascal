program create_the_file;
uses crt, dos, matrix;
var
 thefile : text;
 param1 : string;
 param2 : string;
 overwrite : char;

begin
  param1 := paramstr(1);
   if param1 = '' then
    begin
     writeln('Required parameter missing');
     halt;
    end;
  param2 := paramstr(2);
   if param2 = '' then
    begin
     writeln('Second parameter missing');
     halt;
    end;

      assign(thefile, param1);
       {$I-}
          reset(thefile);
            if ioresult = 0 then
             begin
              writeln;
              textcolor(red+blink);writeln('*** Warning ***');
              writeln;
              textcolor(lightgray);write(upper(param1),' already exist, Overwrite [y/n] : ');
                repeat
                 overwrite := readkey;
                until (upcase(overwrite) = 'Y') or (upcase(overwrite) = 'N');
                 write(overwrite);
                 writeln;
                 writeln;
                  if upcase(overwrite) = 'Y' then
                    begin
                     rewrite(thefile);
                      writeln(thefile, '///');
                      writeln(thefile, '///  Program : ',param2);
                      writeln(thefile, '///');
                      writeln(thefile, '///  Author  :   Ryan Yonzon');
                      writeln(thefile, '///');
                       close(thefile);
                         writeln(upper(param1),' is Overwriten...');
                         writeln;
                    end;
             end else
              begin
                     rewrite(thefile);
                      writeln(thefile, '///');
                      writeln(thefile, '///  Program : ',param2);
                      writeln(thefile, '///');
                      writeln(thefile, '///  Author  :   Ryan Yonzon');
                      writeln(thefile, '///');
                close(thefile);
                   writeln(upper(param1),' is Created...');
                   writeln;
              end;

       {$I+}
end.

