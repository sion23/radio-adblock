function [] = resampleAudio(type, songName)
% Resamples an audio file in folder "[type]s" called "[songname]" and 
% writes the new song in the folder "resampled_[type]s as 
% "resampled_[songName]".
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

