{ Do not run this program }
program accesslog;
uses dos;
var
  logfile : text;
  hours, minutes, seconds, hundredths,
  year, month, day, dayofweek : word;
begin
  gettime (hours, minutes, seconds, hundredths);
  getdate (year, month, day, dayofweek);
  assign(logfile, 'LOGFILE.DAT');
  rewrite(logfile);
   append(logfile);
     writeln(logfile, 'The Computer was last been access : ');
     writeln(logfile, ' Time ');
     writeln(logfile, hours,':',minutes,':',seconds);
     writeln(logfile , ' Date ');
     writeln(logfile, month ,'-',day ,'-',year);
       close(logfile);
end