*;
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
