function varargout = Neurofeedback_Tool(varargin)
% NEUROFEEDBACK_TOOL MATLAB code for Neurofeedback_Tool.fig
%      NEUROFEEDBACK_TOOL, by itself, creates a new NEUROFEEDBACK_TOOL or raises the existing
%      singleton*.
%
%      H = NEUROFEEDBACK_TOOL returns the handle to a new NEUROFEEDBACK_TOOL or the handle to
%      the existing singleton*.
%
%      NEUROFEEDBACK_TOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEUROFEEDBACK_TOOL.M with the given input arguments.
%
%      NEUROFEEDBACK_TOOL('Property','Value',...) creates a new NEUROFEEDBACK_TOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Neurofeedback_Tool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Neurofeedback_Tool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Neurofeedback_Tool

% Last Modified by GUIDE v2.5 25-Apr-2018 16:15:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Neurofeedback_Tool_OpeningFcn, ...
                   'gui_OutputFcn',  @Neurofeedback_Tool_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Neurofeedback_Tool is made visible.
function Neurofeedback_Tool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Neurofeedback_Tool (see VARARGIN)

% Choose default command line output for Neurofeedback_Tool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Neurofeedback_Tool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Neurofeedback_Tool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function rectime = sessionDuration_Callback(hObject, eventdata, handles)
time = get(handles.sessionDuration,'String');
rectime = 0;
if isempty(time)
    warndlg('Invalid Session duration provided. Give input as duration in seconds')
end
time = str2double(time);
if any(~(size(time) == [1 1]))
    warndlg('Invalid Session duration provided. Give input as duration in seconds')
elseif ~(time > 0)
    warndlg('Invalid Session duration provided. Give input as duration in seconds')
    return
else
    rectime = time;    
end

% hObject    handle to sessionDuration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sessionDuration as text
%        str2double(get(hObject,'String')) returns contents of sessionDuration as a double


% --- Executes during object creation, after setting all properties.
function sessionDuration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sessionDuration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fbtime = fbTime_Callback(hObject, eventdata, handles)
time = get(handles.fbTime,'String');
if isempty(time)
    warndlg('Invalid Feedback duration provided. Give input as duration in seconds')
end
time = str2double(time);
if any(~(size(time) == [1 1]))
    warndlg('Invalid Feedback duration provided. Give input as duration in seconds')
elseif ~(time > 0)
    warndlg('Invalid Feedback duration provided. Give input as duration in seconds')
else
    fbtime = time;    
end
% hObject    handle to fbTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fbTime as text
%        str2double(get(hObject,'String')) returns contents of fbTime as a double


% --- Executes during object creation, after setting all properties.
function fbTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fbTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in fbChannel.
function fbChannel = fbChannel_Callback(hObject, eventdata, handles)
fbChannel = get(handles.fbChannel, 'Value');
% hObject    handle to fbChannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns fbChannel contents as cell array
%        contents{get(hObject,'Value')} returns selected item from fbChannel


% --- Executes during object creation, after setting all properties.
function fbChannel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fbChannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freqband1Name = freqband1Name_Callback(hObject, eventdata, handles)
name1 = get(handles.freqband1Name,'String');
if isempty(name1)
    warndlg('Invalid frequency name (1) provided. Give input as one single word')
end

if any(~(size(strsplit(name1)) == [1 1]))
    warndlg('Invalid frequency name (1) provided. Give input as one single word')
elseif ~(name1 > 0)
    warndlg('Invalid frequency name (1) provided. Give input as one single word')
else
    freqband1Name = name1;    
end
% hObject    handle to freqband1Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freqband1Name as text
%        str2double(get(hObject,'String')) returns contents of freqband1Name as a double


% --- Executes during object creation, after setting all properties.
function freqband1Name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freqband1Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freqband1Range = freqband1Range_Callback(hObject, eventdata, handles)
freq1 = get(handles.freqband1Range,'String');
if isempty(freq1)
    warndlg('Invalid Freq range (1) provided. Give input as two frequencies in numbers')
end     
try
    freq1 = eval(['[' freq1 ']']);
catch
    warndlg('Invalid Freq range (1) provided. Give input as two frequencies in numbers')
    return
end
if any(~(size(freq1) == [1 2]))
    warndlg('Invalid Freq range (1) provided. Give input as two frequencies in numbers')
elseif ~(freq1 > 0)
    warndlg('Invalid Freq range (1) provided. Give input as two frequencies in numbers')
else
    freqband1Range = freq1;    
end
% hObject    handle to freqband1Range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freqband1Range as text
%        str2double(get(hObject,'String')) returns contents of freqband1Range as a double


% --- Executes during object creation, after setting all properties.
function freqband1Range_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freqband1Range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freqband2Name = freqband2Name_Callback(hObject, eventdata, handles)
name2 = get(handles.freqband2Name,'String');
if isempty(name2)
    warndlg('Invalid frequency name (2) provided. Give input as one single word')
end

if any(~(size(strsplit(name2)) == [1 1]))
    warndlg('Invalid frequency name (2) provided. Give input as one single word')
elseif ~(name2 > 0)
    warndlg('Invalid frequency name (2) provided. Give input as one single word')
else
    freqband2Name = name2;    
end
% hObject    handle to freqband2Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freqband2Name as text
%        str2double(get(hObject,'String')) returns contents of freqband2Name as a double


% --- Executes during object creation, after setting all properties.
function freqband2Name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freqband2Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freqband2Range = freqband2Range_Callback(hObject, eventdata, handles)
freq2 = get(handles.freqband2Range,'String');
if isempty(freq2)
    warndlg('Invalid Freq range (2) provided. Give input as two frequencies in numbers')
end     
try
    freq2 = eval(['[' freq2 ']']);
catch
    warndlg('Invalid Freq range (2) provided. Give input as two frequencies in numbers')
    return
end 
if any(~(size(freq2) == [1 2]))
    warndlg('Invalid Freq range (2) provided. Give input as two frequencies in numbers')
elseif ~(freq2 > 0)
    warndlg('Invalid Freq range (2) provided. Give input as two frequencies in numbers')
else
    freqband2Range = freq2;    
end
% hObject    handle to freqband2Range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freqband2Range as text
%        str2double(get(hObject,'String')) returns contents of freqband2Range as a double


% --- Executes during object creation, after setting all properties.
function freqband2Range_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freqband2Range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function specPlotRange = specPlotRange_Callback(hObject, eventdata, handles)
spec = get(handles.specPlotRange,'String');
if isempty(spec)
    warndlg('Invalid Spectrum range provided. Give input as two frequencies in numbers')
end
try
    spec = eval(['[' spec ']']);
catch
    warndlg('Invalid Spectrum range provided. Give input as two frequencies in numbers')
    return
end 
if any(~(size(spec) == [1 2]))
    warndlg('Invalid Spectrum range provided. Give input as two frequencies in numbers')
elseif ~(spec > 0)
    warndlg('Invalid Spectrum range provided. Give input as two frequencies in numbers')
else
    specPlotRange = spec(1):spec(2);    
end



% --- Executes during object creation, after setting all properties.
function specplotrange = specPlotRange_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in startSession.
function startSession_Callback(hObject, eventdata, handles)
clc
Fs = 256;
recordingChannels = [1:8];
REC.Fs          = Fs;
REC.channels    = recordingChannels;
% Get recording settings from GUI
tic
REC             = getSettings(REC, handles);
fprintf('getting settings takes %d \n', toc)
% set Fs and number of channels

%%
if ~isfield(handles, 'ai')
% if ~exist('ai','var') 
    handles.ai = getMOBIlab(REC);
    guidata(hObject, handles);
end
ai = handles.ai;
global stoprec
stoprec = 0;
if isempty(ai)
    fprintf('No recording hardware detected, no session started \n')
    return
end
band1.power = [];
band2.power = [];
band1.range = REC.band1range;
band2.range = REC.band2range;
ratio = [];
looptime = [];
%%
guidata(hObject, handles)
%% initiate plots
cla(handles.plotTime)
plots.time = plot(handles.plotTime, 0); handles.plotTime.Title.String = 'EEG signal';

cla(handles.plotSpec)
hold(handles.plotSpec, 'on')
plots.spec = plot(handles.plotSpec, 0); 
plots.meanspec = plot(handles.plotSpec, 0); 
handles.plotSpec.Title.String = 'Power spectrum';
hold(handles.plotSpec, 'off')

cla(handles.plotBand1)
hold(handles.plotBand1, 'on')
plots.band1 = plot(handles.plotBand1  ,0); plots.band1mean = plot(handles.plotBand1, 0);
handles.plotBand1.Title.String = REC.band1name;
hold(handles.plotBand1, 'off')

cla(handles.plotBand2)
hold(handles.plotBand2, 'on')
plots.band2 = plot(handles.plotBand2 ,0); plots.band2mean = plot(handles.plotBand2, 0);
handles.plotBand2.Title.String = REC.band2name;
hold(handles.plotBand2, 'off')

cla(handles.plotBandRatio)
hold(handles.plotBandRatio, 'on')
plots.bandratio = plot(handles.plotBandRatio, 0); plots.bandratiomean = plot(handles.plotBandRatio, 0); 
handles.plotBandRatio.Title.String = [REC.band1name '/' REC.band2name ' ratio' ];
hold(handles.plotBandRatio, 'off')
%% start session
try
    set(ai,'SamplesPerTrigger',REC.samples);
    % Start recording
    start(ai); tic;
    % Wait for enough samples to calculate power
    fprintf('Wait for enough samples to calculate power \n')
    while ai.SamplesAcquired <= REC.fbSamples && stoprec == 0; end
    fprintf('Running... \n')
    % Start recording until time elapsed or figure closed
    tic
    while stoprec == 0  && (ai.SamplesAcquired < REC.samples)
        REC = getSettings(REC, handles);
        alldata = peekdata(ai, ai.SamplesAcquired)*10e6;
        
        set(plots.time, 'XData',(1:length(alldata))/Fs,'YData',alldata(:,REC.fbChan));
        [meanPxx, F] = pwelch(bsxfun(@minus,alldata,mean(alldata,1)),REC.fbSamples,round(REC.fbSamples/2),REC.specplotrange,Fs);
        
        fbdata = peekdata(ai, REC.fbSamples)*10e6;
        [Pxx, F] = pwelch(bsxfun(@minus,fbdata,mean(fbdata,1)),REC.fbSamples,round(REC.fbSamples/2),REC.specplotrange,Fs);
        set(plots.spec,'XData',F,'YData',Pxx(:,REC.fbChan));
        set(plots.meanspec,'XData',F,'YData',meanPxx(:,REC.fbChan));
        
        band1.power = [band1.power; bandpower(fbdata,Fs, band1.range)];
        band2.power = [band2.power; bandpower(fbdata,Fs, band2.range)];
        
        set(plots.band1,    'XData',(1:size(band1.power,1))/Fs,'YData',band1.power(:,REC.fbChan));
        set(plots.band1mean,'XData',(1:size(band1.power,1))/Fs,'YData',repmat(mean(band1.power(:,REC.fbChan)),1,size(band1.power,1)));
        
        set(plots.band2,    'XData',(1:size(band2.power,1))/Fs,'YData',band2.power(:,REC.fbChan));
        set(plots.band2mean,'XData',(1:size(band2.power,1))/Fs,'YData',repmat(mean(band2.power(:,REC.fbChan)),1,size(band2.power,1)));
        
        ratio = band1.power./band2.power;
        set(plots.bandratio,    'XData',(1:size(ratio,1))/Fs,'YData',ratio(:,REC.fbChan));
        set(plots.bandratiomean,'XData',(1:size(ratio,1))/Fs,'YData',repmat(mean(ratio(:,REC.fbChan)),1,size(ratio,1)));
        drawnow;
%         guidata(hObject, handles);
%         handles.stopSession
%          stoprec = get(handles.stopSession.stoprec);
        looptime = [looptime toc];
    end
    fprintf('Session ended \n')
catch ME
    %     flushdata(ai);
    if stoprec
        stop(ai);
        fprintf('session manually stopped \n')
    else
        stop(ai)
        fprintf('Session stopped unexpectedly.. \n')
        errordlg('Some unexpected error ocurred, see command window for more details')
        rethrow(ME)
    end
end
try
handles.ai = ai;
handles.stopSession
%% create structure with all recording settings and data to save
nfb.REC            = REC;
nfb.data           = getdata(ai, ai.SamplesAcquired);
nfb.power.band1    = band1.power;
nfb.power.band2    = band2.power;
nfb.power.ratio    = ratio;
nfb.looptime       = looptime;
guidata(hObject, handles);
%% Ask user whether to save data or not
answer = questdlg('Save data?','save','Yes','No','Yes');
if strcmp(answer, 'Yes')
    savedata = 1;
else
    savedata = 0;
end
if savedata
    uisave('nfb',[cd '\Data\feedbackdata'])
    fprintf('Data saved \n')
end

fprintf('Done!\n')
catch ME 
    errordlg('Some unexpected error ocurred, see command window for more details')
    rethrow(ME)
end

function stopSession_CreateFcn(hObject, eventdata, handles)
handles.stopSession.stoprec = 0;
guidata(hObject,handles);

% --- Executes on button press in stopSession.
function stopSession_Callback(hObject, eventdata, handles)
global stoprec
stoprec = 1;


function recSettings = getSettings(recSettings, handles)
recSettings.time = sessionDuration_Callback([], [], handles);
recSettings.fbTime = fbTime_Callback([], [], handles);
recSettings.fbChan = fbChannel_Callback([], [], handles);
recSettings.specplotrange = specPlotRange_Callback([], [], handles);
recSettings.band1range = freqband1Range_Callback([], [], handles);
recSettings.band1name = freqband1Name_Callback([], [], handles);
recSettings.band2range = freqband2Range_Callback([], [], handles);
recSettings.band2name = freqband2Name_Callback([], [], handles);
% translate recording and feedback time-windows to samples
recSettings.samples     = recSettings.time * recSettings.Fs; % duration of recording in samples
recSettings.fbSamples   = round(recSettings.fbTime*recSettings.Fs); % sample window used for feedback

% fprintf(['Recording duration:        %d \n' ...
%         'Feedback time window:      %d \n' ...
%         'Feedback channel:          %d \n'], ...
%         recSettings.time, recSettings.fbTime, recSettings.fbChan);
