unit Macro;
interface
  function upper(str : string) : string;
  function crypt(str2 : string; count : integer) : string;
  function decrypt(str3 : string; countx : integer) : string;
  procedure nocur;
  procedure oncur;
implementation
 uses crt, dos;
  function upper(str : string) : string;
   var
     thechar : char;
     thestr : string;
     thelength : integer;
    begin
      thelength := length(str);
       thestr := '';
      repeat
        move(str[1], thechar, 1);
         thestr := thestr + upcase(thechar);
         delete(str, 1, 1);
        thelength := thelength - 1;
      until thelength = 0;
     upper := thestr;
    end;
  function crypt(str2 : string; count : integer) : string;
   var
    thechar2 : char;
    thestr2 : string;
    thelength2 : integer;
     begin
      thelength2 := length(str2);
       thestr2 := '';
      repeat
        move(str2[1], thechar2, 1);
          inc(thechar2, count);
         thestr2 := thestr2 + thechar2;
         delete(str2, 1, 1);
        thelength2 := thelength2 - 1;
      until thelength2 = 0;
       crypt := thestr2;
     end;
  function decrypt(str3 : string; countx : integer) : string;
   var
    thechar3 : char;
    thestr3 : string;
    thelength3 : integer;
     begin
      thelength3 := length(str3);
       thestr3 := '';
      repeat
        move(str3[1], thechar3, 1);
          dec(thechar3, countx);
         thestr3 := thestr3 + thechar3;
         delete(str3, 1, 1);
        thelength3 := thelength3 - 1;
      until thelength3 = 0;
       decrypt := thestr3;
     end;
  procedure nocur;
   var
    regs : registers;
     begin
      regs.ah := $01;
      regs.ch := $20;
      regs.cl := $20;
       intr($10, regs);
     end;
  procedure oncur;
   var
    regx : registers;
     begin
      regx.ah := $01;
      regx.ch := $06;
      regx.cl := $07;
       intr($10, regx);
     end;
end.
