function copyArray(maxDT)
path = '.\d2zheng-noeye.aedt';
for i = 1:maxDT
    copyfile(path,['.\array\array' num2str(i) '.aedt']);
end
