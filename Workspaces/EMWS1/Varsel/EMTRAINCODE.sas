*------------------------------------------------------------* ;
* EM: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    CARD_PROM_12(ASC) CLUSTER_CODE(ASC) FREQUENCY_STATUS_97NK(ASC) HOME_OWNER(ASC)
   IMP_INCOME_GROUP(ASC) IMP_REP_SES(ASC) IMP_REP_URBANICITY(ASC)
   IMP_WEALTH_RATING(ASC) IN_HOUSE(ASC) OPT_LIFETIME_GIFT_COUNT(ASC)
   OPT_MEDIAN_HOME_VALUE(ASC) OPT_MEDIAN_HOUSEHOLD_INCOME(ASC)
   OPT_PER_CAPITA_INCOME(ASC) OPT_RECENT_RESPONSE_PROP(ASC)
   OPT_RECENT_STAR_STATUS(ASC) OVERLAY_SOURCE(ASC) PEP_STAR(ASC)
   PUBLISHED_PHONE(ASC) RECENCY_STATUS_96NK(ASC) RECENT_CARD_RESPONSE_COUNT(ASC)
   RECENT_RESPONSE_COUNT(ASC) REP_DONOR_GENDER(ASC) TARGET_B(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* EM: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    FILE_CARD_GIFT IMP_DONOR_AGE IMP_MONTHS_SINCE_LAST_PROM_RESP
   LG10_FILE_AVG_GIFT LG10_LAST_GIFT_AMT LG10_LIFETIME_AVG_GIFT_AMT
   LG10_LIFETIME_GIFT_AMOUNT LIFETIME_CARD_PROM LIFETIME_GIFT_RANGE
   LIFETIME_MAX_GIFT_AMT LIFETIME_MIN_GIFT_AMT LIFETIME_PROM
   MONTHS_SINCE_FIRST_GIFT MONTHS_SINCE_LAST_GIFT MONTHS_SINCE_ORIGIN MOR_HIT_RATE
   NUMBER_PROM_12 PCT_ATTRIBUTE1 PCT_ATTRIBUTE2 PCT_ATTRIBUTE3 PCT_ATTRIBUTE4
   PCT_OWNER_OCCUPIED RECENT_AVG_CARD_GIFT_AMT RECENT_AVG_GIFT_AMT
   RECENT_CARD_RESPONSE_PROP
%mend DMDBVar;
*------------------------------------------------------------*;
* EM: Create DMDB;
*------------------------------------------------------------*;
libname _spdslib SPDE "C:\Users\jmmorr01\AppData\Local\Temp\SAS Temporary Files\_TD10008_COB-MBA045_\Prc2";
proc dmdb batch data=EMWS1.Trans_TRAIN
dmdbcat=WORK.EM_DMDB
maxlevel = 101
out=_spdslib.EM_DMDB
;
class %DMDBClass;
var %DMDBVar;
target
TARGET_B
;
run;
quit;
*------------------------------------------------------------* ;
* Varsel: Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INPUTS;
               CARD_PROM_12 CLUSTER_CODE FILE_CARD_GIFT FREQUENCY_STATUS_97NK HOME_OWNER
              IMP_DONOR_AGE IMP_INCOME_GROUP IMP_MONTHS_SINCE_LAST_PROM_RESP IMP_REP_SES
              IMP_REP_URBANICITY IMP_WEALTH_RATING IN_HOUSE LG10_FILE_AVG_GIFT
              LG10_LAST_GIFT_AMT LG10_LIFETIME_AVG_GIFT_AMT LG10_LIFETIME_GIFT_AMOUNT
              LIFETIME_CARD_PROM LIFETIME_GIFT_RANGE LIFETIME_MAX_GIFT_AMT
              LIFETIME_MIN_GIFT_AMT LIFETIME_PROM MONTHS_SINCE_FIRST_GIFT
              MONTHS_SINCE_LAST_GIFT MONTHS_SINCE_ORIGIN MOR_HIT_RATE NUMBER_PROM_12
              OPT_LIFETIME_GIFT_COUNT OPT_MEDIAN_HOME_VALUE OPT_MEDIAN_HOUSEHOLD_INCOME
              OPT_PER_CAPITA_INCOME OPT_RECENT_RESPONSE_PROP OPT_RECENT_STAR_STATUS
              OVERLAY_SOURCE PCT_ATTRIBUTE1 PCT_ATTRIBUTE2 PCT_ATTRIBUTE3 PCT_ATTRIBUTE4
              PCT_OWNER_OCCUPIED PEP_STAR PUBLISHED_PHONE RECENCY_STATUS_96NK
              RECENT_AVG_CARD_GIFT_AMT RECENT_AVG_GIFT_AMT RECENT_CARD_RESPONSE_COUNT
   RECENT_CARD_RESPONSE_PROP RECENT_RESPONSE_COUNT REP_DONOR_GENDER
%mend INPUTS;
proc dmine data=_spdslib.EM_DMDB dmdbcat=WORK.EM_DMDB
minr2=0.005 maxrows=3000 stopr2=0.0005 NOAOV16 NOINTER USEGROUPS OUTGROUP=EMWS1.Varsel_OUTGROUP outest=EMWS1.Varsel_OUTESTDMINE outeffect=EMWS1.Varsel_OUTEFFECT outrsquare =EMWS1.Varsel_OUTRSQUARE
NOMONITOR
PSHORT
;
var %INPUTS;
target TARGET_B;
code file="J:\JMMORR01\CIS 445\Tutorial 1\Charity\Workspaces\EMWS1\Varsel\EMFLOWSCORE.sas";
code file="J:\JMMORR01\CIS 445\Tutorial 1\Charity\Workspaces\EMWS1\Varsel\EMPUBLISHSCORE.sas";
run;
quit;
/*      proc print data =EMWS1.Varsel_OUTEFFECT;      proc print data =EMWS1.Varsel_OUTRSQUARE;      */
run;