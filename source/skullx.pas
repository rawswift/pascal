uses crt, macro;
begin
{textcolor(red+blink);writeln('ú  ú');
textcolor
readln;
end.  }

clrscr;
nocur;
repeat
textcolor(random(15));
gotoxy(73, 1);writeln('ÚÄÄÄÄÄ¿');
gotoxy(73, 2);writeln('³     ³');
gotoxy(73, 3);writeln('ÀÄ ³ ÄÙ');
gotoxy(73, 4);writeln('  ³³³  ');
textcolor(red+blink);
gotoxy(74, 2);writeln('ù   ù');
until keypressed;
oncur;
end.




