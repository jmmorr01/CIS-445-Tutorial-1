label LG10_LAST_GIFT_AMT = 'Transformed LAST_GIFT_AMT';
if LAST_GIFT_AMT eq . then LG10_LAST_GIFT_AMT = .;
else do;
if LAST_GIFT_AMT + 1 > 0 then LG10_LAST_GIFT_AMT = log10(LAST_GIFT_AMT + 1);
else LG10_LAST_GIFT_AMT = .;
end;
