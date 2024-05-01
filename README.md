# Radio-Adblock
EECS351 Team10 Radio Adblock

Team members: 
* Adithya Vijayan <adivijay@umich.edu>
* Christian Reed <chrireed@umich.edu>
* Sion Kim <sionkim@umich.edu>
* Shanmukh Ghandikota <sghandik@umich.edu>

Website: [https://sites.google.com/umich.edu/team10-radio-ad-block?usp=sharing](https://sites.google.com/umich.edu/team10-radio-ad-block?usp=sharing)

## Python

1. Make the environment
```
conda env create --file environment.yaml
```
2. If you made changes to the environment.yaml and want to remake the environment
```
conda env update -f environment.yaml --prune 
```
In order to generate the ad-removed audio samples as shown here, please refer to the following notebooks in our github:

cnn_test_simple.ipynb
Inputs: 
  Single audio file (*.mp3). This audio file may be anything from a song or an ad or a custom audio file that has both a song and an ad stitched together.
Outputs: 
  Plots showing the confidence of our most-capable CNN models as a function of time.
  
cnn_test_complex.ipynb
Inputs: 
  A directory containing songs (./*.wav) and ads (./*.wav) (notebook will combine them into a single audio file for testing)
Outputs: 
  Plots showing the confidence of our most-capable CNN models as a function of time.
  Audio samples (*.wav) with ads muted/removed placed in ./testing_audio

Recommended Directories to create in your workspace for cnn_test_complex.ipynb:
./testing_ads
./testing_songs
./testing_audio
./resampled_testing_ads
./resampled_testing_songs
Notebooks are already setup to use the above directories.
Steps for cnn_test_complex.ipynb:
  1. Add ad and song files to ./testing_ads and ./testing_songs
  2. Run resampleRun_testing.m (requires resampleAudio_testing.m) 
      Takes audio files (./*.mp3 or ./*.wav) stored in directories ./testing_ads and ./testing_songs and creates resampled versions in ./resampled_testing_ads and ./resampled_testing_songs. The notebook is already setup to take inputs from these two directories.
  3. Run cnn_test_complex.ipynb
