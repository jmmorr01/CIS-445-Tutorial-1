proc sort data= EMWS1.Score_SCORE out= bestlist;
by descending ep_target_b;
run;
proc print data= bestlist;
var control_number ep_target_b;
run;
