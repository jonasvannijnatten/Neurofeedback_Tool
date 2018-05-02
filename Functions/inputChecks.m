function correct = inputChecks(inputVar, inputType, inputNumel)
correct = 0;
if strcmp(inputType, 'Number')    
    if ischar(inputVar)
        warndlg('Invalid Session duration provided. Give input as duration in seconds')
    elseif any(~(size(inputVar) == [1 inputNumel]))
        warndlg('Invalid Session duration provided. Give input as duration in seconds')
    elseif ~(inputVar > 0)
        warndlg('Invalid Session duration provided. Give input as duration in seconds')
    else
        
    end
end
