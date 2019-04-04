label OPT_MEDIAN_HOME_VALUE = 'Transformed MEDIAN_HOME_VALUE';
length OPT_MEDIAN_HOME_VALUE $36;
if (MEDIAN_HOME_VALUE eq .) then OPT_MEDIAN_HOME_VALUE="02:676.5-high, MISSING";
else
if (MEDIAN_HOME_VALUE < 676.5) then
OPT_MEDIAN_HOME_VALUE = "01:low-676.5";
else
if (MEDIAN_HOME_VALUE >= 676.5) then
OPT_MEDIAN_HOME_VALUE = "02:676.5-high, MISSING";
