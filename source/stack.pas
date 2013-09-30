program STACK_pro;
uses crt;
const
 max = 100;
type
 stack = record
   element : array[0..max] of char;
   top : 0..max;
  end;
var
 s : stack;
 i : integer;
 count : integer;
function full(s : stack) : boolean;
 begin
  full := (s.top = max);
 end;

function empty(s : stack) : boolean;
 begin
  empty := (s.top = 0);
 end;
begin
  clrscr;
  writeln;
   i := 0;
  write('Enter a word : ');


   while not full(s) and not eoln do
    begin
     read(s.element[i]);

      s.top := s.top + 1;
       inc(i, 1);

    end;

 writeln;

    dec(i, 1);

       for count := 0 to i do
        begin
         writeln('Pushing : ',s.element[count]);
        end;

      if (s.top > max) then
       begin
        writeln('Stack Overflow');
        readln;
        readln;
        halt;
       end;


  writeln;
{   dec(i, 1);}

  while not empty(s) do
   begin
    writeln('Popping : ',s.element[i]);
     s.top := s.top - 1;
      dec(i , 1);
   end;

{     for count := i downto 0 do
       begin
        writeln('Popping : ',s.element[count]);
       end;}



 writeln;
readln;
readln;
end.


