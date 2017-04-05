ec = Cajal_data.scalars.EVNT.data;
ec = ec(ec~=0);
ec = ec';

start = find(ec==1666);
stop = find(ec==2999);

size_start = size(start);
num_trials = size_start(1);

%par = zeros(60, num_trials);

for mm = 1:num_trials
     infos = ec(start(mm):stop(mm));
     num_ec_for_trial = stop(mm) - start(mm)+1;
     par(1:num_ec_for_trial,mm) = infos;
end

size_ec = size(ec);
num_ec = size_ec(1);
trial = 1;

for zz = 1:num_ec-50
    if ec(zz) == 2998
        for xx=1:50
            gar(xx,trial) = ec(zz+xx);
        end
        trial = trial + 1;    
    end
end
 