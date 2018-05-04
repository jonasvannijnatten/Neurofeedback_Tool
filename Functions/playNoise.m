function player = playNoise(volume, t)
if isnan(volume); volume = 0; end
if isnan(t); t = .01; end

MasterVolume = 1; % set value between 0 and 1 to scale the volume. 
% E.G. a setting of 0.5 will set the max volume to half the normal volume

volume = volume * MasterVolume;
Fs = 4800;
ts = round(t * Fs);
noise = volume * rand(1, ts);
% player = audioplayer(noise, Fs);
player = 0;
% play(player)
sound(noise,Fs);