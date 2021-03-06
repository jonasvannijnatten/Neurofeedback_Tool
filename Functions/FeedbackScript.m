% Script designed to test Neurofeedback parameters
% Written by Jonas van Nijnatten, J.J.vanNijnatten@uva.nl

% The script records one EEG channel and visualizes
%   - The raw EEG signal
%   - the actual and average power spectrum
%   - the actual and average power of two selected frequency bands
%   - the actual and average power ratio of two selected frequency bands

% set recording and feedback parameters
Fs = 256; % Sampling frequency: do not change!

%% Setting feedback parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
REC.channels = 1:8;         % channels which are recorded
REC.fbchan = 3;             % channel used for feedback
REC.time = 20;              % duration of recording in seconds
REC.fbTime = 2;             % time window used for feedback
band1.range = [8 15];       % range of frequency band 1
band1.name  = 'alpha';      % name  of frequency band 1
band2.range = [20 30];      % range of frequency band 2
band2.name  = 'beta';       % name  of frequency band 2
specplotrange = 5:60;       % frequency range displayed in power spectrum

%%
REC.Fs = Fs;
REC.samples = REC.time * Fs; % duration of recording in samples
REC.fbSamples = round(REC.fbTime*Fs); % sample window used for feedback

%% Preparing recording hardware %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if ~exist('ai','var')    
    % Detect & connect recodrding hardware
    fprintf('searching for EEG hardware\n');
    try
        daqinfo = daqhwinfo('gmlplusdaq');
    catch ME
        errordlg('Some unexpected error ocurred, check whether the hardware is connected correctly')
        rethrow(ME)
    end
    % If connection fials, reset and try again
    if isempty(daqinfo.InstalledBoardIds) || length(daqinfo.InstalledBoardIds) > 1
        fprintf('Unable to connect with the hardware, trying 2nd time... \n')
        try
            daqreset
            daqinfo = daqhwinfo('gmlplusdaq');
        catch
            errordlg('Some unexpected error ocurred, check whether the hardware is connected correctly')
            rethrow(ME)
        end
    end
    if isempty(daqinfo.InstalledBoardIds) || length(daqinfo.InstalledBoardIds) > 1
        errordlg('Still unable to connect with recording hardware, quitting this session')
        return
    else
        fprintf('Device found, setting up connection\n')
        % when hardware has been found, initiate recording session
        ai = analoginput('gmlplusdaq',daqinfo.InstalledBoardIds{1});
        
        % add channels to record
        for ichan = 1:length(REC.channels)
            addchannel(ai,ichan);
        end
    end
else
    flushdata(ai)
end
fprintf('Connection established with %s on comport %s \n', ...
    daqinfo.BoardNames{1}, daqinfo.InstalledBoardIds{1})
%%
try
    %% initiate figures and power values %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    close all
    mainFig = figure(1);
    subplot(3,2,1); plots.time = plot(0); title('EEG signal')
    subplot(3,2,2); plots.spec = plot(0); hold on; plots.meanspec = plot(0); hold off;
    title('power spectrum')
    subplot(3,2,3); plots.band1 = plot(0); hold on; plots.band1mean = plot(0); hold off;
    title(band1.name)
    subplot(3,2,4); plots.band2 = plot(0); hold on; plots.band2mean = plot(0); hold off;
    title(band2.name)
    subplot(3,2,5); plots.bandratio = plot(0); hold on; plots.bandratiomean = plot(0); hold off;
    title([band1.name ' / ' band2.name ' ratio'])
    
    recdata = [];
    band1.power = [];
    band2.power = [];
    ratio = [];
    %% Set recording parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Set recording duration 
    set(ai,'SamplesPerTrigger',REC.samples);
    stoprec = 0;
    % Start recording
    start(ai); tic;
    % Wait for enough samples to calculate power
    fprintf('Wait for enough samples to calculate power \n')
    while ai.SamplesAcquired <= feedbackSamples && stoprec == 0; end
    fprintf('Running... \n')
    % Start recording until time elapsed or figure closed
    while stoprec == 0  && ai.SamplesAcquired < REC.samples
 
        data = peekdata(ai, ai.SamplesAcquired)*10e6;
        
        set(plots.time, 'XData',(1:length(data))/Fs,'YData',data(:,REC.fbchan));
        [meanPxx, F] = pwelch(data,feedbackSamples,round(feedbackSamples/2),specplotrange,Fs);
        
        data = peekdata(ai, feedbackSamples)*10e6;
        [Pxx, F] = pwelch(data,feedbackSamples,round(feedbackSamples/2),specplotrange,Fs);
        set(plots.spec,'XData',F,'YData',Pxx(:,REC.fbchan));
        set(plots.meanspec,'XData',F,'YData',meanPxx(:,REC.fbchan));
        
        band1.power = [band1.power; bandpower(data,Fs, band1.range)];
        band2.power = [band2.power; bandpower(data,Fs, band2.range)];
        
        set(plots.band1,    'XData',(1:size(band1.power,1))/Fs,'YData',band1.power(:,REC.fbchan));
        set(plots.band1mean,'XData',(1:size(band1.power,1))/Fs,'YData',repmat(mean(band1.power(:,REC.fbchan)),1,size(band1.power,1)));
        drawnow;
        
        set(plots.band2,    'XData',(1:size(band2.power,1))/Fs,'YData',band2.power(:,REC.fbchan));
        set(plots.band2mean,'XData',(1:size(band2.power,1))/Fs,'YData',repmat(mean(band2.power(:,REC.fbchan)),1,size(band2.power,1)));
        
        ratio = band1.power./band2.power;
        set(plots.bandratio,    'XData',(1:size(ratio,1))/Fs,'YData',ratio(:,REC.fbchan));
        set(plots.bandratiomean,'XData',(1:size(ratio,1))/Fs,'YData',repmat(mean(ratio(:,REC.fbchan)),1,size(ratio,1)));
        drawnow;
        if ~ishghandle(mainFig)
            stoprec = 1;
        end
    end
    fprintf('Session ended \n')
catch ME
    %     flushdata(ai);
    if ~ishghandle(mainFig)
        stop(ai);
        fprintf('session manually stopped \n')
    else
        stop(ai)
        fprintf('Session stopped unexpectedly.. \n')
        errordlg('Some unexpected error ocurred, see command window for more details')
        rethrow(ME)
    end
end

%% create structure with all recording settings and data to save
feedback.REC            = REC;
feedback.data           = getdata(ai, ai.SamplesAcquired);
feedback.power.band1    = band1.power;
feedback.power.band2    = band2.power;
feedback.power.ratio    = ratio;

%% Ask user whether to save data or not
answer = questdlg('Save data?','save','Yes','No','Yes');
if strcmp(answer, 'Yes')
    savedata = 1;
else
    savedata = 0;
end
if savedata
    uisave('feedback',[cd '\Data\feedbackdata'])
    fprintf('Data saved \n')
end

fprintf('Done!\n')