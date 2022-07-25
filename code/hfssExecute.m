function hfssExecute(hfssExePath, ScriptFile, iconMode, runAndExit)
%iconMode If set to false, HFSS will run in normal mode, otherwise it will run in "iconified" mode
%runAndExitIf set to true, HFSS will run the given script, if set to false, HFSS will run and write the script
if (nargin < 2)     %nargin,Determine the number of input variables
    error('Insufficient number of arguments !');
elseif (nargin < 3)
    iconMode = [];
    runAndExit = [];
end
if isempty(iconMode)
    iconMode = true;
end
if isempty(runAndExit)
    runAndExit = true;
end
if (iconMode == true)
    iconStr = '/Iconic';
else
    iconStr = '';
end
% Setup Run and Exit Mode.
if (runAndExit)
    runStr = '/RunScriptAndExit';
else
    runStr = '/RunScript';
end
% Create the Command Path.
cmdHFSS = [hfssExePath, ' ', iconStr, ' ', runStr, ' ' ,  ScriptFile];
% Execute the Command.
fprintf('    Running HFSS using %s ...\n\n', cmdHFSS);
[Status, ~] = system(cmdHFSS);
if (Status ~= 0)
    warning('HFSS Execution returned an error status !');
end
