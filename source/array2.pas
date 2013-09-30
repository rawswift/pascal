program two_dimensional_array;
uses crt;
var
  names : array[1..5, 1..5] of string[20];
  c1, c2, count : integer;
begin
   clrscr;
    c1 := 0;
    c2 := 0;
   repeat
    c1 := c1 + 1;
    c2 := c2 + 1;
    write('Enter a first name : ');
    readln(names[c1, c2]);
    c2 := c2 + 1;
    write('Enter a last name  : ');
    readln(names[c1, c2]);
  until c2 = 10;
  writeln;
    c1 := 0;
    c2 := 0;
   for count := 1 to 5 do
    begin
     c1 := c1 + 1;
     c2 := c2 + 1;
      write(names[c1, c2],', ');
     c2 := c2 + 1;
      writeln(names[c1, c2]);
       writeln;
    end;
readln;
end.
