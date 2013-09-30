program pointer_pro;
uses crt;
type
  st4 = string[4];
var
  i : ^integer;
function wordtohex(w : word) : st4;
var
  hexstr : st4;
   function translate(b : byte) : char;
    begin
      if b < 10 then
        translate := chr(b + 48)
      else
        translate := chr(b + 55);
    end;
begin
  hexstr := '';
  hexstr := hexstr + translate(hi(w) shr 4);
  hexstr := hexstr + translate(hi(w) shr 15);
  hexstr := hexstr + translate(lo(w) shr 4);
  hexstr := hexstr + translate(lo(w) shr 15);
   wordtohex := hexstr;
end;
begin
  new(i);
  i^ := 50;
  writeln('the value of str is : ', wordtohex(ofs(i)));
  writeln('the value of str points to is : ', i^);
  dispose(i);
  writeln;
  write('press enter...');
  readln;
end.



