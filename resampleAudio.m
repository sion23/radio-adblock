function [] = resampleAudio(type, songName)
%RESAMPLEAUDIO Summary of this function goes here
%   Detailed explanation goes here
[songData, fs] = audioread(fullfile(type, songName));
fnew = 44100;
[P,Q] = rat(fnew/fs);
newSong = resample(songData,P,Q);
newName = erase(songName, ".mp3");
maxVal = max(max(abs(newSong)));
if maxVal > 1
    newSong = newSong/maxVal;
else
end
%maxVal = max(max(abs(newSong)));
audiowrite(fullfile(strcat('resampled_', type), strcat('resampled_', newName, '.wav')),newSong,fnew);
end

