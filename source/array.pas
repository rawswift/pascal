program simple_array;
uses crt;
var
  firstname : array[1..5] of string[20];
  count : integer;
begin
 clrscr;
 count := 0;
  repeat
  count := count + 1;
   write(count,' Enter your first name : ');
   readln(firstname[count]);
  until count = 5;
writeln;
 for count := 1 to 5 do
  begin
   writeln(firstname[count],' is array no. ',count,' with a length of ',length(firstname[count]),' characters.');
   writeln;
  end;
readln;
end.
