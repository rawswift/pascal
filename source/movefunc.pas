program move_pro;
uses crt;
var
 str : string;
 char1, char2, char3, char4, char5, char6 : char;
function movex(str : string) : char;
 var
  charx : char;
  begin
    move(str[1], charx, 1);
    movex := charx;
  end;
begin
 clrscr;
  str := 'abcdef';
  writeln(str);
    writeln(movex(str));
     delete(str, 1, 1);
    writeln(movex(str));
     delete(str, 1, 1);
    writeln(movex(str));
     delete(str, 1, 1);
    writeln(movex(str));
     delete(str, 1, 1);
    writeln(movex(str));
     delete(str, 1, 1);
    writeln(movex(str));
 readln;
end.