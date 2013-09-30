program STACK_pro;
uses crt;
type
  stack = record
    element : array[1..5] of integer;
    top : 0..5;
   end;
var
 s : stack;
 count : integer;
 y : integer;

{function empty(s : stack) : boolean;
 begin
  empty := ( s.top = 0 );
 end;}

begin
  clrscr;
  writeln;
  writeln('Maximun of 10');
  write('Enter a integer : ');
   s.top := 0;
   while not eoln do
    begin
     s.top := s.top + 1;
       if s.top > 5 then
        begin
         writeln;
         writeln('Stack Overflow');
         halt;
        end;
      read(s.element[s.top]);
    end;

    writeln;
    writeln;

   writeln('³    ³');
   writeln('³    ³');
   writeln('³    ³');
   writeln('³    ³');
   writeln('³    ³');
   writeln('³    ³');
   writeln('ÀÄÄÄÄÙ');
   writeln;

   y := 11;

   for count := 1 to s.top do
    begin
      delay(1000);
     gotoxy(8, 9);write('Pushing : ');writeln(s.element[count]);
      delay(1000);
     gotoxy(3, y);writeln(s.element[count]);
      dec(y, 1);
    end;

    delay(1000);
    gotoxy(8, 9);write('           ');

    gotoxy(1, 13);

    writeln;
    writeln;
    writeln('Press ENTER to Pop...');
    readln;
    readln;

{ while not empty(s) do
  begin}

        if s.top = 0 then
         begin
          writeln('Empty stack');
         end;

   for count := s.top downto 1 do
    begin

{     delay(1000);}
     writeln('Popping : ',s.element[count]);
{      s.top := s.top - 1;}
    end;
{  end;}

 writeln;
 writeln;
 writeln('Press ENTER...');
 readln;
end.




