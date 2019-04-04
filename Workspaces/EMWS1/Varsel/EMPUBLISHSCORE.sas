******************************************;
*** Begin Scoring Code from PROC DMINE ***;
******************************************;

length _WARN_ $ 4;
label _WARN_ = "Warnings";


/*----G_RECENT_RESPONSE_COUNT begin----*/
length _NORM12 $ 12;
_NORM12 = put( RECENT_RESPONSE_COUNT , BEST12. );
%DMNORMIP( _NORM12 )
drop _NORM12;
select(_NORM12);
  when('0' ) G_RECENT_RESPONSE_COUNT = 3;
  when('1' ) G_RECENT_RESPONSE_COUNT = 3;
  when('2' ) G_RECENT_RESPONSE_COUNT = 2;
  when('3' ) G_RECENT_RESPONSE_COUNT = 1;
  when('4' ) G_RECENT_RESPONSE_COUNT = 1;
  when('5' ) G_RECENT_RESPONSE_COUNT = 0;
  when('6' ) G_RECENT_RESPONSE_COUNT = 0;
  when('7' ) G_RECENT_RESPONSE_COUNT = 0;
  when('8' ) G_RECENT_RESPONSE_COUNT = 0;
  when('9' ) G_RECENT_RESPONSE_COUNT = 0;
  when('10' ) G_RECENT_RESPONSE_COUNT = 0;
  when('11' ) G_RECENT_RESPONSE_COUNT = 0;
  when('12' ) G_RECENT_RESPONSE_COUNT = 1;
  when('13' ) G_RECENT_RESPONSE_COUNT = 0;
  when('14' ) G_RECENT_RESPONSE_COUNT = 3;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_RECENT_RESPONSE_COUNT="Grouped Levels for  RECENT_RESPONSE_COUNT";
/*----RECENT_RESPONSE_COUNT end----*/

/*----G_RECENT_CARD_RESPONSE_COUNT begin----*/
length _NORM12 $ 12;
_NORM12 = put( RECENT_CARD_RESPONSE_COUNT , BEST12. );
%DMNORMIP( _NORM12 )
drop _NORM12;
select(_NORM12);
  when('0' ) G_RECENT_CARD_RESPONSE_COUNT = 4;
  when('1' ) G_RECENT_CARD_RESPONSE_COUNT = 3;
  when('2' ) G_RECENT_CARD_RESPONSE_COUNT = 2;
  when('3' ) G_RECENT_CARD_RESPONSE_COUNT = 1;
  when('4' ) G_RECENT_CARD_RESPONSE_COUNT = 1;
  when('5' ) G_RECENT_CARD_RESPONSE_COUNT = 0;
  when('6' ) G_RECENT_CARD_RESPONSE_COUNT = 1;
  when('7' ) G_RECENT_CARD_RESPONSE_COUNT = 2;
  when('8' ) G_RECENT_CARD_RESPONSE_COUNT = 0;
  when('9' ) G_RECENT_CARD_RESPONSE_COUNT = 1;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_RECENT_CARD_RESPONSE_COUNT="Grouped Levels for  
        RECENT_CARD_RESPONSE_COUNT";
/*----RECENT_CARD_RESPONSE_COUNT end----*/

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

/*----G_CARD_PROM_12 begin----*/
length _NORM12 $ 12;
_NORM12 = put( CARD_PROM_12 , BEST12. );
%DMNORMIP( _NORM12 )
drop _NORM12;
select(_NORM12);
  when('0' ) G_CARD_PROM_12 = 0;
  when('1' ) G_CARD_PROM_12 = 4;
  when('2' ) G_CARD_PROM_12 = 4;
  when('3' ) G_CARD_PROM_12 = 6;
  when('4' ) G_CARD_PROM_12 = 6;
  when('5' ) G_CARD_PROM_12 = 6;
  when('6' ) G_CARD_PROM_12 = 5;
  when('7' ) G_CARD_PROM_12 = 3;
  when('8' ) G_CARD_PROM_12 = 3;
  when('9' ) G_CARD_PROM_12 = 2;
  when('10' ) G_CARD_PROM_12 = 2;
  when('11' ) G_CARD_PROM_12 = 1;
  when('12' ) G_CARD_PROM_12 = 3;
  when('13' ) G_CARD_PROM_12 = 0;
  when('14' ) G_CARD_PROM_12 = 6;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_CARD_PROM_12="Grouped Levels for  CARD_PROM_12";
/*----CARD_PROM_12 end----*/

/*----G_CLUSTER_CODE begin----*/
length _NORM2 $ 2;
%DMNORMCP( CLUSTER_CODE , _NORM2 )
drop _NORM2;
select(_NORM2);
  when('.' ) G_CLUSTER_CODE = 2;
  when('01' ) G_CLUSTER_CODE = 1;
  when('02' ) G_CLUSTER_CODE = 6;
  when('03' ) G_CLUSTER_CODE = 1;
  when('04' ) G_CLUSTER_CODE = 0;
  when('05' ) G_CLUSTER_CODE = 4;
  when('06' ) G_CLUSTER_CODE = 6;
  when('07' ) G_CLUSTER_CODE = 6;
  when('08' ) G_CLUSTER_CODE = 7;
  when('09' ) G_CLUSTER_CODE = 4;
  when('10' ) G_CLUSTER_CODE = 8;
  when('11' ) G_CLUSTER_CODE = 3;
  when('12' ) G_CLUSTER_CODE = 3;
  when('13' ) G_CLUSTER_CODE = 1;
  when('14' ) G_CLUSTER_CODE = 3;
  when('15' ) G_CLUSTER_CODE = 4;
  when('16' ) G_CLUSTER_CODE = 3;
  when('17' ) G_CLUSTER_CODE = 6;
  when('18' ) G_CLUSTER_CODE = 4;
  when('19' ) G_CLUSTER_CODE = 3;
  when('20' ) G_CLUSTER_CODE = 3;
  when('21' ) G_CLUSTER_CODE = 7;
  when('22' ) G_CLUSTER_CODE = 6;
  when('23' ) G_CLUSTER_CODE = 5;
  when('24' ) G_CLUSTER_CODE = 2;
  when('25' ) G_CLUSTER_CODE = 4;
  when('26' ) G_CLUSTER_CODE = 3;
  when('27' ) G_CLUSTER_CODE = 5;
  when('28' ) G_CLUSTER_CODE = 0;
  when('29' ) G_CLUSTER_CODE = 6;
  when('30' ) G_CLUSTER_CODE = 7;
  when('31' ) G_CLUSTER_CODE = 4;
  when('32' ) G_CLUSTER_CODE = 8;
  when('33' ) G_CLUSTER_CODE = 7;
  when('34' ) G_CLUSTER_CODE = 5;
  when('35' ) G_CLUSTER_CODE = 3;
  when('36' ) G_CLUSTER_CODE = 5;
  when('37' ) G_CLUSTER_CODE = 6;
  when('38' ) G_CLUSTER_CODE = 2;
  when('39' ) G_CLUSTER_CODE = 5;
  when('40' ) G_CLUSTER_CODE = 1;
  when('41' ) G_CLUSTER_CODE = 6;
  when('42' ) G_CLUSTER_CODE = 2;
  when('43' ) G_CLUSTER_CODE = 6;
  when('44' ) G_CLUSTER_CODE = 7;
  when('45' ) G_CLUSTER_CODE = 7;
  when('46' ) G_CLUSTER_CODE = 5;
  when('47' ) G_CLUSTER_CODE = 6;
  when('48' ) G_CLUSTER_CODE = 1;
  when('49' ) G_CLUSTER_CODE = 6;
  when('50' ) G_CLUSTER_CODE = 8;
  when('51' ) G_CLUSTER_CODE = 6;
  when('52' ) G_CLUSTER_CODE = 4;
  when('53' ) G_CLUSTER_CODE = 2;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_CLUSTER_CODE="Grouped Levels for  CLUSTER_CODE";
/*----CLUSTER_CODE end----*/


****************************************;
*** End Scoring Code from PROC DMINE ***;
****************************************;
