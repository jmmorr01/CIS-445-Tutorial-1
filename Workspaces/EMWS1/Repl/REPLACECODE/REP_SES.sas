   
* ;
* Defining: REP_SES;
* ;
Length REP_SES$4;
Label REP_SES='Replacement: SES';
REP_SES=SES;
* ;
* Variable: SES;
* ;
_UFORMAT200 = strip(SES);
if _UFORMAT200 =  "?" then
REP_SES="";
