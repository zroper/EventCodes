clear all
cd ../
cd VWM124_4loc
listing = dir;
list = {listing(4:56).name};
gg = zeros(1,8);
code = 0;
trial = 0;

for pp = 1:max(size(list))
    cur_dir = list{pp};
    cd(cur_dir);
    tag1=0;
    tag2=0;
    tag3=0;
    tag4=0;
    tag5=0;
    tag6=0;
    sess_trial = 0;
    
    load plx_data.mat
    total_ec = plx_data.eventCodes;
    cleaned_ec = total_ec(total_ec==2301|total_ec==2201|total_ec==2202|total_ec==2810|total_ec==2811|total_ec==2600|total_ec==10001|total_ec==10002|total_ec==10003|total_ec==10004);
    cleaned_ec_size = size(cleaned_ec);
    kk = zeros(6,1);
    cleaned_ec = [cleaned_ec;kk];
    tag = zeros(1,max(cleaned_ec_size));
    f(:,8) = zeros(1,max(cleaned_ec_size))';
    
    for zz = 1:max(cleaned_ec_size)
        if cleaned_ec(zz) == 2301 && cleaned_ec(zz+1) ~= 2201
            tag(zz) = 1;
            tag1 = tag1 + 1;
            ss=0;
        end
        if cleaned_ec(zz+1) == 2201
            if cleaned_ec(zz+2) == 10001
                ss = 1;
            elseif cleaned_ec(zz+2) == 10002
                ss = 2;
            elseif cleaned_ec(zz+2) == 10003
                ss = 3;
            elseif cleaned_ec(zz+2) == 10004
                ss = 4;
            end
        end
        if cleaned_ec(zz+2) == 10001 || cleaned_ec(zz+2) == 10002 || cleaned_ec(zz+2) == 10003 || cleaned_ec(zz+2) == 10004 && cleaned_ec(zz+3) ~= 2202
            tag(zz) = 2;
            tag2 = tag2 + 1;
        end
        if cleaned_ec(zz+3) == 2202 && cleaned_ec(zz+4) ~= 2810
            tag(zz) = 3;
            tag3 = tag3 + 1;
        end
        if cleaned_ec(zz+4) == 2810 && cleaned_ec(zz+5) ~= 2811
            tag(zz) = 4;
            tag4 = tag4 + 1;
        end
        if cleaned_ec(zz+5) == 2811 && cleaned_ec(zz+6) ~= 2600
            tag(zz) = 5;
            tag5 = tag5 + 1;
        end
        if cleaned_ec(zz+6) == 2600
            tag(zz) = 6;
            tag6 = tag6 + 1;
        end
        if tag(zz) == 0
            tag(zz) = tag(zz-1);
        end
        if cleaned_ec(zz) == 2301
            trial = trial + 1;
            sess_trial = sess_trial +1;
        end
        code = code + 1;
        plug = [code,zz,pp,trial,sess_trial,cleaned_ec(zz),tag(zz),ss];
        f(zz,:) = plug;
    end
    
    gg = [gg;f];
    
    clear plx_data.mat
    clear sess_trial
    clear cleaned_ec
    clear total_ec
    clear cleaned_ec_size
    clear f
    cd ../
end

head = {'ec_index_all','ec_index_session','session_number','trial_number','ec','tag','ss'};


