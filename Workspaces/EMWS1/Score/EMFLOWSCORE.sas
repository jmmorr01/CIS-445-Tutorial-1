*------------------------------------------------------------*;
* Score: Creating Fixed Names;
*------------------------------------------------------------*;
LABEL EM_SEGMENT = 'Segment';
EM_SEGMENT = b_TARGET_B;
LABEL EM_EVENTPROBABILITY = 'Probability for level 1 of TARGET_B';
EM_EVENTPROBABILITY = P_TARGET_B1;
LABEL EM_PROBABILITY = 'Probability of Classification';
EM_PROBABILITY =
max(
P_TARGET_B1
,
P_TARGET_B0
);
LENGTH EM_CLASSIFICATION $%dmnorlen;
LABEL EM_CLASSIFICATION = "Prediction for TARGET_B";
EM_CLASSIFICATION = I_TARGET_B;
LENGTH EM_DECISION $%dmnorlen;
LABEL EM_DECISION= "Recommended Decision for TARGET_B";
EM_DECISION = D_TARGET_B;
LABEL EM_PROFIT= "Expected Profit for TARGET_B";
EM_PROFIT = EP_TARGET_B;
LABEL EM_CLASSTARGET = 'Target Variable: TARGET_B';
EM_CLASSTARGET = F_TARGET_B;
