   
* ;
* Defining New Variables;
* ;
Length REP_DONOR_GENDER $9;
Label REP_DONOR_GENDER='Replacement: DONOR_GENDER';
REP_DONOR_GENDER= DONOR_GENDER;
Length REP_SES $4;
Label REP_SES='Replacement: SES';
REP_SES= SES;
Length REP_URBANICITY $4;
Label REP_URBANICITY='Replacement: URBANICITY';
REP_URBANICITY= URBANICITY;
   
* ;
* Replace Specific Class Levels ;
* ;
length _UFormat200 $200;
drop   _UFORMAT200;
_UFORMAT200 = " ";
* ;
* Variable: DONOR_GENDER;
* ;
_UFORMAT200 = strip(DONOR_GENDER);
if _UFORMAT200 =  "A" then
REP_DONOR_GENDER="_UNKNOWN_";
* ;
* Variable: SES;
* ;
_UFORMAT200 = strip(SES);
if _UFORMAT200 =  "?" then
REP_SES="";
* ;
* Variable: URBANICITY;
* ;
_UFORMAT200 = strip(URBANICITY);
if _UFORMAT200 =  "?" then
REP_URBANICITY="";
