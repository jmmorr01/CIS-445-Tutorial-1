if upcase(NAME) = "DONOR_AGE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "HOME_OWNER" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "INCOME_GROUP" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "LAST_GIFT_AMT" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "LIFETIME_CARD_PROM" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "LIFETIME_GIFT_AMOUNT" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "LIFETIME_GIFT_RANGE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "MONTHS_SINCE_FIRST_GIFT" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "MONTHS_SINCE_LAST_PROM_RESP" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "MONTHS_SINCE_ORIGIN" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "MOR_HIT_RATE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "OVERLAY_SOURCE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "PCT_ATTRIBUTE1" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "PCT_ATTRIBUTE3" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "PCT_ATTRIBUTE4" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "PCT_OWNER_OCCUPIED" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "PUBLISHED_PHONE" then do;
ROLE = "REJECTED";
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
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "RECENT_AVG_CARD_GIFT_AMT" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "RECENT_CARD_RESPONSE_COUNT" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "RECENT_CARD_RESPONSE_PROP" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "REP_DONOR_GENDER" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "REP_URBANICITY" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "WEALTH_RATING" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "_NODE_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;
