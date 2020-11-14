pulrecsig;
% costasloop.m simulate costas loop with input from pulrecsig.m
r=rsc;                                % rsc from pulrecsig.m
fl=500; ff=[0 .01 .02 1]; fa=[1 1 0 0];
h=firpm(fl,ff,fa);                    % LPF design
mu=.003;                              % algorithm stepsize
f0=1000;                              % freq. at receiver
theta=zeros(1,length(t)); theta(1)=0; % estimate vector
zs=zeros(1,fl+1); zc=zeros(1,fl+1);   % buffers for LPFs
for k=1:length(t)-1                   % z contains past inputs
    zs=[zs(2:fl+1), 2*r(k)*sin(2*pi*f0*t(k))];
    zc=[zc(2:fl+1), 2*r(k)*cos(2*pi*f0*t(k))];
    lpfs=fliplr(h)*zs'; 
    lpfc=fliplr(h)*zc'; % output of filters
    
    lpfs_c = lpfs * cos(theta(k));
    lpfs_s = lpfs * sin(theta(k));
    lpfc_c = lpfc * cos(theta(k));
    lpfc_s = lpfc * sin(theta(k));
    
    update_dir = (lpfc_c - lpfs_s)*(lpfc_s + lpfs_c);
    
    theta(k+1)=theta(k)-mu*update_dir;   % algorithm update
end

plot(t,theta),
title('Phase Tracking via the Costas Loop')
xlabel('time'); ylabel('phase offset')
