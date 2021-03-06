ctl-opt option(*srcstmt) dftactgrp(*no);
dcl-s charvar char(30) inz;
dcl-s tsvar timestamp inz;
dcl-s datevar date inz;
dcl-s timevar time inz;
dcl-s numvar zoned(30) inz;

//‚Compiler directive..
exec sql set option commit = *none
,datfmt = *iso;
//‚Main line..
//‚using set to assign system values...
exec sql set :charvar = session_user;
dsply ('session user is ' + %trim(charvar));
//‚Or, using values...
exec sql values now() into :tsvar;
dsply ('timestamp is ' + %char(tsvar));
exec sql set :datevar = current date - 5 days;
dsply ('date is ' + %char(datevar));
exec sql set :charvar = varchar_format(current date,'YYYYMMDD');
dsply ('date all digits: '+ %trim(charvar));
exec sql set :charvar = char(current date - 5 days, iso);
dsply ('date in charvar: ' + %trim(charvar));
exec sql values current time into :timevar;
dsply ('time in timevar: ' + %char(timevar));
exec sql values varchar_format(current timestamp,'HH24MISS')
into :charvar;
dsply ('time in timevar: ' + %trim(charvar));
exec sql set :charvar = current client_wrkstnname;
dsply ('client workstation: ' + %trim(charvar));
exec sql set :charvar = current client_programid;
dsply ('program ID: ' + %trim(charvar));
exec sql set :charvar = current schema;
dsply ('Schema: ' + %trim(charvar));
exec sql set :charvar = current server;
dsply ('Server: ' + %trim(charvar));
exec sql set :numvar = current timezone;
dsply ('timezone: ' + %char(numvar));

*inlr = *on;
