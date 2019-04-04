if NAME = "DONOR_AGE" then delete;
else 
if NAME    = "IMP_DONOR_AGE"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "INCOME_GROUP" then delete;
else 
if NAME    = "IMP_INCOME_GROUP"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "NOMINAL" ;
   ORDER   = "" ;
end;
if NAME = "MONTHS_SINCE_LAST_PROM_RESP" then delete;
else 
if NAME    = "IMP_MONTHS_SINCE_LAST_PROM_RESP"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "REP_SES" then delete;
else 
if NAME    = "IMP_REP_SES"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "NOMINAL" ;
   ORDER   = "" ;
end;
if NAME = "REP_URBANICITY" then delete;
else 
if NAME    = "IMP_REP_URBANICITY"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "NOMINAL" ;
   ORDER   = "" ;
end;
if NAME = "WEALTH_RATING" then delete;
else 
if NAME    = "IMP_WEALTH_RATING"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "NOMINAL" ;
   ORDER   = "" ;
end;
