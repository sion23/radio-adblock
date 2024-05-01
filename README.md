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
To demo some of our work, please refer to the following notebooks in our github:

**cnn_test_simple.ipynb**

Inputs: 
  1. Single audio file (*.mp3). This audio file may be anything from a song or an ad or a custom audio file that has both a song and an ad stitched together.
  
Outputs: 
  1. Plots showing the confidence of our most-capable CNN models as a function of time.
  
**cnn_test_complex.ipynb**

Inputs: 
  1. A directory containing songs (./*.wav) and ads (./*.wav) (notebook will combine them into a single audio file for testing)
  
Outputs: 
  1. Plots showing the confidence of our most-capable CNN models as a function of time.
  2. Audio samples (*.wav) with ads muted/removed placed in ./testing_audio

Recommended Directories to create in your workspace for cnn_test_complex.ipynb:

`./testing_ads`

`./testing_songs`

`./testing_audio`

`./resampled_testing_ads`

`./resampled_testing_songs`

Notebooks are already setup to use the above directories.

Steps for cnn_test_complex.ipynb:

  1. Add ad and song files to ./testing_ads and ./testing_songs
  2. Run resampleRun_testing.m (requires resampleAudio_testing.m) 
      Takes audio files (./*.mp3 or ./*.wav) stored in directories ./testing_ads and ./testing_songs and creates resampled versions in ./resampled_testing_ads and ./resampled_testing_songs. The notebook is already setup to take inputs from these two directories.
  3. Run cnn_test_complex.ipynb

**mlp_raw_embedding.ipynb**

1. Add ad and song files to ./testing_ads and ./testing_songs
2. Run resampleRun_testing.m (requires resampleAudio_testing.m) 
3. Run `generate_data_py.ipynb` to generate raw data that is peak-normalized
4. Run 4. mlp_raw_embedding.ipynb
