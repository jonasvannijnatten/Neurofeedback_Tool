function [plots, handles] = initiatePlots(handles)
REC = handles.REC;

% plot raw EEG signal
plots.time = plot(handles.plotTime, 0); handles.plotTime.Title.String = 'EEG signal';
% set(handles.plotTime, 'XLim', [-Inf Inf])
% set(handles.plotTime, 'YLim',[-50 50])

% plot power spectrum
hold(handles.plotSpec, 'on')
plots.spec = plot(handles.plotSpec, 0);
plots.meanspec = plot(handles.plotSpec, 0);
handles.plotSpec.Title.String = 'Power spectrum';
hold(handles.plotSpec, 'off')

% plot power of frequency band 1
hold(handles.plotBand1, 'on')
plots.band1 = plot(handles.plotBand1  ,0); plots.band1mean = plot(handles.plotBand1, 0);
handles.plotBand1.Title.String = REC.band1name;
hold(handles.plotBand1, 'off')
set(handles.plotBand1, 'XLim', [0 REC.time])
% set(handles.plotBand1, 'YLim',[-Inf Inf])

% plot power of frequency band 2
hold(handles.plotBand2, 'on')
plots.band2 = plot(handles.plotBand2 ,0); plots.band2mean = plot(handles.plotBand2, 0);
handles.plotBand2.Title.String = REC.band2name;
hold(handles.plotBand2, 'off')
set(handles.plotBand2, 'XLim', [0 REC.time])
% set(handles.plotBand2, 'YLim',[-Inf Inf])

% plot ratio of frequeny band powers
hold(handles.plotBandRatio, 'on')
plots.ratio = plot(handles.plotBandRatio, 0); plots.ratiomean = plot(handles.plotBandRatio, 0);
handles.plotBandRatio.Title.String = [REC.band1name '/' REC.band2name ' ratio' ];
hold(handles.plotBandRatio, 'off')
set(handles.plotBandRatio, 'XLim', [0 REC.time])
% set(handles.plotBandRatio, 'YLim',[-Inf Inf])

% plot level of the output signal
plots.output = plot(handles.outputSignal, 0);
handles.outputSignal.Title.String = 'Output Signal';
set(handles.outputSignal, 'XLim', [0 REC.time])
% set(handles.outputSignal, 'YLim',[-Inf Inf])
