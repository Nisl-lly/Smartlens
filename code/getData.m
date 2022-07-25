function fits = getData(num,index,pop1)
if index <10
    filenameZ = ['.\result\0' num2str(index) '\Z110' num2str(index) num2str(num) '.csv'];
else
    filenameZ = ['.\result\' num2str(index) '\Z11' num2str(index) num2str(num) '.csv'];
end
if exist(filenameZ,'file')
%% Extract Z11 data
ODataZ = importdata(filenameZ);  %Load filename data into 0Data
dataZ = ODataZ.data;
dataFre = dataZ(:,1);
dataZ(:,1) = [];
dataZ;
%% fitness function
n=find(dataFre==922);
mzr=dataZ(n,1)
mzi=dataZ(n,2)
m1=abs(mzr-30.53)+abs(mzi-211.81);
Freq = [];
if (mzi>mzr) 
        fits = m1;
        A(1,1) = mzr;
        A(1,2) = mzi;
        A(1,3:9) = pop1;
        filenameParameter='.\parameter\test.txt';
        fid = fopen(filenameParameter,'a');
        fprintf(fid,'%.4f ',A);
        fprintf(fid,'\n');
        A=[];
else
    fits = m1;
end
else 
    fits=inf;
end
fits
end