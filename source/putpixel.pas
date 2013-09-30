program testpro;
uses crt, graph;
var
 gd, gm : integer;
begin
  gd := cga;
  gm := cgahi;
  initgraph( gd, gm, 'c:\pascal7\*.bgi');
 randomize;
 repeat
  putpixel(random(79), random(24), random(15));
 until keypressed;
end.