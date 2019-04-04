****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
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
label I_TARGET_B = 'Into: TARGET_B' ;
label U_TARGET_B = 'Unnormalized Into: TARGET_B' ;
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12; 
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */


******             ASSIGN OBSERVATION TO NODE             ******;
_ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
 %DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('3' ,'4' ) THEN DO;
  IF  NOT MISSING(MONTHS_SINCE_LAST_GIFT ) AND 
    MONTHS_SINCE_LAST_GIFT  <                    8 THEN DO;
    _NODE_  =                    5;
    _LEAF_  =                    1;
    P_TARGET_B1  =     0.17387708913649;
    P_TARGET_B0  =      0.8261229108635;
    Q_TARGET_B1  =     0.57142857142857;
    Q_TARGET_B0  =     0.42857142857142;
    V_TARGET_B1  =     0.12085512037615;
    V_TARGET_B0  =     0.87914487962384;
    I_TARGET_B  = '0' ;
    U_TARGET_B  =                    0;
    END;
  ELSE DO;
    _NODE_  =                    6;
    _LEAF_  =                    2;
    P_TARGET_B1  =     0.07016069959347;
    P_TARGET_B0  =     0.92983930040652;
    Q_TARGET_B1  =     0.32340958947038;
    Q_TARGET_B0  =     0.67659041052961;
    V_TARGET_B1  =      0.0686925955949;
    V_TARGET_B0  =     0.93130740440509;
    I_TARGET_B  = '0' ;
    U_TARGET_B  =                    0;
    END;
  END;
ELSE DO;
  _ARBFMT_12 = PUT( PEP_STAR , BEST12.);
   %DMNORMIP( _ARBFMT_12);
  IF _ARBFMT_12 IN ('1' ) THEN DO;
    _NODE_  =                    7;
    _LEAF_  =                    3;
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
    IF  NOT MISSING(PER_CAPITA_INCOME ) AND 
                     17477 <= PER_CAPITA_INCOME  THEN DO;
      IF  NOT MISSING(FILE_AVG_GIFT ) AND 
        FILE_AVG_GIFT  <               10.165 THEN DO;
        IF  NOT MISSING(MONTHS_SINCE_FIRST_GIFT ) AND 
                           102 <= MONTHS_SINCE_FIRST_GIFT  THEN DO;
          _NODE_  =                   18;
          _LEAF_  =                   10;
          P_TARGET_B1  =      0.2399543516127;
          P_TARGET_B0  =     0.76004564838729;
          Q_TARGET_B1  =     0.66666666666666;
          Q_TARGET_B0  =     0.33333333333333;
          V_TARGET_B1  =      0.0220654235252;
          V_TARGET_B0  =     0.97793457647479;
          I_TARGET_B  = '0' ;
          U_TARGET_B  =                    0;
          END;
        ELSE DO;
          IF  NOT MISSING(FILE_AVG_GIFT ) AND 
                            9.45 <= FILE_AVG_GIFT  THEN DO;
            _NODE_  =                   24;
            _LEAF_  =                    9;
            P_TARGET_B1  =     0.12341431768971;
            P_TARGET_B0  =     0.87658568231028;
            Q_TARGET_B1  =     0.47142857142857;
            Q_TARGET_B0  =     0.52857142857142;
            V_TARGET_B1  =     0.04458445724991;
            V_TARGET_B0  =     0.95541554275008;
            I_TARGET_B  = '0' ;
            U_TARGET_B  =                    0;
            END;
          ELSE DO;
            _NODE_  =                   23;
            _LEAF_  =                    8;
            P_TARGET_B1  =     0.03796554116338;
            P_TARGET_B0  =     0.96203445883661;
            Q_TARGET_B1  =                  0.2;
            Q_TARGET_B0  =                  0.8;
            V_TARGET_B1  =     0.05117197609596;
            V_TARGET_B0  =     0.94882802390403;
            I_TARGET_B  = '0' ;
            U_TARGET_B  =                    0;
            END;
          END;
        END;
      ELSE DO;
        _ARBFMT_12 = PUT( FREQUENCY_STATUS_97NK , BEST12.);
         %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('2' ) THEN DO;
          _NODE_  =                   19;
          _LEAF_  =                   11;
          P_TARGET_B1  =     0.05707061327695;
          P_TARGET_B0  =     0.94292938672304;
          Q_TARGET_B1  =     0.27715355805243;
          Q_TARGET_B0  =     0.72284644194756;
          V_TARGET_B1  =     0.03798586059264;
          V_TARGET_B0  =     0.96201413940735;
          I_TARGET_B  = '0' ;
          U_TARGET_B  =                    0;
          END;
        ELSE DO;
          _NODE_  =                   20;
          _LEAF_  =                   12;
          P_TARGET_B1  =     0.03801496238469;
          P_TARGET_B0  =      0.9619850376153;
          Q_TARGET_B1  =     0.20021645021645;
          Q_TARGET_B0  =     0.79978354978355;
          V_TARGET_B1  =     0.04048064341255;
          V_TARGET_B0  =     0.95951935658744;
          I_TARGET_B  = '0' ;
          U_TARGET_B  =                    0;
          END;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(FILE_AVG_GIFT ) AND 
        FILE_AVG_GIFT  <               13.615 THEN DO;
        _NODE_  =                   11;
        _LEAF_  =                    4;
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
        IF  NOT MISSING(NUMBER_PROM_12 ) AND 
                          13.5 <= NUMBER_PROM_12  THEN DO;
          _NODE_  =                   16;
          _LEAF_  =                    7;
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
            _NODE_  =                   22;
            _LEAF_  =                    6;
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
            _NODE_  =                   21;
            _LEAF_  =                    5;
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

*****  DECISION VARIABLES *******;

*** Decision Processing;
label D_TARGET_B = 'Decision: TARGET_B' ;
label EP_TARGET_B = 'Expected Profit: TARGET_B' ;

length D_TARGET_B $ 1;

D_TARGET_B = ' ';
EP_TARGET_B = .;

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


*** End Decision Processing ;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

