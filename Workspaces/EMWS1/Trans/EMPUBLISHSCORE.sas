*------------------------------------------------------------*;
* Computed Code;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TRANSFORM: FILE_AVG_GIFT , log10(FILE_AVG_GIFT + 1);
*------------------------------------------------------------*;
label LG10_FILE_AVG_GIFT = 'Transformed FILE_AVG_GIFT';
if FILE_AVG_GIFT eq . then LG10_FILE_AVG_GIFT = .;
else do;
if FILE_AVG_GIFT + 1 > 0 then LG10_FILE_AVG_GIFT = log10(FILE_AVG_GIFT + 1);
else LG10_FILE_AVG_GIFT = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: LAST_GIFT_AMT , log10(LAST_GIFT_AMT + 1);
*------------------------------------------------------------*;
label LG10_LAST_GIFT_AMT = 'Transformed LAST_GIFT_AMT';
if LAST_GIFT_AMT eq . then LG10_LAST_GIFT_AMT = .;
else do;
if LAST_GIFT_AMT + 1 > 0 then LG10_LAST_GIFT_AMT = log10(LAST_GIFT_AMT + 1);
else LG10_LAST_GIFT_AMT = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: LIFETIME_AVG_GIFT_AMT , log10(LIFETIME_AVG_GIFT_AMT + 1);
*------------------------------------------------------------*;
label LG10_LIFETIME_AVG_GIFT_AMT = 'Transformed LIFETIME_AVG_GIFT_AMT';
if LIFETIME_AVG_GIFT_AMT eq . then LG10_LIFETIME_AVG_GIFT_AMT = .;
else do;
if LIFETIME_AVG_GIFT_AMT + 1 > 0 then LG10_LIFETIME_AVG_GIFT_AMT = log10(LIFETIME_AVG_GIFT_AMT + 1);
else LG10_LIFETIME_AVG_GIFT_AMT = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: LIFETIME_GIFT_AMOUNT , log10(LIFETIME_GIFT_AMOUNT + 1);
*------------------------------------------------------------*;
label LG10_LIFETIME_GIFT_AMOUNT = 'Transformed LIFETIME_GIFT_AMOUNT';
if LIFETIME_GIFT_AMOUNT eq . then LG10_LIFETIME_GIFT_AMOUNT = .;
else do;
if LIFETIME_GIFT_AMOUNT + 1 > 0 then LG10_LIFETIME_GIFT_AMOUNT = log10(LIFETIME_GIFT_AMOUNT + 1);
else LG10_LIFETIME_GIFT_AMOUNT = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: LIFETIME_GIFT_COUNT , Optimal Binning(4);
*------------------------------------------------------------*;
label OPT_LIFETIME_GIFT_COUNT = 'Transformed LIFETIME_GIFT_COUNT';
length OPT_LIFETIME_GIFT_COUNT $36;
if (LIFETIME_GIFT_COUNT eq .) then OPT_LIFETIME_GIFT_COUNT="02:4.5-13.5, MISSING";
else
if (LIFETIME_GIFT_COUNT < 4.5) then
OPT_LIFETIME_GIFT_COUNT = "01:low-4.5";
else
if (LIFETIME_GIFT_COUNT >= 4.5 and LIFETIME_GIFT_COUNT < 13.5) then
OPT_LIFETIME_GIFT_COUNT = "02:4.5-13.5, MISSING";
else
if (LIFETIME_GIFT_COUNT >= 13.5) then
OPT_LIFETIME_GIFT_COUNT = "03:13.5-high";
*------------------------------------------------------------*;
* TRANSFORM: MEDIAN_HOME_VALUE , Optimal Binning(4);
*------------------------------------------------------------*;
label OPT_MEDIAN_HOME_VALUE = 'Transformed MEDIAN_HOME_VALUE';
length OPT_MEDIAN_HOME_VALUE $36;
if (MEDIAN_HOME_VALUE eq .) then OPT_MEDIAN_HOME_VALUE="02:676.5-high, MISSING";
else
if (MEDIAN_HOME_VALUE < 676.5) then
OPT_MEDIAN_HOME_VALUE = "01:low-676.5";
else
if (MEDIAN_HOME_VALUE >= 676.5) then
OPT_MEDIAN_HOME_VALUE = "02:676.5-high, MISSING";
*------------------------------------------------------------*;
* TRANSFORM: MEDIAN_HOUSEHOLD_INCOME , Optimal Binning(4);
*------------------------------------------------------------*;
label OPT_MEDIAN_HOUSEHOLD_INCOME = 'Transformed MEDIAN_HOUSEHOLD_INCOME';
length OPT_MEDIAN_HOUSEHOLD_INCOME $36;
if (MEDIAN_HOUSEHOLD_INCOME eq .) then OPT_MEDIAN_HOUSEHOLD_INCOME="01:low-624.5, MISSING";
else
if (MEDIAN_HOUSEHOLD_INCOME < 624.5) then
OPT_MEDIAN_HOUSEHOLD_INCOME = "01:low-624.5, MISSING";
else
if (MEDIAN_HOUSEHOLD_INCOME >= 624.5) then
OPT_MEDIAN_HOUSEHOLD_INCOME = "02:624.5-high";
*------------------------------------------------------------*;
* TRANSFORM: PER_CAPITA_INCOME , Optimal Binning(4);
*------------------------------------------------------------*;
label OPT_PER_CAPITA_INCOME = 'Transformed PER_CAPITA_INCOME';
length OPT_PER_CAPITA_INCOME $36;
if (PER_CAPITA_INCOME eq .) then OPT_PER_CAPITA_INCOME="01:low-14976, MISSING";
else
if (PER_CAPITA_INCOME < 14976) then
OPT_PER_CAPITA_INCOME = "01:low-14976, MISSING";
else
if (PER_CAPITA_INCOME >= 14976) then
OPT_PER_CAPITA_INCOME = "02:14976-high";
*------------------------------------------------------------*;
* TRANSFORM: RECENT_RESPONSE_PROP , Optimal Binning(4);
*------------------------------------------------------------*;
label OPT_RECENT_RESPONSE_PROP = 'Transformed RECENT_RESPONSE_PROP';
length OPT_RECENT_RESPONSE_PROP $36;
if (RECENT_RESPONSE_PROP eq .) then OPT_RECENT_RESPONSE_PROP="01:low-0.2125, MISSING";
else
if (RECENT_RESPONSE_PROP < 0.2125) then
OPT_RECENT_RESPONSE_PROP = "01:low-0.2125, MISSING";
else
if (RECENT_RESPONSE_PROP >= 0.2125) then
OPT_RECENT_RESPONSE_PROP = "02:0.2125-high";
*------------------------------------------------------------*;
* TRANSFORM: RECENT_STAR_STATUS , Optimal Binning(4);
*------------------------------------------------------------*;
label OPT_RECENT_STAR_STATUS = 'Transformed RECENT_STAR_STATUS';
length OPT_RECENT_STAR_STATUS $36;
if (RECENT_STAR_STATUS eq .) then OPT_RECENT_STAR_STATUS="01:low-0.5, MISSING";
else
if (RECENT_STAR_STATUS < 0.5) then
OPT_RECENT_STAR_STATUS = "01:low-0.5, MISSING";
else
if (RECENT_STAR_STATUS >= 0.5 and RECENT_STAR_STATUS < 1.5) then
OPT_RECENT_STAR_STATUS = "02:0.5-1.5";
else
if (RECENT_STAR_STATUS >= 1.5) then
OPT_RECENT_STAR_STATUS = "03:1.5-high";
