function enableSettings(handles, OnOff)
if OnOff == 1
    handles.fbTime.Enable           = 'on';
    handles.startSession.Enable     = 'on';
    handles.freqband1Name.Enable    = 'on';
    handles.freqband2Name.Enable    = 'on';
    handles.freqband1Range.Enable   = 'on';
    handles.freqband2Range.Enable   = 'on';
    handles.sessionDuration.Enable  = 'on';
elseif OnOff == 0
    handles.fbTime.Enable           = 'off';
    handles.startSession.Enable     = 'off';
    handles.freqband1Name.Enable    = 'off';
    handles.freqband2Name.Enable    = 'off';
    handles.freqband1Range.Enable   = 'off';
    handles.freqband2Range.Enable   = 'off';
    handles.sessionDuration.Enable  = 'off';
end