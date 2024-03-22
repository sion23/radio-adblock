function [songData, fs] = breakUp(songName)
%BREAKUP Summary of this function goes here
%   Detailed explanation goes here
[data, fs] = audioread(fullfile('songs', songName));
end

