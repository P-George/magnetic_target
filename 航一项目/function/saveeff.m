function result =   savecoeff(filepath,data)
date_now = datestr(now,'yyyy-mm-dd');
dirname = ['Coefficient/',date_now];

if(exist(dirname,'dir')==0)
    mkdir(dirname)
else
end
savepath = [dirname ,'/',filepath];

save(savepath,'data');
result = 1;
end