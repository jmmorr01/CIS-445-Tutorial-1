if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'CARD_PROM_12'
'CLUSTER_CODE'
'DONOR_AGE'
'DONOR_GENDER'
'FILE_AVG_GIFT'
'FILE_CARD_GIFT'
'FREQUENCY_STATUS_97NK'
'HOME_OWNER'
'INCOME_GROUP'
'IN_HOUSE'
'LAST_GIFT_AMT'
'LIFETIME_AVG_GIFT_AMT'
'LIFETIME_CARD_PROM'
'LIFETIME_GIFT_AMOUNT'
'LIFETIME_GIFT_COUNT'
'LIFETIME_GIFT_RANGE'
'LIFETIME_MAX_GIFT_AMT'
'LIFETIME_MIN_GIFT_AMT'
'LIFETIME_PROM'
'MEDIAN_HOME_VALUE'
'MEDIAN_HOUSEHOLD_INCOME'
'MONTHS_SINCE_FIRST_GIFT'
'MONTHS_SINCE_LAST_GIFT'
'MONTHS_SINCE_LAST_PROM_RESP'
'MONTHS_SINCE_ORIGIN'
'MOR_HIT_RATE'
'NUMBER_PROM_12'
'OVERLAY_SOURCE'
'PCT_ATTRIBUTE1'
'PCT_ATTRIBUTE2'
'PCT_ATTRIBUTE3'
'PCT_ATTRIBUTE4'
'PCT_OWNER_OCCUPIED'
'PEP_STAR'
'PER_CAPITA_INCOME'
'PUBLISHED_PHONE'
'RECENCY_STATUS_96NK'
'RECENT_AVG_CARD_GIFT_AMT'
'RECENT_AVG_GIFT_AMT'
'RECENT_CARD_RESPONSE_COUNT'
'RECENT_CARD_RESPONSE_PROP'
'RECENT_RESPONSE_COUNT'
'RECENT_RESPONSE_PROP'
'RECENT_STAR_STATUS'
'SES'
'URBANICITY'
'WEALTH_RATING'
) then ROLE='INPUT';
else delete;
end;
