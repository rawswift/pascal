unit Macro;
interface
  function upper(str : string) : string;
  function crypt(str2 : string; count : integer) : string;
implementation
 uses crt;
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
end.
