# Adaptive_Line_Enhancer
Project file for Adaptive Line Enhancement using MATLAB

## Authors
Hanbyeol Lee, Convergence of Electrocnic Engineering, Hanyang University
Jiyoung Ok, Convergence of Electronic Engineering, Hanyang University

## Abstract
To Reduce an error between targeted signal that mixed narrowband sinusoidal signal and wideband noise signal , and Filtered Signal, find a way to enhance Adaptive Line Enhancement Filter.

## Keywords
Adaptive Line Enhancer, error, suppression

## I. Introduction
Various studies on how to reduce background noise in noisy speech have been conducted using microphone arrays [1], spectral subtraction (SS) [2], etc. To solve this problem, this study proposed an adaptive line enhancer (ALE) based on least mean square (LMS). In this system, the noise is reduced by applying a delayed noise signal to the noisy speech signal. It is used to enhance sinusoidal signals embedded in broadband noise, as is the typical use of ALE. If an interference signal is obtained by a unit delayed version of the signal is added to the input sequence through an adaptive FIR filter,  the objective is to adapt the FIR filter coefficients and investigate the characteristics of the adaptive filter.

## II. Noice Reduction Method using ALE
Fig. 1 shows the sinusoidal noise reduction system using ALE, which is composed of delay circuit and linear predictor(LP). The input signal x(n) is expressed as

$$x(n) = s(n)+w(n)$$

where s(n) and w(n) are the speech signal and the white noise[3], respectively. {s(n)} is the output of the ALE and the enhanced speech signal, respectively D is delay, that is decorrelation parameter. $\hat{s} (n)$ is given by
	
$$\hat{s}(n) = \displaystyle\sum_{k = 0}^{N-1} h(k)x(n-k-D)$$
                             
where h(k) are tap coefficients of the LP. The error signal is expressed as

$$e(n) = x(n) + \hat{s}(n)$$
 
From the error signal e(n), update the filter coefficients according to the equation

$$h_n (k)=h_{n-1} (k)+Δe(n)x(n-k-D)$$
 
where $k=0,1,⋯,N-1$, $n=1,2,⋯$ and Δ is called the step size parameter. To ensure stability, Δ must be chosen to be in the range

$$0<Δ<\frac{1}{10NP_x}$$

where N is the length of the adaptive FIR filter and $P_x$ is the power in the input signal.[4]
The ALE can estimate only the current signal correlated with the delayed signal. Therefore, if the input signal is enough delayed, the ALE comes to estimate only the white noise. Finally, the enhanced speech signal is obtained by subtracting the estimated white noise from the input signal x(n).

The ALE can estimate only the current signal correlated with the delayed signal. Therefore, if the input signal is enough delayed, the ALE comes to estimate only the white noise. Finally, the enhanced speech signal is obtained by subtracting the estimated white noise from the input signal x(n).

<div align="center">
 <img width="732" alt="image" src="https://github.com/user-attachments/assets/ef3d1dcf-8e5e-4295-aa87-a6f60d522fd4">

 Fig. 1. Adaptive Filter for estimating and suppressing a narrowband interference.[5]
 </div>

## III.	DIFFERENCE BY CHANGING PARAMETERS
This paper takes parameters A=10, a=100, M=2000, w_0=π/4, Δ=3×10^(-7), N=10 as an offset except when it is a variable.
### A.	Dependent on LMS Size(N-Taps)
Try changing the LMS Size, N, to 1, 10, 100, 500, 1000, and 2000 to see how the results change. N is the size to be convolved, and the value is taken from the Nth Data Index when filtered. As a result, we see that the results start to appear at each N-th time.
### B.	Relation Between Amplitude of Noize and Sinusoidal Signal 
Vary the amplitude A of the sinusoidal signal to 10, 50, and 100 to see how the output changes. Since the amplitude of the noise plus the amplitude of the signal is the amplitude of the result after passing through the filter, the amplitude of the result increases when the amplitude of the signal is passed through the filter. The larger the amplitude of signal, the larger the amplitude of result. Also, as A gets larger, the difference in amplitude between noise and signal becomes smaller, so less of the noise is reflected in the first place, resulting in a cleaner restoration.
### C.	Dependent on Data Size 
Vary the data size M to 100, 500, 1000, 2000, 5000, 10000 to see the output as the value changes. This only changed the size of the data, which increased the number of data passing through the filter but had no impact on the performance of the filter, so the behavior was almost identical except for the difference in number.
### D.  Dependent on Frequency 
Change the frequency ω_0 of the sinewave to π/6, π/4, π/3, 2π/3, 3π/4, 5π/6 and notice the trend. As the value of Frequency approaches π/2, the mean of S hat tends to decrease. The results produced by this parameter were not significant in terms of removing noise.
### E.  Dependent on Delta
Vary the steps of the filter Δ to 10^(-6), 10^(-7), 10^(-8) to see the trend. As Δ becomes smaller, each step becomes smaller. As a result, the absolute value of the amplitude of the final filtered audio file tends to be smaller as Δ gets smaller.

## IV. RESULTS
<div align="center">
<img width="591" alt="image" src="https://github.com/user-attachments/assets/b2a5660c-4199-4c1a-a2f7-60225d989393">

Fig. 2. Dependent on LMS Filter Size


<img width="618" alt="image" src="https://github.com/user-attachments/assets/9589c152-4648-4ed5-baef-cf70c3f35c97">

 
Fig. 3. Relation between Amplitude of Noize and Sinusoidal Signal

<img width="624" alt="image" src="https://github.com/user-attachments/assets/b8f65488-e341-4bee-a0c0-629f2f40fcc2">

 
Fig. 4. Dependent on Data Size

<img width="630" alt="image" src="https://github.com/user-attachments/assets/455abc4a-3c58-41c7-a699-bf1c9ff5e878">

 
Fig. 5. Dependent on Frequency

<img width="618" alt="image" src="https://github.com/user-attachments/assets/9ff81dc1-9d67-48d7-96c4-689d4c6f8455">

 
Fig. 6. Dependent on Delta

</div>
Fig. 2~6 is the result of the discussion in III. As follow, this paper shows only LMS Filter Size and Sinusoidal Signal’s Amplitude can affect to the result. Otherwise, absolute data size, operating frequency and delta cannot affect drastically to result.

## V. Conclusion
When sending and receiving voice files, it makes noise, inevitably. Audio file which has noise shows a clear noise reduction when they through the filter. Since amplitude of noise is greater than amplitude of signal, which was an important condition in this experiment, the output always sounded louder than the original speech file at any given moment. If the difference between the two amplitudes was too large, the noise would bury the original voice file and make it inaudible, and if the difference between the two amplitudes was too small, the original voice would also become smaller, making it harder to hear. This confirms that the LMS filter did its job and that ALE is working properly.

## Reference
[1]	J. L. Flanagan, J. D.Johnston, R. Zahn and G . W. Elko, “Com- puter-steered microphone arrays for sound transaction in large rooms,”J.Acoust. Soc. Am., 78, pp. 1508-1518,Nov. 1985.

[2]	S. F. Boll, “Suppression of acoustic noise in speech using spec- tral subtraction,”IEEE Trans. Acoust.. Speech, Signal Process- ing, vol. ASSP-27, no. 2, pp.113-120, April 1979.

[3]	“How to generate noise signal with desired max and min signal?” Mathworks.https://kr.mathworks.com/matlabcentral/answers/1753630-how-to-generate-noise-signal-with-desired-max-and-min-signal (June 8th, 2023).

[4]	K. Sumi, N. Sasaoka, Y. Itoh and K. Fujii, “Smart noise reduction method for sinusoidal and wideband noise using adaptive line enhancer and noise reconstruction filter”The 2004 47th, Midwest Symposium on Circuits and Systems, 2004, Nov. 2004.

[5]	V. K. Ingle and J. G. Proakis, Digital Signal Processing using MATLAB, 3rd, ed. Stamford, CT :Cengage Learning, 2010.
