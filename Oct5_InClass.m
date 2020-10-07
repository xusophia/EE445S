


% (a) Use the Elliptic (equiripple) design method to design an IIR filter to meet the specification.

% 1. Give the filter order. How many biquads?

%%  Filter Order: 20; for Bandstop IIR Elliptic design, with minimum order
%%  Biquads: There are 10 Biquads in cascade

% 2. Are all of the poles inside the unit circle for bound-input bounded-output (BIBO) stability?
%% Yes, all the pole are inside the unit circle, so it is BIBO stable
% FDA tool also tells you it is stable

% use w0 = 2*pi*(f0/fs)-> angle is discrete time frequency
% 3. Describe the pole-zero plot and connect poles/zeros to filter passbands/stopbands
%% Angles of the zeroes (or or near the unit circle) are the stop band frequencies
%% Angles of the poles close to the unit circle are the pass band frequencies 

% 4. Give the minimum and maximum value of the group delay over 0-1 kHz

%% Min: 10 samples 
%% Max: 21 samples

% 5. At what frequency does the peak group delay value occur?
%% The maximum value of the group delay are at 1800 Hz and 4200 Hz, which are the edges of the passband
% (b) Convert the IIR filter structure to be a single direct form section. In fdatool, this accomplished via the “Convert to a Single Section” under the Edit menu.

% 1. Are any poles outside the unit circle? If so, how many? Why?
%% There are 4 poles are outside the unit circle, because of poly expansion.
%% When converting the transfer function from a factored to unfactored form, this 
%% this results in 4 poles being moved outside of the unit circle (poles
%% cannot be outside the unit circle for a stable system).
% 2. Describe any differences in the magnitude response vs. part (a).
%% THe magnitude response for the single section reaches about 16 dB, so it does not 
%% meet the specification in the passband.