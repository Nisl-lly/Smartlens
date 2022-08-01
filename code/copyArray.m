function copyArray(maxDT)
path = '.\model.aedt';
for i = 1:maxDT
    copyfile(path,['.\array\array' num2str(i) '.aedt']);
end
