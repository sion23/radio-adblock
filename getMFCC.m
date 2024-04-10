function [output] = getMFCC(dataTable, clipLength)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

for i = 1:size(dataTable)
    label(i)    = dataTable.label(i);
    sampleRate(i)   = dataTable.sampleRate(i);
    mfccCoeffsTemp  = mfcc(dataTable.audioData(i,1:clipLength).', dataTable.sampleRate(i));
    mfccCoeff1(i,1:length(mfccCoeffsTemp(:,1)))   = mfccCoeffsTemp(:,3).';
    mfccCoeff2(i,1:length(mfccCoeffsTemp(:,1)))   = mfccCoeffsTemp(:,4).';
    mfccCoeff3(i,1:length(mfccCoeffsTemp(:,1)))   = mfccCoeffsTemp(:,5).';
    mfccCoeff4(i,1:length(mfccCoeffsTemp(:,1)))   = mfccCoeffsTemp(:,6).';
    mfccCoeff5(i,1:length(mfccCoeffsTemp(:,1)))   = mfccCoeffsTemp(:,7).';
    mfccCoeff6(i,1:length(mfccCoeffsTemp(:,1)))   = mfccCoeffsTemp(:,8).';
    mfccCoeff7(i,1:length(mfccCoeffsTemp(:,1)))   = mfccCoeffsTemp(:,9).';
    mfccCoeff8(i,1:length(mfccCoeffsTemp(:,1)))   = mfccCoeffsTemp(:,10).';
    mfccCoeff9(i,1:length(mfccCoeffsTemp(:,1)))   = mfccCoeffsTemp(:,11).';
    mfccCoeff10(i,1:length(mfccCoeffsTemp(:,1)))   = mfccCoeffsTemp(:,12).';
    mfccCoeff11(i,1:length(mfccCoeffsTemp(:,1)))   = mfccCoeffsTemp(:,13).';
    mfccCoeff12(i,1:length(mfccCoeffsTemp(:,1)))   = mfccCoeffsTemp(:,14).';
end
label = label.';
sampleRate = sampleRate.';
output = table(label, sampleRate, mfccCoeff1, mfccCoeff2, mfccCoeff3, mfccCoeff4, mfccCoeff5, mfccCoeff6, mfccCoeff7, mfccCoeff8, mfccCoeff9, mfccCoeff10, mfccCoeff11, mfccCoeff12);
end

