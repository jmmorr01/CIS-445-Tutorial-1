
if NAME="LG10_FILE_AVG_GIFT" then do;
   COMMENT = "log10(FILE_AVG_GIFT  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="FILE_AVG_GIFT" then delete;

if NAME="LG10_LAST_GIFT_AMT" then do;
   COMMENT = "log10(LAST_GIFT_AMT  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="LAST_GIFT_AMT" then delete;

if NAME="LG10_LIFETIME_AVG_GIFT_AMT" then do;
   COMMENT = "log10(LIFETIME_AVG_GIFT_AMT  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="LIFETIME_AVG_GIFT_AMT" then delete;

if NAME="LG10_LIFETIME_GIFT_AMOUNT" then do;
   COMMENT = "log10(LIFETIME_GIFT_AMOUNT  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="LIFETIME_GIFT_AMOUNT" then delete;

if NAME="OPT_LIFETIME_GIFT_COUNT" then do;
   COMMENT = "Optimal Binning(4) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="NOMINAL";
end;
if NAME="LIFETIME_GIFT_COUNT" then delete;

if NAME="OPT_MEDIAN_HOME_VALUE" then do;
   COMMENT = "Optimal Binning(4) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="NOMINAL";
end;
if NAME="MEDIAN_HOME_VALUE" then delete;

if NAME="OPT_MEDIAN_HOUSEHOLD_INCOME" then do;
   COMMENT = "Optimal Binning(4) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="NOMINAL";
end;
if NAME="MEDIAN_HOUSEHOLD_INCOME" then delete;

if NAME="OPT_PER_CAPITA_INCOME" then do;
   COMMENT = "Optimal Binning(4) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="NOMINAL";
end;
if NAME="PER_CAPITA_INCOME" then delete;

if NAME="OPT_RECENT_RESPONSE_PROP" then do;
   COMMENT = "Optimal Binning(4) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="NOMINAL";
end;
if NAME="RECENT_RESPONSE_PROP" then delete;

if NAME="OPT_RECENT_STAR_STATUS" then do;
   COMMENT = "Optimal Binning(4) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="NOMINAL";
end;
if NAME="RECENT_STAR_STATUS" then delete;
