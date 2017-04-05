
trial_coor=[plx_data.ms(2:end)',plx_data.HE,plx_data.VE];
trial_events = [plx_data.eventTimes, plx_data.eventCodes];
ppp = zeros(1,4);

% for zz = 1:max(size(trial_events))
%     l = trial_events(zz,1);
%     ppp(zz,1:3) = trial_coor(l,:);
%     ppp(zz,4) = trial_events(zz,2);
% end

for zz = 1:max(size(trial_coor))
    try
        l = trial_events(zz,1);
    catch
    end
    ppp(zz,1:3) = trial_coor(zz,:);
    if l == trial_coor(zz,1)
        ppp(zz,4) = trial_events(zz,2);
    end
    l = 0;
end