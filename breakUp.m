function [output] = breakUp(type, clipLength, audio)
% Breaks each sound in audio into several sound clips of
% sample length "clipLength" before storing them in a table. Requires
% that the audio files specified by "audio" are in a folder named 
% "resampled_[type]s" to work.
audioLabel = type;
[data, fs] = audioread(fullfile(strcat('resampled_', type,'s'), audio(1).name));
index = 1;
for i = 1:length(audio)
    [data, fs] = audioread(fullfile(strcat('resampled_', type,'s'), audio(i).name));
    N = length(data);
    j = 0;
    while (j+1)*clipLength < N
        label(index) = audioLabel;
        title(index) = strcat(convertCharsToStrings(audio(i).name), "_", int2str(j));
        sampleRate(index) = fs;
        audioData(index,1:clipLength) = data((1+j*clipLength):((j+1)*clipLength),1).';
        index = index + 1;
        j = j + 1;
    end
end
label = label.';
title = title.';
sampleRate = sampleRate.';
output = table(label, title, sampleRate, audioData);
end

