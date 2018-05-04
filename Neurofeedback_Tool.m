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

% Last Modified by GUIDE v2.5 02-May-2018 15:21:23

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
if ~exist([cd filesep 'Data'],'dir')
    mkdir('Data')
end
addpath([cd filesep 'Data'])
addpath([cd filesep 'Functions'])
handles = getSettings(handles);
[~, handles] = initiatePlots(handles);

guidata(hObject, handles);

% UIWAIT makes Neurofeedback_Tool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Neurofeedback_Tool_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;


function rectime = sessionDuration_Callback(hObject, eventdata, handles)
time = get(handles.sessionDuration,'String');
rectime = 0;
if isempty(time)
    warndlg('Invalid Session duration provided. Give input as duration in seconds')
end
time = str2double(time);
if any(~(size(time) == [1 1])) || ~(time > 0)
    warndlg('Invalid Session duration provided. Give input as duration in seconds')
    return
else
    rectime = time;
end

% --- Executes during object creation, after setting all properties.
function sessionDuration_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function fbtime = fbTime_Callback(hObject, eventdata, handles)
time = get(handles.fbTime,'String');
if isempty(time)
    warndlg('Invalid Feedback duration provided. Give input as duration in seconds')
end
time = str2double(time);
if any(~(size(time) == [1 1])) || ~(time > 0)
    warndlg('Invalid Feedback duration provided. Give input as duration in seconds')
else
    fbtime = time;
end

% --- Executes during object creation, after setting all properties.
function fbTime_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in fbChannel.
function fbChannel = fbChannel_Callback(hObject, eventdata, handles)
fbChannel = get(handles.fbChannel, 'Value');

% --- Executes during object creation, after setting all properties.
function fbChannel_CreateFcn(hObject, eventdata, handles)
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
else
    freqband1Name = name1;
end

% --- Executes during object creation, after setting all properties.
function freqband1Name_CreateFcn(hObject, eventdata, handles)
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
if any(~(size(freq1) == [1 2])) || any((freq1 < 0)) || (freq1(1) > freq1(2))
    warndlg('Invalid Freq range (1) provided. Give input as two frequencies in numbers')
else
    freqband1Range = freq1;
end

% --- Executes during object creation, after setting all properties.
function freqband1Range_CreateFcn(hObject, eventdata, handles)
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
else
    freqband2Name = name2;
end

% --- Executes during object creation, after setting all properties.
function freqband2Name_CreateFcn(hObject, eventdata, handles)
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
if any(~(size(freq2) == [1 2])) || any((freq2 < 0)) || (freq2(1) > freq2(2))
    warndlg('Invalid Freq range (2) provided. Give input as two frequencies in numbers')
else
    freqband2Range = freq2;
end

% --- Executes during object creation, after setting all properties.
function freqband2Range_CreateFcn(hObject, eventdata, handles)
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
if any(~(size(spec) == [1 2])) || (spec(1) > spec(2)) || any((spec < 0 ))
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
global stoprec
stoprec = 0;
try
    handles.startSession.Enable = 'off';
    clc    
    %% If no recording hardware is connected try to connect
    if ~isfield(handles, 'ai')
        [handles.ai, handles.REC] = getMOBIlab(handles.REC);
        guidata(hObject, handles);
    end
    ai = handles.ai;
    if isempty(ai)
        fprintf('No recording hardware detected, no session started \n')
        return
    end
    
    %% Get recording settings from GUI
    handles = getSettings(handles);
    Fs  = handles.REC.Fs;
    handles.REC.threshold.abs   = 250;
    handles.REC.threshold.peak  = 200;
    handles.REC.threshold.SNR   = 1;
    REC = handles.REC;
    guidata(hObject, handles);
    
    %% initiate variables
    alldata     = [];
    band1.power = [];
    band2.power = [];
    band1.mean  = [];
    band2.mean  = [];
    band1.range = REC.band1range;
    band2.range = REC.band2range;
    ratio   = [];
    ratioMean = [];
    minPow  = [];
    maxPow  = [];
    relPow  = [];
    looptime = [];
    player  = 0;
    
    %% get song
    if isfield(handles,'song')
        song = handles.song;
    else
        fprintf('No song selected to play... \n')
    end
    %%
    guidata(hObject, handles)
    %% initiate plots
    allaxes = findall(handles.output, 'type','axes');
    for i = 1:length(allaxes)
        cla(allaxes(i))
    end
    [plots, handles] = initiatePlots(handles);

    %% start session
    try
        set(ai,'SamplesPerTrigger',REC.samples);
        % Start recording
        start(ai); tic;
        % Wait for enough samples to calculate power
        fprintf('Wait for enough samples to calculate power \n')
        hwait = waitbar(0,'Getting data..');
        while ai.SamplesAcquired <= REC.fbSamples && stoprec == 0;
            waitbar(mod(ai.SamplesAcquired,REC.Fs)/REC.Fs ,hwait);
        end
        fbdata = peekdata(ai, REC.fbSamples)*1e6;
        while (ai.SamplesAcquired < REC.samples) ... % until session ends
                && (  ...
                    any(any(abs(fbdata(:,REC.fbChan)) > REC.threshold.abs)) ... % check absolute threshold
                    || ...
                    any(any(abs(diff(fbdata(:,REC.fbChan))) > REC.threshold.peak))... % check peak-to-peak threshold
                    )
            fbdata = peekdata(ai, REC.fbSamples)*1e6;
            waitbar(mod(ai.SamplesAcquired,REC.fbSamples)/REC.Fs, hwait, 'waiting for good signal')
        end
        delete(hwait);
        fprintf('Running... \n')
        % Start recording until time elapsed or figure closed
        tic
        if isfield(handles,'song'); play(handles.song); end
        while stoprec == 0  && ai.SamplesAcquired < REC.samples && strcmp(ai.Running, 'On')
            handles = getSettings(handles);
            alldata = peekdata(ai, ai.SamplesAcquired)*1e6;
            meanPxx = pwelch(bsxfun(@minus,alldata,mean(alldata,1)),REC.fbSamples,round(REC.fbSamples/2),REC.specplotrange,Fs);
            fbdata = peekdata(ai, REC.fbSamples)*1e6;
            [Pxx, F] = pwelch(bsxfun(@minus,fbdata,mean(fbdata,1)),REC.fbSamples,round(REC.fbSamples/2),REC.specplotrange,Fs);
            band1.power = [band1.power; bandpower(fbdata,Fs, band1.range)];
            band2.power = [band2.power; bandpower(fbdata,Fs, band2.range)];
            band1.mean  = [band1.mean; mean(mean(band1.power(:,REC.fbChan),1),2) ];
            band2.mean  = [band2.mean; mean(mean(band2.power(:,REC.fbChan),1),2) ];
            
            
            ratio = mean(band1.power(:,REC.fbChan),2)./mean(band2.power(:,REC.fbChan),2);
            ratioMean = [ ratioMean ; mean(ratio) ] ;
            minPow = min(ratio(:,REC.fbChan));
            maxPow = max(ratio(:,REC.fbChan));
            if any(any(abs(fbdata(:,REC.fbChan)) > REC.threshold.abs)) ... % check absolute threshold
                    || any(any(abs(diff(fbdata(:,REC.fbChan))) > REC.threshold.peak)) % check peak-to-peak threshold
                relPow =[relPow relPow(end)];
            else
                relPow = [relPow ((ratio(end,REC.fbChan) -minPow) / (maxPow - minPow))];
            end
            looptime = [looptime toc];
            
            % update plots
            dispTime = 5;          % plot last x seconds of data;
            if dispTime*Fs > size(alldata,1) ; dispTime = REC.fbTime; end
            dispData = alldata(end-(REC.Fs*dispTime-1):end,REC.fbChan)';
            dispData = dispData -mean(dispData);
            set(plots.time,         'XData',(1:length(dispData))/Fs,'YData',dispData);
            set(plots.spec,         'XData',F,'YData',Pxx(:,REC.fbChan));
            set(plots.meanspec,     'XData',F,'YData',meanPxx(:,REC.fbChan));
            set(plots.band1,        'XData',looptime+REC.fbTime,'YData',band1.power(:,REC.fbChan));
            set(plots.band1mean,    'XData',looptime+REC.fbTime,'YData',band1.mean(:,REC.fbChan));
            set(plots.band2,        'XData',looptime+REC.fbTime,'YData',band2.power(:,REC.fbChan));
            set(plots.band2mean,    'XData',looptime+REC.fbTime,'YData',band2.mean(:,REC.fbChan));
            set(plots.ratio,        'XData',looptime+REC.fbTime,'YData',ratio(:,REC.fbChan));
            set(plots.ratiomean,    'XData',looptime+REC.fbTime,'YData',ratioMean);
            set(plots.output,       'XData',looptime+REC.fbTime,'YData',relPow);
            drawnow;
            player = playNoise(1-relPow(end), mean(diff(looptime))*1.5);
        end
        if strcmp(ai.Running, 'On'); stop(ai); end
        if isfield(handles,'song') && handles.song.isplaying;  stop(song);     end
        if player;   stop(player);   end
        fprintf('Session ended \n')
        fprintf('Average loop duration was %2.4f seconds \n',mean(diff(looptime)))
    catch ME
        W = who;
        putvar(W{:})
        if stoprec
            stop(ai); fprintf('recording stopped \n')
            if isfield(handles,'song') && handles.song.isplaying;     stop(song);     end
            if player;   stop(player);   end
            fprintf('Session manually stopped \n')
        else
            stop(ai); fprintf('recording stopped \n')
            fprintf('Session stopped unexpectedly.. \n')
            errordlg('Some unexpected error ocurred, see command window for more details')
            rethrow(ME)
        end
        handles.startSession.Enable = 'on';
    end
    try
        handles.ai = ai;
        
        %% create structure with all recording settings and data to save
        nfb.REC            = REC;
        nfb.data           = alldata;
        nfb.power.band1    = band1.power;
        nfb.power.band2    = band2.power;
        nfb.power.ratio    = ratio;
        nfb.looptime       = looptime;
        nfb.power.minPow   = minPow;
        nfb.power.maxPow   = maxPow;
        nfb.power.relPow   = relPow;
        guidata(hObject, handles);
        assignin('base','nfb',nfb);
        %% Ask user whether to save data or not
        if any(alldata)
            answer = questdlg('Save data?','save','Yes','No','Yes');
            if strcmp(answer, 'Yes')
                uisave('nfb',[cd filesep 'Data' filesep 'feedbackdata.mat'])
                fprintf('Data saved \n')
            end
        end
        handles.startSession.Enable = 'on';
        fprintf('Done!\n')
    catch ME
        errordlg('Some unexpected error ocurred, see command window for more details')
        rethrow(ME)
    end
catch ME
    handles.startSession.Enable = 'on';
    errordlg('Some unexpected error ocurred, see command window for more details')
    rethrow(ME)
end

% --- Executes on button press in stopSession.
function stopSession_Callback(hObject, eventdata, handles)
global stoprec
stoprec = 1;

function handles = getSettings(handles)
if isfield(handles, 'REC')
    REC = handles.REC;
end
REC.time            = sessionDuration_Callback([], [], handles);
REC.fbTime          = fbTime_Callback([], [], handles);
REC.fbChan          = fbChannel_Callback([], [], handles);
REC.specplotrange   = specPlotRange_Callback([], [], handles);
REC.band1range      = freqband1Range_Callback([], [], handles);
REC.band1name       = freqband1Name_Callback([], [], handles);
REC.band2range      = freqband2Range_Callback([], [], handles);
REC.band2name       = freqband2Name_Callback([], [], handles);
% translate recording and feedback time-windows to samples
if isfield(REC,'Fs')
    REC.samples         = REC.time * REC.Fs; % duration of recording in samples
    REC.fbSamples       = round(REC.fbTime*REC.Fs); % sample window used for feedback
end
handles.REC = REC;


% --- Executes on button press in loadSong.
function loadSong_Callback(hObject, eventdata, handles)
[songName, songPath] = uigetfile({'*.mp3','*.wav'},'Select music file');
if songName
    if ~ismember(songName(end-2:end), {'mp3','wav'})
        warndlg('No sure if this is a readable music file, try another..')
        return
    else
        [y, Fs] = audioread([songPath, songName]);
        songDuration = size(y,1)/Fs ;
        repeats = ceil(handles.REC.time / songDuration);
        y = repmat(y,repeats,1);
        fprintf([...
            'The song loaded is %s and has a duration of %2.2f sec (or %2.2f min). \n' ...
            'It will be played %d times to match the session duration of %d sec\n' ...
            ], ...
            songName, songDuration, songDuration/60, repeats, handles.REC.time);
        handles.song = audioplayer(y,Fs);
        guidata(hObject, handles)
    end
end
