program test_tpu;
uses macro;
var
  str : string;
begin
   write('Enter string to decrypt : ');
   readln(str);
     writeln;
     writeln(decrypt(str, 1));
end.
