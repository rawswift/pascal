program test_window;
uses crt;
type
 scr = array[0..79, 0..24] of word;
 mem = ^scr;
var
 x, y : byte;
 wmin, wmax : word;
 videomem : mem;
 savedscr : scr;
 first_name, last_name : string;
 mid_name : string[1];
procedure save_em(thechar : char);
  begin
  if thechar = 'c' then
   begin
    x := wherex;
    y := wherey;
     wmin := windmin;
     wmax := windmax;
      videomem := ptr($B800, 0);
     savedscr := videomem^;
    end else
     if thechar = 'm' then
      begin
        x := wherex;
        y := wherey;
         wmin := windmin;
         wmax := windmax;
          videomem := ptr($B000, 0);
         savedscr := videomem^;
      end;
 end;
procedure restore_em;
 begin
  videomem^ := savedscr;
   window(lo(wmin)+1, hi(wmin)+1, lo(wmax)+1, hi(wmax)+1);
  gotoxy(x, y);
 end;
procedure cursor;
 var
  key : char;
  stop : boolean;
 begin
 stop := false;
 repeat
  key := readkey;
  case key of
      #0:
      begin
        key:=ReadKey;
        case key of
          #72 : gotoxy(wherex,wherey-2);   {up}
          #75 : gotoxy(wherex-1,wherey);   {left}
          #77 : gotoxy(wherex+1,wherey);   {right}
          #80 : gotoxy(wherex,wherey+2);   {down}
          #83 : begin delline; gotoxy(1,wherey); end;                { Del }
          #71 : gotoxy(1,wherey);
        end;
      end;
       #13 : begin writeln; writeln; end;
       #27 : stop := true; {Esc}
    else
      Write(key);
    end;
  until stop;
 end;
begin
  save_em('c');
   textbackground(blue);
    window(20, 07, 58, 18);
   clrscr;
   textbackground(black);
    window(21, 08, 57, 17);
   clrscr;
   gotoxy(3, 2);textcolor(yellow);write('First name  : ');
   gotoxy(3, 4);textcolor(yellow);write('Last name   : ');
   gotoxy(3, 6);textcolor(yellow);write('Middle name : ');
   textbackground(black);
    window(37, 09, 56, 13);
    clrscr;
    cursor;
  restore_em;
end.








