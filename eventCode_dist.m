clear all
% cd ../
% cd VWM124_4loc
listing = dir;
list = {listing(4:5).name};
row = 1;

% for pp = 1:max(size(list))
%     cur_dir = list{pp};
%     cd(cur_dir);

    load Cajal_scalar_data.mat
    total_ec_size = Cajal_data.scalars.EVNT.data;
    g=unique(Cajal_data.scalars.EVNT.data);
    g_size=size(g);
    

    for tt = 1:g_size(2)
        m = find(Cajal_data.scalars.EVNT.data==g(tt));
        m_size = size(m);
        h(tt) = m_size(2);
        if g(tt) == 2301 || g(tt) == 2810 || g(tt) == 2600 || g(tt) == 887 || g(tt) == 888 || g(tt) == 2756 || g(tt) == 2620
            columns= [row, g(tt),h(tt)];
            data_pruned(row,:) = columns;
            row = row +1;
        end
    end
    
    t = [g',h'];
%     pre = {'data'};
%     info = [pre, cur_dir];
%     cur_dir_str = strjoin(info, '_');
%     f.(cur_dir_str)=t;
%     clear Cajal_scalar_data.mat
%     clear t
% 
%     clear h
%     cd ../
% end


