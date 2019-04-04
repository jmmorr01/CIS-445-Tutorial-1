drop _temp_;
if (P_TARGET_B1 ge 0.09650392136737) then do;
b_TARGET_B = 1;
end;
else
if (P_TARGET_B1 ge 0.08334701982093) then do;
b_TARGET_B = 2;
end;
else
if (P_TARGET_B1 ge 0.07450995410575) then do;
b_TARGET_B = 3;
end;
else
if (P_TARGET_B1 ge 0.06413874301704) then do;
b_TARGET_B = 4;
end;
else
if (P_TARGET_B1 ge 0.06341049257326) then do;
b_TARGET_B = 5;
end;
else
if (P_TARGET_B1 ge 0.05975847538898) then do;
b_TARGET_B = 6;
end;
else
if (P_TARGET_B1 ge 0.05133961631106) then do;
_temp_ = dmran(1234);
b_TARGET_B = floor(7 + 2*_temp_);
end;
else
if (P_TARGET_B1 ge 0.04855344944745) then do;
b_TARGET_B = 9;
end;
else
if (P_TARGET_B1 ge 0.04518616684771) then do;
_temp_ = dmran(1234);
b_TARGET_B = floor(10 + 2*_temp_);
end;
else
if (P_TARGET_B1 ge 0.03919242423951) then do;
b_TARGET_B = 12;
end;
else
if (P_TARGET_B1 ge 0.0364494773849) then do;
_temp_ = dmran(1234);
b_TARGET_B = floor(13 + 4*_temp_);
end;
else
if (P_TARGET_B1 ge 0.03444205040038) then do;
b_TARGET_B = 17;
end;
else
do;
_temp_ = dmran(1234);
b_TARGET_B = floor(18 + 3*_temp_);
end;
