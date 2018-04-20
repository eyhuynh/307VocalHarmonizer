[Home](./index.md)


[Previous: Pitch-Shifting](./pitchshifting.md)


## Cross-Synthesis

In order to implement a more natural sounding harmonizer, it is important to retain the formants of the original sound. To do this, or at least approximate it, we can perform a cross-analysis of both signals, and apply the spectral envelope of the original sound to the transposed sound. We attempted to test this on MATLAB. We obtained a frame of length W for both the original and transposed sounds. We windowed and performed a Fast Fourier Transform (FFT) for each window with an overlap of 50%. We erased the bins beyond Nyquist. We then tried to locate the peaks (magnitude) of the spectral envlopes and locations (frequency bins) for each signal. We then interpolated the magnitude points of the harmonics of both signals, and resampled them between 80 Hz and 3000 Hz, which is the range of formant frequencies. We found the gain by dividing the resampled original curve by the resampled transposed curve. This gain was applied to the absolute value of the FFT of the transposed signal. After converting the transposed signal with the applied gain back to cartesian coordinates, we flipped the left-wing (values corresponding to Nyquist frequency and below) and applied complex conjucation. Then we computed a real Inverse Fast Fourier Transform (IFFT) of the resulting signal. Unfortunately, while performing the above, our resulting signal had many not-a-numbers (NaN). Our resulting signal sounded as if there were many pops and artefacts.

We wanted to investigate the issue a little further, to understand why we were obtaining NaNs. We performed an FFT on a signal, changed the magnitude of the FFT (by multiplying by a scalar value), and then performed an IFFT of the resulting signal. We also attempted this process with different window sizes and overlap percentages. The resulting sound had pops and artefacts. This issue is a matter of further refinement that we would like to look into in the future.


[Next: Effects](./effects.md)

