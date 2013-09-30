program viruspro;
uses crt;
var
  buffer : array[1..4704] of byte;
  thefile, thecopy : file;
  nof : string;
  todele, rec, count : integer;
begin
  nof := paramstr(0);
  repeat
    todele := pos('\', nof);
    delete(nof, 1, todele);
  until todele = 0;
    assign(thefile, nof);
    assign(thecopy, 'thecopy.vir');
    rewrite(thecopy, 1);
     reset(thefile, 1);
      blockread(thefile, buffer, sizeof(buffer), rec);
       count := 1;
       repeat
           blockwrite(thecopy, buffer, rec);
           blockread(thefile, buffer, sizeof(buffer), rec);
           count := count - 1;
       until count = 0;
         close(thefile);
         close(thecopy);
end.