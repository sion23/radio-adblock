clear;
close all;
% RUN THIS BEFORE RUNNING generate_data.m
% Resamples all audio in "songs/" and "ads/" folders and stores them in the
% "resampled_songs/" and "and resampled_ads/" folders. 
% Resampling is done so that all audio files have the same sampling rate
% to eliminate that as a potential factor in classification.
songs = dir('songs\*.mp3');
ads   = dir('ads\*.mp3');
for i = 1:length(songs)
    resampleAudio('songs', songs(i).name)
end
for i = 1:length(ads)
    resampleAudio('ads', ads(i).name)
end
