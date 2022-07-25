function [] = makeScript(d,num,index,scriptPath)  
stind = num2str(index);  
stnum = num2str(num);  
ScriptFile = [scriptPath stnum '.vbs'];  %create script ScriptFile
fid = fopen(ScriptFile,'wt'); %open ScriptFile and write as text document
%% HFSS脚本头文件
fprintf(fid, 'Dim oAnsoftApp\n');
fprintf(fid, 'Dim oDesktop\n');
fprintf(fid, 'Dim oProject\n');
fprintf(fid, 'Dim oDesign\n');
fprintf(fid, 'Dim oEditor\n');
fprintf(fid, 'Dim oModule\n');
fprintf(fid, '\n');
fprintf(fid, 'Set oAnsoftApp = CreateObject("AnsoftHfss.HfssScriptInterface")\n');
fprintf(fid, 'Set oDesktop = oAnsoftApp.GetAppDesktop()\n');
fprintf(fid, 'oDesktop.RestoreWindow\n');
fprintf(fid, 'oDesktop.OpenProject "%s"\n', [ '.\array\array' stnum '.aedt']);%program name list
fprintf(fid, ['Set oProject = oDesktop.SetActiveProject("array' stnum '")\n']);
fprintf(fid, 'Set oDesign = oProject.SetActiveDesign("HFSSDesign1")\n');
fprintf(fid, '  \n');
%% ChangeProperty
fprintf(fid, 'Set oModule = oDesign.GetModule("ReportSetup") \n');
fprintf(fid, 'oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", Array("NAME:PropServers",  _\n');
fprintf(fid, '  "LocalVariables"), Array("NAME:ChangedProps"');
d
for i =1:7
    fprintf(fid, [', Array("NAME:D' num2str(i) '", "Value:=", "' num2str(d(i)) 'mm")']);
end
fprintf(fid, ')))\n');
fprintf(fid, '  \n');
%% 运行仿真
fprintf(fid, 'oDesign.AnalyzeAll\n');           %run the program

%% Z11输出
fprintf(fid, 'Set oModule = oDesign.GetModule("ReportSetup")\n');
fprintf(fid, 'oModule.CreateReport "Z Plot 1", "Modal Solution Data", "Rectangular Plot",  _\n');
fprintf(fid, ' "Setup1 : Sweep", Array("Domain:=", "Sweep"), Array("Freq:=", Array("All"), "r11:=", Array( _\n');
fprintf(fid, '  "Nominal"), "h1:=", Array("Nominal"), "r2:=", Array("Nominal"), "h2:=", Array( _ \n');
fprintf(fid, '  "Nominal"), "r31:=", Array("Nominal"), "h3:=", Array("Nominal"), "g1:=", Array( _ \n');
fprintf(fid, '  "Nominal"), "D1:=", Array("Nominal"), "D2:=", Array( _ \n');
fprintf(fid, '  "Nominal"), "D3:=", Array("Nominal"), "D4:=", Array("Nominal"), "D5:=", Array( _ \n');
fprintf(fid, '  "Nominal"), "D6:=", Array("Nominal")), Array("X Component:=",  _\n');
fprintf(fid, '  "Freq", "Y Component:=", Array("re(Z(1,1))","im(Z(1,1))")), Array()\n');
dir = strrep(pwd,'\','/');
fprintf(fid,['oModule.ExportToFile "Z Plot 1", "' dir '/result/']);
if index<10       %the result is output as .csv
    fprintf(fid, ['0' stind '/Z110' stind stnum '.csv"\n']);
else
    fprintf(fid, [stind '/Z11' stind stnum '.csv"\n']);
end
fclose(fid);
% end
end