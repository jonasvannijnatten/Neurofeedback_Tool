function player = playNoise(volume, t)
if isnan(volume); volume = 0; end
if isnan(t); t = .01; end
Fs = 4800;
ts = round(t * Fs);
noise = volume * rand(1, ts);
% player = audioplayer(noise, Fs);
player = 0;
% play(player)
sound(noise,Fs);