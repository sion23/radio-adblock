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

%% Get MFCC's
mfccTable = getMFCC(dataTable, clipLength);

%% Write Labels
labels = dataTable{:, 1};
labels = table(labels);
writetable(labels,'labels.csv','Delimiter',',');

%% Write MFCC data
mfccTable.label      = [];
mfccTable.sampleRate = [];
writetable(mfccTable,'mfcc_data.csv','Delimiter',',');

%% Write Raw Data
dataTable.label = [];
dataTable.title = [];
dataTable.sampleRate = [];
writetable(dataTable,'raw_data.csv','Delimiter',',');

%% Write Raw Data Small
indices = 1:50;
songTable_small = songTable(indices, :);
adTable_small = adTable(indices, :);
dataTableSmall = vertcat(songTable_small, adTable_small);
labelsSmall = dataTableSmall{:, 1};
labelsSmall = table(labelsSmall);
writetable(labelsSmall,'labels_small.csv','Delimiter',',');

dataTableSmall.label = [];
dataTableSmall.title = [];
dataTableSmall.sampleRate = [];
writetable(dataTableSmall,'raw_data_small.csv','Delimiter',',');
