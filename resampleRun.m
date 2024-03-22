clear;
close all;

songs = dir('songs\*.mp3');
ads   = dir('ads\*.mp3');
for i = 1:length(songs)
    resampleAudio('songs', songs(i).name)
end
for i = 1:length(ads)
    resampleAudio('ads', ads(i).name)
end
