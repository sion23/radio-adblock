close all;

% Reads all audio files in "resampled_songs/" and "and resampled_ads/"
% before breaking them up into clips of length [clipLength] and storing
% them into a combined dataTable.
songs = dir(fullfile('resampled_songs', '*.wav'));
ads   = dir(fullfile('resampled_ads', '*.wav'));
secondsPerClip = 5;
clipLength = 44100 .* secondsPerClip;

%% Songs to Table
[songTable] = breakUp("song", clipLength, songs);

%% Ads to Table
[adTable] = breakUp("ad", clipLength, ads);

%% Combine Tables
dataTable = vertcat(songTable, adTable);

dataTable.title = [];
%dataTable.sampleRate = [];

%% Get MFCC's
mfccTable = getMFCC(dataTable, clipLength);
writetable(dataTable,'preliminary_data.csv','Delimiter',',');
writetable(mfccTable,'mfcc_data.csv','Delimiter',',');



