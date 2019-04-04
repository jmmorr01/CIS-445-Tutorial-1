****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH F_TARGET_B  $   12; 
LENGTH I_TARGET_B  $   12; 
LENGTH _WARN_  $    4; 

******              LABELS FOR NEW VARIABLES              ******;
label P_TARGET_B1 = 'Predicted: TARGET_B=1' ;
      P_TARGET_B1  = 0;
label P_TARGET_B0 = 'Predicted: TARGET_B=0' ;
      P_TARGET_B0  = 0;
label Q_TARGET_B1 = 'Unadjusted P: TARGET_B=1' ;
      Q_TARGET_B1  = 0;
label Q_TARGET_B0 = 'Unadjusted P: TARGET_B=0' ;
      Q_TARGET_B0  = 0;
label R_TARGET_B1 = 'Residual: TARGET_B=1' ;
label R_TARGET_B0 = 'Residual: TARGET_B=0' ;
label F_TARGET_B = 'From: TARGET_B' ;
label I_TARGET_B = 'Into: TARGET_B' ;
label U_TARGET_B = 'Unnormalized Into: TARGET_B' ;
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12; 
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_2 $      2; DROP _ARBFMT_2; 
_ARBFMT_2 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_4 $      4; DROP _ARBFMT_4; 
_ARBFMT_4 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_5 $      5; DROP _ARBFMT_5; 
_ARBFMT_5 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_3 $      3; DROP _ARBFMT_3; 
_ARBFMT_3 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_1 $      1; DROP _ARBFMT_1; 
_ARBFMT_1 = ' '; /* Initialize to avoid warning. */


_ARBFMT_12 = PUT( TARGET_B , BEST12.);
 %DMNORMCP( _ARBFMT_12, F_TARGET_B );

 DROP _ARB_F_;
 DROP _ARB_BADF_;
     _ARB_F_ = 0.5491810036;
     _ARB_BADF_ = 0;
******             ASSIGN OBSERVATION TO NODE             ******;
 DROP _ARB_P_;
 _ARB_P_ = 0;
 DROP _ARB_PPATH_; _ARB_PPATH_ = 1;

********** LEAF     1  NODE   412 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

   DROP _BRANCH_;
  _BRANCH_ = -1;
   DROP _ARB_SURR_;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'4' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,
        '10' ,'13' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <                0.218 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'42' ,'25' ,'01' ,'37' ,'38' ,'48' ,
      '31' ,'35' ,'40' ,'13' ,'28' ,'14' ,'17' ,'11' ,'47' ,'03' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'42' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'35' ,'40' ,
      '13' ,'28' ,'14' ,'17' ,'11' ,'47' ,'03' ,'49' ,'50' ,'43' ,'46' ,'45' ,
      '20' ,'16' ,'30' ,'07' ,'34' ,'23' ,'09' ,'02' ,'41' ,'15' ,'18' ,'36' ,
      '24' ,'08' ,'12' ,'19' ,'27' ,'26' ,'21' ,'51' ,'44' ,'29' ,'05' ,'39' ,
      '33' ,'22' ,'06' ,'32' ,'52' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF                578.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('1' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_4 IN ('2' ,'3' ,'4' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.004132905;
      END;
    END;
  END;

********** LEAF     2  NODE   414 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'4' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,
        '10' ,'13' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <                0.218 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('49' ,'50' ,'43' ,'46' ,'45' ,'20' ,'16' ,'30' ,'07' ,
      '34' ,'23' ,'09' ,'02' ,'41' ,'15' ,'18' ,'36' ,'24' ,'08' ,'12' ,'19' ,
      '27' ,'26' ,'21' ,'51' ,'44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'06' ,'32' ,
      '52' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'42' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'35' ,'40' ,
      '13' ,'28' ,'14' ,'17' ,'11' ,'47' ,'03' ,'49' ,'50' ,'43' ,'46' ,'45' ,
      '20' ,'16' ,'30' ,'07' ,'34' ,'23' ,'09' ,'02' ,'41' ,'15' ,'18' ,'36' ,
      '24' ,'08' ,'12' ,'19' ,'27' ,'26' ,'21' ,'51' ,'44' ,'29' ,'05' ,'39' ,
      '33' ,'22' ,'06' ,'32' ,'52' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF MEDIAN_HOUSEHOLD_INCOME  <                578.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('2' ,'3' ,'4' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('1' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'53' ,'42' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'35' ,
        '40' ,'13' ,'28' ,'14' ,'17' ,'11' ,'47' ,'03' ,'49' ,'50' ,'43' ,
        '46' ,'45' ,'20' ,'16' ,'30' ,'07' ,'34' ,'23' ,'09' ,'02' ,'41' ,
        '15' ,'18' ,'36' ,'24' ,'08' ,'12' ,'19' ,'27' ,'26' ,'21' ,'51' ,
        '44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'06' ,'32' ,'52' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(PEP_STAR ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_12 NOTIN (
        '1' ,'0' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(FILE_CARD_GIFT ) THEN DO;
            IF                  4.5 <= FILE_CARD_GIFT  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
            IF                  8.5 <= LIFETIME_GIFT_COUNT  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0074440158;
        END;
      END;
    END;
  END;

********** LEAF     3  NODE   415 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'4' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,
        '10' ,'13' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <                0.218 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('49' ,'50' ,'43' ,'46' ,'45' ,'20' ,'16' ,'30' ,'07' ,
      '34' ,'23' ,'09' ,'02' ,'41' ,'15' ,'18' ,'36' ,'24' ,'08' ,'12' ,'19' ,
      '27' ,'26' ,'21' ,'51' ,'44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'06' ,'32' ,
      '52' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'42' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'35' ,'40' ,
      '13' ,'28' ,'14' ,'17' ,'11' ,'47' ,'03' ,'49' ,'50' ,'43' ,'46' ,'45' ,
      '20' ,'16' ,'30' ,'07' ,'34' ,'23' ,'09' ,'02' ,'41' ,'15' ,'18' ,'36' ,
      '24' ,'08' ,'12' ,'19' ,'27' ,'26' ,'21' ,'51' ,'44' ,'29' ,'05' ,'39' ,
      '33' ,'22' ,'06' ,'32' ,'52' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF MEDIAN_HOUSEHOLD_INCOME  <                578.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('2' ,'3' ,'4' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('1' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'53' ,'42' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'35' ,
        '40' ,'13' ,'28' ,'14' ,'17' ,'11' ,'47' ,'03' ,'49' ,'50' ,'43' ,
        '46' ,'45' ,'20' ,'16' ,'30' ,'07' ,'34' ,'23' ,'09' ,'02' ,'41' ,
        '15' ,'18' ,'36' ,'24' ,'08' ,'12' ,'19' ,'27' ,'26' ,'21' ,'51' ,
        '44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'06' ,'32' ,'52' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('0' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(PEP_STAR ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_12 NOTIN (
        '1' ,'0' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(FILE_CARD_GIFT ) THEN DO;
            IF FILE_CARD_GIFT  <                  4.5 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
            IF LIFETIME_GIFT_COUNT  <                  8.5 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( PEP_STAR  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_12 NOTIN (
          '1' ,'0' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0283473977;
        END;
      END;
    END;
  END;

********** LEAF     4  NODE   411 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('3' ,'4' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'4' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,'10' ,
        '13' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF                0.218 <= RECENT_RESPONSE_PROP  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.024649371;
    END;
  END;

********** LEAF     5  NODE   419 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
    FILE_AVG_GIFT  <               10.195 THEN DO;
     _BRANCH_ =    1; 
    END; 
   IF MISSING(FILE_AVG_GIFT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_AVG_GIFT_AMT ) THEN DO;
        IF LIFETIME_AVG_GIFT_AMT  <               10.195 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
        IF RECENT_AVG_GIFT_AMT  <                12.27 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'42' ,'01' ,'37' ,'31' ,'13' ,'17' ,'47' ,'50' ,
      '43' ,'46' ,'45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'15' ,'19' ,'26' ,'21' ,
      '44' ,'29' ,'33' ,'06' ,'32' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'01' ,'37' ,'31' ,'13' ,'17' ,'47' ,'50' ,'43' ,'46' ,'45' ,
      '30' ,'07' ,'34' ,'09' ,'02' ,'15' ,'19' ,'26' ,'21' ,'44' ,'29' ,'33' ,
      '06' ,'32' ,'10' ,'04' ,'53' ,'25' ,'38' ,'48' ,'35' ,'40' ,'28' ,'14' ,
      '11' ,'03' ,'49' ,'20' ,'16' ,'23' ,'41' ,'18' ,'36' ,'24' ,'08' ,'12' ,
      '27' ,'51' ,'05' ,'39' ,'22' ,'52' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
        _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('U' ,'R' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_4 IN ('S' ,'C' ,'T' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE3 ) THEN DO;
          IF PCT_ATTRIBUTE3  <                    3 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000738189;
      END;
    END;
  END;

********** LEAF     6  NODE   420 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
    FILE_AVG_GIFT  <               10.195 THEN DO;
     _BRANCH_ =    1; 
    END; 
   IF MISSING(FILE_AVG_GIFT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_AVG_GIFT_AMT ) THEN DO;
        IF LIFETIME_AVG_GIFT_AMT  <               10.195 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
        IF RECENT_AVG_GIFT_AMT  <                12.27 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'53' ,'25' ,'38' ,'48' ,'35' ,'40' ,'28' ,'14' ,
      '11' ,'03' ,'49' ,'20' ,'16' ,'23' ,'41' ,'18' ,'36' ,'24' ,'08' ,'12' ,
      '27' ,'51' ,'05' ,'39' ,'22' ,'52' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'01' ,'37' ,'31' ,'13' ,'17' ,'47' ,'50' ,'43' ,'46' ,'45' ,
      '30' ,'07' ,'34' ,'09' ,'02' ,'15' ,'19' ,'26' ,'21' ,'44' ,'29' ,'33' ,
      '06' ,'32' ,'10' ,'04' ,'53' ,'25' ,'38' ,'48' ,'35' ,'40' ,'28' ,'14' ,
      '11' ,'03' ,'49' ,'20' ,'16' ,'23' ,'41' ,'18' ,'36' ,'24' ,'08' ,'12' ,
      '27' ,'51' ,'05' ,'39' ,'22' ,'52' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
        _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('S' ,'C' ,'T' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('U' ,'R' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE3 ) THEN DO;
          IF                    3 <= PCT_ATTRIBUTE3  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'42' ,'01' ,'37' ,'31' ,'13' ,'17' ,'47' ,'50' ,'43' ,'46' ,
        '45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'15' ,'19' ,'26' ,'21' ,'44' ,
        '29' ,'33' ,'06' ,'32' ,'10' ,'04' ,'53' ,'25' ,'38' ,'48' ,'35' ,
        '40' ,'28' ,'14' ,'11' ,'03' ,'49' ,'20' ,'16' ,'23' ,'41' ,'18' ,
        '36' ,'24' ,'08' ,'12' ,'27' ,'51' ,'05' ,'39' ,'22' ,'52' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.024705957;
      END;
    END;
  END;

********** LEAF     7  NODE   421 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
                  10.195 <= FILE_AVG_GIFT  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(FILE_AVG_GIFT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_AVG_GIFT_AMT ) THEN DO;
        IF               10.195 <= LIFETIME_AVG_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
        IF                12.27 <= RECENT_AVG_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FILE_AVG_GIFT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(MEDIAN_HOME_VALUE ) AND 
      MEDIAN_HOME_VALUE  <                678.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(MEDIAN_HOME_VALUE ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF PER_CAPITA_INCOME  <                13167 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF MEDIAN_HOUSEHOLD_INCOME  <                285.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0251801516;
      END;
    END;
  END;

********** LEAF     8  NODE   423 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
                  10.195 <= FILE_AVG_GIFT  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(FILE_AVG_GIFT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_AVG_GIFT_AMT ) THEN DO;
        IF               10.195 <= LIFETIME_AVG_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
        IF                12.27 <= RECENT_AVG_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FILE_AVG_GIFT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(MEDIAN_HOME_VALUE ) AND 
                     678.5 <= MEDIAN_HOME_VALUE  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(MEDIAN_HOME_VALUE ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF                13167 <= PER_CAPITA_INCOME  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF                285.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( MEDIAN_HOME_VALUE  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
       %DMNORMIP( _ARBFMT_2);
        IF _ARBFMT_2 IN ('.' ,'42' ,'25' ,'01' ,'38' ,'31' ,'35' ,'40' ,'13' ,
        '14' ,'03' ,'49' ,'46' ,'16' ,'07' ,'34' ,'41' ,'15' ,'36' ,'19' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_2 NOTIN (
        '.' ,'42' ,'25' ,'01' ,'38' ,'31' ,'35' ,'40' ,'13' ,'14' ,'03' ,
        '49' ,'46' ,'16' ,'07' ,'34' ,'41' ,'15' ,'36' ,'19' ,'04' ,'37' ,
        '48' ,'28' ,'17' ,'11' ,'20' ,'30' ,'23' ,'09' ,'02' ,'18' ,'24' ,
        '08' ,'12' ,'27' ,'26' ,'21' ,'44' ,'29' ,'05' ,'39' ,'22' ,'06' ,
        '10' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
          _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('R' ,'T' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_4 IN ('U' ,'S' ,'C' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
          _ARBFMT_4 = PUT( REP_SES , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('1' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_4 IN ('2' ,'3' ,'4' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_2 NOTIN (
          '.' ,'42' ,'25' ,'01' ,'38' ,'31' ,'35' ,'40' ,'13' ,'14' ,'03' ,
          '49' ,'46' ,'16' ,'07' ,'34' ,'41' ,'15' ,'36' ,'19' ,'04' ,'37' ,
          '48' ,'28' ,'17' ,'11' ,'20' ,'30' ,'23' ,'09' ,'02' ,'18' ,'24' ,
          '08' ,'12' ,'27' ,'26' ,'21' ,'44' ,'29' ,'05' ,'39' ,'22' ,'06' ,
          '10' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.009900066;
        END;
      END;
    END;
  END;

********** LEAF     9  NODE   424 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
                  10.195 <= FILE_AVG_GIFT  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(FILE_AVG_GIFT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_AVG_GIFT_AMT ) THEN DO;
        IF               10.195 <= LIFETIME_AVG_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
        IF                12.27 <= RECENT_AVG_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FILE_AVG_GIFT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(MEDIAN_HOME_VALUE ) AND 
                     678.5 <= MEDIAN_HOME_VALUE  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(MEDIAN_HOME_VALUE ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF                13167 <= PER_CAPITA_INCOME  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF                285.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( MEDIAN_HOME_VALUE  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
       %DMNORMIP( _ARBFMT_2);
        IF _ARBFMT_2 IN ('04' ,'37' ,'48' ,'28' ,'17' ,'11' ,'20' ,'30' ,
        '23' ,'09' ,'02' ,'18' ,'24' ,'08' ,'12' ,'27' ,'26' ,'21' ,'44' ,
        '29' ,'05' ,'39' ,'22' ,'06' ,'10' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_2 NOTIN (
        '.' ,'42' ,'25' ,'01' ,'38' ,'31' ,'35' ,'40' ,'13' ,'14' ,'03' ,
        '49' ,'46' ,'16' ,'07' ,'34' ,'41' ,'15' ,'36' ,'19' ,'04' ,'37' ,
        '48' ,'28' ,'17' ,'11' ,'20' ,'30' ,'23' ,'09' ,'02' ,'18' ,'24' ,
        '08' ,'12' ,'27' ,'26' ,'21' ,'44' ,'29' ,'05' ,'39' ,'22' ,'06' ,
        '10' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
          _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('U' ,'S' ,'C' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_4 IN ('R' ,'T' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
          _ARBFMT_4 = PUT( REP_SES , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('2' ,'3' ,'4' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_4 IN ('1' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0159005828;
        END;
      END;
    END;
  END;

********** LEAF    10  NODE   428 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ,'11' ,'4' ,'12' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'0' ,'11' ,'4' ,'12' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' ,'13' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <               0.2565 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_CARD_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('0' ,'1' ,'3' ,'2' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('4' ,'7' ,'5' ,'6' ,'8' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'0' ,'11' ,'4' ,'12' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' ,
      '13' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(FILE_CARD_GIFT ) AND 
      FILE_CARD_GIFT  <                  1.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(FILE_CARD_GIFT ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
          IF LIFETIME_GIFT_COUNT  <                  2.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_CARD_PROM ) THEN DO;
          IF LIFETIME_CARD_PROM  <                  8.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0216845303;
      END;
    END;
  END;

********** LEAF    11  NODE   432 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ,'11' ,'4' ,'12' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'0' ,'11' ,'4' ,'12' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' ,'13' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <               0.2565 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_CARD_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('0' ,'1' ,'3' ,'2' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('4' ,'7' ,'5' ,'6' ,'8' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'0' ,'11' ,'4' ,'12' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' ,
      '13' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(FILE_CARD_GIFT ) AND 
                       1.5 <= FILE_CARD_GIFT  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(FILE_CARD_GIFT ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
          IF                  2.5 <= LIFETIME_GIFT_COUNT  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_CARD_PROM ) THEN DO;
          IF                  8.5 <= LIFETIME_CARD_PROM  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FILE_CARD_GIFT  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
       %DMNORMIP( _ARBFMT_2);
        IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'42' ,'25' ,'01' ,'37' ,'38' ,'48' ,
        '31' ,'35' ,'40' ,'13' ,'28' ,'17' ,'11' ,'47' ,'43' ,'46' ,'20' ,
        '16' ,'30' ,'02' ,'15' ,'18' ,'24' ,'12' ,'27' ,'26' ,'21' ,'51' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'53' ,'42' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'35' ,
        '40' ,'13' ,'28' ,'17' ,'11' ,'47' ,'43' ,'46' ,'20' ,'16' ,'30' ,
        '02' ,'15' ,'18' ,'24' ,'12' ,'27' ,'26' ,'21' ,'51' ,'14' ,'03' ,
        '49' ,'50' ,'45' ,'07' ,'34' ,'23' ,'09' ,'41' ,'36' ,'08' ,'19' ,
        '44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'06' ,'32' ,'52' ,'10' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
          _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('R' ,'S' ,'C' ,'T' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_4 IN ('U' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE4 ) THEN DO;
            IF PCT_ATTRIBUTE4  <                 76.5 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_2 NOTIN (
          '.' ,'04' ,'53' ,'42' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'35' ,
          '40' ,'13' ,'28' ,'17' ,'11' ,'47' ,'43' ,'46' ,'20' ,'16' ,'30' ,
          '02' ,'15' ,'18' ,'24' ,'12' ,'27' ,'26' ,'21' ,'51' ,'14' ,'03' ,
          '49' ,'50' ,'45' ,'07' ,'34' ,'23' ,'09' ,'41' ,'36' ,'08' ,'19' ,
          '44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'06' ,'32' ,'52' ,'10' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
        _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
         %DMNORMIP( _ARBFMT_12);
          IF _ARBFMT_12 IN ('1' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK
          ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_12 NOTIN (
          '1' ,'2' ,'3' ,'4' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
              IF RECENT_RESPONSE_PROP  <               0.1465 THEN DO;
               _BRANCH_ =    1; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
            _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
             %DMNORMIP( _ARBFMT_12);
              IF _ARBFMT_12 IN ('1' ,'2' ,'0' ) THEN DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_12 IN ('3' ,'11' ,'4' ,'12' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + 0.0030353446;
          END;
        END;
      END;
    END;
  END;

********** LEAF    12  NODE   433 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ,'11' ,'4' ,'12' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'0' ,'11' ,'4' ,'12' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' ,'13' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <               0.2565 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_CARD_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('0' ,'1' ,'3' ,'2' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('4' ,'7' ,'5' ,'6' ,'8' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'0' ,'11' ,'4' ,'12' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' ,
      '13' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(FILE_CARD_GIFT ) AND 
                       1.5 <= FILE_CARD_GIFT  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(FILE_CARD_GIFT ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
          IF                  2.5 <= LIFETIME_GIFT_COUNT  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_CARD_PROM ) THEN DO;
          IF                  8.5 <= LIFETIME_CARD_PROM  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FILE_CARD_GIFT  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
       %DMNORMIP( _ARBFMT_2);
        IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'42' ,'25' ,'01' ,'37' ,'38' ,'48' ,
        '31' ,'35' ,'40' ,'13' ,'28' ,'17' ,'11' ,'47' ,'43' ,'46' ,'20' ,
        '16' ,'30' ,'02' ,'15' ,'18' ,'24' ,'12' ,'27' ,'26' ,'21' ,'51' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'53' ,'42' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'35' ,
        '40' ,'13' ,'28' ,'17' ,'11' ,'47' ,'43' ,'46' ,'20' ,'16' ,'30' ,
        '02' ,'15' ,'18' ,'24' ,'12' ,'27' ,'26' ,'21' ,'51' ,'14' ,'03' ,
        '49' ,'50' ,'45' ,'07' ,'34' ,'23' ,'09' ,'41' ,'36' ,'08' ,'19' ,
        '44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'06' ,'32' ,'52' ,'10' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
          _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('R' ,'S' ,'C' ,'T' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_4 IN ('U' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE4 ) THEN DO;
            IF PCT_ATTRIBUTE4  <                 76.5 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_2 NOTIN (
          '.' ,'04' ,'53' ,'42' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'35' ,
          '40' ,'13' ,'28' ,'17' ,'11' ,'47' ,'43' ,'46' ,'20' ,'16' ,'30' ,
          '02' ,'15' ,'18' ,'24' ,'12' ,'27' ,'26' ,'21' ,'51' ,'14' ,'03' ,
          '49' ,'50' ,'45' ,'07' ,'34' ,'23' ,'09' ,'41' ,'36' ,'08' ,'19' ,
          '44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'06' ,'32' ,'52' ,'10' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
        _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
         %DMNORMIP( _ARBFMT_12);
          IF _ARBFMT_12 IN ('2' ,'3' ,'4' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK
          ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_12 NOTIN (
          '1' ,'2' ,'3' ,'4' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
              IF               0.1465 <= RECENT_RESPONSE_PROP  THEN DO;
               _BRANCH_ =    2; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
            _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
             %DMNORMIP( _ARBFMT_12);
              IF _ARBFMT_12 IN ('3' ,'11' ,'4' ,'12' ) THEN DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_12 IN ('1' ,'2' ,'0' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;
        IF _BRANCH_ LT 0 THEN DO; 
          _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
           %DMNORMIP( _ARBFMT_12);
           IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 2;
          ELSE IF _ARBFMT_12 NOTIN (
            '1' ,'2' ,'3' ,'4' 
             ) THEN _BRANCH_ = 2;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -0.01506797;
          END;
        END;
      END;
    END;
  END;

********** LEAF    13  NODE   431 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ,'11' ,'4' ,'12' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'0' ,'11' ,'4' ,'12' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' ,'13' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <               0.2565 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_CARD_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('0' ,'1' ,'3' ,'2' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('4' ,'7' ,'5' ,'6' ,'8' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'0' ,'11' ,'4' ,'12' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' ,
      '13' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(FILE_CARD_GIFT ) AND 
                       1.5 <= FILE_CARD_GIFT  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(FILE_CARD_GIFT ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
          IF                  2.5 <= LIFETIME_GIFT_COUNT  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_CARD_PROM ) THEN DO;
          IF                  8.5 <= LIFETIME_CARD_PROM  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FILE_CARD_GIFT  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
       %DMNORMIP( _ARBFMT_2);
        IF _ARBFMT_2 IN ('14' ,'03' ,'49' ,'50' ,'45' ,'07' ,'34' ,'23' ,
        '09' ,'41' ,'36' ,'08' ,'19' ,'44' ,'29' ,'05' ,'39' ,'33' ,'22' ,
        '06' ,'32' ,'52' ,'10' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'53' ,'42' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'35' ,
        '40' ,'13' ,'28' ,'17' ,'11' ,'47' ,'43' ,'46' ,'20' ,'16' ,'30' ,
        '02' ,'15' ,'18' ,'24' ,'12' ,'27' ,'26' ,'21' ,'51' ,'14' ,'03' ,
        '49' ,'50' ,'45' ,'07' ,'34' ,'23' ,'09' ,'41' ,'36' ,'08' ,'19' ,
        '44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'06' ,'32' ,'52' ,'10' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
          _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('U' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_4 IN ('R' ,'S' ,'C' ,'T' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE4 ) THEN DO;
            IF                 76.5 <= PCT_ATTRIBUTE4  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0148219221;
        END;
      END;
    END;
  END;

********** LEAF    14  NODE   427 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('9' ,'7' ,'5' ,'8' ,'6' ,'10' ,'13' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'0' ,'11' ,'4' ,'12' ,'9' ,'7' ,'5' ,'8' ,'6' ,'10' ,'13' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF               0.2565 <= RECENT_RESPONSE_PROP  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_CARD_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('4' ,'7' ,'5' ,'6' ,'8' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_12 IN ('0' ,'1' ,'3' ,'2' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.028167579;
    END;
  END;

********** LEAF    15  NODE   437 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ,'4' ,'12' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'0' ,'4' ,'12' ,'9' ,'11' ,'7' ,'5' ,'8' ,'6' ,'10' ,'13' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <               0.2365 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_CARD_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('0' ,'1' ,'3' ,'2' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('4' ,'7' ,'5' ,'6' ,'8' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'0' ,'4' ,'12' ,'9' ,'11' ,'7' ,'5' ,'8' ,'6' ,'10' ,
      '13' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(FILE_AVG_GIFT ) AND 
      FILE_AVG_GIFT  <               10.185 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(FILE_AVG_GIFT ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_AVG_GIFT_AMT ) THEN DO;
          IF LIFETIME_AVG_GIFT_AMT  <               10.185 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
          IF RECENT_AVG_GIFT_AMT  <               12.415 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.006497577;
      END;
    END;
  END;

********** LEAF    16  NODE   439 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ,'4' ,'12' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'0' ,'4' ,'12' ,'9' ,'11' ,'7' ,'5' ,'8' ,'6' ,'10' ,'13' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <               0.2365 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_CARD_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('0' ,'1' ,'3' ,'2' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('4' ,'7' ,'5' ,'6' ,'8' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'0' ,'4' ,'12' ,'9' ,'11' ,'7' ,'5' ,'8' ,'6' ,'10' ,
      '13' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(FILE_AVG_GIFT ) AND 
                    10.185 <= FILE_AVG_GIFT  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(FILE_AVG_GIFT ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_AVG_GIFT_AMT ) THEN DO;
          IF               10.185 <= LIFETIME_AVG_GIFT_AMT  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
          IF               12.415 <= RECENT_AVG_GIFT_AMT  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FILE_AVG_GIFT  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
       %DMNORMIP( _ARBFMT_2);
        IF _ARBFMT_2 IN ('.' ,'04' ,'42' ,'01' ,'37' ,'38' ,'35' ,'40' ,'28' ,
        '11' ,'03' ,'50' ,'46' ,'20' ,'16' ,'18' ,'12' ,'19' ,'21' ,'51' ,
        '05' ,'22' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'42' ,'01' ,'37' ,'38' ,'35' ,'40' ,'28' ,'11' ,'03' ,
        '50' ,'46' ,'20' ,'16' ,'18' ,'12' ,'19' ,'21' ,'51' ,'05' ,'22' ,
        '53' ,'25' ,'48' ,'31' ,'13' ,'14' ,'17' ,'47' ,'49' ,'43' ,'45' ,
        '30' ,'07' ,'34' ,'23' ,'09' ,'02' ,'41' ,'15' ,'36' ,'24' ,'08' ,
        '27' ,'26' ,'44' ,'29' ,'39' ,'33' ,'06' ,'32' ,'52' ,'10' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
          _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('S' ,'T' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_4 IN ('U' ,'R' ,'C' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE2 ) THEN DO;
            IF PCT_ATTRIBUTE2  <                  1.5 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0024759618;
        END;
      END;
    END;
  END;

********** LEAF    17  NODE   440 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ,'4' ,'12' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'0' ,'4' ,'12' ,'9' ,'11' ,'7' ,'5' ,'8' ,'6' ,'10' ,'13' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <               0.2365 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_CARD_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('0' ,'1' ,'3' ,'2' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('4' ,'7' ,'5' ,'6' ,'8' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'0' ,'4' ,'12' ,'9' ,'11' ,'7' ,'5' ,'8' ,'6' ,'10' ,
      '13' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(FILE_AVG_GIFT ) AND 
                    10.185 <= FILE_AVG_GIFT  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(FILE_AVG_GIFT ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_AVG_GIFT_AMT ) THEN DO;
          IF               10.185 <= LIFETIME_AVG_GIFT_AMT  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
          IF               12.415 <= RECENT_AVG_GIFT_AMT  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FILE_AVG_GIFT  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
       %DMNORMIP( _ARBFMT_2);
        IF _ARBFMT_2 IN ('53' ,'25' ,'48' ,'31' ,'13' ,'14' ,'17' ,'47' ,
        '49' ,'43' ,'45' ,'30' ,'07' ,'34' ,'23' ,'09' ,'02' ,'41' ,'15' ,
        '36' ,'24' ,'08' ,'27' ,'26' ,'44' ,'29' ,'39' ,'33' ,'06' ,'32' ,
        '52' ,'10' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'42' ,'01' ,'37' ,'38' ,'35' ,'40' ,'28' ,'11' ,'03' ,
        '50' ,'46' ,'20' ,'16' ,'18' ,'12' ,'19' ,'21' ,'51' ,'05' ,'22' ,
        '53' ,'25' ,'48' ,'31' ,'13' ,'14' ,'17' ,'47' ,'49' ,'43' ,'45' ,
        '30' ,'07' ,'34' ,'23' ,'09' ,'02' ,'41' ,'15' ,'36' ,'24' ,'08' ,
        '27' ,'26' ,'44' ,'29' ,'39' ,'33' ,'06' ,'32' ,'52' ,'10' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
          _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('U' ,'R' ,'C' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_4 IN ('S' ,'T' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE2 ) THEN DO;
            IF                  1.5 <= PCT_ATTRIBUTE2  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_2 NOTIN (
          '.' ,'04' ,'42' ,'01' ,'37' ,'38' ,'35' ,'40' ,'28' ,'11' ,'03' ,
          '50' ,'46' ,'20' ,'16' ,'18' ,'12' ,'19' ,'21' ,'51' ,'05' ,'22' ,
          '53' ,'25' ,'48' ,'31' ,'13' ,'14' ,'17' ,'47' ,'49' ,'43' ,'45' ,
          '30' ,'07' ,'34' ,'23' ,'09' ,'02' ,'41' ,'15' ,'36' ,'24' ,'08' ,
          '27' ,'26' ,'44' ,'29' ,'39' ,'33' ,'06' ,'32' ,'52' ,'10' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0220294813;
        END;
      END;
    END;
  END;

********** LEAF    18  NODE   436 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('9' ,'11' ,'7' ,'5' ,'8' ,'6' ,'10' ,'13' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'0' ,'4' ,'12' ,'9' ,'11' ,'7' ,'5' ,'8' ,'6' ,'10' ,'13' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF               0.2365 <= RECENT_RESPONSE_PROP  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_CARD_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('4' ,'7' ,'5' ,'6' ,'8' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_12 IN ('0' ,'1' ,'3' ,'2' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.026261801;
    END;
  END;

********** LEAF    19  NODE   444 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ,'0' ,'12' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'0' ,'12' ,'3' ,'9' ,'11' ,'7' ,'4' ,'5' ,'8' ,'6' ,'10' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <               0.1345 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FREQUENCY_STATUS_97NK ) THEN DO;
      _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('2' ,'3' ,'4' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'0' ,'12' ,'3' ,'9' ,'11' ,'7' ,'4' ,'5' ,'8' ,'6' ,'10' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'37' ,'14' ,'17' ,'11' ,'03' ,'49' ,'50' ,'43' ,
      '45' ,'20' ,'16' ,'30' ,'34' ,'23' ,'09' ,'41' ,'15' ,'36' ,'24' ,'08' ,
      '27' ,'44' ,'29' ,'39' ,'33' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'37' ,'14' ,'17' ,'11' ,'03' ,'49' ,'50' ,'43' ,'45' ,'20' ,'16' ,
      '30' ,'34' ,'23' ,'09' ,'41' ,'15' ,'36' ,'24' ,'08' ,'27' ,'44' ,'29' ,
      '39' ,'33' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'25' ,'01' ,'38' ,'48' ,
      '31' ,'35' ,'40' ,'13' ,'28' ,'47' ,'46' ,'07' ,'02' ,'18' ,'12' ,'19' ,
      '26' ,'21' ,'51' ,'05' ,'22' ,'06' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
          IF MEDIAN_HOME_VALUE  <                717.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF MEDIAN_HOUSEHOLD_INCOME  <                353.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'37' ,'14' ,'17' ,'11' ,'03' ,'49' ,'50' ,'43' ,'45' ,'20' ,
        '16' ,'30' ,'34' ,'23' ,'09' ,'41' ,'15' ,'36' ,'24' ,'08' ,'27' ,
        '44' ,'29' ,'39' ,'33' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'25' ,
        '01' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,'28' ,'47' ,'46' ,'07' ,
        '02' ,'18' ,'12' ,'19' ,'26' ,'21' ,'51' ,'05' ,'22' ,'06' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0225511162;
      END;
    END;
  END;

********** LEAF    20  NODE   445 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ,'0' ,'12' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'0' ,'12' ,'3' ,'9' ,'11' ,'7' ,'4' ,'5' ,'8' ,'6' ,'10' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <               0.1345 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FREQUENCY_STATUS_97NK ) THEN DO;
      _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('2' ,'3' ,'4' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'0' ,'12' ,'3' ,'9' ,'11' ,'7' ,'4' ,'5' ,'8' ,'6' ,'10' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'53' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'35' ,
      '40' ,'13' ,'28' ,'47' ,'46' ,'07' ,'02' ,'18' ,'12' ,'19' ,'26' ,'21' ,
      '51' ,'05' ,'22' ,'06' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'37' ,'14' ,'17' ,'11' ,'03' ,'49' ,'50' ,'43' ,'45' ,'20' ,'16' ,
      '30' ,'34' ,'23' ,'09' ,'41' ,'15' ,'36' ,'24' ,'08' ,'27' ,'44' ,'29' ,
      '39' ,'33' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'25' ,'01' ,'38' ,'48' ,
      '31' ,'35' ,'40' ,'13' ,'28' ,'47' ,'46' ,'07' ,'02' ,'18' ,'12' ,'19' ,
      '26' ,'21' ,'51' ,'05' ,'22' ,'06' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
          IF                717.5 <= MEDIAN_HOME_VALUE  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF                353.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000322528;
      END;
    END;
  END;

********** LEAF    21  NODE   446 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('3' ,'9' ,'11' ,'7' ,'4' ,'5' ,'8' ,'6' ,'10' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'0' ,'12' ,'3' ,'9' ,'11' ,'7' ,'4' ,'5' ,'8' ,'6' ,'10' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF               0.1345 <= RECENT_RESPONSE_PROP  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FREQUENCY_STATUS_97NK ) THEN DO;
      _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('2' ,'3' ,'4' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_12 IN ('1' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(MONTHS_SINCE_LAST_GIFT ) AND 
      MONTHS_SINCE_LAST_GIFT  <                 16.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(MONTHS_SINCE_LAST_GIFT ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(MONTHS_SINCE_LAST_PROM_RESP ) THEN DO;
          IF MONTHS_SINCE_LAST_PROM_RESP  <                 16.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(CARD_PROM_12 ) THEN DO;
        _ARBFMT_12 = PUT( CARD_PROM_12 , BEST12.);
         %DMNORMIP( _ARBFMT_12);
          IF _ARBFMT_12 IN ('11' ,'7' ,'9' ,'10' ,'8' ,'3' ,'12' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_12 IN ('5' ,'6' ,'4' ,'2' ,'1' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.026180023;
      END;
    END;
  END;

********** LEAF    22  NODE   447 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('3' ,'9' ,'11' ,'7' ,'4' ,'5' ,'8' ,'6' ,'10' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'0' ,'12' ,'3' ,'9' ,'11' ,'7' ,'4' ,'5' ,'8' ,'6' ,'10' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF               0.1345 <= RECENT_RESPONSE_PROP  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FREQUENCY_STATUS_97NK ) THEN DO;
      _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('2' ,'3' ,'4' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_12 IN ('1' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(MONTHS_SINCE_LAST_GIFT ) AND 
                      16.5 <= MONTHS_SINCE_LAST_GIFT  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(MONTHS_SINCE_LAST_GIFT ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(MONTHS_SINCE_LAST_PROM_RESP ) THEN DO;
          IF                 16.5 <= MONTHS_SINCE_LAST_PROM_RESP  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(CARD_PROM_12 ) THEN DO;
        _ARBFMT_12 = PUT( CARD_PROM_12 , BEST12.);
         %DMNORMIP( _ARBFMT_12);
          IF _ARBFMT_12 IN ('5' ,'6' ,'4' ,'2' ,'1' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_12 IN ('11' ,'7' ,'9' ,'10' ,'8' ,'3' ,'12' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( MONTHS_SINCE_LAST_GIFT  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.004172698;
      END;
    END;
  END;

********** LEAF    23  NODE   451 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_CARD_GIFT ) AND 
    FILE_CARD_GIFT  <                  3.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
   IF MISSING(FILE_CARD_GIFT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
        IF LIFETIME_GIFT_COUNT  <                  7.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(PEP_STAR ) THEN DO;
      _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('0' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('1' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'53' ,'25' ,'37' ,'48' ,'31' ,'35' ,'17' ,'47' ,
      '03' ,'49' ,'43' ,'45' ,'16' ,'30' ,'34' ,'23' ,'02' ,'41' ,'18' ,'36' ,
      '12' ,'27' ,'26' ,'51' ,'44' ,'33' ,'06' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'53' ,'25' ,'37' ,'48' ,'31' ,'35' ,'17' ,'47' ,'03' ,'49' ,'43' ,
      '45' ,'16' ,'30' ,'34' ,'23' ,'02' ,'41' ,'18' ,'36' ,'12' ,'27' ,'26' ,
      '51' ,'44' ,'33' ,'06' ,'32' ,'52' ,'10' ,'04' ,'42' ,'01' ,'38' ,'40' ,
      '13' ,'28' ,'14' ,'11' ,'50' ,'46' ,'20' ,'07' ,'09' ,'15' ,'24' ,'08' ,
      '19' ,'21' ,'29' ,'05' ,'39' ,'22' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
          IF MEDIAN_HOME_VALUE  <                 1240 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF PER_CAPITA_INCOME  <                21351 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'53' ,'25' ,'37' ,'48' ,'31' ,'35' ,'17' ,'47' ,'03' ,'49' ,
        '43' ,'45' ,'16' ,'30' ,'34' ,'23' ,'02' ,'41' ,'18' ,'36' ,'12' ,
        '27' ,'26' ,'51' ,'44' ,'33' ,'06' ,'32' ,'52' ,'10' ,'04' ,'42' ,
        '01' ,'38' ,'40' ,'13' ,'28' ,'14' ,'11' ,'50' ,'46' ,'20' ,'07' ,
        '09' ,'15' ,'24' ,'08' ,'19' ,'21' ,'29' ,'05' ,'39' ,'22' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0211372449;
      END;
    END;
  END;

********** LEAF    24  NODE   452 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_CARD_GIFT ) AND 
    FILE_CARD_GIFT  <                  3.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
   IF MISSING(FILE_CARD_GIFT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
        IF LIFETIME_GIFT_COUNT  <                  7.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(PEP_STAR ) THEN DO;
      _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('0' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('1' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'42' ,'01' ,'38' ,'40' ,'13' ,'28' ,'14' ,'11' ,
      '50' ,'46' ,'20' ,'07' ,'09' ,'15' ,'24' ,'08' ,'19' ,'21' ,'29' ,'05' ,
      '39' ,'22' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'53' ,'25' ,'37' ,'48' ,'31' ,'35' ,'17' ,'47' ,'03' ,'49' ,'43' ,
      '45' ,'16' ,'30' ,'34' ,'23' ,'02' ,'41' ,'18' ,'36' ,'12' ,'27' ,'26' ,
      '51' ,'44' ,'33' ,'06' ,'32' ,'52' ,'10' ,'04' ,'42' ,'01' ,'38' ,'40' ,
      '13' ,'28' ,'14' ,'11' ,'50' ,'46' ,'20' ,'07' ,'09' ,'15' ,'24' ,'08' ,
      '19' ,'21' ,'29' ,'05' ,'39' ,'22' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
          IF                 1240 <= MEDIAN_HOME_VALUE  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF                21351 <= PER_CAPITA_INCOME  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.002312215;
      END;
    END;
  END;

********** LEAF    25  NODE   453 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_CARD_GIFT ) AND 
                     3.5 <= FILE_CARD_GIFT  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(FILE_CARD_GIFT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
        IF                  7.5 <= LIFETIME_GIFT_COUNT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(PEP_STAR ) THEN DO;
      _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_12 IN ('0' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FILE_CARD_GIFT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(RECENT_RESPONSE_PROP ) AND 
      RECENT_RESPONSE_PROP  <               0.2125 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(RECENT_RESPONSE_PROP ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
        _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
         %DMNORMIP( _ARBFMT_12);
          IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ,'4' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_12 IN ('9' ,'11' ,'7' ,'12' ,'5' ,'8' ,'6' ,'10' ,
          '13' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(FREQUENCY_STATUS_97NK ) THEN DO;
        _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
         %DMNORMIP( _ARBFMT_12);
          IF _ARBFMT_12 IN ('1' ,'2' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_12 IN ('3' ,'4' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( RECENT_RESPONSE_PROP  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0006223693;
      END;
    END;
  END;

********** LEAF    26  NODE   454 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_CARD_GIFT ) AND 
                     3.5 <= FILE_CARD_GIFT  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(FILE_CARD_GIFT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
        IF                  7.5 <= LIFETIME_GIFT_COUNT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(PEP_STAR ) THEN DO;
      _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_12 IN ('0' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FILE_CARD_GIFT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(RECENT_RESPONSE_PROP ) AND 
                    0.2125 <= RECENT_RESPONSE_PROP  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(RECENT_RESPONSE_PROP ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
        _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
         %DMNORMIP( _ARBFMT_12);
          IF _ARBFMT_12 IN ('9' ,'11' ,'7' ,'12' ,'5' ,'8' ,'6' ,'10' ,'13' ) 
           THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ,'4' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(FREQUENCY_STATUS_97NK ) THEN DO;
        _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
         %DMNORMIP( _ARBFMT_12);
          IF _ARBFMT_12 IN ('3' ,'4' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_12 IN ('1' ,'2' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.022209703;
      END;
    END;
  END;

********** LEAF    27  NODE   458 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'4' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ,'2' ,'0' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('3' ,'9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,
        '10' ,'13' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <                0.156 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'37' ,'35' ,'14' ,'11' ,'49' ,'50' ,
      '43' ,'45' ,'30' ,'34' ,'23' ,'09' ,'02' ,'41' ,'36' ,'21' ,'51' ,'29' ,
      '05' ,'39' ,'33' ,'06' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'37' ,'35' ,'14' ,'11' ,'49' ,'50' ,'43' ,'45' ,'30' ,
      '34' ,'23' ,'09' ,'02' ,'41' ,'36' ,'21' ,'51' ,'29' ,'05' ,'39' ,'33' ,
      '06' ,'32' ,'52' ,'10' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'40' ,'13' ,
      '28' ,'17' ,'47' ,'03' ,'46' ,'20' ,'16' ,'07' ,'15' ,'18' ,'24' ,'08' ,
      '12' ,'19' ,'27' ,'26' ,'44' ,'22' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF PER_CAPITA_INCOME  <                11917 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
          IF MEDIAN_HOME_VALUE  <                558.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0222906535;
      END;
    END;
  END;

********** LEAF    28  NODE   459 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'4' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ,'2' ,'0' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('3' ,'9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,
        '10' ,'13' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <                0.156 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,
      '17' ,'47' ,'03' ,'46' ,'20' ,'16' ,'07' ,'15' ,'18' ,'24' ,'08' ,'12' ,
      '19' ,'27' ,'26' ,'44' ,'22' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'37' ,'35' ,'14' ,'11' ,'49' ,'50' ,'43' ,'45' ,'30' ,
      '34' ,'23' ,'09' ,'02' ,'41' ,'36' ,'21' ,'51' ,'29' ,'05' ,'39' ,'33' ,
      '06' ,'32' ,'52' ,'10' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'40' ,'13' ,
      '28' ,'17' ,'47' ,'03' ,'46' ,'20' ,'16' ,'07' ,'15' ,'18' ,'24' ,'08' ,
      '12' ,'19' ,'27' ,'26' ,'44' ,'22' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF                11917 <= PER_CAPITA_INCOME  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
          IF                558.5 <= MEDIAN_HOME_VALUE  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'53' ,'37' ,'35' ,'14' ,'11' ,'49' ,'50' ,'43' ,'45' ,
        '30' ,'34' ,'23' ,'09' ,'02' ,'41' ,'36' ,'21' ,'51' ,'29' ,'05' ,
        '39' ,'33' ,'06' ,'32' ,'52' ,'10' ,'42' ,'25' ,'01' ,'38' ,'48' ,
        '31' ,'40' ,'13' ,'28' ,'17' ,'47' ,'03' ,'46' ,'20' ,'16' ,'07' ,
        '15' ,'18' ,'24' ,'08' ,'12' ,'19' ,'27' ,'26' ,'44' ,'22' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.002646052;
      END;
    END;
  END;

********** LEAF    29  NODE   460 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('2' ,'3' ,'4' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'4' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('3' ,'9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,
        '10' ,'13' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_12 IN ('1' ,'2' ,'0' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF                0.156 <= RECENT_RESPONSE_PROP  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'53' ,'38' ,'31' ,'35' ,'40' ,'13' ,'28' ,'14' ,
      '11' ,'03' ,'43' ,'20' ,'16' ,'07' ,'34' ,'09' ,'36' ,'24' ,'27' ,'51' ,
      '29' ,'05' ,'39' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'53' ,'38' ,'31' ,'35' ,'40' ,'13' ,'28' ,'14' ,'11' ,'03' ,'43' ,
      '20' ,'16' ,'07' ,'34' ,'09' ,'36' ,'24' ,'27' ,'51' ,'29' ,'05' ,'39' ,
      '04' ,'42' ,'25' ,'01' ,'37' ,'48' ,'17' ,'47' ,'49' ,'50' ,'46' ,'45' ,
      '30' ,'23' ,'02' ,'41' ,'15' ,'18' ,'08' ,'12' ,'19' ,'26' ,'21' ,'44' ,
      '33' ,'22' ,'06' ,'32' ,'52' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
        _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('C' ,'T' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_4 IN ('U' ,'R' ,'S' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF                286.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'53' ,'38' ,'31' ,'35' ,'40' ,'13' ,'28' ,'14' ,'11' ,'03' ,
        '43' ,'20' ,'16' ,'07' ,'34' ,'09' ,'36' ,'24' ,'27' ,'51' ,'29' ,
        '05' ,'39' ,'04' ,'42' ,'25' ,'01' ,'37' ,'48' ,'17' ,'47' ,'49' ,
        '50' ,'46' ,'45' ,'30' ,'23' ,'02' ,'41' ,'15' ,'18' ,'08' ,'12' ,
        '19' ,'26' ,'21' ,'44' ,'33' ,'22' ,'06' ,'32' ,'52' ,'10' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.018165924;
      END;
    END;
  END;

********** LEAF    30  NODE   461 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('2' ,'3' ,'4' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'4' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('3' ,'9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,
        '10' ,'13' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_12 IN ('1' ,'2' ,'0' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF                0.156 <= RECENT_RESPONSE_PROP  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'42' ,'25' ,'01' ,'37' ,'48' ,'17' ,'47' ,'49' ,
      '50' ,'46' ,'45' ,'30' ,'23' ,'02' ,'41' ,'15' ,'18' ,'08' ,'12' ,'19' ,
      '26' ,'21' ,'44' ,'33' ,'22' ,'06' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'53' ,'38' ,'31' ,'35' ,'40' ,'13' ,'28' ,'14' ,'11' ,'03' ,'43' ,
      '20' ,'16' ,'07' ,'34' ,'09' ,'36' ,'24' ,'27' ,'51' ,'29' ,'05' ,'39' ,
      '04' ,'42' ,'25' ,'01' ,'37' ,'48' ,'17' ,'47' ,'49' ,'50' ,'46' ,'45' ,
      '30' ,'23' ,'02' ,'41' ,'15' ,'18' ,'08' ,'12' ,'19' ,'26' ,'21' ,'44' ,
      '33' ,'22' ,'06' ,'32' ,'52' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
        _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('U' ,'R' ,'S' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('C' ,'T' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF MEDIAN_HOUSEHOLD_INCOME  <                286.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0047823636;
      END;
    END;
  END;

********** LEAF    31  NODE   465 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'4' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,
        '10' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <                0.218 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'42' ,'01' ,'38' ,'48' ,'31' ,'35' ,'40' ,
      '13' ,'28' ,'14' ,'17' ,'11' ,'03' ,'16' ,'07' ,'41' ,'24' ,'08' ,'12' ,
      '32' ,'52' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'42' ,'01' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,'28' ,'14' ,
      '17' ,'11' ,'03' ,'16' ,'07' ,'41' ,'24' ,'08' ,'12' ,'32' ,'52' ,'53' ,
      '25' ,'37' ,'47' ,'49' ,'50' ,'43' ,'46' ,'45' ,'20' ,'30' ,'34' ,'23' ,
      '09' ,'02' ,'15' ,'18' ,'36' ,'19' ,'27' ,'26' ,'21' ,'51' ,'44' ,'29' ,
      '05' ,'39' ,'33' ,'22' ,'06' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('1' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_4 IN ('2' ,'3' ,'4' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF                15093 <= PER_CAPITA_INCOME  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.003112458;
      END;
    END;
  END;

********** LEAF    32  NODE   467 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'4' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,
        '10' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <                0.218 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('53' ,'25' ,'37' ,'47' ,'49' ,'50' ,'43' ,'46' ,'45' ,
      '20' ,'30' ,'34' ,'23' ,'09' ,'02' ,'15' ,'18' ,'36' ,'19' ,'27' ,'26' ,
      '21' ,'51' ,'44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'06' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'42' ,'01' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,'28' ,'14' ,
      '17' ,'11' ,'03' ,'16' ,'07' ,'41' ,'24' ,'08' ,'12' ,'32' ,'52' ,'53' ,
      '25' ,'37' ,'47' ,'49' ,'50' ,'43' ,'46' ,'45' ,'20' ,'30' ,'34' ,'23' ,
      '09' ,'02' ,'15' ,'18' ,'36' ,'19' ,'27' ,'26' ,'21' ,'51' ,'44' ,'29' ,
      '05' ,'39' ,'33' ,'22' ,'06' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('2' ,'3' ,'4' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('1' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF PER_CAPITA_INCOME  <                15093 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'42' ,'01' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,'28' ,
        '14' ,'17' ,'11' ,'03' ,'16' ,'07' ,'41' ,'24' ,'08' ,'12' ,'32' ,
        '52' ,'53' ,'25' ,'37' ,'47' ,'49' ,'50' ,'43' ,'46' ,'45' ,'20' ,
        '30' ,'34' ,'23' ,'09' ,'02' ,'15' ,'18' ,'36' ,'19' ,'27' ,'26' ,
        '21' ,'51' ,'44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'06' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_2 IN ('53' ,'37' ,'47' ,'49' ,'43' ,'30' ,'34' ,'02' ,
        '15' ,'18' ,'19' ,'27' ,'21' ,'05' ,'22' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_2 NOTIN (
        '53' ,'37' ,'47' ,'49' ,'43' ,'30' ,'34' ,'02' ,'15' ,'18' ,'19' ,
        '27' ,'21' ,'05' ,'22' ,'25' ,'50' ,'46' ,'45' ,'20' ,'23' ,'09' ,
        '36' ,'26' ,'51' ,'44' ,'29' ,'39' ,'33' ,'06' ,'10' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
          _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('S' ,'C' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_4 IN ('U' ,'R' ,'T' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
          _ARBFMT_4 = PUT( REP_SES , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('1' ,'3' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_4 IN ('2' ,'4' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_2 NOTIN (
          '53' ,'37' ,'47' ,'49' ,'43' ,'30' ,'34' ,'02' ,'15' ,'18' ,'19' ,
          '27' ,'21' ,'05' ,'22' ,'25' ,'50' ,'46' ,'45' ,'20' ,'23' ,'09' ,
          '36' ,'26' ,'51' ,'44' ,'29' ,'39' ,'33' ,'06' ,'10' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0097237186;
        END;
      END;
    END;
  END;

********** LEAF    33  NODE   468 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'4' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,
        '10' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <                0.218 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('53' ,'25' ,'37' ,'47' ,'49' ,'50' ,'43' ,'46' ,'45' ,
      '20' ,'30' ,'34' ,'23' ,'09' ,'02' ,'15' ,'18' ,'36' ,'19' ,'27' ,'26' ,
      '21' ,'51' ,'44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'06' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'42' ,'01' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,'28' ,'14' ,
      '17' ,'11' ,'03' ,'16' ,'07' ,'41' ,'24' ,'08' ,'12' ,'32' ,'52' ,'53' ,
      '25' ,'37' ,'47' ,'49' ,'50' ,'43' ,'46' ,'45' ,'20' ,'30' ,'34' ,'23' ,
      '09' ,'02' ,'15' ,'18' ,'36' ,'19' ,'27' ,'26' ,'21' ,'51' ,'44' ,'29' ,
      '05' ,'39' ,'33' ,'22' ,'06' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('2' ,'3' ,'4' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('1' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF PER_CAPITA_INCOME  <                15093 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'42' ,'01' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,'28' ,
        '14' ,'17' ,'11' ,'03' ,'16' ,'07' ,'41' ,'24' ,'08' ,'12' ,'32' ,
        '52' ,'53' ,'25' ,'37' ,'47' ,'49' ,'50' ,'43' ,'46' ,'45' ,'20' ,
        '30' ,'34' ,'23' ,'09' ,'02' ,'15' ,'18' ,'36' ,'19' ,'27' ,'26' ,
        '21' ,'51' ,'44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'06' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_2 IN ('25' ,'50' ,'46' ,'45' ,'20' ,'23' ,'09' ,'36' ,
        '26' ,'51' ,'44' ,'29' ,'39' ,'33' ,'06' ,'10' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_2 NOTIN (
        '53' ,'37' ,'47' ,'49' ,'43' ,'30' ,'34' ,'02' ,'15' ,'18' ,'19' ,
        '27' ,'21' ,'05' ,'22' ,'25' ,'50' ,'46' ,'45' ,'20' ,'23' ,'09' ,
        '36' ,'26' ,'51' ,'44' ,'29' ,'39' ,'33' ,'06' ,'10' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
          _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('U' ,'R' ,'T' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_4 IN ('S' ,'C' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
          _ARBFMT_4 = PUT( REP_SES , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('2' ,'4' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_4 IN ('1' ,'3' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0222042951;
        END;
      END;
    END;
  END;

********** LEAF    34  NODE   464 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('3' ,'4' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'4' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,'10' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF                0.218 <= RECENT_RESPONSE_PROP  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.012760417;
    END;
  END;

********** LEAF    35  NODE   472 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_CARD_GIFT ) AND 
    FILE_CARD_GIFT  <                  3.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
   IF MISSING(FILE_CARD_GIFT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
        IF LIFETIME_GIFT_COUNT  <                  6.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_CARD_PROM ) THEN DO;
        IF LIFETIME_CARD_PROM  <                 18.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'42' ,'25' ,'37' ,'48' ,'31' ,'35' ,'40' ,
      '49' ,'50' ,'43' ,'45' ,'16' ,'30' ,'34' ,'09' ,'41' ,'18' ,'08' ,'19' ,
      '21' ,'51' ,'05' ,'33' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'42' ,'25' ,'37' ,'48' ,'31' ,'35' ,'40' ,'49' ,'50' ,'43' ,
      '45' ,'16' ,'30' ,'34' ,'09' ,'41' ,'18' ,'08' ,'19' ,'21' ,'51' ,'05' ,
      '33' ,'32' ,'52' ,'10' ,'53' ,'01' ,'38' ,'13' ,'28' ,'14' ,'17' ,'11' ,
      '47' ,'03' ,'46' ,'20' ,'07' ,'23' ,'02' ,'15' ,'36' ,'24' ,'12' ,'27' ,
      '26' ,'44' ,'29' ,'39' ,'22' ,'06' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('3' ,'4' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_4 IN ('1' ,'2' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF PER_CAPITA_INCOME  <              14563.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0206568845;
      END;
    END;
  END;

********** LEAF    36  NODE   473 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_CARD_GIFT ) AND 
    FILE_CARD_GIFT  <                  3.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
   IF MISSING(FILE_CARD_GIFT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
        IF LIFETIME_GIFT_COUNT  <                  6.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_CARD_PROM ) THEN DO;
        IF LIFETIME_CARD_PROM  <                 18.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('53' ,'01' ,'38' ,'13' ,'28' ,'14' ,'17' ,'11' ,'47' ,
      '03' ,'46' ,'20' ,'07' ,'23' ,'02' ,'15' ,'36' ,'24' ,'12' ,'27' ,'26' ,
      '44' ,'29' ,'39' ,'22' ,'06' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'42' ,'25' ,'37' ,'48' ,'31' ,'35' ,'40' ,'49' ,'50' ,'43' ,
      '45' ,'16' ,'30' ,'34' ,'09' ,'41' ,'18' ,'08' ,'19' ,'21' ,'51' ,'05' ,
      '33' ,'32' ,'52' ,'10' ,'53' ,'01' ,'38' ,'13' ,'28' ,'14' ,'17' ,'11' ,
      '47' ,'03' ,'46' ,'20' ,'07' ,'23' ,'02' ,'15' ,'36' ,'24' ,'12' ,'27' ,
      '26' ,'44' ,'29' ,'39' ,'22' ,'06' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('1' ,'2' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('3' ,'4' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF              14563.5 <= PER_CAPITA_INCOME  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'42' ,'25' ,'37' ,'48' ,'31' ,'35' ,'40' ,'49' ,'50' ,
        '43' ,'45' ,'16' ,'30' ,'34' ,'09' ,'41' ,'18' ,'08' ,'19' ,'21' ,
        '51' ,'05' ,'33' ,'32' ,'52' ,'10' ,'53' ,'01' ,'38' ,'13' ,'28' ,
        '14' ,'17' ,'11' ,'47' ,'03' ,'46' ,'20' ,'07' ,'23' ,'02' ,'15' ,
        '36' ,'24' ,'12' ,'27' ,'26' ,'44' ,'29' ,'39' ,'22' ,'06' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.002300942;
      END;
    END;
  END;

********** LEAF    37  NODE   474 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_CARD_GIFT ) AND 
                     3.5 <= FILE_CARD_GIFT  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(FILE_CARD_GIFT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
        IF                  6.5 <= LIFETIME_GIFT_COUNT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_CARD_PROM ) THEN DO;
        IF                 18.5 <= LIFETIME_CARD_PROM  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FILE_CARD_GIFT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'42' ,'48' ,'35' ,'40' ,'13' ,'28' ,'03' ,
      '49' ,'20' ,'16' ,'23' ,'09' ,'18' ,'36' ,'24' ,'12' ,'06' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'42' ,'48' ,'35' ,'40' ,'13' ,'28' ,'03' ,'49' ,'20' ,'16' ,
      '23' ,'09' ,'18' ,'36' ,'24' ,'12' ,'06' ,'53' ,'25' ,'01' ,'37' ,'38' ,
      '31' ,'14' ,'17' ,'11' ,'47' ,'50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'34' ,
      '02' ,'41' ,'15' ,'08' ,'19' ,'27' ,'26' ,'21' ,'51' ,'44' ,'29' ,'05' ,
      '39' ,'33' ,'22' ,'32' ,'52' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF                342.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('1' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_4 IN ('2' ,'3' ,'4' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.018761623;
      END;
    END;
  END;

********** LEAF    38  NODE   475 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_CARD_GIFT ) AND 
                     3.5 <= FILE_CARD_GIFT  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(FILE_CARD_GIFT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
        IF                  6.5 <= LIFETIME_GIFT_COUNT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_CARD_PROM ) THEN DO;
        IF                 18.5 <= LIFETIME_CARD_PROM  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FILE_CARD_GIFT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('53' ,'25' ,'01' ,'37' ,'38' ,'31' ,'14' ,'17' ,'11' ,
      '47' ,'50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'34' ,'02' ,'41' ,'15' ,'08' ,
      '19' ,'27' ,'26' ,'21' ,'51' ,'44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'32' ,
      '52' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'42' ,'48' ,'35' ,'40' ,'13' ,'28' ,'03' ,'49' ,'20' ,'16' ,
      '23' ,'09' ,'18' ,'36' ,'24' ,'12' ,'06' ,'53' ,'25' ,'01' ,'37' ,'38' ,
      '31' ,'14' ,'17' ,'11' ,'47' ,'50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'34' ,
      '02' ,'41' ,'15' ,'08' ,'19' ,'27' ,'26' ,'21' ,'51' ,'44' ,'29' ,'05' ,
      '39' ,'33' ,'22' ,'32' ,'52' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF MEDIAN_HOUSEHOLD_INCOME  <                342.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('2' ,'3' ,'4' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('1' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'42' ,'48' ,'35' ,'40' ,'13' ,'28' ,'03' ,'49' ,'20' ,
        '16' ,'23' ,'09' ,'18' ,'36' ,'24' ,'12' ,'06' ,'53' ,'25' ,'01' ,
        '37' ,'38' ,'31' ,'14' ,'17' ,'11' ,'47' ,'50' ,'43' ,'46' ,'45' ,
        '30' ,'07' ,'34' ,'02' ,'41' ,'15' ,'08' ,'19' ,'27' ,'26' ,'21' ,
        '51' ,'44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'32' ,'52' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.002693744;
      END;
    END;
  END;

********** LEAF    39  NODE   479 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(PEP_STAR ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'0' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_CARD_GIFT ) THEN DO;
        IF                  4.5 <= FILE_CARD_GIFT  THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
        IF                  7.5 <= LIFETIME_GIFT_COUNT  THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( PEP_STAR  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'0' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'25' ,'37' ,'38' ,'48' ,'31' ,'35' ,
      '40' ,'13' ,'28' ,'14' ,'49' ,'16' ,'34' ,'09' ,'02' ,'15' ,'36' ,'12' ,
      '27' ,'29' ,'05' ,'32' ,'52' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'25' ,'37' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,'28' ,
      '14' ,'49' ,'16' ,'34' ,'09' ,'02' ,'15' ,'36' ,'12' ,'27' ,'29' ,'05' ,
      '32' ,'52' ,'42' ,'01' ,'17' ,'11' ,'47' ,'03' ,'50' ,'43' ,'46' ,'45' ,
      '20' ,'30' ,'07' ,'23' ,'41' ,'18' ,'24' ,'08' ,'19' ,'26' ,'21' ,'51' ,
      '44' ,'39' ,'33' ,'22' ,'06' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
        _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('S' ,'T' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_4 IN ('U' ,'R' ,'C' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF                12091 <= PER_CAPITA_INCOME  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.019150198;
      END;
    END;
  END;

********** LEAF    40  NODE   480 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(PEP_STAR ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'0' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_CARD_GIFT ) THEN DO;
        IF                  4.5 <= FILE_CARD_GIFT  THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
        IF                  7.5 <= LIFETIME_GIFT_COUNT  THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( PEP_STAR  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'0' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('42' ,'01' ,'17' ,'11' ,'47' ,'03' ,'50' ,'43' ,'46' ,
      '45' ,'20' ,'30' ,'07' ,'23' ,'41' ,'18' ,'24' ,'08' ,'19' ,'26' ,'21' ,
      '51' ,'44' ,'39' ,'33' ,'22' ,'06' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'25' ,'37' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,'28' ,
      '14' ,'49' ,'16' ,'34' ,'09' ,'02' ,'15' ,'36' ,'12' ,'27' ,'29' ,'05' ,
      '32' ,'52' ,'42' ,'01' ,'17' ,'11' ,'47' ,'03' ,'50' ,'43' ,'46' ,'45' ,
      '20' ,'30' ,'07' ,'23' ,'41' ,'18' ,'24' ,'08' ,'19' ,'26' ,'21' ,'51' ,
      '44' ,'39' ,'33' ,'22' ,'06' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
        _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('U' ,'R' ,'C' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('S' ,'T' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF PER_CAPITA_INCOME  <                12091 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'53' ,'25' ,'37' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,
        '28' ,'14' ,'49' ,'16' ,'34' ,'09' ,'02' ,'15' ,'36' ,'12' ,'27' ,
        '29' ,'05' ,'32' ,'52' ,'42' ,'01' ,'17' ,'11' ,'47' ,'03' ,'50' ,
        '43' ,'46' ,'45' ,'20' ,'30' ,'07' ,'23' ,'41' ,'18' ,'24' ,'08' ,
        '19' ,'26' ,'21' ,'51' ,'44' ,'39' ,'33' ,'22' ,'06' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0031887874;
      END;
    END;
  END;

********** LEAF    41  NODE   481 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(PEP_STAR ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'0' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_CARD_GIFT ) THEN DO;
        IF FILE_CARD_GIFT  <                  4.5 THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
        IF LIFETIME_GIFT_COUNT  <                  7.5 THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'25' ,'01' ,'31' ,'13' ,'28' ,'17' ,'11' ,
      '03' ,'43' ,'46' ,'20' ,'15' ,'24' ,'19' ,'44' ,'06' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'25' ,'01' ,'31' ,'13' ,'28' ,'17' ,'11' ,'03' ,'43' ,'46' ,
      '20' ,'15' ,'24' ,'19' ,'44' ,'06' ,'53' ,'42' ,'37' ,'38' ,'48' ,'35' ,
      '40' ,'14' ,'47' ,'49' ,'50' ,'45' ,'16' ,'30' ,'07' ,'34' ,'23' ,'09' ,
      '02' ,'41' ,'18' ,'36' ,'08' ,'12' ,'27' ,'26' ,'21' ,'51' ,'29' ,'05' ,
      '39' ,'33' ,'22' ,'32' ,'52' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
          IF               2699.5 <= MEDIAN_HOME_VALUE  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF              23698.5 <= PER_CAPITA_INCOME  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.007386297;
      END;
    END;
  END;

********** LEAF    42  NODE   482 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(PEP_STAR ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'0' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_CARD_GIFT ) THEN DO;
        IF FILE_CARD_GIFT  <                  4.5 THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
        IF LIFETIME_GIFT_COUNT  <                  7.5 THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('53' ,'42' ,'37' ,'38' ,'48' ,'35' ,'40' ,'14' ,'47' ,
      '49' ,'50' ,'45' ,'16' ,'30' ,'07' ,'34' ,'23' ,'09' ,'02' ,'41' ,'18' ,
      '36' ,'08' ,'12' ,'27' ,'26' ,'21' ,'51' ,'29' ,'05' ,'39' ,'33' ,'22' ,
      '32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'25' ,'01' ,'31' ,'13' ,'28' ,'17' ,'11' ,'03' ,'43' ,'46' ,
      '20' ,'15' ,'24' ,'19' ,'44' ,'06' ,'53' ,'42' ,'37' ,'38' ,'48' ,'35' ,
      '40' ,'14' ,'47' ,'49' ,'50' ,'45' ,'16' ,'30' ,'07' ,'34' ,'23' ,'09' ,
      '02' ,'41' ,'18' ,'36' ,'08' ,'12' ,'27' ,'26' ,'21' ,'51' ,'29' ,'05' ,
      '39' ,'33' ,'22' ,'32' ,'52' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
          IF MEDIAN_HOME_VALUE  <               2699.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF PER_CAPITA_INCOME  <              23698.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'25' ,'01' ,'31' ,'13' ,'28' ,'17' ,'11' ,'03' ,'43' ,
        '46' ,'20' ,'15' ,'24' ,'19' ,'44' ,'06' ,'53' ,'42' ,'37' ,'38' ,
        '48' ,'35' ,'40' ,'14' ,'47' ,'49' ,'50' ,'45' ,'16' ,'30' ,'07' ,
        '34' ,'23' ,'09' ,'02' ,'41' ,'18' ,'36' ,'08' ,'12' ,'27' ,'26' ,
        '21' ,'51' ,'29' ,'05' ,'39' ,'33' ,'22' ,'32' ,'52' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0179601275;
      END;
    END;
  END;

********** LEAF    43  NODE   486 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'4' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <                0.218 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,
        '10' ,'13' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'42' ,'01' ,'37' ,'38' ,'48' ,'31' ,'35' ,'13' ,
      '28' ,'17' ,'11' ,'47' ,'03' ,'43' ,'20' ,'16' ,'07' ,'02' ,'41' ,'24' ,
      '12' ,'26' ,'05' ,'06' ,'32' ,'52' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'01' ,'37' ,'38' ,'48' ,'31' ,'35' ,'13' ,'28' ,'17' ,'11' ,
      '47' ,'03' ,'43' ,'20' ,'16' ,'07' ,'02' ,'41' ,'24' ,'12' ,'26' ,'05' ,
      '06' ,'32' ,'52' ,'04' ,'53' ,'25' ,'40' ,'14' ,'49' ,'50' ,'46' ,'45' ,
      '30' ,'34' ,'23' ,'09' ,'15' ,'18' ,'36' ,'08' ,'19' ,'27' ,'21' ,'51' ,
      '44' ,'29' ,'39' ,'33' ,'22' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('1' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_4 IN ('2' ,'3' ,'4' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF                14617 <= PER_CAPITA_INCOME  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.003935627;
      END;
    END;
  END;

********** LEAF    44  NODE   488 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'4' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <                0.218 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,
        '10' ,'13' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'53' ,'25' ,'40' ,'14' ,'49' ,'50' ,'46' ,'45' ,
      '30' ,'34' ,'23' ,'09' ,'15' ,'18' ,'36' ,'08' ,'19' ,'27' ,'21' ,'51' ,
      '44' ,'29' ,'39' ,'33' ,'22' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'01' ,'37' ,'38' ,'48' ,'31' ,'35' ,'13' ,'28' ,'17' ,'11' ,
      '47' ,'03' ,'43' ,'20' ,'16' ,'07' ,'02' ,'41' ,'24' ,'12' ,'26' ,'05' ,
      '06' ,'32' ,'52' ,'04' ,'53' ,'25' ,'40' ,'14' ,'49' ,'50' ,'46' ,'45' ,
      '30' ,'34' ,'23' ,'09' ,'15' ,'18' ,'36' ,'08' ,'19' ,'27' ,'21' ,'51' ,
      '44' ,'29' ,'39' ,'33' ,'22' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('2' ,'3' ,'4' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('1' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF PER_CAPITA_INCOME  <                14617 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'42' ,'01' ,'37' ,'38' ,'48' ,'31' ,'35' ,'13' ,'28' ,'17' ,
        '11' ,'47' ,'03' ,'43' ,'20' ,'16' ,'07' ,'02' ,'41' ,'24' ,'12' ,
        '26' ,'05' ,'06' ,'32' ,'52' ,'04' ,'53' ,'25' ,'40' ,'14' ,'49' ,
        '50' ,'46' ,'45' ,'30' ,'34' ,'23' ,'09' ,'15' ,'18' ,'36' ,'08' ,
        '19' ,'27' ,'21' ,'51' ,'44' ,'29' ,'39' ,'33' ,'22' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_2 IN ('04' ,'53' ,'49' ,'46' ,'45' ,'34' ,'23' ,'09' ,
        '36' ,'27' ,'21' ,'44' ,'39' ,'22' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_2 NOTIN (
        '04' ,'53' ,'49' ,'46' ,'45' ,'34' ,'23' ,'09' ,'36' ,'27' ,'21' ,
        '44' ,'39' ,'22' ,'25' ,'40' ,'14' ,'50' ,'30' ,'15' ,'18' ,'08' ,
        '19' ,'51' ,'29' ,'33' ,'10' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
          _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('R' ,'C' ,'T' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_4 IN ('U' ,'S' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
          _ARBFMT_4 = PUT( REP_SES , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('1' ,'2' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_4 IN ('3' ,'4' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_2 NOTIN (
          '04' ,'53' ,'49' ,'46' ,'45' ,'34' ,'23' ,'09' ,'36' ,'27' ,'21' ,
          '44' ,'39' ,'22' ,'25' ,'40' ,'14' ,'50' ,'30' ,'15' ,'18' ,'08' ,
          '19' ,'51' ,'29' ,'33' ,'10' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0202991923;
        END;
      END;
    END;
  END;

********** LEAF    45  NODE   489 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ,'2' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'4' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF RECENT_RESPONSE_PROP  <                0.218 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,
        '10' ,'13' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'3' ,'4' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'53' ,'25' ,'40' ,'14' ,'49' ,'50' ,'46' ,'45' ,
      '30' ,'34' ,'23' ,'09' ,'15' ,'18' ,'36' ,'08' ,'19' ,'27' ,'21' ,'51' ,
      '44' ,'29' ,'39' ,'33' ,'22' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'01' ,'37' ,'38' ,'48' ,'31' ,'35' ,'13' ,'28' ,'17' ,'11' ,
      '47' ,'03' ,'43' ,'20' ,'16' ,'07' ,'02' ,'41' ,'24' ,'12' ,'26' ,'05' ,
      '06' ,'32' ,'52' ,'04' ,'53' ,'25' ,'40' ,'14' ,'49' ,'50' ,'46' ,'45' ,
      '30' ,'34' ,'23' ,'09' ,'15' ,'18' ,'36' ,'08' ,'19' ,'27' ,'21' ,'51' ,
      '44' ,'29' ,'39' ,'33' ,'22' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('2' ,'3' ,'4' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('1' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF PER_CAPITA_INCOME  <                14617 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'42' ,'01' ,'37' ,'38' ,'48' ,'31' ,'35' ,'13' ,'28' ,'17' ,
        '11' ,'47' ,'03' ,'43' ,'20' ,'16' ,'07' ,'02' ,'41' ,'24' ,'12' ,
        '26' ,'05' ,'06' ,'32' ,'52' ,'04' ,'53' ,'25' ,'40' ,'14' ,'49' ,
        '50' ,'46' ,'45' ,'30' ,'34' ,'23' ,'09' ,'15' ,'18' ,'36' ,'08' ,
        '19' ,'27' ,'21' ,'51' ,'44' ,'29' ,'39' ,'33' ,'22' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_2 IN ('25' ,'40' ,'14' ,'50' ,'30' ,'15' ,'18' ,'08' ,
        '19' ,'51' ,'29' ,'33' ,'10' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_2 NOTIN (
        '04' ,'53' ,'49' ,'46' ,'45' ,'34' ,'23' ,'09' ,'36' ,'27' ,'21' ,
        '44' ,'39' ,'22' ,'25' ,'40' ,'14' ,'50' ,'30' ,'15' ,'18' ,'08' ,
        '19' ,'51' ,'29' ,'33' ,'10' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
          _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('U' ,'S' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_4 IN ('R' ,'C' ,'T' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
          _ARBFMT_4 = PUT( REP_SES , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('3' ,'4' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_4 IN ('1' ,'2' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.009627842;
        END;
      END;
    END;
  END;

********** LEAF    46  NODE   485 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('3' ,'4' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '1' ,'2' ,'3' ,'4' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
        IF                0.218 <= RECENT_RESPONSE_PROP  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,'10' ,
        '13' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.010033094;
    END;
  END;

********** LEAF    47  NODE   495 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( RECENCY_STATUS_96NK , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('A' ,'N' ,'F' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENCY_STATUS_96NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_5 NOTIN (
    'A' ,'N' ,'F' ,'S' ,'E' ,'L' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_STAR_STATUS ) THEN DO;
        IF RECENT_STAR_STATUS  <                  0.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_CARD_GIFT ) THEN DO;
        IF FILE_CARD_GIFT  <                  8.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENCY_STATUS_96NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_5 NOTIN (
      'A' ,'N' ,'F' ,'S' ,'E' ,'L' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'42' ,'25' ,'01' ,'48' ,'40' ,'13' ,'28' ,'14' ,
      '47' ,'03' ,'46' ,'07' ,'23' ,'15' ,'36' ,'24' ,'08' ,'19' ,'26' ,'05' ,
      '39' ,'33' ,'22' ,'06' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'25' ,'01' ,'48' ,'40' ,'13' ,'28' ,'14' ,'47' ,'03' ,'46' ,
      '07' ,'23' ,'15' ,'36' ,'24' ,'08' ,'19' ,'26' ,'05' ,'39' ,'33' ,'22' ,
      '06' ,'04' ,'53' ,'37' ,'38' ,'31' ,'35' ,'17' ,'11' ,'49' ,'50' ,'43' ,
      '45' ,'20' ,'16' ,'30' ,'34' ,'09' ,'02' ,'41' ,'18' ,'12' ,'27' ,'21' ,
      '51' ,'44' ,'29' ,'32' ,'52' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF              19212.5 <= PER_CAPITA_INCOME  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
          IF                 1100 <= MEDIAN_HOME_VALUE  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(LAST_GIFT_AMT ) AND 
        LAST_GIFT_AMT  <               15.875 THEN DO;
         _BRANCH_ =    1; 
        END; 
       IF MISSING(LAST_GIFT_AMT ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_MAX_GIFT_AMT ) THEN DO;
            IF LIFETIME_MAX_GIFT_AMT  <               15.875 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
            IF RECENT_AVG_GIFT_AMT  <                15.22 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.015484724;
        END;
      END;
    END;
  END;

********** LEAF    48  NODE   496 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( RECENCY_STATUS_96NK , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('A' ,'N' ,'F' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENCY_STATUS_96NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_5 NOTIN (
    'A' ,'N' ,'F' ,'S' ,'E' ,'L' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_STAR_STATUS ) THEN DO;
        IF RECENT_STAR_STATUS  <                  0.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_CARD_GIFT ) THEN DO;
        IF FILE_CARD_GIFT  <                  8.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENCY_STATUS_96NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_5 NOTIN (
      'A' ,'N' ,'F' ,'S' ,'E' ,'L' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'42' ,'25' ,'01' ,'48' ,'40' ,'13' ,'28' ,'14' ,
      '47' ,'03' ,'46' ,'07' ,'23' ,'15' ,'36' ,'24' ,'08' ,'19' ,'26' ,'05' ,
      '39' ,'33' ,'22' ,'06' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'25' ,'01' ,'48' ,'40' ,'13' ,'28' ,'14' ,'47' ,'03' ,'46' ,
      '07' ,'23' ,'15' ,'36' ,'24' ,'08' ,'19' ,'26' ,'05' ,'39' ,'33' ,'22' ,
      '06' ,'04' ,'53' ,'37' ,'38' ,'31' ,'35' ,'17' ,'11' ,'49' ,'50' ,'43' ,
      '45' ,'20' ,'16' ,'30' ,'34' ,'09' ,'02' ,'41' ,'18' ,'12' ,'27' ,'21' ,
      '51' ,'44' ,'29' ,'32' ,'52' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF              19212.5 <= PER_CAPITA_INCOME  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
          IF                 1100 <= MEDIAN_HOME_VALUE  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(LAST_GIFT_AMT ) AND 
                      15.875 <= LAST_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
       IF MISSING(LAST_GIFT_AMT ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_MAX_GIFT_AMT ) THEN DO;
            IF               15.875 <= LIFETIME_MAX_GIFT_AMT  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
            IF                15.22 <= RECENT_AVG_GIFT_AMT  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( LAST_GIFT_AMT  ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0049990723;
        END;
      END;
    END;
  END;

********** LEAF    49  NODE   497 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( RECENCY_STATUS_96NK , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('A' ,'N' ,'F' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENCY_STATUS_96NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_5 NOTIN (
    'A' ,'N' ,'F' ,'S' ,'E' ,'L' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_STAR_STATUS ) THEN DO;
        IF RECENT_STAR_STATUS  <                  0.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_CARD_GIFT ) THEN DO;
        IF FILE_CARD_GIFT  <                  8.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENCY_STATUS_96NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_5 NOTIN (
      'A' ,'N' ,'F' ,'S' ,'E' ,'L' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'53' ,'37' ,'38' ,'31' ,'35' ,'17' ,'11' ,'49' ,
      '50' ,'43' ,'45' ,'20' ,'16' ,'30' ,'34' ,'09' ,'02' ,'41' ,'18' ,'12' ,
      '27' ,'21' ,'51' ,'44' ,'29' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'25' ,'01' ,'48' ,'40' ,'13' ,'28' ,'14' ,'47' ,'03' ,'46' ,
      '07' ,'23' ,'15' ,'36' ,'24' ,'08' ,'19' ,'26' ,'05' ,'39' ,'33' ,'22' ,
      '06' ,'04' ,'53' ,'37' ,'38' ,'31' ,'35' ,'17' ,'11' ,'49' ,'50' ,'43' ,
      '45' ,'20' ,'16' ,'30' ,'34' ,'09' ,'02' ,'41' ,'18' ,'12' ,'27' ,'21' ,
      '51' ,'44' ,'29' ,'32' ,'52' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF PER_CAPITA_INCOME  <              19212.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
          IF MEDIAN_HOME_VALUE  <                 1100 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'42' ,'25' ,'01' ,'48' ,'40' ,'13' ,'28' ,'14' ,'47' ,'03' ,
        '46' ,'07' ,'23' ,'15' ,'36' ,'24' ,'08' ,'19' ,'26' ,'05' ,'39' ,
        '33' ,'22' ,'06' ,'04' ,'53' ,'37' ,'38' ,'31' ,'35' ,'17' ,'11' ,
        '49' ,'50' ,'43' ,'45' ,'20' ,'16' ,'30' ,'34' ,'09' ,'02' ,'41' ,
        '18' ,'12' ,'27' ,'21' ,'51' ,'44' ,'29' ,'32' ,'52' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_12 = PUT( PUBLISHED_PHONE , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('0' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(PUBLISHED_PHONE ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_12 NOTIN (
        '0' ,'1' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(OVERLAY_SOURCE ) THEN DO;
          _ARBFMT_1 = PUT( OVERLAY_SOURCE , $1.);
           %DMNORMIP( _ARBFMT_1);
            IF _ARBFMT_1 IN ('P' ,'N' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_1 IN ('B' ,'M' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(MOR_HIT_RATE ) THEN DO;
            IF MOR_HIT_RATE  <                  0.5 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( PUBLISHED_PHONE  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_12 NOTIN (
          '0' ,'1' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0178605628;
        END;
      END;
    END;
  END;

********** LEAF    50  NODE   498 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( RECENCY_STATUS_96NK , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('A' ,'N' ,'F' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENCY_STATUS_96NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_5 NOTIN (
    'A' ,'N' ,'F' ,'S' ,'E' ,'L' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_STAR_STATUS ) THEN DO;
        IF RECENT_STAR_STATUS  <                  0.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_CARD_GIFT ) THEN DO;
        IF FILE_CARD_GIFT  <                  8.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENCY_STATUS_96NK  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_5 NOTIN (
      'A' ,'N' ,'F' ,'S' ,'E' ,'L' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'53' ,'37' ,'38' ,'31' ,'35' ,'17' ,'11' ,'49' ,
      '50' ,'43' ,'45' ,'20' ,'16' ,'30' ,'34' ,'09' ,'02' ,'41' ,'18' ,'12' ,
      '27' ,'21' ,'51' ,'44' ,'29' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'25' ,'01' ,'48' ,'40' ,'13' ,'28' ,'14' ,'47' ,'03' ,'46' ,
      '07' ,'23' ,'15' ,'36' ,'24' ,'08' ,'19' ,'26' ,'05' ,'39' ,'33' ,'22' ,
      '06' ,'04' ,'53' ,'37' ,'38' ,'31' ,'35' ,'17' ,'11' ,'49' ,'50' ,'43' ,
      '45' ,'20' ,'16' ,'30' ,'34' ,'09' ,'02' ,'41' ,'18' ,'12' ,'27' ,'21' ,
      '51' ,'44' ,'29' ,'32' ,'52' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF PER_CAPITA_INCOME  <              19212.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
          IF MEDIAN_HOME_VALUE  <                 1100 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'42' ,'25' ,'01' ,'48' ,'40' ,'13' ,'28' ,'14' ,'47' ,'03' ,
        '46' ,'07' ,'23' ,'15' ,'36' ,'24' ,'08' ,'19' ,'26' ,'05' ,'39' ,
        '33' ,'22' ,'06' ,'04' ,'53' ,'37' ,'38' ,'31' ,'35' ,'17' ,'11' ,
        '49' ,'50' ,'43' ,'45' ,'20' ,'16' ,'30' ,'34' ,'09' ,'02' ,'41' ,
        '18' ,'12' ,'27' ,'21' ,'51' ,'44' ,'29' ,'32' ,'52' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_12 = PUT( PUBLISHED_PHONE , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(PUBLISHED_PHONE ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_12 NOTIN (
        '0' ,'1' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(OVERLAY_SOURCE ) THEN DO;
          _ARBFMT_1 = PUT( OVERLAY_SOURCE , $1.);
           %DMNORMIP( _ARBFMT_1);
            IF _ARBFMT_1 IN ('B' ,'M' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_1 IN ('P' ,'N' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(MOR_HIT_RATE ) THEN DO;
            IF                  0.5 <= MOR_HIT_RATE  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0078617178;
        END;
      END;
    END;
  END;

********** LEAF    51  NODE   492 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_5 = PUT( RECENCY_STATUS_96NK , $5.);
   %DMNORMIP( _ARBFMT_5);
    IF _ARBFMT_5 IN ('S' ,'E' ,'L' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENCY_STATUS_96NK ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_5 NOTIN (
    'A' ,'N' ,'F' ,'S' ,'E' ,'L' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_STAR_STATUS ) THEN DO;
        IF                  0.5 <= RECENT_STAR_STATUS  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_CARD_GIFT ) THEN DO;
        IF                  8.5 <= FILE_CARD_GIFT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.012558796;
    END;
  END;

********** LEAF    52  NODE   502 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'25' ,'31' ,'17' ,'49' ,'46' ,'45' ,'16' ,'30' ,
    '07' ,'41' ,'36' ,'21' ,'51' ,'44' ,'39' ,'33' ,'32' ,'52' ,'10' ) THEN 
        DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'25' ,'31' ,'17' ,'49' ,'46' ,'45' ,'16' ,'30' ,'07' ,'41' ,'36' ,
    '21' ,'51' ,'44' ,'39' ,'33' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'01' ,
    '37' ,'38' ,'48' ,'35' ,'40' ,'13' ,'28' ,'14' ,'11' ,'47' ,'03' ,'50' ,
    '43' ,'20' ,'34' ,'23' ,'09' ,'02' ,'15' ,'18' ,'24' ,'08' ,'12' ,'19' ,
    '27' ,'26' ,'29' ,'05' ,'22' ,'06' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
        IF PER_CAPITA_INCOME  <              12755.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
        IF MEDIAN_HOME_VALUE  <                676.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( INCOME_GROUP , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('4' ,'1' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(INCOME_GROUP ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_12 NOTIN (
      '4' ,'1' ,'2' ,'6' ,'5' ,'3' ,'7' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
          IF _ARBFMT_2 IN ('33' ,'10' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_2 IN ('.' ,'25' ,'31' ,'17' ,'49' ,'46' ,'45' ,
          '16' ,'30' ,'07' ,'41' ,'36' ,'21' ,'51' ,'44' ,'39' ,'32' ,'52' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_PROM ) THEN DO;
          IF                 99.5 <= LIFETIME_PROM  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( INCOME_GROUP  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_12 NOTIN (
        '4' ,'1' ,'2' ,'6' ,'5' ,'3' ,'7' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0187022591;
      END;
    END;
  END;

********** LEAF    53  NODE   503 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'25' ,'31' ,'17' ,'49' ,'46' ,'45' ,'16' ,'30' ,
    '07' ,'41' ,'36' ,'21' ,'51' ,'44' ,'39' ,'33' ,'32' ,'52' ,'10' ) THEN 
        DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'25' ,'31' ,'17' ,'49' ,'46' ,'45' ,'16' ,'30' ,'07' ,'41' ,'36' ,
    '21' ,'51' ,'44' ,'39' ,'33' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'01' ,
    '37' ,'38' ,'48' ,'35' ,'40' ,'13' ,'28' ,'14' ,'11' ,'47' ,'03' ,'50' ,
    '43' ,'20' ,'34' ,'23' ,'09' ,'02' ,'15' ,'18' ,'24' ,'08' ,'12' ,'19' ,
    '27' ,'26' ,'29' ,'05' ,'22' ,'06' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
        IF PER_CAPITA_INCOME  <              12755.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
        IF MEDIAN_HOME_VALUE  <                676.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( INCOME_GROUP , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('2' ,'6' ,'5' ,'3' ,'7' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(INCOME_GROUP ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_12 NOTIN (
      '4' ,'1' ,'2' ,'6' ,'5' ,'3' ,'7' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
          IF _ARBFMT_2 IN ('.' ,'25' ,'31' ,'17' ,'49' ,'46' ,'45' ,'16' ,
          '30' ,'07' ,'41' ,'36' ,'21' ,'51' ,'44' ,'39' ,'32' ,'52' ) THEN 
           DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_2 IN ('33' ,'10' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_PROM ) THEN DO;
          IF LIFETIME_PROM  <                 99.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0055550403;
      END;
    END;
  END;

********** LEAF    54  NODE   504 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'53' ,'42' ,'01' ,'37' ,'38' ,'48' ,'35' ,'40' ,
    '13' ,'28' ,'14' ,'11' ,'47' ,'03' ,'50' ,'43' ,'20' ,'34' ,'23' ,'09' ,
    '02' ,'15' ,'18' ,'24' ,'08' ,'12' ,'19' ,'27' ,'26' ,'29' ,'05' ,'22' ,
    '06' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'25' ,'31' ,'17' ,'49' ,'46' ,'45' ,'16' ,'30' ,'07' ,'41' ,'36' ,
    '21' ,'51' ,'44' ,'39' ,'33' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'01' ,
    '37' ,'38' ,'48' ,'35' ,'40' ,'13' ,'28' ,'14' ,'11' ,'47' ,'03' ,'50' ,
    '43' ,'20' ,'34' ,'23' ,'09' ,'02' ,'15' ,'18' ,'24' ,'08' ,'12' ,'19' ,
    '27' ,'26' ,'29' ,'05' ,'22' ,'06' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
        IF              12755.5 <= PER_CAPITA_INCOME  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
        IF                676.5 <= MEDIAN_HOME_VALUE  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'25' ,'31' ,'17' ,'49' ,'46' ,'45' ,'16' ,'30' ,'07' ,'41' ,'36' ,
      '21' ,'51' ,'44' ,'39' ,'33' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'01' ,
      '37' ,'38' ,'48' ,'35' ,'40' ,'13' ,'28' ,'14' ,'11' ,'47' ,'03' ,'50' ,
      '43' ,'20' ,'34' ,'23' ,'09' ,'02' ,'15' ,'18' ,'24' ,'08' ,'12' ,'19' ,
      '27' ,'26' ,'29' ,'05' ,'22' ,'06' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( WEALTH_RATING , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('4' ,'5' ,'2' ,'1' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(WEALTH_RATING ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_12 NOTIN (
      '4' ,'5' ,'2' ,'1' ,'7' ,'3' ,'6' ,'9' ,'8' ,'0' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
          IF _ARBFMT_2 IN ('53' ,'37' ,'48' ,'47' ,'50' ,'43' ,'09' ,'08' ,
          '29' ,'06' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_2 IN ('04' ,'42' ,'01' ,'38' ,'35' ,'40' ,'13' ,
          '28' ,'14' ,'11' ,'03' ,'20' ,'34' ,'23' ,'02' ,'15' ,'18' ,'24' ,
          '12' ,'19' ,'27' ,'26' ,'05' ,'22' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF MEDIAN_HOUSEHOLD_INCOME  <                272.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( WEALTH_RATING  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_12 NOTIN (
        '4' ,'5' ,'2' ,'1' ,'7' ,'3' ,'6' ,'9' ,'8' ,'0' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000270285;
      END;
    END;
  END;

********** LEAF    55  NODE   506 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'53' ,'42' ,'01' ,'37' ,'38' ,'48' ,'35' ,'40' ,
    '13' ,'28' ,'14' ,'11' ,'47' ,'03' ,'50' ,'43' ,'20' ,'34' ,'23' ,'09' ,
    '02' ,'15' ,'18' ,'24' ,'08' ,'12' ,'19' ,'27' ,'26' ,'29' ,'05' ,'22' ,
    '06' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'25' ,'31' ,'17' ,'49' ,'46' ,'45' ,'16' ,'30' ,'07' ,'41' ,'36' ,
    '21' ,'51' ,'44' ,'39' ,'33' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'01' ,
    '37' ,'38' ,'48' ,'35' ,'40' ,'13' ,'28' ,'14' ,'11' ,'47' ,'03' ,'50' ,
    '43' ,'20' ,'34' ,'23' ,'09' ,'02' ,'15' ,'18' ,'24' ,'08' ,'12' ,'19' ,
    '27' ,'26' ,'29' ,'05' ,'22' ,'06' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
        IF              12755.5 <= PER_CAPITA_INCOME  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
        IF                676.5 <= MEDIAN_HOME_VALUE  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'25' ,'31' ,'17' ,'49' ,'46' ,'45' ,'16' ,'30' ,'07' ,'41' ,'36' ,
      '21' ,'51' ,'44' ,'39' ,'33' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'01' ,
      '37' ,'38' ,'48' ,'35' ,'40' ,'13' ,'28' ,'14' ,'11' ,'47' ,'03' ,'50' ,
      '43' ,'20' ,'34' ,'23' ,'09' ,'02' ,'15' ,'18' ,'24' ,'08' ,'12' ,'19' ,
      '27' ,'26' ,'29' ,'05' ,'22' ,'06' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( WEALTH_RATING , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('7' ,'3' ,'6' ,'9' ,'8' ,'0' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(WEALTH_RATING ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_12 NOTIN (
      '4' ,'5' ,'2' ,'1' ,'7' ,'3' ,'6' ,'9' ,'8' ,'0' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
          IF _ARBFMT_2 IN ('04' ,'42' ,'01' ,'38' ,'35' ,'40' ,'13' ,'28' ,
          '14' ,'11' ,'03' ,'20' ,'34' ,'23' ,'02' ,'15' ,'18' ,'24' ,'12' ,
          '19' ,'27' ,'26' ,'05' ,'22' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_2 IN ('53' ,'37' ,'48' ,'47' ,'50' ,'43' ,'09' ,
          '08' ,'29' ,'06' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF                272.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK
         ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_12 NOTIN (
        '1' ,'2' ,'3' ,'4' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
          _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
           %DMNORMIP( _ARBFMT_12);
            IF _ARBFMT_12 IN ('1' ,'2' ,'0' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_12 IN ('3' ,'9' ,'11' ,'7' ,'4' ,'5' ,'8' ,'6' ,
            '10' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
            IF RECENT_RESPONSE_PROP  <                0.156 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0010456055;
        END;
      END;
    END;
  END;

********** LEAF    56  NODE   507 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'53' ,'42' ,'01' ,'37' ,'38' ,'48' ,'35' ,'40' ,
    '13' ,'28' ,'14' ,'11' ,'47' ,'03' ,'50' ,'43' ,'20' ,'34' ,'23' ,'09' ,
    '02' ,'15' ,'18' ,'24' ,'08' ,'12' ,'19' ,'27' ,'26' ,'29' ,'05' ,'22' ,
    '06' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'25' ,'31' ,'17' ,'49' ,'46' ,'45' ,'16' ,'30' ,'07' ,'41' ,'36' ,
    '21' ,'51' ,'44' ,'39' ,'33' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'01' ,
    '37' ,'38' ,'48' ,'35' ,'40' ,'13' ,'28' ,'14' ,'11' ,'47' ,'03' ,'50' ,
    '43' ,'20' ,'34' ,'23' ,'09' ,'02' ,'15' ,'18' ,'24' ,'08' ,'12' ,'19' ,
    '27' ,'26' ,'29' ,'05' ,'22' ,'06' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
        IF              12755.5 <= PER_CAPITA_INCOME  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
        IF                676.5 <= MEDIAN_HOME_VALUE  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'25' ,'31' ,'17' ,'49' ,'46' ,'45' ,'16' ,'30' ,'07' ,'41' ,'36' ,
      '21' ,'51' ,'44' ,'39' ,'33' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'01' ,
      '37' ,'38' ,'48' ,'35' ,'40' ,'13' ,'28' ,'14' ,'11' ,'47' ,'03' ,'50' ,
      '43' ,'20' ,'34' ,'23' ,'09' ,'02' ,'15' ,'18' ,'24' ,'08' ,'12' ,'19' ,
      '27' ,'26' ,'29' ,'05' ,'22' ,'06' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( WEALTH_RATING , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('7' ,'3' ,'6' ,'9' ,'8' ,'0' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(WEALTH_RATING ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_12 NOTIN (
      '4' ,'5' ,'2' ,'1' ,'7' ,'3' ,'6' ,'9' ,'8' ,'0' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
          IF _ARBFMT_2 IN ('04' ,'42' ,'01' ,'38' ,'35' ,'40' ,'13' ,'28' ,
          '14' ,'11' ,'03' ,'20' ,'34' ,'23' ,'02' ,'15' ,'18' ,'24' ,'12' ,
          '19' ,'27' ,'26' ,'05' ,'22' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_2 IN ('53' ,'37' ,'48' ,'47' ,'50' ,'43' ,'09' ,
          '08' ,'29' ,'06' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF                272.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('2' ,'3' ,'4' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(FREQUENCY_STATUS_97NK
         ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_12 NOTIN (
        '1' ,'2' ,'3' ,'4' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
          _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
           %DMNORMIP( _ARBFMT_12);
            IF _ARBFMT_12 IN ('3' ,'9' ,'11' ,'7' ,'4' ,'5' ,'8' ,'6' ,'10' ) 
             THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_12 IN ('1' ,'2' ,'0' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
            IF                0.156 <= RECENT_RESPONSE_PROP  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
        _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
         %DMNORMIP( _ARBFMT_12);
         IF MISSING( FREQUENCY_STATUS_97NK  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_12 NOTIN (
          '1' ,'2' ,'3' ,'4' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.014006839;
        END;
      END;
    END;
  END;

********** LEAF    57  NODE   511 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'01' ,'37' ,'31' ,'35' ,'28' ,'17' ,'11' ,'47' ,
    '49' ,'50' ,'43' ,'45' ,'20' ,'16' ,'30' ,'09' ,'15' ,'36' ,'24' ,'08' ,
    '12' ,'26' ,'21' ,'51' ,'29' ,'39' ,'06' ,'32' ,'52' ,'10' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'01' ,'37' ,'31' ,'35' ,'28' ,'17' ,'11' ,'47' ,'49' ,'50' ,'43' ,
    '45' ,'20' ,'16' ,'30' ,'09' ,'15' ,'36' ,'24' ,'08' ,'12' ,'26' ,'21' ,
    '51' ,'29' ,'39' ,'06' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'25' ,'38' ,
    '48' ,'40' ,'13' ,'14' ,'03' ,'46' ,'07' ,'34' ,'23' ,'02' ,'41' ,'18' ,
    '19' ,'27' ,'44' ,'05' ,'33' ,'22' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
        IF MEDIAN_HOUSEHOLD_INCOME  <                344.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
        IF MEDIAN_HOME_VALUE  <               2391.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'01' ,'37' ,'31' ,'35' ,'28' ,'17' ,'11' ,'47' ,'49' ,'50' ,'43' ,
      '45' ,'20' ,'16' ,'30' ,'09' ,'15' ,'36' ,'24' ,'08' ,'12' ,'26' ,'21' ,
      '51' ,'29' ,'39' ,'06' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'25' ,'38' ,
      '48' ,'40' ,'13' ,'14' ,'03' ,'46' ,'07' ,'34' ,'23' ,'02' ,'41' ,'18' ,
      '19' ,'27' ,'44' ,'05' ,'33' ,'22' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ,'0' ,'4' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_12 NOTIN (
      '1' ,'0' ,'4' ,'2' ,'3' ,'9' ,'11' ,'7' ,'12' ,'5' ,'8' ,'6' ,'10' ,
      '13' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
          IF RECENT_RESPONSE_PROP  <                0.087 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
          IF LIFETIME_GIFT_COUNT  <                  1.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_12 NOTIN (
        '1' ,'0' ,'4' ,'2' ,'3' ,'9' ,'11' ,'7' ,'12' ,'5' ,'8' ,'6' ,'10' ,
        '13' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0168996994;
      END;
    END;
  END;

********** LEAF    58  NODE   515 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'01' ,'37' ,'31' ,'35' ,'28' ,'17' ,'11' ,'47' ,
    '49' ,'50' ,'43' ,'45' ,'20' ,'16' ,'30' ,'09' ,'15' ,'36' ,'24' ,'08' ,
    '12' ,'26' ,'21' ,'51' ,'29' ,'39' ,'06' ,'32' ,'52' ,'10' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'01' ,'37' ,'31' ,'35' ,'28' ,'17' ,'11' ,'47' ,'49' ,'50' ,'43' ,
    '45' ,'20' ,'16' ,'30' ,'09' ,'15' ,'36' ,'24' ,'08' ,'12' ,'26' ,'21' ,
    '51' ,'29' ,'39' ,'06' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'25' ,'38' ,
    '48' ,'40' ,'13' ,'14' ,'03' ,'46' ,'07' ,'34' ,'23' ,'02' ,'41' ,'18' ,
    '19' ,'27' ,'44' ,'05' ,'33' ,'22' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
        IF MEDIAN_HOUSEHOLD_INCOME  <                344.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
        IF MEDIAN_HOME_VALUE  <               2391.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'01' ,'37' ,'31' ,'35' ,'28' ,'17' ,'11' ,'47' ,'49' ,'50' ,'43' ,
      '45' ,'20' ,'16' ,'30' ,'09' ,'15' ,'36' ,'24' ,'08' ,'12' ,'26' ,'21' ,
      '51' ,'29' ,'39' ,'06' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'25' ,'38' ,
      '48' ,'40' ,'13' ,'14' ,'03' ,'46' ,'07' ,'34' ,'23' ,'02' ,'41' ,'18' ,
      '19' ,'27' ,'44' ,'05' ,'33' ,'22' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('2' ,'3' ,'9' ,'11' ,'7' ,'12' ,'5' ,'8' ,'6' ,'10' ,
      '13' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_12 NOTIN (
      '1' ,'0' ,'4' ,'2' ,'3' ,'9' ,'11' ,'7' ,'12' ,'5' ,'8' ,'6' ,'10' ,
      '13' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
          IF                0.087 <= RECENT_RESPONSE_PROP  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
          IF                  1.5 <= LIFETIME_GIFT_COUNT  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_2 IN ('.' ,'01' ,'35' ,'17' ,'11' ,'47' ,'20' ,'30' ,'09' ,
        '15' ,'24' ,'12' ,'29' ,'32' ,'52' ,'10' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_2 NOTIN (
        '.' ,'01' ,'35' ,'17' ,'11' ,'47' ,'20' ,'30' ,'09' ,'15' ,'24' ,
        '12' ,'29' ,'32' ,'52' ,'10' ,'37' ,'31' ,'28' ,'49' ,'50' ,'43' ,
        '45' ,'16' ,'36' ,'08' ,'26' ,'21' ,'51' ,'39' ,'06' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
          _ARBFMT_4 = PUT( REP_SES , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('1' ,'4' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_4 IN ('2' ,'3' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
            IF              13920.5 <= PER_CAPITA_INCOME  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_2 NOTIN (
          '.' ,'01' ,'35' ,'17' ,'11' ,'47' ,'20' ,'30' ,'09' ,'15' ,'24' ,
          '12' ,'29' ,'32' ,'52' ,'10' ,'37' ,'31' ,'28' ,'49' ,'50' ,'43' ,
          '45' ,'16' ,'36' ,'08' ,'26' ,'21' ,'51' ,'39' ,'06' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.006525629;
        END;
      END;
    END;
  END;

********** LEAF    59  NODE   516 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'01' ,'37' ,'31' ,'35' ,'28' ,'17' ,'11' ,'47' ,
    '49' ,'50' ,'43' ,'45' ,'20' ,'16' ,'30' ,'09' ,'15' ,'36' ,'24' ,'08' ,
    '12' ,'26' ,'21' ,'51' ,'29' ,'39' ,'06' ,'32' ,'52' ,'10' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'01' ,'37' ,'31' ,'35' ,'28' ,'17' ,'11' ,'47' ,'49' ,'50' ,'43' ,
    '45' ,'20' ,'16' ,'30' ,'09' ,'15' ,'36' ,'24' ,'08' ,'12' ,'26' ,'21' ,
    '51' ,'29' ,'39' ,'06' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'25' ,'38' ,
    '48' ,'40' ,'13' ,'14' ,'03' ,'46' ,'07' ,'34' ,'23' ,'02' ,'41' ,'18' ,
    '19' ,'27' ,'44' ,'05' ,'33' ,'22' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
        IF MEDIAN_HOUSEHOLD_INCOME  <                344.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
        IF MEDIAN_HOME_VALUE  <               2391.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'01' ,'37' ,'31' ,'35' ,'28' ,'17' ,'11' ,'47' ,'49' ,'50' ,'43' ,
      '45' ,'20' ,'16' ,'30' ,'09' ,'15' ,'36' ,'24' ,'08' ,'12' ,'26' ,'21' ,
      '51' ,'29' ,'39' ,'06' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'25' ,'38' ,
      '48' ,'40' ,'13' ,'14' ,'03' ,'46' ,'07' ,'34' ,'23' ,'02' ,'41' ,'18' ,
      '19' ,'27' ,'44' ,'05' ,'33' ,'22' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('2' ,'3' ,'9' ,'11' ,'7' ,'12' ,'5' ,'8' ,'6' ,'10' ,
      '13' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_12 NOTIN (
      '1' ,'0' ,'4' ,'2' ,'3' ,'9' ,'11' ,'7' ,'12' ,'5' ,'8' ,'6' ,'10' ,
      '13' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
          IF                0.087 <= RECENT_RESPONSE_PROP  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
          IF                  1.5 <= LIFETIME_GIFT_COUNT  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_2 IN ('37' ,'31' ,'28' ,'49' ,'50' ,'43' ,'45' ,'16' ,
        '36' ,'08' ,'26' ,'21' ,'51' ,'39' ,'06' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_2 NOTIN (
        '.' ,'01' ,'35' ,'17' ,'11' ,'47' ,'20' ,'30' ,'09' ,'15' ,'24' ,
        '12' ,'29' ,'32' ,'52' ,'10' ,'37' ,'31' ,'28' ,'49' ,'50' ,'43' ,
        '45' ,'16' ,'36' ,'08' ,'26' ,'21' ,'51' ,'39' ,'06' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
          _ARBFMT_4 = PUT( REP_SES , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('2' ,'3' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_4 IN ('1' ,'4' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
            IF PER_CAPITA_INCOME  <              13920.5 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0082052522;
        END;
      END;
    END;
  END;

********** LEAF    60  NODE   513 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'53' ,'42' ,'25' ,'38' ,'48' ,'40' ,'13' ,'14' ,
    '03' ,'46' ,'07' ,'34' ,'23' ,'02' ,'41' ,'18' ,'19' ,'27' ,'44' ,'05' ,
    '33' ,'22' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'01' ,'37' ,'31' ,'35' ,'28' ,'17' ,'11' ,'47' ,'49' ,'50' ,'43' ,
    '45' ,'20' ,'16' ,'30' ,'09' ,'15' ,'36' ,'24' ,'08' ,'12' ,'26' ,'21' ,
    '51' ,'29' ,'39' ,'06' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'25' ,'38' ,
    '48' ,'40' ,'13' ,'14' ,'03' ,'46' ,'07' ,'34' ,'23' ,'02' ,'41' ,'18' ,
    '19' ,'27' ,'44' ,'05' ,'33' ,'22' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
        IF                344.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
        IF               2391.5 <= MEDIAN_HOME_VALUE  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(PEP_STAR ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_12 NOTIN (
      '1' ,'0' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(FILE_CARD_GIFT ) THEN DO;
          IF                  4.5 <= FILE_CARD_GIFT  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
          IF                  7.5 <= LIFETIME_GIFT_COUNT  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.01555221;
      END;
    END;
  END;

********** LEAF    61  NODE   514 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'53' ,'42' ,'25' ,'38' ,'48' ,'40' ,'13' ,'14' ,
    '03' ,'46' ,'07' ,'34' ,'23' ,'02' ,'41' ,'18' ,'19' ,'27' ,'44' ,'05' ,
    '33' ,'22' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'01' ,'37' ,'31' ,'35' ,'28' ,'17' ,'11' ,'47' ,'49' ,'50' ,'43' ,
    '45' ,'20' ,'16' ,'30' ,'09' ,'15' ,'36' ,'24' ,'08' ,'12' ,'26' ,'21' ,
    '51' ,'29' ,'39' ,'06' ,'32' ,'52' ,'10' ,'04' ,'53' ,'42' ,'25' ,'38' ,
    '48' ,'40' ,'13' ,'14' ,'03' ,'46' ,'07' ,'34' ,'23' ,'02' ,'41' ,'18' ,
    '19' ,'27' ,'44' ,'05' ,'33' ,'22' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
        IF                344.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
        IF               2391.5 <= MEDIAN_HOME_VALUE  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('0' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(PEP_STAR ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_12 NOTIN (
      '1' ,'0' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(FILE_CARD_GIFT ) THEN DO;
          IF FILE_CARD_GIFT  <                  4.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
          IF LIFETIME_GIFT_COUNT  <                  7.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( PEP_STAR  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_12 NOTIN (
        '1' ,'0' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0000153974;
      END;
    END;
  END;

********** LEAF    62  NODE   524 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'04' ,'42' ,'37' ,'38' ,'35' ,'11' ,'47' ,'49' ,
    '50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'08' ,'12' ,'21' ,
    '51' ,'44' ,'39' ,'33' ,'22' ,'32' ,'52' ,'10' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'04' ,'42' ,'37' ,'38' ,'35' ,'11' ,'47' ,'49' ,'50' ,'43' ,'46' ,
    '45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'08' ,'12' ,'21' ,'51' ,'44' ,'39' ,
    '33' ,'22' ,'32' ,'52' ,'10' ,'53' ,'25' ,'01' ,'48' ,'31' ,'40' ,'13' ,
    '28' ,'14' ,'17' ,'03' ,'20' ,'16' ,'23' ,'41' ,'15' ,'18' ,'36' ,'24' ,
    '19' ,'27' ,'26' ,'29' ,'05' ,'06' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
      _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('U' ,'R' ,'T' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_4 IN ('S' ,'C' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
        IF PER_CAPITA_INCOME  <                12871 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'42' ,'37' ,'38' ,'35' ,'11' ,'47' ,'49' ,'50' ,'43' ,'46' ,
      '45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'08' ,'12' ,'21' ,'51' ,'44' ,'39' ,
      '33' ,'22' ,'32' ,'52' ,'10' ,'53' ,'25' ,'01' ,'48' ,'31' ,'40' ,'13' ,
      '28' ,'14' ,'17' ,'03' ,'20' ,'16' ,'23' ,'41' ,'15' ,'18' ,'36' ,'24' ,
      '19' ,'27' ,'26' ,'29' ,'05' ,'06' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ,'2' ,'0' ,'9' ,'4' ,'6' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'0' ,'9' ,'4' ,'6' ,'10' ,'3' ,'11' ,'7' ,'12' ,'5' ,'8' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
          IF RECENT_RESPONSE_PROP  <               0.2245 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_CARD_RESPONSE_COUNT ) THEN DO;
        _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
         %DMNORMIP( _ARBFMT_12);
          IF _ARBFMT_12 IN ('0' ,'1' ,'2' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_12 IN ('3' ,'4' ,'7' ,'5' ,'6' ,'8' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_2 IN ('.' ,'42' ,'38' ,'35' ,'49' ,'43' ,'30' ,'07' ,'02' ,
        '51' ,'39' ,'22' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_2 NOTIN (
        '.' ,'42' ,'38' ,'35' ,'49' ,'43' ,'30' ,'07' ,'02' ,'51' ,'39' ,
        '22' ,'04' ,'37' ,'11' ,'47' ,'50' ,'46' ,'45' ,'34' ,'09' ,'08' ,
        '12' ,'21' ,'44' ,'33' ,'32' ,'52' ,'10' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
          _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('R' ,'C' ,'T' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_4 IN ('U' ,'S' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE4 ) THEN DO;
            IF PCT_ATTRIBUTE4  <                 33.5 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_2 NOTIN (
          '.' ,'42' ,'38' ,'35' ,'49' ,'43' ,'30' ,'07' ,'02' ,'51' ,'39' ,
          '22' ,'04' ,'37' ,'11' ,'47' ,'50' ,'46' ,'45' ,'34' ,'09' ,'08' ,
          '12' ,'21' ,'44' ,'33' ,'32' ,'52' ,'10' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0046971576;
        END;
      END;
    END;
  END;

********** LEAF    63  NODE   525 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'04' ,'42' ,'37' ,'38' ,'35' ,'11' ,'47' ,'49' ,
    '50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'08' ,'12' ,'21' ,
    '51' ,'44' ,'39' ,'33' ,'22' ,'32' ,'52' ,'10' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'04' ,'42' ,'37' ,'38' ,'35' ,'11' ,'47' ,'49' ,'50' ,'43' ,'46' ,
    '45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'08' ,'12' ,'21' ,'51' ,'44' ,'39' ,
    '33' ,'22' ,'32' ,'52' ,'10' ,'53' ,'25' ,'01' ,'48' ,'31' ,'40' ,'13' ,
    '28' ,'14' ,'17' ,'03' ,'20' ,'16' ,'23' ,'41' ,'15' ,'18' ,'36' ,'24' ,
    '19' ,'27' ,'26' ,'29' ,'05' ,'06' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
      _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('U' ,'R' ,'T' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_4 IN ('S' ,'C' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
        IF PER_CAPITA_INCOME  <                12871 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'42' ,'37' ,'38' ,'35' ,'11' ,'47' ,'49' ,'50' ,'43' ,'46' ,
      '45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'08' ,'12' ,'21' ,'51' ,'44' ,'39' ,
      '33' ,'22' ,'32' ,'52' ,'10' ,'53' ,'25' ,'01' ,'48' ,'31' ,'40' ,'13' ,
      '28' ,'14' ,'17' ,'03' ,'20' ,'16' ,'23' ,'41' ,'15' ,'18' ,'36' ,'24' ,
      '19' ,'27' ,'26' ,'29' ,'05' ,'06' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ,'2' ,'0' ,'9' ,'4' ,'6' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'0' ,'9' ,'4' ,'6' ,'10' ,'3' ,'11' ,'7' ,'12' ,'5' ,'8' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
          IF RECENT_RESPONSE_PROP  <               0.2245 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_CARD_RESPONSE_COUNT ) THEN DO;
        _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
         %DMNORMIP( _ARBFMT_12);
          IF _ARBFMT_12 IN ('0' ,'1' ,'2' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_12 IN ('3' ,'4' ,'7' ,'5' ,'6' ,'8' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_2 IN ('04' ,'37' ,'11' ,'47' ,'50' ,'46' ,'45' ,'34' ,
        '09' ,'08' ,'12' ,'21' ,'44' ,'33' ,'32' ,'52' ,'10' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_2 NOTIN (
        '.' ,'42' ,'38' ,'35' ,'49' ,'43' ,'30' ,'07' ,'02' ,'51' ,'39' ,
        '22' ,'04' ,'37' ,'11' ,'47' ,'50' ,'46' ,'45' ,'34' ,'09' ,'08' ,
        '12' ,'21' ,'44' ,'33' ,'32' ,'52' ,'10' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
          _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
           %DMNORMIP( _ARBFMT_4);
            IF _ARBFMT_4 IN ('U' ,'S' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_4 IN ('R' ,'C' ,'T' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE4 ) THEN DO;
            IF                 33.5 <= PCT_ATTRIBUTE4  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.021378198;
        END;
      END;
    END;
  END;

********** LEAF    64  NODE   521 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'04' ,'42' ,'37' ,'38' ,'35' ,'11' ,'47' ,'49' ,
    '50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'08' ,'12' ,'21' ,
    '51' ,'44' ,'39' ,'33' ,'22' ,'32' ,'52' ,'10' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'04' ,'42' ,'37' ,'38' ,'35' ,'11' ,'47' ,'49' ,'50' ,'43' ,'46' ,
    '45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'08' ,'12' ,'21' ,'51' ,'44' ,'39' ,
    '33' ,'22' ,'32' ,'52' ,'10' ,'53' ,'25' ,'01' ,'48' ,'31' ,'40' ,'13' ,
    '28' ,'14' ,'17' ,'03' ,'20' ,'16' ,'23' ,'41' ,'15' ,'18' ,'36' ,'24' ,
    '19' ,'27' ,'26' ,'29' ,'05' ,'06' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
      _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('U' ,'R' ,'T' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_4 IN ('S' ,'C' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
        IF PER_CAPITA_INCOME  <                12871 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'42' ,'37' ,'38' ,'35' ,'11' ,'47' ,'49' ,'50' ,'43' ,'46' ,
      '45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'08' ,'12' ,'21' ,'51' ,'44' ,'39' ,
      '33' ,'22' ,'32' ,'52' ,'10' ,'53' ,'25' ,'01' ,'48' ,'31' ,'40' ,'13' ,
      '28' ,'14' ,'17' ,'03' ,'20' ,'16' ,'23' ,'41' ,'15' ,'18' ,'36' ,'24' ,
      '19' ,'27' ,'26' ,'29' ,'05' ,'06' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('3' ,'11' ,'7' ,'12' ,'5' ,'8' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_12 NOTIN (
      '1' ,'2' ,'0' ,'9' ,'4' ,'6' ,'10' ,'3' ,'11' ,'7' ,'12' ,'5' ,'8' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
          IF               0.2245 <= RECENT_RESPONSE_PROP  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_CARD_RESPONSE_COUNT ) THEN DO;
        _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
         %DMNORMIP( _ARBFMT_12);
          IF _ARBFMT_12 IN ('3' ,'4' ,'7' ,'5' ,'6' ,'8' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_12 IN ('0' ,'1' ,'2' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
       IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_12 NOTIN (
        '1' ,'2' ,'0' ,'9' ,'4' ,'6' ,'10' ,'3' ,'11' ,'7' ,'12' ,'5' ,'8' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.004176006;
      END;
    END;
  END;

********** LEAF    65  NODE   522 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('53' ,'25' ,'01' ,'48' ,'31' ,'40' ,'13' ,'28' ,'14' ,
    '17' ,'03' ,'20' ,'16' ,'23' ,'41' ,'15' ,'18' ,'36' ,'24' ,'19' ,'27' ,
    '26' ,'29' ,'05' ,'06' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'04' ,'42' ,'37' ,'38' ,'35' ,'11' ,'47' ,'49' ,'50' ,'43' ,'46' ,
    '45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'08' ,'12' ,'21' ,'51' ,'44' ,'39' ,
    '33' ,'22' ,'32' ,'52' ,'10' ,'53' ,'25' ,'01' ,'48' ,'31' ,'40' ,'13' ,
    '28' ,'14' ,'17' ,'03' ,'20' ,'16' ,'23' ,'41' ,'15' ,'18' ,'36' ,'24' ,
    '19' ,'27' ,'26' ,'29' ,'05' ,'06' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
      _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('S' ,'C' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_4 IN ('U' ,'R' ,'T' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
        IF                12871 <= PER_CAPITA_INCOME  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LAST_GIFT_AMT ) AND 
      LAST_GIFT_AMT  <                 15.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(LAST_GIFT_AMT ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_MAX_GIFT_AMT ) THEN DO;
          IF LIFETIME_MAX_GIFT_AMT  <               15.575 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
          IF RECENT_AVG_GIFT_AMT  <                15.29 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LAST_GIFT_AMT  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.012991983;
      END;
    END;
  END;

********** LEAF    66  NODE   523 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('53' ,'25' ,'01' ,'48' ,'31' ,'40' ,'13' ,'28' ,'14' ,
    '17' ,'03' ,'20' ,'16' ,'23' ,'41' ,'15' ,'18' ,'36' ,'24' ,'19' ,'27' ,
    '26' ,'29' ,'05' ,'06' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'04' ,'42' ,'37' ,'38' ,'35' ,'11' ,'47' ,'49' ,'50' ,'43' ,'46' ,
    '45' ,'30' ,'07' ,'34' ,'09' ,'02' ,'08' ,'12' ,'21' ,'51' ,'44' ,'39' ,
    '33' ,'22' ,'32' ,'52' ,'10' ,'53' ,'25' ,'01' ,'48' ,'31' ,'40' ,'13' ,
    '28' ,'14' ,'17' ,'03' ,'20' ,'16' ,'23' ,'41' ,'15' ,'18' ,'36' ,'24' ,
    '19' ,'27' ,'26' ,'29' ,'05' ,'06' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
      _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('S' ,'C' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_4 IN ('U' ,'R' ,'T' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
        IF                12871 <= PER_CAPITA_INCOME  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LAST_GIFT_AMT ) AND 
                      15.5 <= LAST_GIFT_AMT  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(LAST_GIFT_AMT ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_MAX_GIFT_AMT ) THEN DO;
          IF               15.575 <= LIFETIME_MAX_GIFT_AMT  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
          IF                15.29 <= RECENT_AVG_GIFT_AMT  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0022771296;
      END;
    END;
  END;

********** LEAF    67  NODE   529 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('3' ,'2' ,'4' ,'5' ,'8' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENT_CARD_RESPONSE_COUNT
         ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '3' ,'2' ,'4' ,'5' ,'8' ,'0' ,'1' ,'7' ,'6' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_CARD_RESPONSE_PROP ) THEN DO;
        IF               0.1745 <= RECENT_CARD_RESPONSE_PROP  THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('3' ,'11' ,'7' ,'4' ,'5' ,'8' ,'6' ,'13' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('1' ,'2' ,'0' ,'9' ,'12' ,'10' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( RECENT_CARD_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '3' ,'2' ,'4' ,'5' ,'8' ,'0' ,'1' ,'7' ,'6' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'42' ,'01' ,'37' ,'48' ,'31' ,'35' ,
      '40' ,'28' ,'14' ,'11' ,'45' ,'20' ,'07' ,'34' ,'23' ,'09' ,'02' ,'15' ,
      '18' ,'36' ,'24' ,'12' ,'19' ,'51' ,'05' ,'33' ,'22' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'42' ,'01' ,'37' ,'48' ,'31' ,'35' ,'40' ,'28' ,'14' ,
      '11' ,'45' ,'20' ,'07' ,'34' ,'23' ,'09' ,'02' ,'15' ,'18' ,'36' ,'24' ,
      '12' ,'19' ,'51' ,'05' ,'33' ,'22' ,'25' ,'38' ,'13' ,'17' ,'47' ,'03' ,
      '49' ,'50' ,'43' ,'46' ,'16' ,'30' ,'41' ,'08' ,'27' ,'26' ,'21' ,'44' ,
      '29' ,'39' ,'06' ,'32' ,'52' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF              12970.5 <= PER_CAPITA_INCOME  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('1' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_4 IN ('2' ,'3' ,'4' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'53' ,'42' ,'01' ,'37' ,'48' ,'31' ,'35' ,'40' ,'28' ,
        '14' ,'11' ,'45' ,'20' ,'07' ,'34' ,'23' ,'09' ,'02' ,'15' ,'18' ,
        '36' ,'24' ,'12' ,'19' ,'51' ,'05' ,'33' ,'22' ,'25' ,'38' ,'13' ,
        '17' ,'47' ,'03' ,'49' ,'50' ,'43' ,'46' ,'16' ,'30' ,'41' ,'08' ,
        '27' ,'26' ,'21' ,'44' ,'29' ,'39' ,'06' ,'32' ,'52' ,'10' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.015971507;
      END;
    END;
  END;

********** LEAF    68  NODE   530 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('3' ,'2' ,'4' ,'5' ,'8' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENT_CARD_RESPONSE_COUNT
         ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '3' ,'2' ,'4' ,'5' ,'8' ,'0' ,'1' ,'7' ,'6' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_CARD_RESPONSE_PROP ) THEN DO;
        IF               0.1745 <= RECENT_CARD_RESPONSE_PROP  THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('3' ,'11' ,'7' ,'4' ,'5' ,'8' ,'6' ,'13' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_12 IN ('1' ,'2' ,'0' ,'9' ,'12' ,'10' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
     IF MISSING( RECENT_CARD_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '3' ,'2' ,'4' ,'5' ,'8' ,'0' ,'1' ,'7' ,'6' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('25' ,'38' ,'13' ,'17' ,'47' ,'03' ,'49' ,'50' ,'43' ,
      '46' ,'16' ,'30' ,'41' ,'08' ,'27' ,'26' ,'21' ,'44' ,'29' ,'39' ,'06' ,
      '32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'42' ,'01' ,'37' ,'48' ,'31' ,'35' ,'40' ,'28' ,'14' ,
      '11' ,'45' ,'20' ,'07' ,'34' ,'23' ,'09' ,'02' ,'15' ,'18' ,'36' ,'24' ,
      '12' ,'19' ,'51' ,'05' ,'33' ,'22' ,'25' ,'38' ,'13' ,'17' ,'47' ,'03' ,
      '49' ,'50' ,'43' ,'46' ,'16' ,'30' ,'41' ,'08' ,'27' ,'26' ,'21' ,'44' ,
      '29' ,'39' ,'06' ,'32' ,'52' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF PER_CAPITA_INCOME  <              12970.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('2' ,'3' ,'4' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('1' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0051736885;
      END;
    END;
  END;

********** LEAF    69  NODE   531 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ,'1' ,'7' ,'6' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENT_CARD_RESPONSE_COUNT
         ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '3' ,'2' ,'4' ,'5' ,'8' ,'0' ,'1' ,'7' ,'6' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_CARD_RESPONSE_PROP ) THEN DO;
        IF RECENT_CARD_RESPONSE_PROP  <               0.1745 THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ,'2' ,'0' ,'9' ,'12' ,'10' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_12 IN ('3' ,'11' ,'7' ,'4' ,'5' ,'8' ,'6' ,'13' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'53' ,'37' ,'38' ,'48' ,'14' ,'49' ,'50' ,'43' ,
      '45' ,'30' ,'23' ,'09' ,'02' ,'41' ,'15' ,'36' ,'24' ,'08' ,'12' ,'26' ,
      '21' ,'51' ,'05' ,'33' ,'22' ,'06' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'53' ,'37' ,'38' ,'48' ,'14' ,'49' ,'50' ,'43' ,'45' ,'30' ,'23' ,
      '09' ,'02' ,'41' ,'15' ,'36' ,'24' ,'08' ,'12' ,'26' ,'21' ,'51' ,'05' ,
      '33' ,'22' ,'06' ,'10' ,'04' ,'42' ,'25' ,'01' ,'31' ,'35' ,'40' ,'13' ,
      '28' ,'17' ,'11' ,'47' ,'03' ,'46' ,'20' ,'16' ,'07' ,'34' ,'18' ,'19' ,
      '27' ,'44' ,'29' ,'39' ,'32' ,'52' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF MEDIAN_HOUSEHOLD_INCOME  <                291.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF PER_CAPITA_INCOME  <                12002 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'53' ,'37' ,'38' ,'48' ,'14' ,'49' ,'50' ,'43' ,'45' ,'30' ,
        '23' ,'09' ,'02' ,'41' ,'15' ,'36' ,'24' ,'08' ,'12' ,'26' ,'21' ,
        '51' ,'05' ,'33' ,'22' ,'06' ,'10' ,'04' ,'42' ,'25' ,'01' ,'31' ,
        '35' ,'40' ,'13' ,'28' ,'17' ,'11' ,'47' ,'03' ,'46' ,'20' ,'16' ,
        '07' ,'34' ,'18' ,'19' ,'27' ,'44' ,'29' ,'39' ,'32' ,'52' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0154100586;
      END;
    END;
  END;

********** LEAF    70  NODE   532 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('0' ,'1' ,'7' ,'6' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(RECENT_CARD_RESPONSE_COUNT
         ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '3' ,'2' ,'4' ,'5' ,'8' ,'0' ,'1' ,'7' ,'6' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_CARD_RESPONSE_PROP ) THEN DO;
        IF RECENT_CARD_RESPONSE_PROP  <               0.1745 THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ,'2' ,'0' ,'9' ,'12' ,'10' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_12 IN ('3' ,'11' ,'7' ,'4' ,'5' ,'8' ,'6' ,'13' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'42' ,'25' ,'01' ,'31' ,'35' ,'40' ,'13' ,'28' ,
      '17' ,'11' ,'47' ,'03' ,'46' ,'20' ,'16' ,'07' ,'34' ,'18' ,'19' ,'27' ,
      '44' ,'29' ,'39' ,'32' ,'52' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'53' ,'37' ,'38' ,'48' ,'14' ,'49' ,'50' ,'43' ,'45' ,'30' ,'23' ,
      '09' ,'02' ,'41' ,'15' ,'36' ,'24' ,'08' ,'12' ,'26' ,'21' ,'51' ,'05' ,
      '33' ,'22' ,'06' ,'10' ,'04' ,'42' ,'25' ,'01' ,'31' ,'35' ,'40' ,'13' ,
      '28' ,'17' ,'11' ,'47' ,'03' ,'46' ,'20' ,'16' ,'07' ,'34' ,'18' ,'19' ,
      '27' ,'44' ,'29' ,'39' ,'32' ,'52' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF                291.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF                12002 <= PER_CAPITA_INCOME  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.002272658;
      END;
    END;
  END;

********** LEAF    71  NODE   536 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,
    '40' ,'13' ,'28' ,'17' ,'11' ,'47' ,'03' ,'49' ,'20' ,'16' ,'34' ,'23' ,
    '09' ,'41' ,'15' ,'18' ,'36' ,'24' ,'26' ,'21' ,'51' ,'44' ,'39' ,'33' ,
    '22' ,'06' ,'52' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,
    '17' ,'11' ,'47' ,'03' ,'49' ,'20' ,'16' ,'34' ,'23' ,'09' ,'41' ,'15' ,
    '18' ,'36' ,'24' ,'26' ,'21' ,'51' ,'44' ,'39' ,'33' ,'22' ,'06' ,'52' ,
    '42' ,'35' ,'14' ,'50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'02' ,'08' ,'12' ,
    '19' ,'27' ,'29' ,'05' ,'32' ,'10' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
      _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('R' ,'S' ,'C' ,'T' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_4 IN ('U' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
        IF               7543.5 <= PER_CAPITA_INCOME  THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,
      '17' ,'11' ,'47' ,'03' ,'49' ,'20' ,'16' ,'34' ,'23' ,'09' ,'41' ,'15' ,
      '18' ,'36' ,'24' ,'26' ,'21' ,'51' ,'44' ,'39' ,'33' ,'22' ,'06' ,'52' ,
      '42' ,'35' ,'14' ,'50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'02' ,'08' ,'12' ,
      '19' ,'27' ,'29' ,'05' ,'32' ,'10' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(FILE_CARD_GIFT ) AND 
      FILE_CARD_GIFT  <                  3.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(FILE_CARD_GIFT ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
          IF LIFETIME_GIFT_COUNT  <                  7.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_CARD_PROM ) THEN DO;
          IF LIFETIME_CARD_PROM  <                 16.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0037905166;
      END;
    END;
  END;

********** LEAF    72  NODE   540 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,
    '40' ,'13' ,'28' ,'17' ,'11' ,'47' ,'03' ,'49' ,'20' ,'16' ,'34' ,'23' ,
    '09' ,'41' ,'15' ,'18' ,'36' ,'24' ,'26' ,'21' ,'51' ,'44' ,'39' ,'33' ,
    '22' ,'06' ,'52' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,
    '17' ,'11' ,'47' ,'03' ,'49' ,'20' ,'16' ,'34' ,'23' ,'09' ,'41' ,'15' ,
    '18' ,'36' ,'24' ,'26' ,'21' ,'51' ,'44' ,'39' ,'33' ,'22' ,'06' ,'52' ,
    '42' ,'35' ,'14' ,'50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'02' ,'08' ,'12' ,
    '19' ,'27' ,'29' ,'05' ,'32' ,'10' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
      _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('R' ,'S' ,'C' ,'T' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_4 IN ('U' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
        IF               7543.5 <= PER_CAPITA_INCOME  THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,
      '17' ,'11' ,'47' ,'03' ,'49' ,'20' ,'16' ,'34' ,'23' ,'09' ,'41' ,'15' ,
      '18' ,'36' ,'24' ,'26' ,'21' ,'51' ,'44' ,'39' ,'33' ,'22' ,'06' ,'52' ,
      '42' ,'35' ,'14' ,'50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'02' ,'08' ,'12' ,
      '19' ,'27' ,'29' ,'05' ,'32' ,'10' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(FILE_CARD_GIFT ) AND 
                       3.5 <= FILE_CARD_GIFT  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(FILE_CARD_GIFT ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
          IF                  7.5 <= LIFETIME_GIFT_COUNT  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_CARD_PROM ) THEN DO;
          IF                 16.5 <= LIFETIME_CARD_PROM  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FILE_CARD_GIFT  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(RECENT_RESPONSE_PROP ) AND 
        RECENT_RESPONSE_PROP  <                0.185 THEN DO;
         _BRANCH_ =    1; 
        END; 
       IF MISSING(RECENT_RESPONSE_PROP ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
          _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
           %DMNORMIP( _ARBFMT_12);
            IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_12 IN ('9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,
            '10' ,'13' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(FREQUENCY_STATUS_97NK ) THEN DO;
          _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
           %DMNORMIP( _ARBFMT_12);
            IF _ARBFMT_12 IN ('1' ,'2' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_12 IN ('3' ,'4' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( RECENT_RESPONSE_PROP  ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.003303095;
        END;
      END;
    END;
  END;

********** LEAF    73  NODE   541 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,
    '40' ,'13' ,'28' ,'17' ,'11' ,'47' ,'03' ,'49' ,'20' ,'16' ,'34' ,'23' ,
    '09' ,'41' ,'15' ,'18' ,'36' ,'24' ,'26' ,'21' ,'51' ,'44' ,'39' ,'33' ,
    '22' ,'06' ,'52' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,
    '17' ,'11' ,'47' ,'03' ,'49' ,'20' ,'16' ,'34' ,'23' ,'09' ,'41' ,'15' ,
    '18' ,'36' ,'24' ,'26' ,'21' ,'51' ,'44' ,'39' ,'33' ,'22' ,'06' ,'52' ,
    '42' ,'35' ,'14' ,'50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'02' ,'08' ,'12' ,
    '19' ,'27' ,'29' ,'05' ,'32' ,'10' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
      _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('R' ,'S' ,'C' ,'T' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_4 IN ('U' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
        IF               7543.5 <= PER_CAPITA_INCOME  THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,
      '17' ,'11' ,'47' ,'03' ,'49' ,'20' ,'16' ,'34' ,'23' ,'09' ,'41' ,'15' ,
      '18' ,'36' ,'24' ,'26' ,'21' ,'51' ,'44' ,'39' ,'33' ,'22' ,'06' ,'52' ,
      '42' ,'35' ,'14' ,'50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'02' ,'08' ,'12' ,
      '19' ,'27' ,'29' ,'05' ,'32' ,'10' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(FILE_CARD_GIFT ) AND 
                       3.5 <= FILE_CARD_GIFT  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(FILE_CARD_GIFT ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
          IF                  7.5 <= LIFETIME_GIFT_COUNT  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_CARD_PROM ) THEN DO;
          IF                 16.5 <= LIFETIME_CARD_PROM  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( FILE_CARD_GIFT  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(RECENT_RESPONSE_PROP ) AND 
                       0.185 <= RECENT_RESPONSE_PROP  THEN DO;
         _BRANCH_ =    2; 
        END; 
       IF MISSING(RECENT_RESPONSE_PROP ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
          _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
           %DMNORMIP( _ARBFMT_12);
            IF _ARBFMT_12 IN ('9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,'10' ,
            '13' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(FREQUENCY_STATUS_97NK ) THEN DO;
          _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
           %DMNORMIP( _ARBFMT_12);
            IF _ARBFMT_12 IN ('3' ,'4' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_12 IN ('1' ,'2' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.017606952;
        END;
      END;
    END;
  END;

********** LEAF    74  NODE   538 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('42' ,'35' ,'14' ,'50' ,'43' ,'46' ,'45' ,'30' ,'07' ,
    '02' ,'08' ,'12' ,'19' ,'27' ,'29' ,'05' ,'32' ,'10' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,
    '17' ,'11' ,'47' ,'03' ,'49' ,'20' ,'16' ,'34' ,'23' ,'09' ,'41' ,'15' ,
    '18' ,'36' ,'24' ,'26' ,'21' ,'51' ,'44' ,'39' ,'33' ,'22' ,'06' ,'52' ,
    '42' ,'35' ,'14' ,'50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'02' ,'08' ,'12' ,
    '19' ,'27' ,'29' ,'05' ,'32' ,'10' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
      _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('U' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_4 IN ('R' ,'S' ,'C' ,'T' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
        IF PER_CAPITA_INCOME  <               7543.5 THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( INCOME_GROUP , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('5' ,'3' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(INCOME_GROUP ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_12 NOTIN (
      '5' ,'3' ,'4' ,'1' ,'2' ,'6' ,'7' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(NUMBER_PROM_12 ) THEN DO;
          IF                   39 <= NUMBER_PROM_12  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF               1244.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( INCOME_GROUP  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_12 NOTIN (
        '5' ,'3' ,'4' ,'1' ,'2' ,'6' ,'7' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0021711746;
      END;
    END;
  END;

********** LEAF    75  NODE   539 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('42' ,'35' ,'14' ,'50' ,'43' ,'46' ,'45' ,'30' ,'07' ,
    '02' ,'08' ,'12' ,'19' ,'27' ,'29' ,'05' ,'32' ,'10' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,
    '17' ,'11' ,'47' ,'03' ,'49' ,'20' ,'16' ,'34' ,'23' ,'09' ,'41' ,'15' ,
    '18' ,'36' ,'24' ,'26' ,'21' ,'51' ,'44' ,'39' ,'33' ,'22' ,'06' ,'52' ,
    '42' ,'35' ,'14' ,'50' ,'43' ,'46' ,'45' ,'30' ,'07' ,'02' ,'08' ,'12' ,
    '19' ,'27' ,'29' ,'05' ,'32' ,'10' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
      _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('U' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_4 IN ('R' ,'S' ,'C' ,'T' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
        IF PER_CAPITA_INCOME  <               7543.5 THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( INCOME_GROUP , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('4' ,'1' ,'2' ,'6' ,'7' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(INCOME_GROUP ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_12 NOTIN (
      '5' ,'3' ,'4' ,'1' ,'2' ,'6' ,'7' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(NUMBER_PROM_12 ) THEN DO;
          IF NUMBER_PROM_12  <                   39 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF MEDIAN_HOUSEHOLD_INCOME  <               1244.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0112917096;
      END;
    END;
  END;

********** LEAF    76  NODE   545 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
    FILE_AVG_GIFT  <                10.07 THEN DO;
     _BRANCH_ =    1; 
    END; 
   IF MISSING(FILE_AVG_GIFT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_AVG_GIFT_AMT ) THEN DO;
        IF LIFETIME_AVG_GIFT_AMT  <                10.07 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
        IF RECENT_AVG_GIFT_AMT  <                12.39 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'13' ,'17' ,
      '50' ,'43' ,'45' ,'16' ,'07' ,'34' ,'02' ,'15' ,'18' ,'08' ,'12' ,'19' ,
      '21' ,'44' ,'29' ,'05' ,'22' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'13' ,'17' ,'50' ,'43' ,'45' ,
      '16' ,'07' ,'34' ,'02' ,'15' ,'18' ,'08' ,'12' ,'19' ,'21' ,'44' ,'29' ,
      '05' ,'22' ,'32' ,'52' ,'10' ,'04' ,'53' ,'37' ,'35' ,'40' ,'28' ,'14' ,
      '11' ,'47' ,'03' ,'49' ,'46' ,'20' ,'30' ,'23' ,'09' ,'41' ,'36' ,'24' ,
      '27' ,'26' ,'51' ,'39' ,'33' ,'06' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
        _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('U' ,'R' ,'S' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_4 IN ('C' ,'T' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE2 ) THEN DO;
          IF PCT_ATTRIBUTE2  <                 21.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0058537402;
      END;
    END;
  END;

********** LEAF    77  NODE   546 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
    FILE_AVG_GIFT  <                10.07 THEN DO;
     _BRANCH_ =    1; 
    END; 
   IF MISSING(FILE_AVG_GIFT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_AVG_GIFT_AMT ) THEN DO;
        IF LIFETIME_AVG_GIFT_AMT  <                10.07 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
        IF RECENT_AVG_GIFT_AMT  <                12.39 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'53' ,'37' ,'35' ,'40' ,'28' ,'14' ,'11' ,'47' ,
      '03' ,'49' ,'46' ,'20' ,'30' ,'23' ,'09' ,'41' ,'36' ,'24' ,'27' ,'26' ,
      '51' ,'39' ,'33' ,'06' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'13' ,'17' ,'50' ,'43' ,'45' ,
      '16' ,'07' ,'34' ,'02' ,'15' ,'18' ,'08' ,'12' ,'19' ,'21' ,'44' ,'29' ,
      '05' ,'22' ,'32' ,'52' ,'10' ,'04' ,'53' ,'37' ,'35' ,'40' ,'28' ,'14' ,
      '11' ,'47' ,'03' ,'49' ,'46' ,'20' ,'30' ,'23' ,'09' ,'41' ,'36' ,'24' ,
      '27' ,'26' ,'51' ,'39' ,'33' ,'06' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
        _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('C' ,'T' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('U' ,'R' ,'S' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE2 ) THEN DO;
          IF                 21.5 <= PCT_ATTRIBUTE2  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'13' ,'17' ,'50' ,'43' ,
        '45' ,'16' ,'07' ,'34' ,'02' ,'15' ,'18' ,'08' ,'12' ,'19' ,'21' ,
        '44' ,'29' ,'05' ,'22' ,'32' ,'52' ,'10' ,'04' ,'53' ,'37' ,'35' ,
        '40' ,'28' ,'14' ,'11' ,'47' ,'03' ,'49' ,'46' ,'20' ,'30' ,'23' ,
        '09' ,'41' ,'36' ,'24' ,'27' ,'26' ,'51' ,'39' ,'33' ,'06' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.017350283;
      END;
    END;
  END;

********** LEAF    78  NODE   547 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
                   10.07 <= FILE_AVG_GIFT  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(FILE_AVG_GIFT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_AVG_GIFT_AMT ) THEN DO;
        IF                10.07 <= LIFETIME_AVG_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
        IF                12.39 <= RECENT_AVG_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FILE_AVG_GIFT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'42' ,'48' ,'28' ,'17' ,'11' ,'49' ,'45' ,'20' ,
      '16' ,'30' ,'23' ,'41' ,'18' ,'36' ,'08' ,'19' ,'26' ,'44' ,'29' ,'39' ,
      '33' ,'06' ,'32' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'48' ,'28' ,'17' ,'11' ,'49' ,'45' ,'20' ,'16' ,'30' ,'23' ,
      '41' ,'18' ,'36' ,'08' ,'19' ,'26' ,'44' ,'29' ,'39' ,'33' ,'06' ,'32' ,
      '52' ,'10' ,'04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'31' ,'35' ,'40' ,'13' ,
      '14' ,'47' ,'03' ,'50' ,'43' ,'46' ,'07' ,'34' ,'09' ,'02' ,'15' ,'24' ,
      '12' ,'27' ,'21' ,'51' ,'05' ,'22' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('2' ,'3' ,'4' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_4 IN ('1' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF PER_CAPITA_INCOME  <              15200.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0162784387;
      END;
    END;
  END;

********** LEAF    79  NODE   548 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(FILE_AVG_GIFT ) AND 
                   10.07 <= FILE_AVG_GIFT  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(FILE_AVG_GIFT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_AVG_GIFT_AMT ) THEN DO;
        IF                10.07 <= LIFETIME_AVG_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
        IF                12.39 <= RECENT_AVG_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( FILE_AVG_GIFT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'31' ,'35' ,'40' ,
      '13' ,'14' ,'47' ,'03' ,'50' ,'43' ,'46' ,'07' ,'34' ,'09' ,'02' ,'15' ,
      '24' ,'12' ,'27' ,'21' ,'51' ,'05' ,'22' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'48' ,'28' ,'17' ,'11' ,'49' ,'45' ,'20' ,'16' ,'30' ,'23' ,
      '41' ,'18' ,'36' ,'08' ,'19' ,'26' ,'44' ,'29' ,'39' ,'33' ,'06' ,'32' ,
      '52' ,'10' ,'04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'31' ,'35' ,'40' ,'13' ,
      '14' ,'47' ,'03' ,'50' ,'43' ,'46' ,'07' ,'34' ,'09' ,'02' ,'15' ,'24' ,
      '12' ,'27' ,'21' ,'51' ,'05' ,'22' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('1' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('2' ,'3' ,'4' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF              15200.5 <= PER_CAPITA_INCOME  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'42' ,'48' ,'28' ,'17' ,'11' ,'49' ,'45' ,'20' ,'16' ,'30' ,
        '23' ,'41' ,'18' ,'36' ,'08' ,'19' ,'26' ,'44' ,'29' ,'39' ,'33' ,
        '06' ,'32' ,'52' ,'10' ,'04' ,'53' ,'25' ,'01' ,'37' ,'38' ,'31' ,
        '35' ,'40' ,'13' ,'14' ,'47' ,'03' ,'50' ,'43' ,'46' ,'07' ,'34' ,
        '09' ,'02' ,'15' ,'24' ,'12' ,'27' ,'21' ,'51' ,'05' ,'22' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.002292856;
      END;
    END;
  END;

********** LEAF    80  NODE   552 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'42' ,'25' ,'31' ,'47' ,'50' ,'43' ,'45' ,'20' ,
    '30' ,'23' ,'41' ,'15' ,'18' ,'27' ,'21' ,'51' ,'44' ,'29' ,'05' ,'33' ,
    '32' ,'10' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'42' ,'25' ,'31' ,'47' ,'50' ,'43' ,'45' ,'20' ,'30' ,'23' ,'41' ,
    '15' ,'18' ,'27' ,'21' ,'51' ,'44' ,'29' ,'05' ,'33' ,'32' ,'10' ,'04' ,
    '53' ,'01' ,'37' ,'38' ,'48' ,'35' ,'40' ,'13' ,'28' ,'14' ,'17' ,'11' ,
    '03' ,'49' ,'46' ,'16' ,'07' ,'34' ,'09' ,'02' ,'36' ,'24' ,'08' ,'12' ,
    '19' ,'26' ,'39' ,'22' ,'06' ,'52' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
      _ARBFMT_4 = PUT( REP_SES , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('3' ,'4' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_4 IN ('1' ,'2' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
      _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('R' ,'C' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_4 IN ('U' ,'S' ,'T' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(MONTHS_SINCE_LAST_GIFT ) AND 
      MONTHS_SINCE_LAST_GIFT  <                 17.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(MONTHS_SINCE_LAST_GIFT ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(MONTHS_SINCE_LAST_PROM_RESP ) THEN DO;
          IF MONTHS_SINCE_LAST_PROM_RESP  <                 17.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
          IF                0.195 <= RECENT_RESPONSE_PROP  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000574849;
      END;
    END;
  END;

********** LEAF    81  NODE   553 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'42' ,'25' ,'31' ,'47' ,'50' ,'43' ,'45' ,'20' ,
    '30' ,'23' ,'41' ,'15' ,'18' ,'27' ,'21' ,'51' ,'44' ,'29' ,'05' ,'33' ,
    '32' ,'10' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'42' ,'25' ,'31' ,'47' ,'50' ,'43' ,'45' ,'20' ,'30' ,'23' ,'41' ,
    '15' ,'18' ,'27' ,'21' ,'51' ,'44' ,'29' ,'05' ,'33' ,'32' ,'10' ,'04' ,
    '53' ,'01' ,'37' ,'38' ,'48' ,'35' ,'40' ,'13' ,'28' ,'14' ,'17' ,'11' ,
    '03' ,'49' ,'46' ,'16' ,'07' ,'34' ,'09' ,'02' ,'36' ,'24' ,'08' ,'12' ,
    '19' ,'26' ,'39' ,'22' ,'06' ,'52' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
      _ARBFMT_4 = PUT( REP_SES , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('3' ,'4' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_4 IN ('1' ,'2' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
      _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('R' ,'C' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_4 IN ('U' ,'S' ,'T' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(MONTHS_SINCE_LAST_GIFT ) AND 
                      17.5 <= MONTHS_SINCE_LAST_GIFT  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(MONTHS_SINCE_LAST_GIFT ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(MONTHS_SINCE_LAST_PROM_RESP ) THEN DO;
          IF                 17.5 <= MONTHS_SINCE_LAST_PROM_RESP  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
          IF RECENT_RESPONSE_PROP  <                0.195 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( MONTHS_SINCE_LAST_GIFT  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0162774202;
      END;
    END;
  END;

********** LEAF    82  NODE   554 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'53' ,'01' ,'37' ,'38' ,'48' ,'35' ,'40' ,'13' ,
    '28' ,'14' ,'17' ,'11' ,'03' ,'49' ,'46' ,'16' ,'07' ,'34' ,'09' ,'02' ,
    '36' ,'24' ,'08' ,'12' ,'19' ,'26' ,'39' ,'22' ,'06' ,'52' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'42' ,'25' ,'31' ,'47' ,'50' ,'43' ,'45' ,'20' ,'30' ,'23' ,'41' ,
    '15' ,'18' ,'27' ,'21' ,'51' ,'44' ,'29' ,'05' ,'33' ,'32' ,'10' ,'04' ,
    '53' ,'01' ,'37' ,'38' ,'48' ,'35' ,'40' ,'13' ,'28' ,'14' ,'17' ,'11' ,
    '03' ,'49' ,'46' ,'16' ,'07' ,'34' ,'09' ,'02' ,'36' ,'24' ,'08' ,'12' ,
    '19' ,'26' ,'39' ,'22' ,'06' ,'52' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
      _ARBFMT_4 = PUT( REP_SES , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('1' ,'2' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_4 IN ('3' ,'4' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
      _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('U' ,'S' ,'T' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_4 IN ('R' ,'C' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'25' ,'31' ,'47' ,'50' ,'43' ,'45' ,'20' ,'30' ,'23' ,'41' ,
      '15' ,'18' ,'27' ,'21' ,'51' ,'44' ,'29' ,'05' ,'33' ,'32' ,'10' ,'04' ,
      '53' ,'01' ,'37' ,'38' ,'48' ,'35' ,'40' ,'13' ,'28' ,'14' ,'17' ,'11' ,
      '03' ,'49' ,'46' ,'16' ,'07' ,'34' ,'09' ,'02' ,'36' ,'24' ,'08' ,'12' ,
      '19' ,'26' ,'39' ,'22' ,'06' ,'52' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LIFETIME_MAX_GIFT_AMT ) AND 
      LIFETIME_MAX_GIFT_AMT  <               15.875 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(LIFETIME_MAX_GIFT_AMT ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(LAST_GIFT_AMT ) THEN DO;
          IF LAST_GIFT_AMT  <               15.875 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
          IF RECENT_AVG_GIFT_AMT  <               15.065 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.013712443;
      END;
    END;
  END;

********** LEAF    83  NODE   555 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'53' ,'01' ,'37' ,'38' ,'48' ,'35' ,'40' ,'13' ,
    '28' ,'14' ,'17' ,'11' ,'03' ,'49' ,'46' ,'16' ,'07' ,'34' ,'09' ,'02' ,
    '36' ,'24' ,'08' ,'12' ,'19' ,'26' ,'39' ,'22' ,'06' ,'52' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'42' ,'25' ,'31' ,'47' ,'50' ,'43' ,'45' ,'20' ,'30' ,'23' ,'41' ,
    '15' ,'18' ,'27' ,'21' ,'51' ,'44' ,'29' ,'05' ,'33' ,'32' ,'10' ,'04' ,
    '53' ,'01' ,'37' ,'38' ,'48' ,'35' ,'40' ,'13' ,'28' ,'14' ,'17' ,'11' ,
    '03' ,'49' ,'46' ,'16' ,'07' ,'34' ,'09' ,'02' ,'36' ,'24' ,'08' ,'12' ,
    '19' ,'26' ,'39' ,'22' ,'06' ,'52' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
      _ARBFMT_4 = PUT( REP_SES , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('1' ,'2' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_4 IN ('3' ,'4' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
      _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('U' ,'S' ,'T' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_4 IN ('R' ,'C' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'25' ,'31' ,'47' ,'50' ,'43' ,'45' ,'20' ,'30' ,'23' ,'41' ,
      '15' ,'18' ,'27' ,'21' ,'51' ,'44' ,'29' ,'05' ,'33' ,'32' ,'10' ,'04' ,
      '53' ,'01' ,'37' ,'38' ,'48' ,'35' ,'40' ,'13' ,'28' ,'14' ,'17' ,'11' ,
      '03' ,'49' ,'46' ,'16' ,'07' ,'34' ,'09' ,'02' ,'36' ,'24' ,'08' ,'12' ,
      '19' ,'26' ,'39' ,'22' ,'06' ,'52' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(LIFETIME_MAX_GIFT_AMT ) AND 
                    15.875 <= LIFETIME_MAX_GIFT_AMT  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(LIFETIME_MAX_GIFT_AMT ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(LAST_GIFT_AMT ) THEN DO;
          IF               15.875 <= LAST_GIFT_AMT  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
          IF               15.065 <= RECENT_AVG_GIFT_AMT  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( LIFETIME_MAX_GIFT_AMT  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0025006286;
      END;
    END;
  END;

********** LEAF    84  NODE   559 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'37' ,'40' ,'13' ,'11' ,'47' ,'49' ,'43' ,'45' ,
    '16' ,'07' ,'34' ,'23' ,'09' ,'02' ,'36' ,'08' ,'27' ,'26' ,'44' ,'39' ,
    '33' ,'22' ,'06' ,'32' ,'10' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'37' ,'40' ,'13' ,'11' ,'47' ,'49' ,'43' ,'45' ,'16' ,'07' ,'34' ,
    '23' ,'09' ,'02' ,'36' ,'08' ,'27' ,'26' ,'44' ,'39' ,'33' ,'22' ,'06' ,
    '32' ,'10' ,'04' ,'53' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'35' ,'28' ,
    '14' ,'17' ,'03' ,'50' ,'46' ,'20' ,'30' ,'41' ,'15' ,'18' ,'24' ,'12' ,
    '19' ,'21' ,'51' ,'29' ,'05' ,'52' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
      _ARBFMT_4 = PUT( REP_SES , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('2' ,'4' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_4 IN ('1' ,'3' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
      _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('U' ,'R' ,'T' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_4 IN ('S' ,'C' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'37' ,'40' ,'13' ,'11' ,'47' ,'49' ,'43' ,'45' ,'16' ,'07' ,'34' ,
      '23' ,'09' ,'02' ,'36' ,'08' ,'27' ,'26' ,'44' ,'39' ,'33' ,'22' ,'06' ,
      '32' ,'10' ,'04' ,'53' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'35' ,'28' ,
      '14' ,'17' ,'03' ,'50' ,'46' ,'20' ,'30' ,'41' ,'15' ,'18' ,'24' ,'12' ,
      '19' ,'21' ,'51' ,'29' ,'05' ,'52' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(MEDIAN_HOME_VALUE ) AND 
      MEDIAN_HOME_VALUE  <                  802 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(MEDIAN_HOME_VALUE ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF PER_CAPITA_INCOME  <              15516.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF MEDIAN_HOUSEHOLD_INCOME  <                364.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( MEDIAN_HOME_VALUE  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0119567971;
      END;
    END;
  END;

********** LEAF    85  NODE   560 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('.' ,'37' ,'40' ,'13' ,'11' ,'47' ,'49' ,'43' ,'45' ,
    '16' ,'07' ,'34' ,'23' ,'09' ,'02' ,'36' ,'08' ,'27' ,'26' ,'44' ,'39' ,
    '33' ,'22' ,'06' ,'32' ,'10' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'37' ,'40' ,'13' ,'11' ,'47' ,'49' ,'43' ,'45' ,'16' ,'07' ,'34' ,
    '23' ,'09' ,'02' ,'36' ,'08' ,'27' ,'26' ,'44' ,'39' ,'33' ,'22' ,'06' ,
    '32' ,'10' ,'04' ,'53' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'35' ,'28' ,
    '14' ,'17' ,'03' ,'50' ,'46' ,'20' ,'30' ,'41' ,'15' ,'18' ,'24' ,'12' ,
    '19' ,'21' ,'51' ,'29' ,'05' ,'52' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
      _ARBFMT_4 = PUT( REP_SES , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('2' ,'4' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_4 IN ('1' ,'3' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
      _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('U' ,'R' ,'T' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_4 IN ('S' ,'C' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_2 NOTIN (
      '.' ,'37' ,'40' ,'13' ,'11' ,'47' ,'49' ,'43' ,'45' ,'16' ,'07' ,'34' ,
      '23' ,'09' ,'02' ,'36' ,'08' ,'27' ,'26' ,'44' ,'39' ,'33' ,'22' ,'06' ,
      '32' ,'10' ,'04' ,'53' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'35' ,'28' ,
      '14' ,'17' ,'03' ,'50' ,'46' ,'20' ,'30' ,'41' ,'15' ,'18' ,'24' ,'12' ,
      '19' ,'21' ,'51' ,'29' ,'05' ,'52' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(MEDIAN_HOME_VALUE ) AND 
                       802 <= MEDIAN_HOME_VALUE  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(MEDIAN_HOME_VALUE ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF              15516.5 <= PER_CAPITA_INCOME  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
          IF                364.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.001185951;
      END;
    END;
  END;

********** LEAF    86  NODE   561 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'53' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'35' ,
    '28' ,'14' ,'17' ,'03' ,'50' ,'46' ,'20' ,'30' ,'41' ,'15' ,'18' ,'24' ,
    '12' ,'19' ,'21' ,'51' ,'29' ,'05' ,'52' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'37' ,'40' ,'13' ,'11' ,'47' ,'49' ,'43' ,'45' ,'16' ,'07' ,'34' ,
    '23' ,'09' ,'02' ,'36' ,'08' ,'27' ,'26' ,'44' ,'39' ,'33' ,'22' ,'06' ,
    '32' ,'10' ,'04' ,'53' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'35' ,'28' ,
    '14' ,'17' ,'03' ,'50' ,'46' ,'20' ,'30' ,'41' ,'15' ,'18' ,'24' ,'12' ,
    '19' ,'21' ,'51' ,'29' ,'05' ,'52' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
      _ARBFMT_4 = PUT( REP_SES , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('1' ,'3' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_4 IN ('2' ,'4' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
      _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('S' ,'C' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_4 IN ('U' ,'R' ,'T' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ,'3' ,'0' ,'11' ,'7' ,'4' ,'12' ,'8' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_12 NOTIN (
      '1' ,'3' ,'0' ,'11' ,'7' ,'4' ,'12' ,'8' ,'2' ,'9' ,'5' ,'6' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
          IF               0.1345 <= RECENT_RESPONSE_PROP  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_CARD_RESPONSE_COUNT ) THEN DO;
        _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
         %DMNORMIP( _ARBFMT_12);
          IF _ARBFMT_12 IN ('0' ,'1' ,'3' ,'2' ,'7' ,'5' ,'6' ,'8' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_12 IN ('4' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
       %DMNORMIP( _ARBFMT_12);
       IF MISSING( RECENT_RESPONSE_COUNT  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_12 NOTIN (
        '1' ,'3' ,'0' ,'11' ,'7' ,'4' ,'12' ,'8' ,'2' ,'9' ,'5' ,'6' ,'10' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.000991738;
      END;
    END;
  END;

********** LEAF    87  NODE   562 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
   %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('04' ,'53' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'35' ,
    '28' ,'14' ,'17' ,'03' ,'50' ,'46' ,'20' ,'30' ,'41' ,'15' ,'18' ,'24' ,
    '12' ,'19' ,'21' ,'51' ,'29' ,'05' ,'52' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_2 NOTIN (
    '.' ,'37' ,'40' ,'13' ,'11' ,'47' ,'49' ,'43' ,'45' ,'16' ,'07' ,'34' ,
    '23' ,'09' ,'02' ,'36' ,'08' ,'27' ,'26' ,'44' ,'39' ,'33' ,'22' ,'06' ,
    '32' ,'10' ,'04' ,'53' ,'42' ,'25' ,'01' ,'38' ,'48' ,'31' ,'35' ,'28' ,
    '14' ,'17' ,'03' ,'50' ,'46' ,'20' ,'30' ,'41' ,'15' ,'18' ,'24' ,'12' ,
    '19' ,'21' ,'51' ,'29' ,'05' ,'52' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
      _ARBFMT_4 = PUT( REP_SES , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('1' ,'3' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_4 IN ('2' ,'4' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
      _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('S' ,'C' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_4 IN ('U' ,'R' ,'T' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
     %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('2' ,'9' ,'5' ,'6' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(RECENT_RESPONSE_COUNT ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_12 NOTIN (
      '1' ,'3' ,'0' ,'11' ,'7' ,'4' ,'12' ,'8' ,'2' ,'9' ,'5' ,'6' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
          IF RECENT_RESPONSE_PROP  <               0.1345 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_CARD_RESPONSE_COUNT ) THEN DO;
        _ARBFMT_12 = PUT( RECENT_CARD_RESPONSE_COUNT , BEST12.);
         %DMNORMIP( _ARBFMT_12);
          IF _ARBFMT_12 IN ('4' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_12 IN ('0' ,'1' ,'3' ,'2' ,'7' ,'5' ,'6' ,'8' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.014053484;
      END;
    END;
  END;

********** LEAF    88  NODE   566 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( WEALTH_RATING , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('5' ,'2' ,'1' ,'3' ,'9' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(WEALTH_RATING ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '5' ,'2' ,'1' ,'3' ,'9' ,'4' ,'7' ,'6' ,'8' ,'0' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
      _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
       %DMNORMIP( _ARBFMT_2);
        IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'38' ,'48' ,'35' ,'13' ,'28' ,'14' ,
        '17' ,'47' ,'49' ,'50' ,'43' ,'46' ,'45' ,'30' ,'09' ,'41' ,'36' ,
        '24' ,'08' ,'21' ,'51' ,'33' ,'32' ,'10' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_2 IN ('42' ,'25' ,'01' ,'37' ,'31' ,'40' ,'11' ,'03' ,
        '20' ,'16' ,'07' ,'34' ,'23' ,'02' ,'15' ,'18' ,'12' ,'19' ,'27' ,
        '26' ,'44' ,'29' ,'05' ,'39' ,'22' ,'06' ,'52' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
        IF MEDIAN_HOUSEHOLD_INCOME  <                306.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( WEALTH_RATING  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '5' ,'2' ,'1' ,'3' ,'9' ,'4' ,'7' ,'6' ,'8' ,'0' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'25' ,'01' ,'38' ,'48' ,'13' ,'28' ,
      '17' ,'46' ,'45' ,'16' ,'34' ,'09' ,'02' ,'18' ,'26' ,'44' ,'05' ,'39' )
       THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'25' ,'01' ,'38' ,'48' ,'13' ,'28' ,'17' ,'46' ,'45' ,
      '16' ,'34' ,'09' ,'02' ,'18' ,'26' ,'44' ,'05' ,'39' ,'42' ,'37' ,'31' ,
      '35' ,'40' ,'14' ,'11' ,'47' ,'03' ,'49' ,'50' ,'43' ,'20' ,'30' ,'07' ,
      '23' ,'41' ,'15' ,'36' ,'24' ,'08' ,'12' ,'19' ,'27' ,'21' ,'51' ,'29' ,
      '33' ,'22' ,'06' ,'32' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE2 ) THEN DO;
          IF PCT_ATTRIBUTE2  <                  0.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE4 ) THEN DO;
          IF PCT_ATTRIBUTE4  <                  2.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'53' ,'25' ,'01' ,'38' ,'48' ,'13' ,'28' ,'17' ,'46' ,
        '45' ,'16' ,'34' ,'09' ,'02' ,'18' ,'26' ,'44' ,'05' ,'39' ,'42' ,
        '37' ,'31' ,'35' ,'40' ,'14' ,'11' ,'47' ,'03' ,'49' ,'50' ,'43' ,
        '20' ,'30' ,'07' ,'23' ,'41' ,'15' ,'36' ,'24' ,'08' ,'12' ,'19' ,
        '27' ,'21' ,'51' ,'29' ,'33' ,'22' ,'06' ,'32' ,'10' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.009343339;
      END;
    END;
  END;

********** LEAF    89  NODE   570 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( WEALTH_RATING , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('5' ,'2' ,'1' ,'3' ,'9' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(WEALTH_RATING ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '5' ,'2' ,'1' ,'3' ,'9' ,'4' ,'7' ,'6' ,'8' ,'0' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
      _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
       %DMNORMIP( _ARBFMT_2);
        IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'38' ,'48' ,'35' ,'13' ,'28' ,'14' ,
        '17' ,'47' ,'49' ,'50' ,'43' ,'46' ,'45' ,'30' ,'09' ,'41' ,'36' ,
        '24' ,'08' ,'21' ,'51' ,'33' ,'32' ,'10' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_2 IN ('42' ,'25' ,'01' ,'37' ,'31' ,'40' ,'11' ,'03' ,
        '20' ,'16' ,'07' ,'34' ,'23' ,'02' ,'15' ,'18' ,'12' ,'19' ,'27' ,
        '26' ,'44' ,'29' ,'05' ,'39' ,'22' ,'06' ,'52' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
        IF MEDIAN_HOUSEHOLD_INCOME  <                306.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( WEALTH_RATING  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '5' ,'2' ,'1' ,'3' ,'9' ,'4' ,'7' ,'6' ,'8' ,'0' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('42' ,'37' ,'31' ,'35' ,'40' ,'14' ,'11' ,'47' ,'03' ,
      '49' ,'50' ,'43' ,'20' ,'30' ,'07' ,'23' ,'41' ,'15' ,'36' ,'24' ,'08' ,
      '12' ,'19' ,'27' ,'21' ,'51' ,'29' ,'33' ,'22' ,'06' ,'32' ,'10' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'25' ,'01' ,'38' ,'48' ,'13' ,'28' ,'17' ,'46' ,'45' ,
      '16' ,'34' ,'09' ,'02' ,'18' ,'26' ,'44' ,'05' ,'39' ,'42' ,'37' ,'31' ,
      '35' ,'40' ,'14' ,'11' ,'47' ,'03' ,'49' ,'50' ,'43' ,'20' ,'30' ,'07' ,
      '23' ,'41' ,'15' ,'36' ,'24' ,'08' ,'12' ,'19' ,'27' ,'21' ,'51' ,'29' ,
      '33' ,'22' ,'06' ,'32' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE2 ) THEN DO;
          IF                  0.5 <= PCT_ATTRIBUTE2  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE4 ) THEN DO;
          IF                  2.5 <= PCT_ATTRIBUTE4  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(PCT_OWNER_OCCUPIED ) AND 
        PCT_OWNER_OCCUPIED  <                 76.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
       IF MISSING(PCT_OWNER_OCCUPIED ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
            IF _ARBFMT_2 IN ('42' ,'31' ,'11' ,'47' ,'03' ,'20' ,'30' ,'07' ,
            '23' ,'41' ,'15' ,'36' ,'08' ,'19' ,'27' ,'21' ,'22' ,'06' ,'32' ,
            '10' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_2 IN ('37' ,'35' ,'40' ,'14' ,'49' ,'50' ,'43' ,
            '24' ,'12' ,'51' ,'29' ,'33' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
            IF MEDIAN_HOUSEHOLD_INCOME  <                263.5 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0148083833;
        END;
      END;
    END;
  END;

********** LEAF    90  NODE   571 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( WEALTH_RATING , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('5' ,'2' ,'1' ,'3' ,'9' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(WEALTH_RATING ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '5' ,'2' ,'1' ,'3' ,'9' ,'4' ,'7' ,'6' ,'8' ,'0' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
      _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
       %DMNORMIP( _ARBFMT_2);
        IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'38' ,'48' ,'35' ,'13' ,'28' ,'14' ,
        '17' ,'47' ,'49' ,'50' ,'43' ,'46' ,'45' ,'30' ,'09' ,'41' ,'36' ,
        '24' ,'08' ,'21' ,'51' ,'33' ,'32' ,'10' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_2 IN ('42' ,'25' ,'01' ,'37' ,'31' ,'40' ,'11' ,'03' ,
        '20' ,'16' ,'07' ,'34' ,'23' ,'02' ,'15' ,'18' ,'12' ,'19' ,'27' ,
        '26' ,'44' ,'29' ,'05' ,'39' ,'22' ,'06' ,'52' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
        IF MEDIAN_HOUSEHOLD_INCOME  <                306.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( WEALTH_RATING  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_12 NOTIN (
      '5' ,'2' ,'1' ,'3' ,'9' ,'4' ,'7' ,'6' ,'8' ,'0' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('42' ,'37' ,'31' ,'35' ,'40' ,'14' ,'11' ,'47' ,'03' ,
      '49' ,'50' ,'43' ,'20' ,'30' ,'07' ,'23' ,'41' ,'15' ,'36' ,'24' ,'08' ,
      '12' ,'19' ,'27' ,'21' ,'51' ,'29' ,'33' ,'22' ,'06' ,'32' ,'10' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'53' ,'25' ,'01' ,'38' ,'48' ,'13' ,'28' ,'17' ,'46' ,'45' ,
      '16' ,'34' ,'09' ,'02' ,'18' ,'26' ,'44' ,'05' ,'39' ,'42' ,'37' ,'31' ,
      '35' ,'40' ,'14' ,'11' ,'47' ,'03' ,'49' ,'50' ,'43' ,'20' ,'30' ,'07' ,
      '23' ,'41' ,'15' ,'36' ,'24' ,'08' ,'12' ,'19' ,'27' ,'21' ,'51' ,'29' ,
      '33' ,'22' ,'06' ,'32' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE2 ) THEN DO;
          IF                  0.5 <= PCT_ATTRIBUTE2  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE4 ) THEN DO;
          IF                  2.5 <= PCT_ATTRIBUTE4  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(PCT_OWNER_OCCUPIED ) AND 
                        76.5 <= PCT_OWNER_OCCUPIED  THEN DO;
         _BRANCH_ =    2; 
        END; 
       IF MISSING(PCT_OWNER_OCCUPIED ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
            IF _ARBFMT_2 IN ('37' ,'35' ,'40' ,'14' ,'49' ,'50' ,'43' ,'24' ,
            '12' ,'51' ,'29' ,'33' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_2 IN ('42' ,'31' ,'11' ,'47' ,'03' ,'20' ,'30' ,
            '07' ,'23' ,'41' ,'15' ,'36' ,'08' ,'19' ,'27' ,'21' ,'22' ,'06' ,
            '32' ,'10' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
            IF                263.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( PCT_OWNER_OCCUPIED  ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0059574384;
        END;
      END;
    END;
  END;

********** LEAF    91  NODE   568 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( WEALTH_RATING , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('4' ,'7' ,'6' ,'8' ,'0' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(WEALTH_RATING ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '5' ,'2' ,'1' ,'3' ,'9' ,'4' ,'7' ,'6' ,'8' ,'0' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
      _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
       %DMNORMIP( _ARBFMT_2);
        IF _ARBFMT_2 IN ('42' ,'25' ,'01' ,'37' ,'31' ,'40' ,'11' ,'03' ,
        '20' ,'16' ,'07' ,'34' ,'23' ,'02' ,'15' ,'18' ,'12' ,'19' ,'27' ,
        '26' ,'44' ,'29' ,'05' ,'39' ,'22' ,'06' ,'52' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'38' ,'48' ,'35' ,'13' ,'28' ,
        '14' ,'17' ,'47' ,'49' ,'50' ,'43' ,'46' ,'45' ,'30' ,'09' ,'41' ,
        '36' ,'24' ,'08' ,'21' ,'51' ,'33' ,'32' ,'10' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
        IF                306.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'42' ,'01' ,'37' ,'31' ,'28' ,'47' ,'03' ,
      '49' ,'50' ,'45' ,'07' ,'23' ,'41' ,'15' ,'18' ,'36' ,'24' ,'19' ,'26' ,
      '39' ,'33' ,'32' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'42' ,'01' ,'37' ,'31' ,'28' ,'47' ,'03' ,'49' ,'50' ,'45' ,
      '07' ,'23' ,'41' ,'15' ,'18' ,'36' ,'24' ,'19' ,'26' ,'39' ,'33' ,'32' ,
      '53' ,'25' ,'38' ,'48' ,'35' ,'40' ,'13' ,'14' ,'17' ,'11' ,'43' ,'46' ,
      '20' ,'16' ,'30' ,'34' ,'09' ,'02' ,'08' ,'12' ,'27' ,'21' ,'51' ,'44' ,
      '29' ,'05' ,'22' ,'06' ,'52' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(PCT_OWNER_OCCUPIED ) THEN DO;
          IF PCT_OWNER_OCCUPIED  <                 46.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE3 ) THEN DO;
          IF PCT_ATTRIBUTE3  <                  4.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.013844126;
      END;
    END;
  END;

********** LEAF    92  NODE   569 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( WEALTH_RATING , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('4' ,'7' ,'6' ,'8' ,'0' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(WEALTH_RATING ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_12 NOTIN (
    '5' ,'2' ,'1' ,'3' ,'9' ,'4' ,'7' ,'6' ,'8' ,'0' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
      _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
       %DMNORMIP( _ARBFMT_2);
        IF _ARBFMT_2 IN ('42' ,'25' ,'01' ,'37' ,'31' ,'40' ,'11' ,'03' ,
        '20' ,'16' ,'07' ,'34' ,'23' ,'02' ,'15' ,'18' ,'12' ,'19' ,'27' ,
        '26' ,'44' ,'29' ,'05' ,'39' ,'22' ,'06' ,'52' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_2 IN ('.' ,'04' ,'53' ,'38' ,'48' ,'35' ,'13' ,'28' ,
        '14' ,'17' ,'47' ,'49' ,'50' ,'43' ,'46' ,'45' ,'30' ,'09' ,'41' ,
        '36' ,'24' ,'08' ,'21' ,'51' ,'33' ,'32' ,'10' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
        IF                306.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('53' ,'25' ,'38' ,'48' ,'35' ,'40' ,'13' ,'14' ,'17' ,
      '11' ,'43' ,'46' ,'20' ,'16' ,'30' ,'34' ,'09' ,'02' ,'08' ,'12' ,'27' ,
      '21' ,'51' ,'44' ,'29' ,'05' ,'22' ,'06' ,'52' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'42' ,'01' ,'37' ,'31' ,'28' ,'47' ,'03' ,'49' ,'50' ,'45' ,
      '07' ,'23' ,'41' ,'15' ,'18' ,'36' ,'24' ,'19' ,'26' ,'39' ,'33' ,'32' ,
      '53' ,'25' ,'38' ,'48' ,'35' ,'40' ,'13' ,'14' ,'17' ,'11' ,'43' ,'46' ,
      '20' ,'16' ,'30' ,'34' ,'09' ,'02' ,'08' ,'12' ,'27' ,'21' ,'51' ,'44' ,
      '29' ,'05' ,'22' ,'06' ,'52' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(PCT_OWNER_OCCUPIED ) THEN DO;
          IF                 46.5 <= PCT_OWNER_OCCUPIED  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PCT_ATTRIBUTE3 ) THEN DO;
          IF                  4.5 <= PCT_ATTRIBUTE3  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'42' ,'01' ,'37' ,'31' ,'28' ,'47' ,'03' ,'49' ,'50' ,
        '45' ,'07' ,'23' ,'41' ,'15' ,'18' ,'36' ,'24' ,'19' ,'26' ,'39' ,
        '33' ,'32' ,'53' ,'25' ,'38' ,'48' ,'35' ,'40' ,'13' ,'14' ,'17' ,
        '11' ,'43' ,'46' ,'20' ,'16' ,'30' ,'34' ,'09' ,'02' ,'08' ,'12' ,
        '27' ,'21' ,'51' ,'44' ,'29' ,'05' ,'22' ,'06' ,'52' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0040405336;
      END;
    END;
  END;

********** LEAF    93  NODE   573 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(RECENT_AVG_GIFT_AMT ) AND 
    RECENT_AVG_GIFT_AMT  <                9.685 THEN DO;
     _BRANCH_ =    1; 
    END; 
   IF MISSING(RECENT_AVG_GIFT_AMT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_MAX_GIFT_AMT ) THEN DO;
        IF LIFETIME_MAX_GIFT_AMT  <                 11.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_AVG_GIFT ) THEN DO;
        IF FILE_AVG_GIFT  <                7.775 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.010751192;
    END;
  END;

********** LEAF    94  NODE   577 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(RECENT_AVG_GIFT_AMT ) AND 
                   9.685 <= RECENT_AVG_GIFT_AMT  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(RECENT_AVG_GIFT_AMT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_MAX_GIFT_AMT ) THEN DO;
        IF                 11.5 <= LIFETIME_MAX_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_AVG_GIFT ) THEN DO;
        IF                7.775 <= FILE_AVG_GIFT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_AVG_GIFT_AMT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'01' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,
      '17' ,'49' ,'43' ,'16' ,'34' ,'23' ,'02' ,'36' ,'24' ,'19' ,'27' ,'26' ,
      '21' ,'06' ,'52' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'01' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,'17' ,'49' ,'43' ,
      '16' ,'34' ,'23' ,'02' ,'36' ,'24' ,'19' ,'27' ,'26' ,'21' ,'06' ,'52' ,
      '53' ,'42' ,'25' ,'37' ,'35' ,'14' ,'11' ,'47' ,'03' ,'50' ,'46' ,'45' ,
      '20' ,'30' ,'07' ,'09' ,'41' ,'15' ,'18' ,'08' ,'12' ,'51' ,'44' ,'29' ,
      '05' ,'39' ,'33' ,'22' ,'32' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('2' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_4 IN ('1' ,'3' ,'4' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
        _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('C' ,'T' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_4 IN ('U' ,'R' ,'S' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(MONTHS_SINCE_FIRST_GIFT ) AND 
        MONTHS_SINCE_FIRST_GIFT  <                   71 THEN DO;
         _BRANCH_ =    1; 
        END; 
       IF MISSING(MONTHS_SINCE_FIRST_GIFT ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(MONTHS_SINCE_ORIGIN ) THEN DO;
            IF MONTHS_SINCE_ORIGIN  <                   72 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_PROM ) THEN DO;
            IF LIFETIME_PROM  <                 49.5 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( MONTHS_SINCE_FIRST_GIFT  ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0017683444;
        END;
      END;
    END;
  END;

********** LEAF    95  NODE   578 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(RECENT_AVG_GIFT_AMT ) AND 
                   9.685 <= RECENT_AVG_GIFT_AMT  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(RECENT_AVG_GIFT_AMT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_MAX_GIFT_AMT ) THEN DO;
        IF                 11.5 <= LIFETIME_MAX_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_AVG_GIFT ) THEN DO;
        IF                7.775 <= FILE_AVG_GIFT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_AVG_GIFT_AMT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'04' ,'01' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,
      '17' ,'49' ,'43' ,'16' ,'34' ,'23' ,'02' ,'36' ,'24' ,'19' ,'27' ,'26' ,
      '21' ,'06' ,'52' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'01' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,'17' ,'49' ,'43' ,
      '16' ,'34' ,'23' ,'02' ,'36' ,'24' ,'19' ,'27' ,'26' ,'21' ,'06' ,'52' ,
      '53' ,'42' ,'25' ,'37' ,'35' ,'14' ,'11' ,'47' ,'03' ,'50' ,'46' ,'45' ,
      '20' ,'30' ,'07' ,'09' ,'41' ,'15' ,'18' ,'08' ,'12' ,'51' ,'44' ,'29' ,
      '05' ,'39' ,'33' ,'22' ,'32' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('2' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_4 IN ('1' ,'3' ,'4' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
        _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('C' ,'T' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_4 IN ('U' ,'R' ,'S' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(MONTHS_SINCE_FIRST_GIFT ) AND 
                          71 <= MONTHS_SINCE_FIRST_GIFT  THEN DO;
         _BRANCH_ =    2; 
        END; 
       IF MISSING(MONTHS_SINCE_FIRST_GIFT ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(MONTHS_SINCE_ORIGIN ) THEN DO;
            IF                   72 <= MONTHS_SINCE_ORIGIN  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_PROM ) THEN DO;
            IF                 49.5 <= LIFETIME_PROM  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.007905275;
        END;
      END;
    END;
  END;

********** LEAF    96  NODE   579 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(RECENT_AVG_GIFT_AMT ) AND 
                   9.685 <= RECENT_AVG_GIFT_AMT  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(RECENT_AVG_GIFT_AMT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_MAX_GIFT_AMT ) THEN DO;
        IF                 11.5 <= LIFETIME_MAX_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_AVG_GIFT ) THEN DO;
        IF                7.775 <= FILE_AVG_GIFT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_AVG_GIFT_AMT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('53' ,'42' ,'25' ,'37' ,'35' ,'14' ,'11' ,'47' ,'03' ,
      '50' ,'46' ,'45' ,'20' ,'30' ,'07' ,'09' ,'41' ,'15' ,'18' ,'08' ,'12' ,
      '51' ,'44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'32' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'01' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,'17' ,'49' ,'43' ,
      '16' ,'34' ,'23' ,'02' ,'36' ,'24' ,'19' ,'27' ,'26' ,'21' ,'06' ,'52' ,
      '53' ,'42' ,'25' ,'37' ,'35' ,'14' ,'11' ,'47' ,'03' ,'50' ,'46' ,'45' ,
      '20' ,'30' ,'07' ,'09' ,'41' ,'15' ,'18' ,'08' ,'12' ,'51' ,'44' ,'29' ,
      '05' ,'39' ,'33' ,'22' ,'32' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('1' ,'3' ,'4' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('2' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
        _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('U' ,'R' ,'S' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('C' ,'T' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'01' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,'17' ,'49' ,
        '43' ,'16' ,'34' ,'23' ,'02' ,'36' ,'24' ,'19' ,'27' ,'26' ,'21' ,
        '06' ,'52' ,'53' ,'42' ,'25' ,'37' ,'35' ,'14' ,'11' ,'47' ,'03' ,
        '50' ,'46' ,'45' ,'20' ,'30' ,'07' ,'09' ,'41' ,'15' ,'18' ,'08' ,
        '12' ,'51' ,'44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'32' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_12 = PUT( INCOME_GROUP , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ,'2' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(INCOME_GROUP ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_12 NOTIN (
        '1' ,'2' ,'4' ,'6' ,'5' ,'3' ,'7' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
            IF _ARBFMT_2 IN ('53' ,'30' ,'09' ,'51' ,'33' ,'32' ,'10' ) THEN 
             DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_2 IN ('42' ,'25' ,'37' ,'35' ,'14' ,'11' ,'47' ,
            '03' ,'50' ,'46' ,'45' ,'20' ,'07' ,'41' ,'15' ,'18' ,'08' ,'12' ,
            '44' ,'29' ,'05' ,'39' ,'22' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
            IF MEDIAN_HOUSEHOLD_INCOME  <                217.5 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( INCOME_GROUP  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_12 NOTIN (
          '1' ,'2' ,'4' ,'6' ,'5' ,'3' ,'7' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0182610918;
        END;
      END;
    END;
  END;

********** LEAF    97  NODE   580 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(RECENT_AVG_GIFT_AMT ) AND 
                   9.685 <= RECENT_AVG_GIFT_AMT  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(RECENT_AVG_GIFT_AMT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_MAX_GIFT_AMT ) THEN DO;
        IF                 11.5 <= LIFETIME_MAX_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_AVG_GIFT ) THEN DO;
        IF                7.775 <= FILE_AVG_GIFT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_AVG_GIFT_AMT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('53' ,'42' ,'25' ,'37' ,'35' ,'14' ,'11' ,'47' ,'03' ,
      '50' ,'46' ,'45' ,'20' ,'30' ,'07' ,'09' ,'41' ,'15' ,'18' ,'08' ,'12' ,
      '51' ,'44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'32' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'04' ,'01' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,'17' ,'49' ,'43' ,
      '16' ,'34' ,'23' ,'02' ,'36' ,'24' ,'19' ,'27' ,'26' ,'21' ,'06' ,'52' ,
      '53' ,'42' ,'25' ,'37' ,'35' ,'14' ,'11' ,'47' ,'03' ,'50' ,'46' ,'45' ,
      '20' ,'30' ,'07' ,'09' ,'41' ,'15' ,'18' ,'08' ,'12' ,'51' ,'44' ,'29' ,
      '05' ,'39' ,'33' ,'22' ,'32' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('1' ,'3' ,'4' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('2' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_URBANICITY ) THEN DO;
        _ARBFMT_4 = PUT( REP_URBANICITY , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('U' ,'R' ,'S' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('C' ,'T' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'04' ,'01' ,'38' ,'48' ,'31' ,'40' ,'13' ,'28' ,'17' ,'49' ,
        '43' ,'16' ,'34' ,'23' ,'02' ,'36' ,'24' ,'19' ,'27' ,'26' ,'21' ,
        '06' ,'52' ,'53' ,'42' ,'25' ,'37' ,'35' ,'14' ,'11' ,'47' ,'03' ,
        '50' ,'46' ,'45' ,'20' ,'30' ,'07' ,'09' ,'41' ,'15' ,'18' ,'08' ,
        '12' ,'51' ,'44' ,'29' ,'05' ,'39' ,'33' ,'22' ,'32' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_12 = PUT( INCOME_GROUP , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('4' ,'6' ,'5' ,'3' ,'7' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(INCOME_GROUP ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_12 NOTIN (
        '1' ,'2' ,'4' ,'6' ,'5' ,'3' ,'7' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
            IF _ARBFMT_2 IN ('42' ,'25' ,'37' ,'35' ,'14' ,'11' ,'47' ,'03' ,
            '50' ,'46' ,'45' ,'20' ,'07' ,'41' ,'15' ,'18' ,'08' ,'12' ,'44' ,
            '29' ,'05' ,'39' ,'22' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_2 IN ('53' ,'30' ,'09' ,'51' ,'33' ,'32' ,'10' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
            IF                217.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0079577857;
        END;
      END;
    END;
  END;

********** LEAF    98  NODE   582 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(RECENT_AVG_GIFT_AMT ) AND 
    RECENT_AVG_GIFT_AMT  <                8.845 THEN DO;
     _BRANCH_ =    1; 
    END; 
   IF MISSING(RECENT_AVG_GIFT_AMT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_MAX_GIFT_AMT ) THEN DO;
        IF LIFETIME_MAX_GIFT_AMT  <                 10.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_AVG_GIFT ) THEN DO;
        IF FILE_AVG_GIFT  <                 7.02 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -0.011249546;
    END;
  END;

********** LEAF    99  NODE   586 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(RECENT_AVG_GIFT_AMT ) AND 
                   8.845 <= RECENT_AVG_GIFT_AMT  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(RECENT_AVG_GIFT_AMT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_MAX_GIFT_AMT ) THEN DO;
        IF                 10.5 <= LIFETIME_MAX_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_AVG_GIFT ) THEN DO;
        IF                 7.02 <= FILE_AVG_GIFT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_AVG_GIFT_AMT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'42' ,'01' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,
      '28' ,'14' ,'17' ,'11' ,'50' ,'43' ,'07' ,'34' ,'24' ,'26' ,'21' ,'51' ,
      '44' ,'29' ,'22' ,'52' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'01' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,'28' ,'14' ,'17' ,
      '11' ,'50' ,'43' ,'07' ,'34' ,'24' ,'26' ,'21' ,'51' ,'44' ,'29' ,'22' ,
      '52' ,'04' ,'53' ,'25' ,'37' ,'47' ,'03' ,'49' ,'46' ,'45' ,'20' ,'16' ,
      '30' ,'23' ,'09' ,'02' ,'41' ,'15' ,'18' ,'36' ,'08' ,'12' ,'19' ,'27' ,
      '05' ,'39' ,'33' ,'06' ,'32' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('1' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_4 IN ('2' ,'3' ,'4' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF              14137.5 <= PER_CAPITA_INCOME  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_12 = PUT( INCOME_GROUP , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ,'2' ,'3' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(INCOME_GROUP ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_12 NOTIN (
        '1' ,'2' ,'3' ,'4' ,'6' ,'5' ,'7' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
            IF _ARBFMT_2 IN ('38' ,'48' ,'31' ,'50' ,'43' ,'26' ,'51' ,'52' ) 
             THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_2 IN ('.' ,'42' ,'01' ,'35' ,'40' ,'13' ,'28' ,
            '14' ,'17' ,'11' ,'07' ,'34' ,'24' ,'21' ,'44' ,'29' ,'22' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
            IF MEDIAN_HOUSEHOLD_INCOME  <                252.5 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( INCOME_GROUP  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_12 NOTIN (
          '1' ,'2' ,'3' ,'4' ,'6' ,'5' ,'7' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.004239405;
        END;
      END;
    END;
  END;

********** LEAF   100  NODE   587 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(RECENT_AVG_GIFT_AMT ) AND 
                   8.845 <= RECENT_AVG_GIFT_AMT  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(RECENT_AVG_GIFT_AMT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_MAX_GIFT_AMT ) THEN DO;
        IF                 10.5 <= LIFETIME_MAX_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_AVG_GIFT ) THEN DO;
        IF                 7.02 <= FILE_AVG_GIFT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_AVG_GIFT_AMT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('.' ,'42' ,'01' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,
      '28' ,'14' ,'17' ,'11' ,'50' ,'43' ,'07' ,'34' ,'24' ,'26' ,'21' ,'51' ,
      '44' ,'29' ,'22' ,'52' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'01' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,'28' ,'14' ,'17' ,
      '11' ,'50' ,'43' ,'07' ,'34' ,'24' ,'26' ,'21' ,'51' ,'44' ,'29' ,'22' ,
      '52' ,'04' ,'53' ,'25' ,'37' ,'47' ,'03' ,'49' ,'46' ,'45' ,'20' ,'16' ,
      '30' ,'23' ,'09' ,'02' ,'41' ,'15' ,'18' ,'36' ,'08' ,'12' ,'19' ,'27' ,
      '05' ,'39' ,'33' ,'06' ,'32' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('1' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_4 IN ('2' ,'3' ,'4' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF              14137.5 <= PER_CAPITA_INCOME  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_12 = PUT( INCOME_GROUP , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('4' ,'6' ,'5' ,'7' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(INCOME_GROUP ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_12 NOTIN (
        '1' ,'2' ,'3' ,'4' ,'6' ,'5' ,'7' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
            IF _ARBFMT_2 IN ('.' ,'42' ,'01' ,'35' ,'40' ,'13' ,'28' ,'14' ,
            '17' ,'11' ,'07' ,'34' ,'24' ,'21' ,'44' ,'29' ,'22' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_2 IN ('38' ,'48' ,'31' ,'50' ,'43' ,'26' ,'51' ,
            '52' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
            IF                252.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.008285578;
        END;
      END;
    END;
  END;

********** LEAF   101  NODE   588 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(RECENT_AVG_GIFT_AMT ) AND 
                   8.845 <= RECENT_AVG_GIFT_AMT  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(RECENT_AVG_GIFT_AMT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_MAX_GIFT_AMT ) THEN DO;
        IF                 10.5 <= LIFETIME_MAX_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_AVG_GIFT ) THEN DO;
        IF                 7.02 <= FILE_AVG_GIFT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_AVG_GIFT_AMT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'53' ,'25' ,'37' ,'47' ,'03' ,'49' ,'46' ,'45' ,
      '20' ,'16' ,'30' ,'23' ,'09' ,'02' ,'41' ,'15' ,'18' ,'36' ,'08' ,'12' ,
      '19' ,'27' ,'05' ,'39' ,'33' ,'06' ,'32' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'01' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,'28' ,'14' ,'17' ,
      '11' ,'50' ,'43' ,'07' ,'34' ,'24' ,'26' ,'21' ,'51' ,'44' ,'29' ,'22' ,
      '52' ,'04' ,'53' ,'25' ,'37' ,'47' ,'03' ,'49' ,'46' ,'45' ,'20' ,'16' ,
      '30' ,'23' ,'09' ,'02' ,'41' ,'15' ,'18' ,'36' ,'08' ,'12' ,'19' ,'27' ,
      '05' ,'39' ,'33' ,'06' ,'32' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('2' ,'3' ,'4' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('1' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF PER_CAPITA_INCOME  <              14137.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'42' ,'01' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,'28' ,'14' ,
        '17' ,'11' ,'50' ,'43' ,'07' ,'34' ,'24' ,'26' ,'21' ,'51' ,'44' ,
        '29' ,'22' ,'52' ,'04' ,'53' ,'25' ,'37' ,'47' ,'03' ,'49' ,'46' ,
        '45' ,'20' ,'16' ,'30' ,'23' ,'09' ,'02' ,'41' ,'15' ,'18' ,'36' ,
        '08' ,'12' ,'19' ,'27' ,'05' ,'39' ,'33' ,'06' ,'32' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_12 = PUT( INCOME_GROUP , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('1' ,'2' ,'7' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(INCOME_GROUP ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_12 NOTIN (
        '1' ,'2' ,'7' ,'4' ,'6' ,'5' ,'3' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(HOME_OWNER ) THEN DO;
          _ARBFMT_3 = PUT( HOME_OWNER , $3.);
           %DMNORMIP( _ARBFMT_3);
            IF _ARBFMT_3 IN ('U' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_3 IN ('H' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
            IF _ARBFMT_2 IN ('53' ,'25' ,'30' ,'41' ,'36' ,'33' ,'32' ,'10' ) 
             THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_2 IN ('04' ,'37' ,'47' ,'03' ,'49' ,'46' ,'45' ,
            '20' ,'16' ,'23' ,'09' ,'02' ,'15' ,'18' ,'08' ,'12' ,'19' ,'27' ,
            '05' ,'39' ,'06' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( INCOME_GROUP  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_12 NOTIN (
          '1' ,'2' ,'7' ,'4' ,'6' ,'5' ,'3' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0176395363;
        END;
      END;
    END;
  END;

********** LEAF   102  NODE   589 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(RECENT_AVG_GIFT_AMT ) AND 
                   8.845 <= RECENT_AVG_GIFT_AMT  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(RECENT_AVG_GIFT_AMT ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_MAX_GIFT_AMT ) THEN DO;
        IF                 10.5 <= LIFETIME_MAX_GIFT_AMT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(FILE_AVG_GIFT ) THEN DO;
        IF                 7.02 <= FILE_AVG_GIFT  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( RECENT_AVG_GIFT_AMT  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
     %DMNORMIP( _ARBFMT_2);
      IF _ARBFMT_2 IN ('04' ,'53' ,'25' ,'37' ,'47' ,'03' ,'49' ,'46' ,'45' ,
      '20' ,'16' ,'30' ,'23' ,'09' ,'02' ,'41' ,'15' ,'18' ,'36' ,'08' ,'12' ,
      '19' ,'27' ,'05' ,'39' ,'33' ,'06' ,'32' ,'10' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(CLUSTER_CODE ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_2 NOTIN (
      '.' ,'42' ,'01' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,'28' ,'14' ,'17' ,
      '11' ,'50' ,'43' ,'07' ,'34' ,'24' ,'26' ,'21' ,'51' ,'44' ,'29' ,'22' ,
      '52' ,'04' ,'53' ,'25' ,'37' ,'47' ,'03' ,'49' ,'46' ,'45' ,'20' ,'16' ,
      '30' ,'23' ,'09' ,'02' ,'41' ,'15' ,'18' ,'36' ,'08' ,'12' ,'19' ,'27' ,
      '05' ,'39' ,'33' ,'06' ,'32' ,'10' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
        _ARBFMT_4 = PUT( REP_SES , $4.);
         %DMNORMIP( _ARBFMT_4);
          IF _ARBFMT_4 IN ('2' ,'3' ,'4' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_4 IN ('1' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(PER_CAPITA_INCOME ) THEN DO;
          IF PER_CAPITA_INCOME  <              14137.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( CLUSTER_CODE  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_2 NOTIN (
        '.' ,'42' ,'01' ,'38' ,'48' ,'31' ,'35' ,'40' ,'13' ,'28' ,'14' ,
        '17' ,'11' ,'50' ,'43' ,'07' ,'34' ,'24' ,'26' ,'21' ,'51' ,'44' ,
        '29' ,'22' ,'52' ,'04' ,'53' ,'25' ,'37' ,'47' ,'03' ,'49' ,'46' ,
        '45' ,'20' ,'16' ,'30' ,'23' ,'09' ,'02' ,'41' ,'15' ,'18' ,'36' ,
        '08' ,'12' ,'19' ,'27' ,'05' ,'39' ,'33' ,'06' ,'32' ,'10' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_12 = PUT( INCOME_GROUP , BEST12.);
       %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('4' ,'6' ,'5' ,'3' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(INCOME_GROUP ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_12 NOTIN (
        '1' ,'2' ,'7' ,'4' ,'6' ,'5' ,'3' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(HOME_OWNER ) THEN DO;
          _ARBFMT_3 = PUT( HOME_OWNER , $3.);
           %DMNORMIP( _ARBFMT_3);
            IF _ARBFMT_3 IN ('H' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_3 IN ('U' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
            IF _ARBFMT_2 IN ('04' ,'37' ,'47' ,'03' ,'49' ,'46' ,'45' ,'20' ,
            '16' ,'23' ,'09' ,'02' ,'15' ,'18' ,'08' ,'12' ,'19' ,'27' ,'05' ,
            '39' ,'06' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_2 IN ('53' ,'25' ,'30' ,'41' ,'36' ,'33' ,'32' ,
            '10' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0034244026;
        END;
      END;
    END;
  END;

_ARB_F_ = 2.0 * _ARB_F_;
IF _ARB_BADF_ NE 0 THEN P_TARGET_B0  = 0.7499530693;
ELSE IF _ARB_F_ > 45.0 THEN P_TARGET_B0  = 1.0;
ELSE IF _ARB_F_ < -45.0 THEN P_TARGET_B0  = 0.0;
ELSE P_TARGET_B0  = 1.0/(1.0 + EXP( - _ARB_F_));
P_TARGET_B1  = 1.0 - P_TARGET_B0 ;
*****  CREATE Q_: POSTERIORS WITHOUT PRIORS ****;
Q_TARGET_B1  = P_TARGET_B1 ;
Q_TARGET_B0  = P_TARGET_B0 ;

*****  ADJUST POSTERIOR  PROBILITIES WITH PRIORS ****;
 _ARB_P_   = 0;
P_TARGET_B1  = P_TARGET_B1  * 0.1999624625;
 _ARB_P_ + P_TARGET_B1 ;
P_TARGET_B0  = P_TARGET_B0  * 1.2667459324;
 _ARB_P_ + P_TARGET_B0 ;
IF _ARB_P_ > 0 THEN DO;
  P_TARGET_B1  = P_TARGET_B1  / _ARB_P_;
  P_TARGET_B0  = P_TARGET_B0  / _ARB_P_;
END;

*****  I_ AND U_ VARIABLES *******************;
 DROP _ARB_I_ _ARB_IP_;
 _ARB_IP_ = -1.0;
 IF _ARB_IP_ + 1.0/32768.0 < P_TARGET_B1 THEN DO;
   _ARB_IP_ = P_TARGET_B1 ;
   _ARB_I_  = 1;
   END;
 IF _ARB_IP_ + 1.0/32768.0 < P_TARGET_B0 THEN DO;
   _ARB_IP_ = P_TARGET_B0 ;
   _ARB_I_  = 2;
   END;
 SELECT( _ARB_I_);
  WHEN( 1) DO;
    I_TARGET_B  = '1' ;
    U_TARGET_B  =  1;
     END;
  WHEN( 2) DO;
    I_TARGET_B  = '0' ;
    U_TARGET_B  =  0;
     END;
   END;

*****  RESIDUALS R_ *************;
IF  F_TARGET_B  NE '1' 
AND F_TARGET_B  NE '0'  THEN DO; 
        R_TARGET_B1  = .;
        R_TARGET_B0  = .;
 END;
 ELSE DO;
       R_TARGET_B1  =  -P_TARGET_B1 ;
       R_TARGET_B0  =  -P_TARGET_B0 ;
       SELECT( F_TARGET_B  );
          WHEN( '1'  ) R_TARGET_B1  = R_TARGET_B1  +1;
          WHEN( '0'  ) R_TARGET_B0  = R_TARGET_B0  +1;
       END;
 END;

*****  DECISION VARIABLES *******;

*** Decision Processing;
label D_TARGET_B = 'Decision: TARGET_B' ;
label EP_TARGET_B = 'Expected Profit: TARGET_B' ;
label BP_TARGET_B = 'Best Profit: TARGET_B' ;
label CP_TARGET_B = 'Computed Profit: TARGET_B' ;

length D_TARGET_B $ 1;

D_TARGET_B = ' ';
EP_TARGET_B = .;
BP_TARGET_B = .;
CP_TARGET_B = .;

*** Compute Expected Consequences and Choose Decision;
_decnum = 1; drop _decnum;

D_TARGET_B = '1' ;
EP_TARGET_B = P_TARGET_B1 * 14.5 + P_TARGET_B0 * -0.5;
drop _sum; 
_sum = P_TARGET_B1 * 0 + P_TARGET_B0 * 0;
if _sum > EP_TARGET_B + 4.547474E-13 then do;
   EP_TARGET_B = _sum; _decnum = 2;
   D_TARGET_B = '0' ;
end;

*** Decision Matrix;
array BOOSTdema [2,2] _temporary_ (
/* row 1 */  14.5 0
/* row 2 */  -0.5 0
);

*** Find Index of Target Category;
drop _tarnum; select( F_TARGET_B );
   when('1' ) _tarnum = 1;
   when('0' ) _tarnum = 2;
   otherwise _tarnum = 0;
end;
if _tarnum <= 0 then goto BOOSTdeex;

*** Computed Consequence of Chosen Decision;
CP_TARGET_B = BOOSTdema [_tarnum,_decnum];

*** Best Possible Consequence of Any Decision without Cost;
array BOOSTdebe [2] _temporary_ ( 14.5 0);
BP_TARGET_B = BOOSTdebe [_tarnum];


BOOSTdeex:;

*** End Decision Processing ;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

*------------------------------------------------------------*;
*Computing Unadjusted Residual Vars: TARGET_B;
*------------------------------------------------------------*;
Label R_TARGET_B1='Residual: TARGET_B=1';
Label R_TARGET_B0='Residual: TARGET_B=0';
if
 F_TARGET_B ne '1'
and F_TARGET_B ne '0'
 then do;
R_TARGET_B1=.;
R_TARGET_B0=.;
end;
else do;
R_TARGET_B1= - Q_TARGET_B1;
R_TARGET_B0= - Q_TARGET_B0;
select(F_TARGET_B);
when('1')R_TARGET_B1= R_TARGET_B1+1;
when('0')R_TARGET_B0= R_TARGET_B0+1;
otherwise;
end;
end;
