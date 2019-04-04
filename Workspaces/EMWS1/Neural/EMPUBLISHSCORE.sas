***********************************;
*** Begin Scoring Code for Neural;
***********************************;
DROP _DM_BAD _EPS _NOCL_ _MAX_ _MAXP_ _SUM_ _NTRIALS;
 _DM_BAD = 0;
 _NOCL_ = .;
 _MAX_ = .;
 _MAXP_ = .;
 _SUM_ = .;
 _NTRIALS = .;
 _EPS =                1E-10;
LENGTH _WARN_ $4
;
      label S_LG10_LAST_GIFT_AMT = 'Standard: LG10_LAST_GIFT_AMT' ;

      label S_MONTHS_SINCE_LAST_GIFT = 'Standard: MONTHS_SINCE_LAST_GIFT' ;

      label PEP_STAR0 = 'Dummy: PEP_STAR=0' ;

      label FREQUENCY_STATUS_97NK1 = 'Dummy: FREQUENCY_STATUS_97NK=1' ;

      label FREQUENCY_STATUS_97NK2 = 'Dummy: FREQUENCY_STATUS_97NK=2' ;

      label FREQUENCY_STATUS_97NK3 = 'Dummy: FREQUENCY_STATUS_97NK=3' ;

      label G_CARD_PROM_120 = 'Dummy: G_CARD_PROM_12=0' ;

      label G_CARD_PROM_121 = 'Dummy: G_CARD_PROM_12=1' ;

      label G_CARD_PROM_122 = 'Dummy: G_CARD_PROM_12=2' ;

      label G_CARD_PROM_123 = 'Dummy: G_CARD_PROM_12=3' ;

      label G_CARD_PROM_124 = 'Dummy: G_CARD_PROM_12=4' ;

      label G_CARD_PROM_125 = 'Dummy: G_CARD_PROM_12=5' ;

      label G_CLUSTER_CODE0 = 'Dummy: G_CLUSTER_CODE=0' ;

      label G_CLUSTER_CODE1 = 'Dummy: G_CLUSTER_CODE=1' ;

      label G_CLUSTER_CODE2 = 'Dummy: G_CLUSTER_CODE=2' ;

      label G_CLUSTER_CODE3 = 'Dummy: G_CLUSTER_CODE=3' ;

      label G_CLUSTER_CODE4 = 'Dummy: G_CLUSTER_CODE=4' ;

      label G_CLUSTER_CODE5 = 'Dummy: G_CLUSTER_CODE=5' ;

      label G_CLUSTER_CODE6 = 'Dummy: G_CLUSTER_CODE=6' ;

      label G_CLUSTER_CODE7 = 'Dummy: G_CLUSTER_CODE=7' ;

      label G_RECENCY_STATUS_96NK0 = 'Dummy: G_RECENCY_STATUS_96NK=0' ;

      label G_RECENCY_STATUS_96NK1 = 'Dummy: G_RECENCY_STATUS_96NK=1' ;

      label G_RECENCY_STATUS_96NK2 = 'Dummy: G_RECENCY_STATUS_96NK=2' ;

      label G_RECENT_CARD_RESPONSE_COUNT0 =
'Dummy: G_RECENT_CARD_RESPONSE_COUNT=0' ;

      label G_RECENT_CARD_RESPONSE_COUNT1 =
'Dummy: G_RECENT_CARD_RESPONSE_COUNT=1' ;

      label G_RECENT_CARD_RESPONSE_COUNT2 =
'Dummy: G_RECENT_CARD_RESPONSE_COUNT=2' ;

      label G_RECENT_CARD_RESPONSE_COUNT3 =
'Dummy: G_RECENT_CARD_RESPONSE_COUNT=3' ;

      label G_RECENT_RESPONSE_COUNT0 = 'Dummy: G_RECENT_RESPONSE_COUNT=0' ;

      label G_RECENT_RESPONSE_COUNT1 = 'Dummy: G_RECENT_RESPONSE_COUNT=1' ;

      label G_RECENT_RESPONSE_COUNT2 = 'Dummy: G_RECENT_RESPONSE_COUNT=2' ;

      label OPT_LIFETIME_GI01_low_4_5 =
'Dummy: OPT_LIFETIME_GIFT_COUNT=01:low-4.5' ;

      label OPT_LIFETIME_GI02_4_5_13_5__MI =
'Dummy: OPT_LIFETIME_GIFT_COUNT=02:4.5-13.5, MISSING' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label H15 = 'Hidden: H1=5' ;

      label I_TARGET_B = 'Into: TARGET_B' ;

      label U_TARGET_B = 'Unnormalized Into: TARGET_B' ;

      label P_TARGET_B1 = 'Predicted: TARGET_B=1' ;

      label P_TARGET_B0 = 'Predicted: TARGET_B=0' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for PEP_STAR ;
drop PEP_STAR0 ;
if missing( PEP_STAR ) then do;
   PEP_STAR0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( PEP_STAR , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      PEP_STAR0 = -1;
   end;
   else if _dm12 = '0'  then do;
      PEP_STAR0 = 1;
   end;
   else do;
      PEP_STAR0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for FREQUENCY_STATUS_97NK ;
drop FREQUENCY_STATUS_97NK1 FREQUENCY_STATUS_97NK2 FREQUENCY_STATUS_97NK3 ;
if missing( FREQUENCY_STATUS_97NK ) then do;
   FREQUENCY_STATUS_97NK1 = .;
   FREQUENCY_STATUS_97NK2 = .;
   FREQUENCY_STATUS_97NK3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( FREQUENCY_STATUS_97NK , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      FREQUENCY_STATUS_97NK1 = 1;
      FREQUENCY_STATUS_97NK2 = 0;
      FREQUENCY_STATUS_97NK3 = 0;
   end;
   else if _dm12 = '2'  then do;
      FREQUENCY_STATUS_97NK1 = 0;
      FREQUENCY_STATUS_97NK2 = 1;
      FREQUENCY_STATUS_97NK3 = 0;
   end;
   else if _dm12 = '3'  then do;
      FREQUENCY_STATUS_97NK1 = 0;
      FREQUENCY_STATUS_97NK2 = 0;
      FREQUENCY_STATUS_97NK3 = 1;
   end;
   else if _dm12 = '4'  then do;
      FREQUENCY_STATUS_97NK1 = -1;
      FREQUENCY_STATUS_97NK2 = -1;
      FREQUENCY_STATUS_97NK3 = -1;
   end;
   else do;
      FREQUENCY_STATUS_97NK1 = .;
      FREQUENCY_STATUS_97NK2 = .;
      FREQUENCY_STATUS_97NK3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_CARD_PROM_12 ;
drop G_CARD_PROM_120 G_CARD_PROM_121 G_CARD_PROM_122 G_CARD_PROM_123
        G_CARD_PROM_124 G_CARD_PROM_125 ;
*** encoding is sparse, initialize to zero;
G_CARD_PROM_120 = 0;
G_CARD_PROM_121 = 0;
G_CARD_PROM_122 = 0;
G_CARD_PROM_123 = 0;
G_CARD_PROM_124 = 0;
G_CARD_PROM_125 = 0;
if missing( G_CARD_PROM_12 ) then do;
   G_CARD_PROM_120 = .;
   G_CARD_PROM_121 = .;
   G_CARD_PROM_122 = .;
   G_CARD_PROM_123 = .;
   G_CARD_PROM_124 = .;
   G_CARD_PROM_125 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_CARD_PROM_12 , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      G_CARD_PROM_125 = 1;
   end;
   else if _dm12 = '6'  then do;
      G_CARD_PROM_120 = -1;
      G_CARD_PROM_121 = -1;
      G_CARD_PROM_122 = -1;
      G_CARD_PROM_123 = -1;
      G_CARD_PROM_124 = -1;
      G_CARD_PROM_125 = -1;
   end;
   else if _dm12 = '3'  then do;
      G_CARD_PROM_123 = 1;
   end;
   else if _dm12 = '4'  then do;
      G_CARD_PROM_124 = 1;
   end;
   else if _dm12 = '2'  then do;
      G_CARD_PROM_122 = 1;
   end;
   else if _dm12 = '1'  then do;
      G_CARD_PROM_121 = 1;
   end;
   else if _dm12 = '0'  then do;
      G_CARD_PROM_120 = 1;
   end;
   else do;
      G_CARD_PROM_120 = .;
      G_CARD_PROM_121 = .;
      G_CARD_PROM_122 = .;
      G_CARD_PROM_123 = .;
      G_CARD_PROM_124 = .;
      G_CARD_PROM_125 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_CLUSTER_CODE ;
drop G_CLUSTER_CODE0 G_CLUSTER_CODE1 G_CLUSTER_CODE2 G_CLUSTER_CODE3
        G_CLUSTER_CODE4 G_CLUSTER_CODE5 G_CLUSTER_CODE6 G_CLUSTER_CODE7 ;
*** encoding is sparse, initialize to zero;
G_CLUSTER_CODE0 = 0;
G_CLUSTER_CODE1 = 0;
G_CLUSTER_CODE2 = 0;
G_CLUSTER_CODE3 = 0;
G_CLUSTER_CODE4 = 0;
G_CLUSTER_CODE5 = 0;
G_CLUSTER_CODE6 = 0;
G_CLUSTER_CODE7 = 0;
if missing( G_CLUSTER_CODE ) then do;
   G_CLUSTER_CODE0 = .;
   G_CLUSTER_CODE1 = .;
   G_CLUSTER_CODE2 = .;
   G_CLUSTER_CODE3 = .;
   G_CLUSTER_CODE4 = .;
   G_CLUSTER_CODE5 = .;
   G_CLUSTER_CODE6 = .;
   G_CLUSTER_CODE7 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_CLUSTER_CODE , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '1'  then do;
            if _dm12 = '0'  then do;
               G_CLUSTER_CODE0 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '1'  then do;
                  G_CLUSTER_CODE1 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               G_CLUSTER_CODE2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            G_CLUSTER_CODE3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               G_CLUSTER_CODE4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '6'  then do;
         if _dm12 = '5'  then do;
            G_CLUSTER_CODE5 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '6'  then do;
               G_CLUSTER_CODE6 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '7'  then do;
            G_CLUSTER_CODE7 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '8'  then do;
               G_CLUSTER_CODE0 = -1;
               G_CLUSTER_CODE1 = -1;
               G_CLUSTER_CODE2 = -1;
               G_CLUSTER_CODE3 = -1;
               G_CLUSTER_CODE4 = -1;
               G_CLUSTER_CODE5 = -1;
               G_CLUSTER_CODE6 = -1;
               G_CLUSTER_CODE7 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      G_CLUSTER_CODE0 = .;
      G_CLUSTER_CODE1 = .;
      G_CLUSTER_CODE2 = .;
      G_CLUSTER_CODE3 = .;
      G_CLUSTER_CODE4 = .;
      G_CLUSTER_CODE5 = .;
      G_CLUSTER_CODE6 = .;
      G_CLUSTER_CODE7 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_RECENCY_STATUS_96NK ;
drop G_RECENCY_STATUS_96NK0 G_RECENCY_STATUS_96NK1 G_RECENCY_STATUS_96NK2 ;
if missing( G_RECENCY_STATUS_96NK ) then do;
   G_RECENCY_STATUS_96NK0 = .;
   G_RECENCY_STATUS_96NK1 = .;
   G_RECENCY_STATUS_96NK2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_RECENCY_STATUS_96NK , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      G_RECENCY_STATUS_96NK0 = 0;
      G_RECENCY_STATUS_96NK1 = 1;
      G_RECENCY_STATUS_96NK2 = 0;
   end;
   else if _dm12 = '0'  then do;
      G_RECENCY_STATUS_96NK0 = 1;
      G_RECENCY_STATUS_96NK1 = 0;
      G_RECENCY_STATUS_96NK2 = 0;
   end;
   else if _dm12 = '3'  then do;
      G_RECENCY_STATUS_96NK0 = -1;
      G_RECENCY_STATUS_96NK1 = -1;
      G_RECENCY_STATUS_96NK2 = -1;
   end;
   else if _dm12 = '2'  then do;
      G_RECENCY_STATUS_96NK0 = 0;
      G_RECENCY_STATUS_96NK1 = 0;
      G_RECENCY_STATUS_96NK2 = 1;
   end;
   else do;
      G_RECENCY_STATUS_96NK0 = .;
      G_RECENCY_STATUS_96NK1 = .;
      G_RECENCY_STATUS_96NK2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_RECENT_CARD_RESPONSE_COUNT ;
drop G_RECENT_CARD_RESPONSE_COUNT0 G_RECENT_CARD_RESPONSE_COUNT1
        G_RECENT_CARD_RESPONSE_COUNT2 G_RECENT_CARD_RESPONSE_COUNT3 ;
*** encoding is sparse, initialize to zero;
G_RECENT_CARD_RESPONSE_COUNT0 = 0;
G_RECENT_CARD_RESPONSE_COUNT1 = 0;
G_RECENT_CARD_RESPONSE_COUNT2 = 0;
G_RECENT_CARD_RESPONSE_COUNT3 = 0;
if missing( G_RECENT_CARD_RESPONSE_COUNT ) then do;
   G_RECENT_CARD_RESPONSE_COUNT0 = .;
   G_RECENT_CARD_RESPONSE_COUNT1 = .;
   G_RECENT_CARD_RESPONSE_COUNT2 = .;
   G_RECENT_CARD_RESPONSE_COUNT3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_RECENT_CARD_RESPONSE_COUNT , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '2'  then do;
      if _dm12 <= '1'  then do;
         if _dm12 = '0'  then do;
            G_RECENT_CARD_RESPONSE_COUNT0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '1'  then do;
               G_RECENT_CARD_RESPONSE_COUNT1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '2'  then do;
            G_RECENT_CARD_RESPONSE_COUNT2 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = '3'  then do;
         G_RECENT_CARD_RESPONSE_COUNT3 = 1;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = '4'  then do;
            G_RECENT_CARD_RESPONSE_COUNT0 = -1;
            G_RECENT_CARD_RESPONSE_COUNT1 = -1;
            G_RECENT_CARD_RESPONSE_COUNT2 = -1;
            G_RECENT_CARD_RESPONSE_COUNT3 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      G_RECENT_CARD_RESPONSE_COUNT0 = .;
      G_RECENT_CARD_RESPONSE_COUNT1 = .;
      G_RECENT_CARD_RESPONSE_COUNT2 = .;
      G_RECENT_CARD_RESPONSE_COUNT3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_RECENT_RESPONSE_COUNT ;
drop G_RECENT_RESPONSE_COUNT0 G_RECENT_RESPONSE_COUNT1
        G_RECENT_RESPONSE_COUNT2 ;
if missing( G_RECENT_RESPONSE_COUNT ) then do;
   G_RECENT_RESPONSE_COUNT0 = .;
   G_RECENT_RESPONSE_COUNT1 = .;
   G_RECENT_RESPONSE_COUNT2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_RECENT_RESPONSE_COUNT , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      G_RECENT_RESPONSE_COUNT0 = 0;
      G_RECENT_RESPONSE_COUNT1 = 1;
      G_RECENT_RESPONSE_COUNT2 = 0;
   end;
   else if _dm12 = '2'  then do;
      G_RECENT_RESPONSE_COUNT0 = 0;
      G_RECENT_RESPONSE_COUNT1 = 0;
      G_RECENT_RESPONSE_COUNT2 = 1;
   end;
   else if _dm12 = '3'  then do;
      G_RECENT_RESPONSE_COUNT0 = -1;
      G_RECENT_RESPONSE_COUNT1 = -1;
      G_RECENT_RESPONSE_COUNT2 = -1;
   end;
   else if _dm12 = '0'  then do;
      G_RECENT_RESPONSE_COUNT0 = 1;
      G_RECENT_RESPONSE_COUNT1 = 0;
      G_RECENT_RESPONSE_COUNT2 = 0;
   end;
   else do;
      G_RECENT_RESPONSE_COUNT0 = .;
      G_RECENT_RESPONSE_COUNT1 = .;
      G_RECENT_RESPONSE_COUNT2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for OPT_LIFETIME_GIFT_COUNT ;
drop OPT_LIFETIME_GI01_low_4_5 OPT_LIFETIME_GI02_4_5_13_5__MI ;
if missing( OPT_LIFETIME_GIFT_COUNT ) then do;
   OPT_LIFETIME_GI01_low_4_5 = .;
   OPT_LIFETIME_GI02_4_5_13_5__MI = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm32 $ 32; drop _dm32 ;
   %DMNORMCP( OPT_LIFETIME_GIFT_COUNT , _dm32 )
   if _dm32 = '02:4.5-13.5, MISSING'  then do;
      OPT_LIFETIME_GI01_low_4_5 = 0;
      OPT_LIFETIME_GI02_4_5_13_5__MI = 1;
   end;
   else if _dm32 = '01:LOW-4.5'  then do;
      OPT_LIFETIME_GI01_low_4_5 = 1;
      OPT_LIFETIME_GI02_4_5_13_5__MI = 0;
   end;
   else if _dm32 = '03:13.5-HIGH'  then do;
      OPT_LIFETIME_GI01_low_4_5 = -1;
      OPT_LIFETIME_GI02_4_5_13_5__MI = -1;
   end;
   else do;
      OPT_LIFETIME_GI01_low_4_5 = .;
      OPT_LIFETIME_GI02_4_5_13_5__MI = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   LG10_LAST_GIFT_AMT ,
   MONTHS_SINCE_LAST_GIFT   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_LG10_LAST_GIFT_AMT  =    -5.04963340818956 +     4.26588117171544 *
        LG10_LAST_GIFT_AMT ;
   S_MONTHS_SINCE_LAST_GIFT  =    -4.51352840067237 +     0.24813657655727 *
        MONTHS_SINCE_LAST_GIFT ;
END;
ELSE DO;
   IF MISSING( LG10_LAST_GIFT_AMT ) THEN S_LG10_LAST_GIFT_AMT  = . ;
   ELSE S_LG10_LAST_GIFT_AMT  =    -5.04963340818956 +     4.26588117171544 *
        LG10_LAST_GIFT_AMT ;
   IF MISSING( MONTHS_SINCE_LAST_GIFT ) THEN S_MONTHS_SINCE_LAST_GIFT  = . ;
   ELSE S_MONTHS_SINCE_LAST_GIFT
          =    -4.51352840067237 +     0.24813657655727 *
        MONTHS_SINCE_LAST_GIFT ;
END;
*** *************************;
*** Writing the Node bin ;
*** *************************;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.11213066555484 * S_LG10_LAST_GIFT_AMT
          +    -0.22347250832105 * S_MONTHS_SINCE_LAST_GIFT ;
   H12  =    -0.05639866137982 * S_LG10_LAST_GIFT_AMT
          +      0.1773252372245 * S_MONTHS_SINCE_LAST_GIFT ;
   H13  =    -0.07319320509102 * S_LG10_LAST_GIFT_AMT
          +      0.2383708896268 * S_MONTHS_SINCE_LAST_GIFT ;
   H14  =    -0.26574546339443 * S_LG10_LAST_GIFT_AMT
          +    -0.02532809364003 * S_MONTHS_SINCE_LAST_GIFT ;
   H15  =    -0.10140842385243 * S_LG10_LAST_GIFT_AMT
          +     0.23859212879769 * S_MONTHS_SINCE_LAST_GIFT ;
   H11  = H11  +    -0.00652867491977 * PEP_STAR0 ;
   H12  = H12  +    -0.04892911190358 * PEP_STAR0 ;
   H13  = H13  +    -0.12056778551454 * PEP_STAR0 ;
   H14  = H14  +    -0.05209653736427 * PEP_STAR0 ;
   H15  = H15  +     0.19741818112531 * PEP_STAR0 ;
   H11  = H11  +     0.01082538949385 * FREQUENCY_STATUS_97NK1
          +     0.49219648737925 * FREQUENCY_STATUS_97NK2
          +    -0.02458016532864 * FREQUENCY_STATUS_97NK3
          +    -0.04044154448013 * G_CARD_PROM_120  +    -0.00501659076115 *
        G_CARD_PROM_121  +    -0.00644599505598 * G_CARD_PROM_122
          +     0.01749763784338 * G_CARD_PROM_123  +     0.26818269056681 *
        G_CARD_PROM_124  +    -0.04239359008883 * G_CARD_PROM_125
          +     0.23649470448275 * G_CLUSTER_CODE0  +    -0.11110867930916 *
        G_CLUSTER_CODE1  +     0.08361781679846 * G_CLUSTER_CODE2
          +     0.04967449645217 * G_CLUSTER_CODE3  +    -0.12097233533707 *
        G_CLUSTER_CODE4  +     0.15262282964346 * G_CLUSTER_CODE5
          +     0.12159567468107 * G_CLUSTER_CODE6  +     0.03625236635579 *
        G_CLUSTER_CODE7  +    -0.21445899560655 * G_RECENCY_STATUS_96NK0
          +    -0.35090637113899 * G_RECENCY_STATUS_96NK1
          +     0.12086559045117 * G_RECENCY_STATUS_96NK2
          +    -0.17744278195077 * G_RECENT_CARD_RESPONSE_COUNT0
          +     0.02096535236292 * G_RECENT_CARD_RESPONSE_COUNT1
          +     0.04018561432328 * G_RECENT_CARD_RESPONSE_COUNT2
          +     0.23432383898757 * G_RECENT_CARD_RESPONSE_COUNT3
          +    -0.17217485848211 * G_RECENT_RESPONSE_COUNT0
          +     0.38539624657998 * G_RECENT_RESPONSE_COUNT1
          +    -0.05870606069492 * G_RECENT_RESPONSE_COUNT2
          +     0.00490471642058 * OPT_LIFETIME_GI01_low_4_5
          +     -0.2247487413791 * OPT_LIFETIME_GI02_4_5_13_5__MI ;
   H12  = H12  +    -0.16352482397887 * FREQUENCY_STATUS_97NK1
          +    -0.06618691765749 * FREQUENCY_STATUS_97NK2
          +    -0.05950999990543 * FREQUENCY_STATUS_97NK3
          +    -0.25681629503912 * G_CARD_PROM_120  +    -0.00700511923894 *
        G_CARD_PROM_121  +     0.11031717991515 * G_CARD_PROM_122
          +    -0.11502491672221 * G_CARD_PROM_123  +    -0.01793888600582 *
        G_CARD_PROM_124  +    -0.07008514617974 * G_CARD_PROM_125
          +     0.21861055052062 * G_CLUSTER_CODE0  +    -0.25838456698193 *
        G_CLUSTER_CODE1  +     0.05924460089257 * G_CLUSTER_CODE2
          +    -0.12590382234941 * G_CLUSTER_CODE3  +      0.1787748704023 *
        G_CLUSTER_CODE4  +     0.19953880608103 * G_CLUSTER_CODE5
          +    -0.01071076148168 * G_CLUSTER_CODE6  +     0.02166768691646 *
        G_CLUSTER_CODE7  +     0.15883892102069 * G_RECENCY_STATUS_96NK0
          +    -0.15994827574112 * G_RECENCY_STATUS_96NK1
          +    -0.26786357302142 * G_RECENCY_STATUS_96NK2
          +     0.25314125894869 * G_RECENT_CARD_RESPONSE_COUNT0
          +     0.24689931062649 * G_RECENT_CARD_RESPONSE_COUNT1
          +    -0.04297181610486 * G_RECENT_CARD_RESPONSE_COUNT2
          +     0.23319268262903 * G_RECENT_CARD_RESPONSE_COUNT3
          +     0.24843306214969 * G_RECENT_RESPONSE_COUNT0
          +    -0.02050546154796 * G_RECENT_RESPONSE_COUNT1
          +    -0.04531469972856 * G_RECENT_RESPONSE_COUNT2
          +     0.00125649724799 * OPT_LIFETIME_GI01_low_4_5
          +    -0.13394875961332 * OPT_LIFETIME_GI02_4_5_13_5__MI ;
   H13  = H13  +    -0.02278286390999 * FREQUENCY_STATUS_97NK1
          +    -0.03310469048665 * FREQUENCY_STATUS_97NK2
          +     0.03481275760113 * FREQUENCY_STATUS_97NK3
          +    -0.13328931008823 * G_CARD_PROM_120  +    -0.15905690282229 *
        G_CARD_PROM_121  +     0.06178833824023 * G_CARD_PROM_122
          +    -0.19128320209733 * G_CARD_PROM_123  +     0.04498858136501 *
        G_CARD_PROM_124  +    -0.11087930402878 * G_CARD_PROM_125
          +      0.1533904770682 * G_CLUSTER_CODE0  +     0.18314551302224 *
        G_CLUSTER_CODE1  +     -0.3337037757849 * G_CLUSTER_CODE2
          +    -0.34406068724391 * G_CLUSTER_CODE3  +    -0.01857153116431 *
        G_CLUSTER_CODE4  +    -0.15899239146898 * G_CLUSTER_CODE5
          +     0.18940276021503 * G_CLUSTER_CODE6  +    -0.03053439923764 *
        G_CLUSTER_CODE7  +     0.14835315846918 * G_RECENCY_STATUS_96NK0
          +     -0.0498531276373 * G_RECENCY_STATUS_96NK1
          +    -0.10608299122292 * G_RECENCY_STATUS_96NK2
          +    -0.24160106160337 * G_RECENT_CARD_RESPONSE_COUNT0
          +    -0.13193576557682 * G_RECENT_CARD_RESPONSE_COUNT1
          +     0.03256143141161 * G_RECENT_CARD_RESPONSE_COUNT2
          +    -0.03932406991241 * G_RECENT_CARD_RESPONSE_COUNT3
          +     0.25147147357576 * G_RECENT_RESPONSE_COUNT0
          +    -0.31133361286833 * G_RECENT_RESPONSE_COUNT1
          +     0.23494702886086 * G_RECENT_RESPONSE_COUNT2
          +    -0.11322615498205 * OPT_LIFETIME_GI01_low_4_5
          +     0.18921523087634 * OPT_LIFETIME_GI02_4_5_13_5__MI ;
   H14  = H14  +     0.30380362108164 * FREQUENCY_STATUS_97NK1
          +    -0.05497193231139 * FREQUENCY_STATUS_97NK2
          +    -0.23656783648124 * FREQUENCY_STATUS_97NK3
          +    -0.37292427600327 * G_CARD_PROM_120  +     0.15453730385597 *
        G_CARD_PROM_121  +     0.18549661834026 * G_CARD_PROM_122
          +     0.05518181264516 * G_CARD_PROM_123  +    -0.14525454012242 *
        G_CARD_PROM_124  +     0.09788418101011 * G_CARD_PROM_125
          +     0.08644361935889 * G_CLUSTER_CODE0  +    -0.16813092433416 *
        G_CLUSTER_CODE1  +    -0.13212962960433 * G_CLUSTER_CODE2
          +    -0.17152378085479 * G_CLUSTER_CODE3  +    -0.32165606266347 *
        G_CLUSTER_CODE4  +     0.12978657848268 * G_CLUSTER_CODE5
          +     0.00532989078916 * G_CLUSTER_CODE6  +     0.04305242277199 *
        G_CLUSTER_CODE7  +     0.27927711482868 * G_RECENCY_STATUS_96NK0
          +    -0.02090540415754 * G_RECENCY_STATUS_96NK1
          +     0.25787097378466 * G_RECENCY_STATUS_96NK2
          +     0.11860500320153 * G_RECENT_CARD_RESPONSE_COUNT0
          +    -0.18506725500291 * G_RECENT_CARD_RESPONSE_COUNT1
          +     0.11212842242795 * G_RECENT_CARD_RESPONSE_COUNT2
          +    -0.30686505432178 * G_RECENT_CARD_RESPONSE_COUNT3
          +      0.3101711491395 * G_RECENT_RESPONSE_COUNT0
          +     -0.0363908767277 * G_RECENT_RESPONSE_COUNT1
          +    -0.17509119171654 * G_RECENT_RESPONSE_COUNT2
          +     -0.0090650334417 * OPT_LIFETIME_GI01_low_4_5
          +     0.09072423774134 * OPT_LIFETIME_GI02_4_5_13_5__MI ;
   H15  = H15  +    -0.31171241823743 * FREQUENCY_STATUS_97NK1
          +    -0.07781651914779 * FREQUENCY_STATUS_97NK2
          +    -0.49384633896434 * FREQUENCY_STATUS_97NK3
          +     0.30576599950084 * G_CARD_PROM_120  +     0.12442017901286 *
        G_CARD_PROM_121  +     0.04011722241028 * G_CARD_PROM_122
          +    -0.49337520347492 * G_CARD_PROM_123  +     0.13080475760228 *
        G_CARD_PROM_124  +     0.06118236580179 * G_CARD_PROM_125
          +    -0.08739162819656 * G_CLUSTER_CODE0  +    -0.08298129125869 *
        G_CLUSTER_CODE1  +    -0.08287495308174 * G_CLUSTER_CODE2
          +    -0.00922896365269 * G_CLUSTER_CODE3  +     0.25591109190383 *
        G_CLUSTER_CODE4  +    -0.01820343031973 * G_CLUSTER_CODE5
          +    -0.05886287418427 * G_CLUSTER_CODE6  +     0.18278935524879 *
        G_CLUSTER_CODE7  +    -0.04443793982458 * G_RECENCY_STATUS_96NK0
          +    -0.24376263220977 * G_RECENCY_STATUS_96NK1
          +    -0.02056875679055 * G_RECENCY_STATUS_96NK2
          +      0.0106806502803 * G_RECENT_CARD_RESPONSE_COUNT0
          +     0.04700979454081 * G_RECENT_CARD_RESPONSE_COUNT1
          +    -0.14770304353585 * G_RECENT_CARD_RESPONSE_COUNT2
          +    -0.12867537641781 * G_RECENT_CARD_RESPONSE_COUNT3
          +    -0.29043209874301 * G_RECENT_RESPONSE_COUNT0
          +      0.1815769992282 * G_RECENT_RESPONSE_COUNT1
          +    -0.21963864240678 * G_RECENT_RESPONSE_COUNT2
          +    -0.02728560921104 * OPT_LIFETIME_GI01_low_4_5
          +    -0.02921068489127 * OPT_LIFETIME_GI02_4_5_13_5__MI ;
   H11  =    -0.02955360372466 + H11 ;
   H12  =     0.22622997279397 + H12 ;
   H13  =    -1.49895351273186 + H13 ;
   H14  =     2.01423747637263 + H14 ;
   H15  =    -0.56962276227658 + H15 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
   H15  = TANH(H15 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
   H15  = .;
END;
*** *************************;
*** Writing the Node TARGET_B ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_TARGET_B1  =    -0.07413423594325 * H11  +     0.01590017105672 * H12
          +     0.02354550709167 * H13  +     0.02872856988505 * H14
          +    -0.12155272198661 * H15 ;
   P_TARGET_B1  = P_TARGET_B1  +    -0.07964257414039 * S_LG10_LAST_GIFT_AMT
          +    -0.10800112323143 * S_MONTHS_SINCE_LAST_GIFT ;
   P_TARGET_B1  = P_TARGET_B1  +    -0.06702560867309 * PEP_STAR0 ;
   P_TARGET_B1  = P_TARGET_B1  +    -0.17608241158332 * FREQUENCY_STATUS_97NK1
          +    -0.02898150444629 * FREQUENCY_STATUS_97NK2
          +     0.05090541281098 * FREQUENCY_STATUS_97NK3
          +     0.04088369659902 * G_CARD_PROM_120  +     0.11662777972531 *
        G_CARD_PROM_121  +     0.06796789006729 * G_CARD_PROM_122
          +     0.02414580000739 * G_CARD_PROM_123  +     0.12878345047347 *
        G_CARD_PROM_124  +    -0.25811670372811 * G_CARD_PROM_125
          +     0.21264277132797 * G_CLUSTER_CODE0  +     0.36117402731971 *
        G_CLUSTER_CODE1  +     0.19072383745501 * G_CLUSTER_CODE2
          +     0.16104193939364 * G_CLUSTER_CODE3  +     0.04286522867523 *
        G_CLUSTER_CODE4  +    -0.05807505526846 * G_CLUSTER_CODE5
          +    -0.11219100493914 * G_CLUSTER_CODE6  +    -0.32684926796465 *
        G_CLUSTER_CODE7  +      0.1289727766094 * G_RECENCY_STATUS_96NK0
          +     0.10564270144554 * G_RECENCY_STATUS_96NK1
          +    -0.00736891638152 * G_RECENCY_STATUS_96NK2
          +      0.2755540618358 * G_RECENT_CARD_RESPONSE_COUNT0
          +     0.01513710334843 * G_RECENT_CARD_RESPONSE_COUNT1
          +    -0.03699793639192 * G_RECENT_CARD_RESPONSE_COUNT2
          +    -0.03203495553888 * G_RECENT_CARD_RESPONSE_COUNT3
          +      0.0755640111083 * G_RECENT_RESPONSE_COUNT0
          +      0.0325914309027 * G_RECENT_RESPONSE_COUNT1
          +    -0.09006652648533 * G_RECENT_RESPONSE_COUNT2
          +    -0.05776348037458 * OPT_LIFETIME_GI01_low_4_5
          +     0.04028810792559 * OPT_LIFETIME_GI02_4_5_13_5__MI ;
   P_TARGET_B1  =    -1.05427904860498 + P_TARGET_B1 ;
   P_TARGET_B0  = 0;
   _MAX_ = MAX (P_TARGET_B1 , P_TARGET_B0 );
   _SUM_ = 0.;
   P_TARGET_B1  = EXP(P_TARGET_B1  - _MAX_);
   _SUM_ = _SUM_ + P_TARGET_B1 ;
   P_TARGET_B0  = EXP(P_TARGET_B0  - _MAX_);
   _SUM_ = _SUM_ + P_TARGET_B0 ;
   P_TARGET_B1  = P_TARGET_B1  / _SUM_;
   P_TARGET_B0  = P_TARGET_B0  / _SUM_;
END;
ELSE DO;
   P_TARGET_B1  = .;
   P_TARGET_B0  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_TARGET_B1  =     0.25004693073024;
   P_TARGET_B0  =     0.74995306926975;
END;


*** Update Posterior Probabilities;
P_TARGET_B1 = P_TARGET_B1 * 0.05 / 0.25004693073024;
P_TARGET_B0 = P_TARGET_B0 * 0.95 / 0.74995306926975;
drop _sum; _sum = P_TARGET_B1 + P_TARGET_B0 ;
if _sum > 4.135903E-25 then do;
   P_TARGET_B1 = P_TARGET_B1 / _sum;
   P_TARGET_B0 = P_TARGET_B0 / _sum;
end;

*** Decision Processing;
label D_TARGET_B = 'Decision: TARGET_B' ;
label EP_TARGET_B = 'Expected Profit: TARGET_B' ;

length D_TARGET_B $ 9;

D_TARGET_B = ' ';
EP_TARGET_B = .;

*** Compute Expected Consequences and Choose Decision;
_decnum = 1; drop _decnum;

D_TARGET_B = '1' ;
EP_TARGET_B = P_TARGET_B1 * 14.5 + P_TARGET_B0 * -0.5;
drop _sum;
_sum = P_TARGET_B1 * 0 + P_TARGET_B0 * 0;
if _sum > EP_TARGET_B + 6.593837E-12 then do;
   EP_TARGET_B = _sum; _decnum = 2;
   D_TARGET_B = '0' ;
end;


*** End Decision Processing ;
*** *************************;
*** Writing the I_TARGET_B  AND U_TARGET_B ;
*** *************************;
_MAXP_ = P_TARGET_B1 ;
I_TARGET_B  = "1           " ;
U_TARGET_B  =                    1;
IF( _MAXP_ LT P_TARGET_B0  ) THEN DO;
   _MAXP_ = P_TARGET_B0 ;
   I_TARGET_B  = "0           " ;
   U_TARGET_B  =                    0;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
drop
H11
H12
H13
H14
H15
;
drop S_:;
