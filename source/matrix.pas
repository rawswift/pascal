unit Matrix;

interface   { INTERFACE }

 type
  tsv = array[0..79, 0..24] of word;
  psv = ^tsv;

 var
  x, y : byte;
  wmin, wmax : word;
  videomem : psv;
  savedscr : tsv;

  function upper(str : string) : string;  { UPPER('STRING') }

  function incstr(str : string; count : integer) : string;  { INCSTR('STRING') }

  function decstr(str : string; count : integer) : string;  { DECSTR('STRING') }

  procedure nocur;  { NOCUR; - disable cursor }

  procedure oncur;  { ONCUR; - enable cursor }

  procedure disable; { DISABLE - disable interrupts }

  procedure enable;  { ENABLE - enable interrupts }

  procedure call(theint : pointer); { CALL(int08) - call the save interrupt }


implementation  { IMPLEMENTATION }


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

  function incstr(str : string; count : integer) : string;
   var
    thechar : char;
    thestr : string;
    thelength : integer;
     begin
      thelength := length(str);
       thestr := '';
      repeat
        move(str[1], thechar, 1);
          inc(thechar, count);
         thestr := thestr + thechar;
         delete(str, 1, 1);
        thelength := thelength - 1;
      until thelength = 0;
       incstr := thestr;
     end;

  function decstr(str : string; count : integer) : string;
   var
    thechar : char;
    thestr : string;
    thelength : integer;
     begin
      thelength := length(str);
       thestr := '';
      repeat
        move(str[1], thechar, 1);
          dec(thechar, count);
         thestr := thestr + thechar;
         delete(str, 1, 1);
        thelength := thelength - 1;
      until thelength = 0;
       decstr := thestr;
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
    regs : registers;
     begin
      regs.ah := $01;
      regs.ch := $06;
      regs.cl := $07;
       intr($10, regs);
     end;

  procedure disable;assembler;
   asm
    CLI
   end;

  procedure enable;assembler;
   asm
    STI
   end;

 procedure call(theint : pointer);
   begin
    asm
     PUSHF
     CALL theint
    end;
   end;

end.
