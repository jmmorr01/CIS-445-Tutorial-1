****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;
 
******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH F_TARGET_B  $   12;
LENGTH I_TARGET_B  $   12;
LENGTH _WARN_  $    4;
 
******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_TARGET_B1 = 'Predicted: TARGET_B=1' ;
label P_TARGET_B0 = 'Predicted: TARGET_B=0' ;
label Q_TARGET_B1 = 'Unadjusted P: TARGET_B=1' ;
label Q_TARGET_B0 = 'Unadjusted P: TARGET_B=0' ;
label V_TARGET_B1 = 'Validated: TARGET_B=1' ;
label V_TARGET_B0 = 'Validated: TARGET_B=0' ;
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
 
 
_ARBFMT_12 = PUT( TARGET_B , BEST12.);
 %DMNORMCP( _ARBFMT_12, F_TARGET_B );
 
******             ASSIGN OBSERVATION TO NODE             ******;
 
 DROP _BRANCH_;
_BRANCH_ = -1;
_ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
 %DMNORMIP( _ARBFMT_12);
  IF _ARBFMT_12 IN ('3' ,'4' ) THEN DO;
   _BRANCH_ =    1;
  END;
  ELSE IF _ARBFMT_12 IN ('1' ,'2' ) THEN DO;
   _BRANCH_ =    2;
  END;
IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_PROP ) THEN DO;
    IF                0.218 <= RECENT_RESPONSE_PROP  THEN DO;
     _BRANCH_ =    1;
    END;
    ELSE IF RECENT_RESPONSE_PROP  <                0.218 THEN DO;
     _BRANCH_ =    2;
    END;
   ELSE _BRANCH_ =    1;
  END;
IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_RESPONSE_COUNT ) THEN DO;
  _ARBFMT_12 = PUT( RECENT_RESPONSE_COUNT , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('9' ,'11' ,'7' ,'4' ,'12' ,'5' ,'8' ,'6' ,'10' ,'13' )
     THEN DO;
     _BRANCH_ =    1;
    END;
    ELSE IF _ARBFMT_12 IN ('1' ,'2' ,'3' ,'0' ) THEN DO;
     _BRANCH_ =    2;
    END;
  END;
IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_MAX_GIFT_AMT ) THEN DO;
    IF LIFETIME_MAX_GIFT_AMT  <                 13.5 THEN DO;
     _BRANCH_ =    1;
    END;
    ELSE IF                 13.5 <= LIFETIME_MAX_GIFT_AMT  THEN DO;
     _BRANCH_ =    2;
    END;
   ELSE _BRANCH_ =    2;
  END;
IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
    IF RECENT_AVG_GIFT_AMT  <                 9.95 THEN DO;
     _BRANCH_ =    1;
    END;
    ELSE IF                 9.95 <= RECENT_AVG_GIFT_AMT  THEN DO;
     _BRANCH_ =    2;
    END;
   ELSE _BRANCH_ =    2;
  END;
IF _BRANCH_ LT 0 THEN _BRANCH_ =    2;
 
IF _BRANCH_ EQ    1 THEN DO;
  _NODE_  =                    2;
  _LEAF_  =                    1;
  P_TARGET_B1  =     0.07300054401831;
  P_TARGET_B0  =     0.92699945598168;
  Q_TARGET_B1  =     0.33283087126921;
  Q_TARGET_B0  =     0.66716912873078;
  V_TARGET_B1  =     0.07029666958131;
  V_TARGET_B0  =     0.92970333041868;
  I_TARGET_B  = '0' ;
  U_TARGET_B  =                    0;
  END;
ELSE DO;
 
  _BRANCH_ = -1;
  _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
   %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('1' ) THEN DO;
     _BRANCH_ =    1;
    END;
    ELSE IF _ARBFMT_12 IN ('0' ) THEN DO;
     _BRANCH_ =    2;
    END;
  IF _BRANCH_ LT 0 AND NOT MISSING(FILE_CARD_GIFT ) THEN DO;
      IF                  4.5 <= FILE_CARD_GIFT  THEN DO;
       _BRANCH_ =    1;
      END;
      ELSE IF FILE_CARD_GIFT  <                  4.5 THEN DO;
       _BRANCH_ =    2;
      END;
     ELSE _BRANCH_ =    1;
    END;
  IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_GIFT_COUNT ) THEN DO;
      IF                  8.5 <= LIFETIME_GIFT_COUNT  THEN DO;
       _BRANCH_ =    1;
      END;
      ELSE IF LIFETIME_GIFT_COUNT  <                  8.5 THEN DO;
       _BRANCH_ =    2;
      END;
     ELSE _BRANCH_ =    1;
    END;
  IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_STAR_STATUS ) THEN DO;
      IF                  0.5 <= RECENT_STAR_STATUS  THEN DO;
       _BRANCH_ =    1;
      END;
      ELSE IF RECENT_STAR_STATUS  <                  0.5 THEN DO;
       _BRANCH_ =    2;
      END;
     ELSE _BRANCH_ =    1;
    END;
  IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_PROM ) THEN DO;
      IF                 53.5 <= LIFETIME_PROM  THEN DO;
       _BRANCH_ =    1;
      END;
      ELSE IF LIFETIME_PROM  <                 53.5 THEN DO;
       _BRANCH_ =    2;
      END;
     ELSE _BRANCH_ =    1;
    END;
  IF _BRANCH_ LT 0 THEN _BRANCH_ =    2;
 
  IF _BRANCH_ EQ    1 THEN DO;
    _NODE_  =                    6;
    _LEAF_  =                    2;
    P_TARGET_B1  =     0.05030587345486;
    P_TARGET_B0  =     0.94969412654513;
    Q_TARGET_B1  =     0.25125292348813;
    Q_TARGET_B0  =     0.74874707651186;
    V_TARGET_B1  =     0.04964830264094;
    V_TARGET_B0  =     0.95035169735905;
    I_TARGET_B  = '0' ;
    U_TARGET_B  =                    0;
    END;
  ELSE DO;
 
    _BRANCH_ = -1;
      IF  NOT MISSING(PER_CAPITA_INCOME ) AND
      PER_CAPITA_INCOME  <                17477 THEN DO;
       _BRANCH_ =    1;
      END;
      ELSE IF  NOT MISSING(PER_CAPITA_INCOME ) AND
                     17477 <= PER_CAPITA_INCOME  THEN DO;
       _BRANCH_ =    2;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(CLUSTER_CODE ) THEN DO;
      _ARBFMT_2 = PUT( CLUSTER_CODE , $2.);
       %DMNORMIP( _ARBFMT_2);
        IF _ARBFMT_2 IN ('.' ,'04' ,'49' ,'50' ,'43' ,'53' ,'42' ,'46' ,'45' ,
        '20' ,'16' ,'30' ,'07' ,'25' ,'09' ,'41' ,'37' ,'38' ,'18' ,'36' ,
        '48' ,'08' ,'31' ,'19' ,'27' ,'40' ,'26' ,'28' ,'21' ,'51' ,'44' ,
        '05' ,'17' ,'39' ,'33' ,'47' ,'06' ,'32' ,'52' ,'10' ) THEN DO;
         _BRANCH_ =    1;
        END;
        ELSE IF _ARBFMT_2 IN ('34' ,'23' ,'01' ,'02' ,'15' ,'24' ,'12' ,'35' ,
        '13' ,'14' ,'29' ,'11' ,'22' ,'03' ) THEN DO;
         _BRANCH_ =    2;
        END;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOUSEHOLD_INCOME ) THEN DO;
        IF MEDIAN_HOUSEHOLD_INCOME  <                409.5 THEN DO;
         _BRANCH_ =    1;
        END;
        ELSE IF                409.5 <= MEDIAN_HOUSEHOLD_INCOME  THEN DO;
         _BRANCH_ =    2;
        END;
       ELSE _BRANCH_ =    2;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(REP_SES ) THEN DO;
      _ARBFMT_4 = PUT( REP_SES , $4.);
       %DMNORMIP( _ARBFMT_4);
        IF _ARBFMT_4 IN ('2' ,'3' ,'4' ) THEN DO;
         _BRANCH_ =    1;
        END;
        ELSE IF _ARBFMT_4 IN ('1' ) THEN DO;
         _BRANCH_ =    2;
        END;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(MEDIAN_HOME_VALUE ) THEN DO;
        IF MEDIAN_HOME_VALUE  <                 1126 THEN DO;
         _BRANCH_ =    1;
        END;
        ELSE IF                 1126 <= MEDIAN_HOME_VALUE  THEN DO;
         _BRANCH_ =    2;
        END;
       ELSE _BRANCH_ =    2;
      END;
    IF _BRANCH_ LT 0 THEN _BRANCH_ =    1;
 
    IF _BRANCH_ EQ    2 THEN DO;
      _NODE_  =                   15;
      _LEAF_  =                    7;
      P_TARGET_B1  =     0.04725884462623;
      P_TARGET_B0  =     0.95274115537376;
      Q_TARGET_B1  =      0.2390988372093;
      Q_TARGET_B0  =     0.76090116279069;
      V_TARGET_B1  =     0.04024137145951;
      V_TARGET_B0  =     0.95975862854048;
      I_TARGET_B  = '0' ;
      U_TARGET_B  =                    0;
      END;
    ELSE DO;
 
      _BRANCH_ = -1;
        IF  NOT MISSING(FILE_AVG_GIFT ) AND
        FILE_AVG_GIFT  <               13.615 THEN DO;
         _BRANCH_ =    1;
        END;
        ELSE IF  NOT MISSING(FILE_AVG_GIFT ) AND
                      13.615 <= FILE_AVG_GIFT  THEN DO;
         _BRANCH_ =    2;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_AVG_GIFT_AMT ) THEN DO;
          IF LIFETIME_AVG_GIFT_AMT  <               13.615 THEN DO;
           _BRANCH_ =    1;
          END;
          ELSE IF               13.615 <= LIFETIME_AVG_GIFT_AMT  THEN DO;
           _BRANCH_ =    2;
          END;
         ELSE _BRANCH_ =    2;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_MIN_GIFT_AMT ) THEN DO;
          IF LIFETIME_MIN_GIFT_AMT  <                 7.75 THEN DO;
           _BRANCH_ =    1;
          END;
          ELSE IF                 7.75 <= LIFETIME_MIN_GIFT_AMT  THEN DO;
           _BRANCH_ =    2;
          END;
         ELSE _BRANCH_ =    2;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(RECENT_AVG_GIFT_AMT ) THEN DO;
          IF RECENT_AVG_GIFT_AMT  <               14.835 THEN DO;
           _BRANCH_ =    1;
          END;
          ELSE IF               14.835 <= RECENT_AVG_GIFT_AMT  THEN DO;
           _BRANCH_ =    2;
          END;
         ELSE _BRANCH_ =    2;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_MAX_GIFT_AMT ) THEN DO;
          IF LIFETIME_MAX_GIFT_AMT  <                 19.5 THEN DO;
           _BRANCH_ =    1;
          END;
          ELSE IF                 19.5 <= LIFETIME_MAX_GIFT_AMT  THEN DO;
           _BRANCH_ =    2;
          END;
         ELSE _BRANCH_ =    2;
        END;
      IF _BRANCH_ LT 0 THEN _BRANCH_ =    2;
 
      IF _BRANCH_ EQ    1 THEN DO;
        _NODE_  =                   24;
        _LEAF_  =                    3;
        P_TARGET_B1  =      0.0361451652753;
        P_TARGET_B0  =     0.96385483472469;
        Q_TARGET_B1  =     0.19196062346185;
        Q_TARGET_B0  =     0.80803937653814;
        V_TARGET_B1  =     0.03668059246853;
        V_TARGET_B0  =     0.96331940753146;
        I_TARGET_B  = '0' ;
        U_TARGET_B  =                    0;
        END;
      ELSE DO;
 
        _BRANCH_ = -1;
          IF  NOT MISSING(NUMBER_PROM_12 ) AND
          NUMBER_PROM_12  <                 13.5 THEN DO;
           _BRANCH_ =    1;
          END;
          ELSE IF  NOT MISSING(NUMBER_PROM_12 ) AND
                          13.5 <= NUMBER_PROM_12  THEN DO;
           _BRANCH_ =    2;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(IN_HOUSE ) THEN DO;
          _ARBFMT_12 = PUT( IN_HOUSE , BEST12.);
           %DMNORMIP( _ARBFMT_12);
            IF _ARBFMT_12 IN ('0' ) THEN DO;
             _BRANCH_ =    1;
            END;
            ELSE IF _ARBFMT_12 IN ('1' ) THEN DO;
             _BRANCH_ =    2;
            END;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(MONTHS_SINCE_LAST_GIFT ) THEN DO;
            IF                 14.5 <= MONTHS_SINCE_LAST_GIFT  THEN DO;
             _BRANCH_ =    1;
            END;
            ELSE IF MONTHS_SINCE_LAST_GIFT  <                 14.5 THEN DO;
             _BRANCH_ =    2;
            END;
           ELSE _BRANCH_ =    1;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(CARD_PROM_12 ) THEN DO;
          _ARBFMT_12 = PUT( CARD_PROM_12 , BEST12.);
           %DMNORMIP( _ARBFMT_12);
            IF _ARBFMT_12 IN ('5' ,'6' ,'4' ,'2' ,'3' ,'1' ) THEN DO;
             _BRANCH_ =    1;
            END;
            ELSE IF _ARBFMT_12 IN ('7' ,'9' ,'8' ) THEN DO;
             _BRANCH_ =    2;
            END;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(LIFETIME_PROM ) THEN DO;
            IF LIFETIME_PROM  <                 71.5 THEN DO;
             _BRANCH_ =    1;
            END;
            ELSE IF                 71.5 <= LIFETIME_PROM  THEN DO;
             _BRANCH_ =    2;
            END;
           ELSE _BRANCH_ =    2;
          END;
        IF _BRANCH_ LT 0 THEN _BRANCH_ =    1;
 
        IF _BRANCH_ EQ    2 THEN DO;
          _NODE_  =                   35;
          _LEAF_  =                    6;
          P_TARGET_B1  =     0.04899772110298;
          P_TARGET_B0  =     0.95100227889701;
          Q_TARGET_B1  =     0.24607329842931;
          Q_TARGET_B0  =     0.75392670157068;
          V_TARGET_B1  =     0.03602921311568;
          V_TARGET_B0  =     0.96397078688431;
          I_TARGET_B  = '0' ;
          U_TARGET_B  =                    0;
          END;
        ELSE DO;
          IF  NOT MISSING(PCT_ATTRIBUTE2 ) AND
                            58.5 <= PCT_ATTRIBUTE2  THEN DO;
            _NODE_  =                   41;
            _LEAF_  =                    5;
            P_TARGET_B1  =     0.12136059263373;
            P_TARGET_B0  =     0.87863940736626;
            Q_TARGET_B1  =     0.46666666666666;
            Q_TARGET_B0  =     0.53333333333333;
            V_TARGET_B1  =     0.05942303585465;
            V_TARGET_B0  =     0.94057696414534;
            I_TARGET_B  = '0' ;
            U_TARGET_B  =                    0;
            END;
          ELSE DO;
            _NODE_  =                   40;
            _LEAF_  =                    4;
            P_TARGET_B1  =      0.0218140868437;
            P_TARGET_B0  =     0.97818591315629;
            Q_TARGET_B1  =     0.12378483473752;
            Q_TARGET_B0  =     0.87621516526247;
            V_TARGET_B1  =     0.03330189507384;
            V_TARGET_B0  =     0.96669810492615;
            I_TARGET_B  = '0' ;
            U_TARGET_B  =                    0;
            END;
          END;
        END;
      END;
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
 
length D_TARGET_B $ 9;
 
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
if _sum > EP_TARGET_B + 6.593837E-12 then do;
   EP_TARGET_B = _sum; _decnum = 2;
   D_TARGET_B = '0' ;
end;
 
*** Decision Matrix;
array TREEdema [2,2] _temporary_ (
/* row 1 */  14.5 0
/* row 2 */  -0.5 0
);
 
*** Find Index of Target Category;
drop _tarnum; select( F_TARGET_B );
   when('1' ) _tarnum = 1;
   when('0' ) _tarnum = 2;
   otherwise _tarnum = 0;
end;
if _tarnum <= 0 then goto TREEdeex;
 
*** Computed Consequence of Chosen Decision;
CP_TARGET_B = TREEdema [_tarnum,_decnum];
 
*** Best Possible Consequence of Any Decision without Cost;
array TREEdebe [2] _temporary_ ( 14.5 0);
BP_TARGET_B = TREEdebe [_tarnum];
 
 
TREEdeex:;
 
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
drop _LEAF_;
