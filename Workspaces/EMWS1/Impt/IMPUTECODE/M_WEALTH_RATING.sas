label M_WEALTH_RATING = "Imputation Indicator for WEALTH_RATING";
if missing(WEALTH_RATING) then M_WEALTH_RATING = 1;
else M_WEALTH_RATING= 0;
