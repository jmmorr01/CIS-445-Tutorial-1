Label _ReplaceCount1 = "DONOR_GENDER";
if DONOR_GENDER ne REP_DONOR_GENDER then
_DIFF1= 1;
 else 
_DIFF1= 0;
Label _ReplaceCount2 = "SES";
if SES ne REP_SES then
_DIFF2= 1;
 else 
_DIFF2= 0;
Label _ReplaceCount3 = "URBANICITY";
if URBANICITY ne REP_URBANICITY then
_DIFF3= 1;
 else 
_DIFF3= 0;
