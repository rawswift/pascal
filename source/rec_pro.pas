program FINAL_PRO;
uses crt, dos;
const
  filename = 'data.rec';
type
 rec = record
     stud_num : integer;
     first_name : string;
     last_name : string;
     deleted : boolean;
   end;

var
 data : rec;
 array_of_data : array[1..100] of rec;
 thefile : file of rec;
 back_up_file : file of rec;
 choice, correct, another, create : char;
 count, i, ix : integer;
 found : boolean;
 delete_em : char;
 delete_this, undelete_this : integer;
 array_01, array_02, array_save : rec;

procedure prompt_menu;
 var
  edit_this : integer;
  find_this : integer;
  deleted_count : integer;

 begin
  writeln;
  writeln('(1)  Add');
  writeln('(2)  Edit');
  writeln('(3)  Browse');
  writeln('(4)  Find');
  writeln('(5)  Delete');
  writeln('(6)  Undelete');
  writeln('(7)  Sort');
  writeln('(8)  Pack');
  writeln('(9)  Exit');
 writeln;
  write('Your choice ? : ');
   repeat
    choice := readkey;
   until ((choice) = '1') or ((choice) = '2') or ((choice) = '3')
          or ((choice) = '4') or ((choice) = '5') or ((choice) = '6')
          or ((choice) = '7') or ((choice) = '8') or ((choice) = '9');

    writeln;


     case choice of

        '1' :   begin

                 seek(thefile, filesize(thefile));

                 repeat
                  repeat

                   writeln;
                   writeln;
                   write('Student no. : ');
                   readln(data.stud_num);
                   writeln;
                   write('First name  : ');
                   readln(data.first_name);
                   writeln;
                   write('Last name  : ');
                   readln(data.last_name);

                      writeln;
                      write('...are all data correct ? [y/n] : ');
                       repeat
                         correct := readkey;
                       until (upcase(correct) = 'Y') or (upcase(correct) = 'N');

                  until upcase(correct) = 'Y';

                        data.deleted := false;
                         write(thefile, data);

                      writeln;
                      writeln;
                      write('...another ? [y/n] : ');
                       repeat
                         another := readkey;
                       until (upcase(another) = 'Y') or (upcase(another) = 'N');

                 until upcase(another) = 'N';

                end;
        '2' :   begin

                repeat
                 writeln;
                 writeln;
                 write('Student no. : ');
                 readln(edit_this);

                   seek(thefile, 0);

                    while (not eof(thefile)) and (not found) do
                     begin
                      read(thefile, data);
                       if data.stud_num =  edit_this then
                        begin
                         found := true;
                         writeln;
                          gotoxy(1, wherey);write(data.stud_num);
                          gotoxy(10, wherey);write(data.last_name);
                          gotoxy(30, wherey);write(data.first_name);
                         writeln;
                        end;
                     end;

                     if found then
                      begin

                       repeat

                         writeln;
                         write('Student no. : ');
                         readln(data.stud_num);
                         writeln;
                         write('First name  : ');
                         readln(data.first_name);
                         writeln;
                         write('Last name  : ');
                         readln(data.last_name);
                         writeln;

                         write('...are all data correct ? [y/n] : ');
                          repeat
                            correct := readkey;
                          until (upcase(correct) = 'Y') or (upcase(correct) = 'N');

                       until upcase(correct) = 'Y';

                             seek(thefile, count - 1);
                              data.deleted := false;
                               write(thefile, data);

                      end else
                       begin
                        writeln;
                        writeln(edit_this,' is not found');
                       end;

                    writeln;writeln;
                    write('...another ? [y/n] : ');

                      repeat
                        another := readkey;
                      until (upcase(another) = 'Y') or (upcase(another) = 'N');

                until upcase(another) = 'N';

                end;

        '3' :   begin

                 writeln;
                 count := 0;
                 deleted_count := 0;

                  while not eof(thefile) do
                   begin
                    read(thefile, data);
                    if not data.deleted then
                     begin
                      inc(count, 1);
                      writeln;
                       gotoxy(1, wherey);write(data.stud_num);
                       gotoxy(10, wherey);write(data.first_name);
                       gotoxy(30, wherey);write(data.last_name);
                      writeln;
                     end else
                      begin
                       inc(deleted_count, 1);
                      end;

                   end;

                   writeln;
                   writeln(count,' record found');
                   writeln;
                   if deleted_count > 0 then
                     begin
                       writeln(deleted_count,' record(s) has been previously deleted');
                       writeln;
                     end;

                end;

        '4' :   begin

                 writeln;
                 writeln;
                 write('Student no. : ');
                 readln(find_this);

                  seek(thefile, 0);
                  found := false;
                   while (not eof(thefile)) and (not found) do
                    begin
                     read(thefile, data);
                       if data.stud_num = find_this then
                        begin
                         found := true;
                          gotoxy(1, wherey);write(data.stud_num);
                          gotoxy(10, wherey);write(data.last_name);
                          gotoxy(30, wherey);write(data.first_name);
                           writeln;
                        end;
                    end;

                      if not found then
                       begin
                        writeln;
                        writeln(find_this,' is not found');
                       end;

                end;

        '5' :   begin

                 writeln;
                 write('Student no. : ');
                 readln(delete_this);

                  count := 0;

                   while (not eof(thefile)) and (not found) do
                    begin
                     inc(count, 1);
                      read(thefile, data);
                       if data.stud_num = delete_this then
                        begin
                         found := true;
                          gotoxy(1, wherey);write(data.stud_num);
                          gotoxy(10, wherey);write(data.last_name);
                          gotoxy(30, wherey);write(data.first_name);
                           writeln;
                        end;
                    end;

                      if found then
                       begin
                        writeln;
                        write('...delete the record ? [y/n] : ');
                         repeat
                          delete_em := readkey;
                         until (upcase(delete_em) = 'Y') or (upcase(delete_em) = 'N');

                           if upcase(delete_em) = 'Y' then
                             begin
                              seek(thefile, count - 1);
                               data.deleted := true;
                                write(thefile, data);
                             end;

                       end else
                        begin
                         writeln;
                         writeln(delete_this,' is not found');
                        end;

                end;

        '6' :   begin

                repeat

                 seek(thefile, 0);

                 deleted_count := 0;

                 while not eof(thefile) do
                   begin
                    read(thefile, data);
                    if data.deleted then
                     begin
                      inc(deleted_count, 1);
                      writeln;
                       gotoxy(1, wherey);write(data.stud_num);
                       gotoxy(10, wherey);write(data.first_name);
                       gotoxy(30, wherey);write(data.last_name);
                      writeln;
                     end;

                   end;

                 writeln;
                 writeln(deleted_count,' previously deleted record(s)');
                 writeln;
                 write('Undelete Student no. : ');
                 readln(undelete_this);

                   seek(thefile, 0);
                   count := 0;

                    while (not eof(thefile)) and (not found) do
                     begin
                     inc(count, 1);
                      read(thefile, data);
                       if data.stud_num =  undelete_this then
                        begin
                         found := true;
                         writeln;
                        end;
                     end;

                       if found then
                        begin
                         seek(thefile, count - 1);
                          data.deleted := false;
                           write(thefile, data);
                            writeln(undelete_this,' ...undeleted');
                        end else
                         begin
                          writeln;
                          writeln(undelete_this,' is not in the recyle bin');
                         end;

                    writeln;
                    writeln;
                    write('...undelete another record ? [y/n] : ');
                     repeat
                      another := readkey;
                     until (upcase(another) = 'Y') or (upcase(another) = 'N');

                until upcase(another) = 'N';

                end;


        '7' :   begin

                 assign(back_up_file, 'data.bak');
                  rewrite(back_up_file);
                    seek(thefile, 0);
                     while not eof(thefile) do
                      begin
                       read(thefile, data);
                       write(back_up_file, data);
                      end;

                       close(back_up_file);

                    seek(thefile, 0);
                     count := 0;

                     while not eof(thefile) do
                       begin
                        inc(count, 1);
                         read(thefile, array_of_data[count]);
                       end;

                   dec(count, 1);

                    for i := 1 to count do
                     begin
                       for ix := 1 to count do
                        begin
                         array_01 := array_of_data[ix];
                         array_02 := array_of_data[ix+1];
                         array_save := array_of_data[ix];

                          if array_01.stud_num > array_02.stud_num then
                           begin
                            array_of_data[ix] := array_02;
                            array_of_data[ix+1] := array_save;
                           end;
                        end;
                     end;

                      seek(thefile, 0);
                       inc(count, 1);

                      for i := 1 to count do
                       begin
                         write(thefile, array_of_data[i]);
                       end;

                 writeln;
                 writeln;
                 writeln('...record(s) has been sorted');

                end;

        '8' :   begin
                end;

        '9' :   begin
                end;

        end;

 end;

procedure init_file;
 begin
  assign(thefile, filename);
   {$I-}
    reset(thefile);
     if ioresult <> 0 then
      begin
       writeln;
       writeln('Error');
       writeln;
       writeln(filename,' is not found');
       writeln;
       write('...create the said file [y/n] : ');
        repeat
         create := readkey;
        until (upcase(create) = 'Y') or (upcase(create) = 'N');

          if upcase(create) = 'Y' then
           begin
            rewrite(thefile);
           end else
            begin
             writeln;
             halt;
            end;

      end;

  {$I+}
  writeln;

 end;


begin

 init_file;

 prompt_menu;

 close(thefile);

 writeln;
 writeln;
 writeln('...done');

end.

