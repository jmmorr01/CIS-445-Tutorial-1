if upcase(NAME) = "CARD_PROM_12" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "CLUSTER_CODE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "DONOR_AGE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "FILE_AVG_GIFT" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "FILE_CARD_GIFT" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "FREQUENCY_STATUS_97NK" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "HOME_OWNER" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "INCOME_GROUP" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "IN_HOUSE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "LAST_GIFT_AMT" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "LIFETIME_AVG_GIFT_AMT" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "LIFETIME_CARD_PROM" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "LIFETIME_GIFT_AMOUNT" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "LIFETIME_GIFT_COUNT" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "LIFETIME_GIFT_RANGE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "LIFETIME_MAX_GIFT_AMT" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "LIFETIME_MIN_GIFT_AMT" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "LIFETIME_PROM" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "MEDIAN_HOME_VALUE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "MEDIAN_HOUSEHOLD_INCOME" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "MONTHS_SINCE_FIRST_GIFT" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "MONTHS_SINCE_LAST_GIFT" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "MONTHS_SINCE_LAST_PROM_RESP" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "MONTHS_SINCE_ORIGIN" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "MOR_HIT_RATE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "NUMBER_PROM_12" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "OVERLAY_SOURCE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "PCT_ATTRIBUTE1" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "PCT_ATTRIBUTE2" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "PCT_ATTRIBUTE3" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "PCT_ATTRIBUTE4" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "PCT_OWNER_OCCUPIED" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "PEP_STAR" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "PER_CAPITA_INCOME" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "PUBLISHED_PHONE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "Q_TARGET_B0" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "Q_TARGET_B1" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "RECENCY_STATUS_96NK" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "RECENT_AVG_CARD_GIFT_AMT" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "RECENT_AVG_GIFT_AMT" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "RECENT_CARD_RESPONSE_COUNT" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "RECENT_CARD_RESPONSE_PROP" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "RECENT_RESPONSE_COUNT" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "RECENT_RESPONSE_PROP" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "RECENT_STAR_STATUS" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "REP_DONOR_GENDER" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "REP_SES" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "REP_URBANICITY" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "WEALTH_RATING" then do;
ROLE = "INPUT";
end;
