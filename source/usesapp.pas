program testpro;
uses app;
type
  tflashcardapp = object(tapplication)
  end;
var
  flashcardapp : tflashcardapp;
begin
  flashcardapp.init;
  flashcardapp.run;
  flashcardapp.done;
end.