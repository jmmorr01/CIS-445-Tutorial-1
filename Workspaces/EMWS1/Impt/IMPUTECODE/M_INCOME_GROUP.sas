label M_INCOME_GROUP = "Imputation Indicator for INCOME_GROUP";
if missing(INCOME_GROUP) then M_INCOME_GROUP = 1;
else M_INCOME_GROUP= 0;
