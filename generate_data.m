close all;
clear;

% Reads all audio files in "resampled_songs/" and "and resampled_ads/"
% before breaking them up into clips of length [clipLength] and storing
% them into a combined dataTable.
songs = dir('resampled_songs\*.wav');
ads   = dir('resampled_ads\*.wav');
clipLength = 10000;

%% Songs to Table
[songTable] = breakUp("song",clipLength, songs);

%% Ads to Table
[adTable] = breakUp("ad",clipLength, ads);

%% Combine Tables
dataTable = vertcat(songTable, adTable);






