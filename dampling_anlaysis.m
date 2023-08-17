t=data26_20(100:499,1);
signall=data26_20(100:499,2);%TGS signal here I use data from grating period 13um after charging 20 hours
ssignal=spline(t, signall, t)
f = fit(t,signall,'smoothingspline','SmoothingParam',0.9999906426046482);
plot(f,data26_20(100:499,1),ssignal);
hold on
difference =feval(f, t);

xlabel('Time');
ylabel('Difference');
title('Difference between Signal Data and Fitting');
hold on
[upper_env, lower_env] = envelope(data26_20(100:499,2));
plot(t, upper_env,'*');
hold on 
plot(t, lower_env,'*');
hold on
plot(t, upper_env-lower_env,'^');
xlabel('Time');
ylabel('Upper Envelope');
title('Upper Envelope of the Difference');
signalenv26_20=data26_20(100:499,:);
signalenv26_20(:,1)=t;
realev=upper_env-lower_env
signalenv26_20(:,2)=realev;
realsignalenv26_20=signalenv26_20(1:200,:);
realev=realsignalenv26_20(:,2)
t=realsignalenv26_20(:,1);
%then use fitting funtion tool box choose exponetial fitting to fit realev,t