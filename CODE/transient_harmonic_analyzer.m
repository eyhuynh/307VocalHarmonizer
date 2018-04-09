%% Read file and initialize variables

[y, fs] = audioread('Vocal_Test.mp3');

blockSize = 1024;
hopSize = 512;
iNumBlocks = ceil(length(y) / hopSize) - 1;
if length(y) / blockSize ~= 0
    add_zeros = zeros( (blockSize - (mod(length(y), blockSize))), 1 );
    y = [ y ;add_zeros];
    clear add_zeros;
end

N = length(y);
t = ((0:iNumBlocks-1) * hopSize + (blockSize/2))/fs;

unvoicedGain = 0.1;
fadeIn = transpose(logspace(unvoicedGain,log10(unvoicedGain),blockSize));
fadeOut = transpose(logspace(log10(unvoicedGain),unvoicedGain,blockSize));
% yfft = abs(fft(y));
% yfft = yfft(1:floor(length(yfft)/2)+1);

%plot(yfft);
%soundsc(y, fs);

%% Zero Crossing Rate of the Signal


vzc = zeros(1,iNumBlocks);

%Get the zero crossing rate of the signal
for n=1:iNumBlocks
    iStart = (n-1)*hopSize + 1;
    iStop = min(N, iStart + blockSize - 1);
    vzc(n) =  0.5*mean( abs( diff( sign(y(iStart:iStop) ))));
end

%Reconstruct a signal lowering gain of areas with high zero crossing rate.
%For testing purposes

ynew = zeros(N,1);
zcr_thresh = 0.25;
for n=2:iNumBlocks
    iStart = (n-1)*hopSize + 1;
    iStop = iStart + blockSize - 1;
    if vzc(n) > zcr_thresh
        if vzc(n-1) > zcr_thresh
            ynew(iStart:iStop) = y(iStart:iStop)*unvoicedGain;
        else 
            ynew(iStart:iStop) = y(iStart:iStop).*fadeOut;
        end
    elseif vzc(n) < zcr_thresh
        if vzc(n-1) > zcr_thresh
            ynew(iStart:iStop) = y(iStart:iStop).*fadeIn;
        else
            ynew(iStart:iStop) = y(iStart:iStop);
        end
    end   
end


%Plot zero crossing information
figure(1);
plot(t,vzc, 'r');
title('Zero Crossing Rate of Signal');
xlabel('Time in Seconds');
ylabel('Zero Crosing Rate');


figure(2)
plot(y);
hold on;
plot(ynew, 'r');

%% Spectral Flux of the Signal 

%Get FFT of the Signal
w = hanning(blockSize);
F = zeros( blockSize, iNumBlocks );
for n = 1:iNumBlocks
  iStart = (n-1) * hopSize;
  if iStart+blockSize > N, break; end
  F(:, n) = fft( w .* y(iStart+1 : iStart+blockSize) );
  
end

%Calculate Spectral Flux From Window to Window
flux = zeros(iNumBlocks,1);
for n=2:iNumBlocks
    flux(n) = abs(sum( real( F(:,n))) - sum( real( F(:,n-1)))); 
end


%Reconstruct a signal lowering gain of blocks with high spectral flux (Full
%spectrum). For testing purposes

ynew_flux = zeros(length(y),1);
flux_thresh = 4. * 10^-3;
for n=2:iNumBlocks
    iStart = (n-1)*hopSize + 1;
    iStop = iStart + blockSize - 1;
    if flux(n) > flux_thresh
        if flux(n-1) > flux_thresh
            ynew_flux(iStart:iStop) = y(iStart:iStop)*unvoicedGain;
        else 
            ynew_flux(iStart:iStop) = y(iStart:iStop).*fadeOut;
        end
    elseif flux(n) < flux_thresh
        if flux(n-1) > flux_thresh
            ynew_flux(iStart:iStop) = y(iStart:iStop).*fadeIn;
        else
            ynew_flux(iStart:iStop) = y(iStart:iStop);
        end
    end   
end


figure(3);
plot(t,flux, 'r');
title('Spectral Flux of Signal');
xlabel('Time in Seconds');
ylabel('Flux');


%% FFT Processing of the signal

%Get FFT of signal for analysis of voiced vs unvoiced sounds
F = zeros( blockSize, iNumBlocks );
w = hanning( blockSize );
for n = 1:iNumBlocks
  iStart = (n-1) * hopSize;
  if iStart+blockSize > N, break; end
  F(:, n) = fft( w .* y(iStart+1 : iStart+blockSize) );
end

yfftnew = zeros( N, 1 );
for n = 1:iNumBlocks
  iStart = (n-1) * hopSize;
  if iStart+blockSize > N, break; end
  yfftnew(iStart+1 : iStart+blockSize) = yfftnew(iStart+1 : iStart+blockSize) + (w .* real(ifft( F(:, n) )));
end

figure(4);
spectrogram(y, 1024, 512, 2048, fs, 'yaxis');
figure(5);
spectrogram(ynew, 1024, 512, 2048, fs, 'yaxis');


%% Try downsampling the signal

ydown = zeros(1, length(y)/2);
for n=1:length(ydown)
    ydown(n) = y(2*n-1);
end



%% Plots Comparing different methods 

figure(6);
subplot(3,1,1);
plot(y);
title('Original Signal');
subplot(3,1,2);
plot(ynew);
title('Processed via ZCR');
subplot(3,1,3);
plot(ynew_flux);
title('Processed via Spectral Flux');


%% Fundamental Frequency Calculation

[f0 idx] = pitch(y, fs);

subplot(2,1,1)
plot(y)
ylabel('Amplitude')

subplot(2,1,2)
plot(idx*1/fs,f0)
ylabel('Pitch (Hz)')
xlabel('Seconds')

    
%% Try to Create a Harmony using delay lines  

plot(envelope(y))



%% 



% perform spectral analysis
N = length(y);   
w = hanning(N, 'periodic');
[Xamp, f] = periodogram(y, w, N, fs, 'power');
Xamp = 20*log10(sqrt(Xamp)*sqrt(2));

% spectral envelope extraction
Xenv = specenv(Xamp, f);

% plot the spectrum
semilogx(f, Xamp)
grid on
hold on
semilogx(f, Xenv, 'r', 'LineWidth', 1.5)
xlim([0 max(f)])
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Frequency, Hz')
ylabel('Magnitude, dB')
title('Amplitude spectrum of the signal and its envelope')
legend('Original spectrum', 'Spectral envelope')



%%


plot( rceps(y) );




