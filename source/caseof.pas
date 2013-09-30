program testpro;
uses crt ;
var
   cdrive : string[1];
   ans : char;
begin
   clrscr;
  repeat;
   getdir (0,cdrive);
     writeln ('Data error reading drive ',cdrive);
     write ('Abort, Retry, Fail?');
   repeat
    ans := readkey;
   until ((upcase (ans) = 'A') or (upcase(ans) = 'F'))
   or (upcase(ans) = 'R') or (upcase(ans) = 'X');
   writeln;
case (ans) of
'A' : begin
       write ('a');
       writeln;
      end;
'R' : begin
       write ('r');
       writeln;
      end;
'F' : begin
       write ('f');
       writeln;
      end;
end;
writeln;
until (upcase(ans)) = 'X';
end.