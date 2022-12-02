## DIP CA2

工海碩一 游子霆 R11525079

#### 1. Fourier Transforms of Image

* Single Edge
  ![Alt text](assets/a_edge.png)

* box
  ![Alt text](assets/a_box.png)

* rotated box
  ![Alt text](assets/a_rotated_box.png)

* circle
  ![Alt text](assets/a_circle.png)


#### 2. Ideal Lowpass and Highpass Filtering

* Lowpass filter with cutoff frequency = 5
  ![Alt text](assets/b_lowpass_5.png)

* Lowpass filter with cutoff frequency = 30
  ![Alt text](assets/b_lowpass_30.png)

* Highpass filter with cutoff frequency = 5
  ![Alt text](assets/b_highpass_5.png)

* Highpass filter with cutoff frequency = 30
  ![Alt text](assets/b_highpass_30.png)

Highpass parts are mostly edges, while lowpass parts are just blurred.
With lower cutoff frequency, the lowpass part gets blurred even more.
WIth higher cutoff frequency, the highpass part has clearer edge details.


#### 3. Gaussian Filtering

* Sigma = 10
  Lowpass part is blurred significantly
  ![Alt text](assets/c_10.png)

* Sigma = 30
  Lowpass part is blurred but less obvious than sigma = 10
  ![Alt text](assets/c_30.png)

Highpass parts are not that different as the highpass part extracted using ideal highpass filter.
