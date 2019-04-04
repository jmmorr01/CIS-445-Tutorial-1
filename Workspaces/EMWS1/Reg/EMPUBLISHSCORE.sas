*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_TARGET_B $ 12;
label I_TARGET_B = 'Into: TARGET_B' ;
*** Target Values;
array REGDRF [2] $12 _temporary_ ('1' '0' );
label U_TARGET_B = 'Unnormalized Into: TARGET_B' ;
*** Unnormalized target values;
ARRAY REGDRU[2]  _TEMPORARY_ (1 0);

drop _DM_BAD;
_DM_BAD=0;

*** Generate dummy variables for FREQUENCY_STATUS_97NK ;
drop _3_0 _3_1 _3_2 ;
if missing( FREQUENCY_STATUS_97NK ) then do;
   _3_0 = .;
   _3_1 = .;
   _3_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( FREQUENCY_STATUS_97NK , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      _3_0 = 1;
      _3_1 = 0;
      _3_2 = 0;
   end;
   else if _dm12 = '2'  then do;
      _3_0 = 0;
      _3_1 = 1;
      _3_2 = 0;
   end;
   else if _dm12 = '3'  then do;
      _3_0 = 0;
      _3_1 = 0;
      _3_2 = 1;
   end;
   else if _dm12 = '4'  then do;
      _3_0 = -1;
      _3_1 = -1;
      _3_2 = -1;
   end;
   else do;
      _3_0 = .;
      _3_1 = .;
      _3_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for OPT_MEDIAN_HOME_VALUE ;
drop _11_0 ;
if missing( OPT_MEDIAN_HOME_VALUE ) then do;
   _11_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm32 $ 32; drop _dm32 ;
   %DMNORMCP( OPT_MEDIAN_HOME_VALUE , _dm32 )
   if _dm32 = '02:676.5-HIGH, MISSING'  then do;
      _11_0 = -1;
   end;
   else if _dm32 = '01:LOW-676.5'  then do;
      _11_0 = 1;
   end;
   else do;
      _11_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for PEP_STAR ;
drop _17_0 ;
if missing( PEP_STAR ) then do;
   _17_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( PEP_STAR , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      _17_0 = -1;
   end;
   else if _dm12 = '0'  then do;
      _17_0 = 1;
   end;
   else do;
      _17_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.2500469307;
   _P1 = 0.7499530693;
   goto REGDR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: FREQUENCY_STATUS_97NK ;
_TEMP = 1;
_LP0 = _LP0 + (    -0.3556861257867) * _TEMP * _3_0;
_LP0 = _LP0 + (   -0.13171370881188) * _TEMP * _3_1;
_LP0 = _LP0 + (    0.16318592168351) * _TEMP * _3_2;

***  Effect: OPT_MEDIAN_HOME_VALUE ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.14135126079011) * _TEMP * _11_0;

***  Effect: PEP_STAR ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.17905481873096) * _TEMP * _17_0;

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -1.03523114674562 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

REGDR1:



*** Update Posterior Probabilities;
_P0 = _P0 * 0.05 / 0.25004693073024;
_P1 = _P1 * 0.95 / 0.74995306926975;
drop _sum; _sum = _P0 + _P1 ;
if _sum > 4.135903E-25 then do;
   _P0 = _P0 / _sum;
   _P1 = _P1 / _sum;
end;

*** Decision Processing;
label D_TARGET_B = 'Decision: TARGET_B' ;
label EP_TARGET_B = 'Expected Profit: TARGET_B' ;

length D_TARGET_B $ 9;

D_TARGET_B = ' ';
EP_TARGET_B = .;

*** Compute Expected Consequences and Choose Decision;
_decnum = 1; drop _decnum;

D_TARGET_B = '1' ;
EP_TARGET_B = _P0 * 14.5 + _P1 * -0.5;
drop _sum; 
_sum = _P0 * 0 + _P1 * 0;
if _sum > EP_TARGET_B + 6.593837E-12 then do;
   EP_TARGET_B = _sum; _decnum = 2;
   D_TARGET_B = '0' ;
end;


*** End Decision Processing ;

*** Posterior Probabilities and Predicted Level;
label P_TARGET_B1 = 'Predicted: TARGET_B=1' ;
label P_TARGET_B0 = 'Predicted: TARGET_B=0' ;
P_TARGET_B1 = _P0;
_MAXP = _P0;
_IY = 1;
P_TARGET_B0 = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I_TARGET_B = REGDRF[_IY];
U_TARGET_B = REGDRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
