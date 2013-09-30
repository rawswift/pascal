program testpro;
uses crt;
const
  pass = 'exit';
procedure enter;
  begin
    gotoxy (29,13);textcolor (white+blink);write ('enter password : ');
  end;
var
  ans, ans2, ans3, ans4 : char;
  answer : string;
begin
 textbackground (blue);
 textcolor (white);
 repeat
  clrscr;
  enter;
  ans := readkey;
  textcolor (black);write ('*');
  enter;
  ans2 := readkey;
  textcolor (black);write ('**');
  enter;
  ans3 := readkey;
  textcolor (black);write ('***');
  enter;
  ans4 := readkey;
  textcolor (black);write ('****');
answer := (ans + ans2 + ans3 + ans4);
until answer = pass;
clrscr;
gotoxy (35,12);textcolor (lightgreen);writeln ('very good');
readln;
end.
