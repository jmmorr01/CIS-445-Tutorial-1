if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'FREQUENCY_STATUS_97NK'
'OPT_MEDIAN_HOME_VALUE'
'PEP_STAR'
) then ROLE='INPUT';
else do;
ROLE='REJECTED';
COMMENT = "Reg: Rejected using stepwise selection";
end;
end;
