clear;
close all;
% RUN THIS BEFORE RUNNING generate_data.m
% Resamples all audio in "testing_songs/" and "testing_ads/" folders and stores them in the
% "resampled_testing_songs/" and "and resampled_testing_ads/" folders. 
% Resampling is done so that all audio files have the same sampling rate
% to eliminate that as a potential factor in classification.
songs = dir(fullfile('testing_songs','*.mp3'));
ads   = dir(fullfile('testing_ads','*.mp3'));
for i = 1:length(songs)
    resampleAudio_testing('testing_songs', songs(i).name)
end
for i = 1:length(ads)
    resampleAudio_testing('testing_ads', ads(i).name)
end
