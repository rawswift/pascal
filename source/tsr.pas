{$S-}
{$M 3072, 0, 512}
program TSR_pro;
uses crt, dos;
type
 tsavedvideo = array[0..24, 0..79] of word;
 psavedvideo = ^tsavedvideo;
type
 string8 = string[8];
const
 idstr1 : string8 = 'TP7RTSR';
 idstr2 : string8 = 'TSRInUse';
var
 cpuregisters : registers;
 cursorstartline : byte;
 cursorendline : byte;
 diskinuse : word;
 madeactive : boolean;
 oursp : word;
 ourss : word;
 pint09 : pointer;
 pint12 : pointer;
 pint1b : pointer;
 pint24 : pointer;
 pint28 : pointer;
 pint1c : pointer;
 pindosflag : ^word;
 videomem : psavedvideo;
 savedvideo : tsavedvideo;
 savedwindmin : word;
 savedwindmax : word;
 savedss, savedsp : word;
 savedx, savedy : word;
 tempptr : pointer;
 tsrinuse : boolean;
procedure savedisplay;
var
 cursorlines : byte;
  begin
   savedx := wherex;
   savedy := wherey;
    savedwindmin := windmin;
    savedwindmax := windmax;
   with cpuregisters do
    begin
     ah := $03;
     bh := 0;
      intr($10, cpuregisters);
       cursorstartline := ch;
       cursorendline := cl;
    end;
   intr($11, cpuregisters);
    if ((cpuregisters.ax shr 4) and 7) = 3 then
     begin
      videomem := ptr($B000, 0);
       cursorlines := 15;
     end else
      begin
       videomem := ptr($B800, 0);
       cursorlines := 7;
      end;
    savedvideo := videomem^;
     with cpuregisters do
      begin
       ah := $01;
       ch := 0;
       cl := cursorlines;
        intr($10, cpuregisters);
      end;
end;
procedure restoredisplay;
 begin
  videomem^ := savedvideo;
   with cpuregisters do
    begin
     ah := $01;
     ch := cursorstartline;
     cl := cursorendline;
      intr($10, cpuregisters);
    end;
     window (lo(savedwindmin)+1, hi(savedwindmin)+1,
             lo(savedwindmax)+1, hi(savedwindmax)+1);
     gotoxy(savedx, savedy);
 end;
procedure trapcriticalerrors;
  assembler;
   asm
    IRET
   end;
procedure cbreakcheack;
 assembler;
  asm
   IRET
  end;
function getkey : integer;
 var
  ch : char;
   begin
    repeat
     asm
      int$28
     end;
    until keypreesed;
     ch := readkey;
      if ord(ch) <> 0 then
       getkey := ord(ch)
        else
         getkey := ord(readkey) + 256;
   end;
procedure dopopupfunction;
 const
  upperleftx = 10;
  upperlefty = 5;
  lowerleftx = 70;
  lowerrighty = 20;

























