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
% indices = 1:50;
% songTable = songTable(indices, :);
% adTable = adTable(indices, :);
% dataTableSmall = vertcat(songTable, adTable);

%% Get MFCC's
mfccTable = getMFCC(dataTable, clipLength);

%% Write data
% labels = dataTableSmall{:, 1};
% labels = table(labels);
% writetable(labels,'labels.csv','Delimiter',',');
% dataTableSmall.label = [];
% dataTableSmall.title = [];
% dataTableSmall.sampleRate = [];
% writetable(dataTableSmall,'raw_data.csv','Delimiter',',');
labels = dataTable{:, 1};
labels = table(labels);
writetable(labels,'labels.csv','Delimiter',',');
dataTable.label = [];
dataTable.title = [];
dataTable.sampleRate = [];
writetable(dataTable,'raw_data.csv','Delimiter',',');
mfccTable.label      = [];
mfccTable.sampleRate = [];
writetable(mfccTable,'mfcc_data.csv','Delimiter',',');



