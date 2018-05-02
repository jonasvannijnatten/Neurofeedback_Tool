function [plots, handles] = initiatePlots(handles, REC)
    plots.time = plot(handles.plotTime, 0); handles.plotTime.Title.String = 'EEG signal';
    
    hold(handles.plotSpec, 'on')
    plots.spec = plot(handles.plotSpec, 0);
    plots.meanspec = plot(handles.plotSpec, 0);
    handles.plotSpec.Title.String = 'Power spectrum';
    hold(handles.plotSpec, 'off')
    
    hold(handles.plotBand1, 'on')
    plots.band1 = plot(handles.plotBand1  ,0); plots.band1mean = plot(handles.plotBand1, 0);
    handles.plotBand1.Title.String = REC.band1name;
    hold(handles.plotBand1, 'off')
    
    hold(handles.plotBand2, 'on')
    plots.band2 = plot(handles.plotBand2 ,0); plots.band2mean = plot(handles.plotBand2, 0);
    handles.plotBand2.Title.String = REC.band2name;
    hold(handles.plotBand2, 'off')
    
    hold(handles.plotBandRatio, 'on')
    plots.ratio = plot(handles.plotBandRatio, 0); plots.ratiomean = plot(handles.plotBandRatio, 0);
    handles.plotBandRatio.Title.String = [REC.band1name '/' REC.band2name ' ratio' ];
    hold(handles.plotBandRatio, 'off')
    
    plots.output = plot(handles.outputSignal, 0);
    handles.outputSignal.Title.String = 'Output Signal';
