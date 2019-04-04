label LG10_FILE_AVG_GIFT = 'Transformed FILE_AVG_GIFT';
if FILE_AVG_GIFT eq . then LG10_FILE_AVG_GIFT = .;
else do;
if FILE_AVG_GIFT + 1 > 0 then LG10_FILE_AVG_GIFT = log10(FILE_AVG_GIFT + 1);
else LG10_FILE_AVG_GIFT = .;
end;
