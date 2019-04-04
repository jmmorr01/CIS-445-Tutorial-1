*------------------------------------------------------------*;
* Neural: Create decision matrix;
*------------------------------------------------------------*;
data WORK.TARGET_B;
  length   TARGET_B                         $  32
           COUNT                                8
           DATAPRIOR                            8
           TRAINPRIOR                           8
           DECPRIOR                             8
           DECISION1                            8
           DECISION2                            8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="1"
           DECISION2="0"
           ;
  format   COUNT 10.
           ;
TARGET_B="1"; COUNT=4843; DATAPRIOR=0.25; TRAINPRIOR=0.25; DECPRIOR=0.05; DECISION1=14.5; DECISION2=0;
output;
TARGET_B="0"; COUNT=14529; DATAPRIOR=0.75; TRAINPRIOR=0.75; DECPRIOR=0.95; DECISION1=-0.5; DECISION2=0;
output;
;
run;
proc datasets lib=work nolist;
modify TARGET_B(type=PROFIT label=TARGET_B);
label DECISION1= '1';
label DECISION2= '0';
run;
quit;
data EM_Neural;
set EMWS1.Varsel_TRAIN(keep=
FREQUENCY_STATUS_97NK G_CARD_PROM_12 G_CLUSTER_CODE G_RECENCY_STATUS_96NK
G_RECENT_CARD_RESPONSE_COUNT G_RECENT_RESPONSE_COUNT LG10_LAST_GIFT_AMT
MONTHS_SINCE_LAST_GIFT OPT_LIFETIME_GIFT_COUNT PEP_STAR TARGET_B );
run;
*------------------------------------------------------------* ;
* Neural: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    FREQUENCY_STATUS_97NK(ASC) G_CARD_PROM_12(ASC) G_CLUSTER_CODE(ASC)
   G_RECENCY_STATUS_96NK(ASC) G_RECENT_CARD_RESPONSE_COUNT(ASC)
   G_RECENT_RESPONSE_COUNT(ASC) OPT_LIFETIME_GIFT_COUNT(ASC) PEP_STAR(ASC)
   TARGET_B(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    LG10_LAST_GIFT_AMT MONTHS_SINCE_LAST_GIFT
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural
dmdbcat=WORK.Neural_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
TARGET_B
;
run;
quit;
*------------------------------------------------------------* ;
* Neural: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    LG10_LAST_GIFT_AMT MONTHS_SINCE_LAST_GIFT
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural: Binary Inputs Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;
    PEP_STAR
%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    FREQUENCY_STATUS_97NK G_CARD_PROM_12 G_CLUSTER_CODE G_RECENCY_STATUS_96NK
   G_RECENT_CARD_RESPONSE_COUNT G_RECENT_RESPONSE_COUNT OPT_LIFETIME_GIFT_COUNT
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Neural Network Training;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural dmdbcat=WORK.Neural_DMDB
validdata = EMWS1.Varsel_VALIDATE
random=12345
;
nloptions
;
performance alldetails noutilfile;
decision decdata=WORK.TARGET_B
decvars=
DECISION1
DECISION2
priorVar=DECPRIOR
;
netopts
decay=0;
input %INTINPUTS / level=interval id=intvl
;
input %BININPUTS / level=nominal id=bin
;
input %NOMINPUTS / level=nominal id=nom
;
target TARGET_B / level=NOMINAL id=TARGET_B
bias
;
arch MLP
Hidden=5
direct
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS1.Neural_PRELIM_OUTEST
;
save network=EMWS1.Neural_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS1.Neural_outest estiter=1
Outfit=EMWS1.Neural_OUTFIT
;
run;
quit;
proc sort data=EMWS1.Neural_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural;
by DESCENDING _VAPROF_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS1.Neural_INITIAL;
set EMWS1.Neural_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Neural Network Model Selection;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural dmdbcat=WORK.Neural_DMDB
validdata = EMWS1.Varsel_VALIDATE
network = EMWS1.Neural_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
decision decdata=WORK.TARGET_B
decvars=
DECISION1
DECISION2
priorVar=DECPRIOR
;
initial inest=EMWS1.Neural_INITIAL;
train tech=NONE;
code file="J:\JMMORR01\CIS 445\Tutorial 1\Charity\Workspaces\EMWS1\Neural\SCORECODE.sas"
group=Neural
;
;
code file="J:\JMMORR01\CIS 445\Tutorial 1\Charity\Workspaces\EMWS1\Neural\RESIDUALSCORECODE.sas"
group=Neural
residual
;
;
score data=EMWS1.Varsel_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS1.Neural_OUTKEY;
score data=EMWS1.Varsel_VALIDATE out=_NULL_
outfit=WORK.FIT2
role=VALID
outkey=EMWS1.Neural_OUTKEY;
run;
quit;
data EMWS1.Neural_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS1.Neural_EMESTIMATE;
set EMWS1.Neural_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural;
run;
quit;
