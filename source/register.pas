program Yonzonsetup;
uses dos, crt;
const ORO = '123';
var
  RO : string;
  todir : string;
  thefile : text;
  attr : word;
begin
  clrscr;
  gotoxy(33,12);textcolor(lightgreen);write ('Registry No. : ');
  textcolor(lightgray);readln(RO);
    if RO <> ORO then
      begin
        clrscr;
        gotoxy(33,12);textcolor(lightgray);writeln ('Invalid Registry Number');
        delay(3000);
        clrscr;
        halt(1);
      end else
         if RO = ORO then
           begin
             clrscr;
             gotoxy(24,12);textcolor(lightgreen);write ('Register to directory : ');
             textcolor(lightgray);readln(todir);
             assign(thefile, 'YTIME.EXE');
             getfattr(thefile, attr);
             setfattr(thefile, attr-archive);
           {$i-}
             rename(thefile, todir+'\'+'YTIME.EXE');
             if ioresult <> 0 then
               begin
                clrscr;
                gotoxy(33,12);textcolor(lightgray);writeln('Invalid directory');
               end;
           {$i+}
           end;
clrscr;
textbackground(lightblue);textcolor(white);textcolor(lightcyan);writeln ('Thank you for purchasing ytime(R)');
writeln;
writeln ('For any questions or comment, do send us a letter or call our');
writeln ('Telephone Hot Line : 4809004');
textbackground(black);textcolor(lightgray);writeln('ÿ');
end.
