uses crt, macro;
begin
{textcolor(red+blink);writeln('�  �');
textcolor
readln;
end.  }

clrscr;
nocur;
repeat
textcolor(random(15));
gotoxy(73, 1);writeln('�����Ŀ');
gotoxy(73, 2);writeln('�     �');
gotoxy(73, 3);writeln('�� � ��');
gotoxy(73, 4);writeln('  ���  ');
textcolor(red+blink);
gotoxy(74, 2);writeln('�   �');
until keypressed;
oncur;
end.




