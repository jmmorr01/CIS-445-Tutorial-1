*;
/*----G_RECENCY_STATUS_96NK begin----*/
length _NORM5 $ 5;
%DMNORMCP( RECENCY_STATUS_96NK , _NORM5 )
drop _NORM5;
select(_NORM5);
when('A' ) G_RECENCY_STATUS_96NK = 1;
when('E' ) G_RECENCY_STATUS_96NK = 0;
when('F' ) G_RECENCY_STATUS_96NK = 3;
when('L' ) G_RECENCY_STATUS_96NK = 2;
when('N' ) G_RECENCY_STATUS_96NK = 2;
when('S' ) G_RECENCY_STATUS_96NK = 0;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_RECENCY_STATUS_96NK="Grouped Levels for  RECENCY_STATUS_96NK";
/*----RECENCY_STATUS_96NK end----*/
