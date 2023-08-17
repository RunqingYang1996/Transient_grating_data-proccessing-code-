
dataaa=copper100_30;
time = dataaa(:, 1); % Extract time values
data = dataaa(:, 2); % Extract data values

% Perform FFT
N = length(data); % Number of samples
Fs = 1 / (time(2) - time(1)); % Sampling frequency
frequencies = Fs * (0:(N/2)) / N; % Frequency axis

data_fft = fft(data); % Perform FFT
amplitude_spectrum = abs(data_fft / N); % Compute amplitude spectrum
single_sided_spectrum = amplitude_spectrum(1:N/2+1); % Extract single-sided spectrum

% Plotting
figure;
 plot(frequencies, smooth(single_sided_spectrum),'LineWidth', 2);
 %title('Single-Sided Amplitude Spectrum');
 %xlabel('Frequency (Hz)');
 %ylabel('Amplitude');
 hold on
dataaa=copper100_20;
time = dataaa(:, 1); % Extract time values
data = dataaa(:, 2); % Extract data values

% Perform FFT
N = length(data); % Number of samples
Fs = 1 / (time(2) - time(1)); % Sampling frequency
frequencies = Fs * (0:(N/2)) / N; % Frequency axis

data_fft = fft(data); % Perform FFT
amplitude_spectrum = abs(data_fft / N); % Compute amplitude spectrum
single_sided_spectrum = amplitude_spectrum(1:N/2+1); % Extract single-sided spectrum

% Plotting
plot(frequencies, smooth(single_sided_spectrum),'LineWidth', 2);
%title('Single-Sided Amplitude Spectrum');
%xlabel('Frequency (Hz)');
%ylabel('Amplitude');
hold on
dataaa=copper100_10;
time = dataaa(:, 1); % Extract time values
data = dataaa(:, 2); % Extract data values

% Perform FFT
N = length(data); % Number of samples
Fs = 1 / (time(2) - time(1)); % Sampling frequency
frequencies = Fs * (0:(N/2)) / N; % Frequency axis

data_fft = fft(data); % Perform FFT
amplitude_spectrum = abs(data_fft / N); % Compute amplitude spectrum
single_sided_spectrum = amplitude_spectrum(1:N/2+1); % Extract single-sided spectrum

% Plotting
plot(frequencies, smooth(single_sided_spectrum),'LineWidth', 2);
%title('Single-Sided Amplitude Spectrum');
%xlabel('Frequency (Hz)');
%ylabel('Amplitude');
hold on
dataaa=copper100_0;
time = dataaa(150:920, 1); % Extract time values
data = dataaa(150:920, 2); % Extract data values

% Perform FFT
N = length(data); % Number of samples
Fs = 1 / (time(2) - time(1)); % Sampling frequency
frequencies = Fs * (0:(N/2)) / N; % Frequency axis

data_fft = fft(data); % Perform FFT
amplitude_spectrum = abs(data_fft / N); % Compute amplitude spectrum
single_sided_spectrum = amplitude_spectrum(1:N/2+1); % Extract single-sided spectrum

% Plotting
plot(frequencies, smooth(single_sided_spectrum),'LineWidth', 2);
%title('Single-Sided Amplitude Spectrum','FontSize', 24);
xlabel('Frequency (MHz)','FontSize', 24);
ylabel('FFT magnitude','FontSize', 24);
xlim([130 400])
ax = gca;
ax.FontSize = 22; 
set(gca, 'FontSize', 22) % Increase the font size of tick labels and axis labels
set(gca, 'LineWidth', 2) % Increase the linewidth of the figure frame