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
