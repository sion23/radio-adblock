close all;
clear;

songs = dir('resampled_songs\*.wav');
ads   = dir('resampled_ads\*.wav');
clipLength = 10000;

%% Songs to Table
musicLabel = "music";
[data, fs] = audioread(fullfile('resampled_songs', songs(1).name));
index = 1;
for i = 1:length(songs)
    [data, fs] = audioread(fullfile('resampled_songs', songs(i).name));
    N = length(data);
    j = 0;
    while (j+1)*clipLength < N
        label(index) = musicLabel;
        title(index) = strcat(convertCharsToStrings(songs(i).name), "_", int2str(j));
        sampleRate(index) = fs;
        audioData(index,1:clipLength) = data((1+j*clipLength):((j+1)*clipLength),1).';
        index = index + 1;
        j = j + 1;
    end
end
label = label.';
title = title.';
sampleRate = sampleRate.';
songTable = table(label, title, sampleRate, audioData);

%% Ads to Table
clear label;
clear title;
clear sampleRate;
clear audioData;
adLabel = "ad";
[data, fs] = audioread(fullfile('resampled_ads', ads(1).name));
index = 1;
for i = 1:length(ads)
    [data, fs] = audioread(fullfile('resampled_ads', ads(i).name));
    N = length(data);
    j = 0;
    while (j+1)*clipLength < N
        label(index) = adLabel;
        title(index) = strcat(convertCharsToStrings(ads(i).name), "_", int2str(j));
        sampleRate(index) = fs;
        audioData(index,1:clipLength) = data((1+j*clipLength):((j+1)*clipLength),1).';
        %adData(index) = 1;
        index = index + 1;
        j = j + 1;
    end
end
label = label.';
title = title.';
sampleRate = sampleRate.';
adTable = table(label, title, sampleRate, audioData);

%% Combine Tables
dataTable = vertcat(songTable, adTable);






