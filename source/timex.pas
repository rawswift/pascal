program timer;
uses crt, dos, macro;
type
 tsv = array[0..24, 0..79] of word;
 psv = ^tsv;
var
  svideo : tsv;
  vmem : psv;
  x, y : byte;
  wmin, wmax : word;
  hour, min, sec, sec100 : word;
  echo01, echo02, echo03 : string;
begin
 writeln(decrypt('nƒ‡’F:g{}Œ‰‚{Œ~:‰€‘{ŒF:]‰Š“Œƒ‚:KSSR:G:KSSS:|“:^{‡{:cˆ}H', 26));
   x := wherex;
   y := wherey;
    wmin := windmin;
    wmax := windmax;
     vmem := ptr($B800, 0);
    svideo := vmem^;
    nocur;
     textbackground(lightblue);
      window(29, 10, 43, 14);
     clrscr;
     textbackground(black);
      window(30, 11, 42, 13);
     clrscr;
     repeat
      gettime(hour, min, sec, sec100);
       if hour = 13 then hour := 1; if hour = 14 then hour := 2;
       if hour = 15 then hour := 3; if hour = 16 then hour := 4;
       if hour = 17 then hour := 5; if hour = 18 then hour := 6;
       if hour = 19 then hour := 7; if hour = 20 then hour := 8;
       if hour = 21 then hour := 9; if hour = 22 then hour := 10;
       if hour = 23 then hour := 11; if hour = 24 then hour := 12;
          if hour < 10 then echo01 := ' ' else echo01 := '';
          if min < 10 then echo02 := ':0' else echo02 := ':';
          if sec < 10 then echo03 := ':0' else echo03 := ':';
        gotoxy(2, 2);textcolor(lightgreen);write(echo01,hour,echo02,min,echo03,sec,':',sec100);
     until keypressed;
  vmem^ := svideo;
   window(lo(wmin)+1, hi(wmin)+1, lo(wmax)+1, hi(wmax)+1);
   oncur;
    gotoxy(x, y);
end.