program copy_pro;
uses crt;
var
  char1, char2, char3, char4, char5, char6 : string[1];
  str, s : string;
begin
  str := 'sixchr';
    char1 := copy(str, 1, 1);
      delete(str, 1, 1);
    char2 := copy(str, 1, 1);
      delete(str, 1, 1);
    char3 := copy(str, 1, 1);
      delete(str, 1, 1);
    char4 := copy(str, 1, 1);
      delete(str, 1, 1);
    char5 := copy(str, 1, 1);
      delete(str, 1, 1);
    char6 := copy(str, 1, 1);
  s := char1+char2+char3+char4+char5+char6;
   writeln(s);
   readln;
end.

