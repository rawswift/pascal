program Encrypt_Decrypt;

uses crt, dos, matrix;
type
 rec = record
   element : char;
   file_pos : integer;
  end;

var
 thefile : text;
 open_the_file : file of char;
 data : rec;
 file_of_rec : file of rec;
 last_file : text;
 count : integer;
 param01, param02 : string;
 bufferx : string[7];
 thechar : char;
 stop : boolean;
 esc : boolean;
 the_same : boolean;
 pass : string;
 confirm : string;
 size : longint;

procedure name;
 begin
  writeln('RAGE(r), Damage Software, Copyright by SmartSoft Co.');
  writeln;
 end;

procedure help;
 begin
  name;
   writeln('    Usage :');
   writeln;
   writeln('            RAGE < file name > < option >');
   writeln;
   writeln('    Option : ');
   writeln;
   writeln('            ENC     Encrypt a file');
   writeln;
   writeln('            DEC     Decrypt a file');
   writeln;
 end;

procedure fx(str : string);
 begin
  writeln;
  writeln;
  write('...',str,'  - ');
   nocur;
  for count := 1 to 100 do
   begin
    delay(50);
     gotoxy(19, wherey);write(count,'%');
   end;
 end;


procedure get_pass;
 var
  six : boolean;
 begin

  the_same := false;

while not the_same do
 begin
  six := false;

 while not six do
  begin
  writeln;
  write('Password : ');
  stop := false;
  esc := false;
  pass := '';
  count := 0;

   while (not stop) and (not esc) do
    begin
     thechar := readkey;
       if thechar = #13 then
        begin
         stop := true;
        end else if thechar = #27 then
         begin
          esc := true;
         end else
          begin
           inc(thechar, 11);
           pass := pass + thechar;
            write('*');
             inc(count, 1);
          end;
    end;

   if esc then
    begin
     writeln;
     writeln;
     writeln('Program Terminated by User');
     halt;
    end;

     if count = 6 then
      begin
       six := true;
      end else
       begin
        writeln;
        writeln;
        writeln('Password requires 6 characters');
       end;

  end;


  writeln;
  write('Confirm  : ');
  stop := false;
  esc := false;
  confirm := '';
   while (not stop) and (not esc) do
    begin
     thechar := readkey;
       if thechar = #13 then
        begin
         stop := true;
        end else if thechar = #27 then
         begin
          esc := true;
         end else
          begin
           inc(thechar, 11);
           confirm := confirm + thechar;
            write('*');
          end;
    end;

   if esc then
    begin
     writeln;
     writeln;
     writeln('Program Terminated by User');
     halt;
    end;

    if pass = confirm then
      begin
       the_same := true;
      end else
       begin
        writeln;
        writeln;
        writeln('Password do not match');
       end;

 end;

 end;

procedure test_pass;
 begin

  writeln;
  write('Password : ');
   while (not stop) and (not esc) do
    begin
     thechar := readkey;
      if thechar = #13 then
       begin
        stop := true;
       end else if thechar = #27 then
        begin
         esc := true;
        end else
         begin
           inc(thechar, 11);
          pass := pass + thechar;
           write('*');
         end;
    end;

      if esc then
       begin
        writeln;
        writeln;
        writeln('Program is terminated by user');
        halt;
       end;

 end;

procedure encrypt_file;
 begin
   name;

    get_pass;

      close(open_the_file);

         fx('encrypting');

     writeln;
     writeln;
     write('Writing');

       assign(thefile, param01);
        reset(thefile);
             write('.');
          assign(file_of_rec, '$$$$$$$$.$$$');
            rewrite(file_of_rec);
             write('.');
              count := 0;

            while not eof(thefile) do
             begin
              read(thefile, thechar);
              inc(thechar, 26);
               data.element := thechar;
                inc(count, 1);
                 data.file_pos := count;
                  write(file_of_rec, data);
             end;

             write('.');
               close(thefile);
                erase(thefile);
             write('.');
               close(file_of_rec);
                rename(file_of_rec, param01);

             write('.');
                  assign(open_the_file, param01);
                   reset(open_the_file);
             write('.');
                    assign(thefile, '$$$$$$$$.$$$');
                     rewrite(thefile);
                      write(thefile, 'RAGE(r)');
             write('.');
                       seek(open_the_file, 0);

                    while not eof(open_the_file) do
                      begin
                        read(open_the_file, thechar);
                        write(thefile, thechar);
                      end;
             write('.');
                        write(thefile, confirm);
                         close(open_the_file);
                          erase(open_the_file);
             write('.');
                         close(thefile);
                          rename(thefile, param01);
             write('.');
                           writeln('done');
                           writeln;
                            writeln(upper(param01) ,' is Encrypted');
                             oncur;

 end;

procedure decrypt_file;
 begin
   name;

     test_pass;

      seek(open_the_file, filesize(open_the_file) - 6);
        while not eof(open_the_file) do
          begin
           read(open_the_file, thechar);
             confirm := confirm + thechar;
          end;

            if pass <> confirm then
             begin
              writeln;
              writeln;
              writeln('Invalid password');
               halt;
             end;


           fx('decrypting');

            writeln;
            writeln;
            write('Writing');

             write('.');

         size := filesize(open_the_file) - 6;
          seek(open_the_file, 7);
           assign(thefile, '$$$$$$$$.$$$');
            rewrite(thefile);
             write('.');
              stop := false;
            while not eof(open_the_file) and not stop do
             begin
              read(open_the_file, thechar);
              write(thefile, thechar);
               if filepos(open_the_file) = size then
                 begin
                  stop := true;
                 end;
             end;

             write('.');
               close(open_the_file);
                erase(open_the_file);
             write('.');
               close(thefile);
                rename(thefile, param01);

             write('.');
                 assign(file_of_rec, param01);
                  reset(file_of_rec);
             write('.');
                 assign(thefile, '$$$$$$$$.$$$');
                  rewrite(thefile);

             write('.');
                   while not eof(file_of_rec) do
                     begin
                       read(file_of_rec, data);
                        thechar := data.element;
                         dec(thechar, 26);
                       write(thefile, thechar);
                     end;

             write('.');
                       close(file_of_rec);
                        erase(file_of_rec);
             write('.');
                       close(thefile);
                        rename(thefile, param01);
             write('.');
                         writeln('done');
                         writeln;
                          writeln(upper(param01) ,' is Decrypted');
                             oncur;

 end;

begin                          { MAIN }

 param01 := paramstr(1);
  if param01 = '' then
   begin
    help;
    halt;
   end;

          assign(open_the_file, param01);
            {$I-}
              reset(open_the_file);
               if ioresult <> 0 then
                begin
                 name;
                 writeln(upper(param01),' is not found');
                 halt;
                end;
             {$I+}

   param02 := paramstr(2);
     if param02 = '' then
      begin
       name;
       writeln('Required option missing');
       halt;
      end;

   if upper(param02) = 'ENC' then
    begin
      seek(open_the_file, 0);
       bufferx := '';
        for count := 1 to 7 do
         begin
          read(open_the_file, thechar);
           bufferx := bufferx + thechar;
         end;
          if bufferx = 'RAGE(r)' then
           begin
            name;
            writeln(upper(param01),' is already encrypted');
            halt;
           end else
            begin

              encrypt_file;

            end;

    end else if upper(param02) = 'DEC' then
     begin
      seek(open_the_file, 0);
       bufferx := '';
        for count := 1 to 7 do
         begin
          read(open_the_file, thechar);
           bufferx := bufferx + thechar;
         end;
          if bufferx <> 'RAGE(r)' then
           begin
            name;
            writeln(upper(param01),' is not encrypted');
            halt;
           end else
            begin

              decrypt_file;

            end;

     end else
      begin
       name;
       writeln('Invalid parameter ',upper(param02));
      end;

end.                           { MAIN }
