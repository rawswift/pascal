program Bubble_sort;
uses crt;
var
 num : array[1..10] of integer;
 i, count : integer;
 a, b, c : integer;
 thechar : char;
begin
clrscr;
repeat
 randomize;
 textcolor(lightgreen);writeln('This numbers will be sorted...');
 textcolor(lightgray);
 writeln;
  for i := 1 to 10 do
   begin
    num[i] := random(11);
    write(num[i],' ');
   end;
  readln;
  writeln;
  for count := 1 to 9 do
   begin
    for i := 1 to 9 do
     begin
      a := num[i];
      b := num[i+1];
      c := num[i];
       if a > b then
        begin
         a := b;
         b := c;
        end;
         num[i] := a;
         num[i+1] := b;
     end;
  end;
 textcolor(lightgreen);writeln('...and the sorted numbers');
 textcolor(lightgray);
 writeln;
 for count := 1 to 10 do
  begin
   write(num[count],' ');
  end;
  writeln;
  writeln;
  write('...another [');textcolor(yellow+blink);write('y');
  textcolor(lightgray);write('/');textcolor(yellow+blink);write('n');
  textcolor(lightgray);write('] : ');
   repeat
    thechar := readkey;
   until (upcase(thechar) = 'Y') or (upcase(thechar) = 'N');
    write(thechar);
    writeln;
    writeln;
    writeln;
 until upcase(thechar) = 'N';
end.
