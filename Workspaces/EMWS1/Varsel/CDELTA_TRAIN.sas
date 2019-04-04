if upcase(name) = 'CARD_PROM_12' then role = 'REJECTED';
else
if upcase(name) = 'CLUSTER_CODE' then role = 'REJECTED';
else
if upcase(name) = 'FILE_CARD_GIFT' then role = 'REJECTED';
else
if upcase(name) = 'HOME_OWNER' then role = 'REJECTED';
else
if upcase(name) = 'IMP_DONOR_AGE' then role = 'REJECTED';
else
if upcase(name) = 'IMP_INCOME_GROUP' then role = 'REJECTED';
else
if upcase(name) = 'IMP_MONTHS_SINCE_LAST_PROM_RESP' then role = 'REJECTED';
else
if upcase(name) = 'IMP_REP_SES' then role = 'REJECTED';
else
if upcase(name) = 'IMP_REP_URBANICITY' then role = 'REJECTED';
else
if upcase(name) = 'IMP_WEALTH_RATING' then role = 'REJECTED';
else
if upcase(name) = 'IN_HOUSE' then role = 'REJECTED';
else
if upcase(name) = 'LG10_FILE_AVG_GIFT' then role = 'REJECTED';
else
if upcase(name) = 'LG10_LIFETIME_AVG_GIFT_AMT' then role = 'REJECTED';
else
if upcase(name) = 'LG10_LIFETIME_GIFT_AMOUNT' then role = 'REJECTED';
else
if upcase(name) = 'LIFETIME_CARD_PROM' then role = 'REJECTED';
else
if upcase(name) = 'LIFETIME_GIFT_RANGE' then role = 'REJECTED';
else
if upcase(name) = 'LIFETIME_MAX_GIFT_AMT' then role = 'REJECTED';
else
if upcase(name) = 'LIFETIME_MIN_GIFT_AMT' then role = 'REJECTED';
else
if upcase(name) = 'LIFETIME_PROM' then role = 'REJECTED';
else
if upcase(name) = 'MONTHS_SINCE_FIRST_GIFT' then role = 'REJECTED';
else
if upcase(name) = 'MONTHS_SINCE_ORIGIN' then role = 'REJECTED';
else
if upcase(name) = 'MOR_HIT_RATE' then role = 'REJECTED';
else
if upcase(name) = 'NUMBER_PROM_12' then role = 'REJECTED';
else
if upcase(name) = 'OPT_MEDIAN_HOME_VALUE' then role = 'REJECTED';
else
if upcase(name) = 'OPT_MEDIAN_HOUSEHOLD_INCOME' then role = 'REJECTED';
else
if upcase(name) = 'OPT_PER_CAPITA_INCOME' then role = 'REJECTED';
else
if upcase(name) = 'OPT_RECENT_RESPONSE_PROP' then role = 'REJECTED';
else
if upcase(name) = 'OPT_RECENT_STAR_STATUS' then role = 'REJECTED';
else
if upcase(name) = 'OVERLAY_SOURCE' then role = 'REJECTED';
else
if upcase(name) = 'PCT_ATTRIBUTE1' then role = 'REJECTED';
else
if upcase(name) = 'PCT_ATTRIBUTE2' then role = 'REJECTED';
else
if upcase(name) = 'PCT_ATTRIBUTE3' then role = 'REJECTED';
else
if upcase(name) = 'PCT_ATTRIBUTE4' then role = 'REJECTED';
else
if upcase(name) = 'PCT_OWNER_OCCUPIED' then role = 'REJECTED';
else
if upcase(name) = 'PUBLISHED_PHONE' then role = 'REJECTED';
else
if upcase(name) = 'RECENCY_STATUS_96NK' then role = 'REJECTED';
else
if upcase(name) = 'RECENT_AVG_CARD_GIFT_AMT' then role = 'REJECTED';
else
if upcase(name) = 'RECENT_AVG_GIFT_AMT' then role = 'REJECTED';
else
if upcase(name) = 'RECENT_CARD_RESPONSE_COUNT' then role = 'REJECTED';
else
if upcase(name) = 'RECENT_CARD_RESPONSE_PROP' then role = 'REJECTED';
else
if upcase(name) = 'RECENT_RESPONSE_COUNT' then role = 'REJECTED';
else
if upcase(name) = 'REP_DONOR_GENDER' then role = 'REJECTED';
if upcase(strip(name)) = "G_RECENT_RESPONSE_COUNT" then level = "NOMINAL";
if upcase(strip(name)) = "G_RECENT_CARD_RESPONSE_COUNT" then level = "NOMINAL";
if upcase(strip(name)) = "G_RECENCY_STATUS_96NK" then level = "NOMINAL";
if upcase(strip(name)) = "G_CARD_PROM_12" then level = "NOMINAL";
if upcase(strip(name)) = "G_CLUSTER_CODE" then level = "NOMINAL";
