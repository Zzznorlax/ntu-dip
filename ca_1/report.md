## DIP CA1

工海碩一 游子霆 R11525079

### 1. Spatial Resolution
1.
    a.
    ![](assets/lena_4.jpg)
    b.
    ![](assets/lena_8.jpg)
    c.
    ![](assets/lena_16.jpg)
    d.
    ![](assets/lena_32.jpg)

    The results won't be the same, because the information lost as the size of the image shrinks. The smaller the size, the less information.

2.
    ![Alt text](assets/spatial_res.png)

### 2. Bit Planes

The 8 bit planes of the cameraman image:
The bit planes are multiplied by 255 for visualization.

![result](assets/bitplane.png)


### 3. Histogram Operation

Original image histogram: ![](assets/original_hist.jpg)

**pollen.tif**
a.
![](assets/eq_hist.jpg)

b. adjust image contrast based on the standard deviation and the mean of the image: [avg-n*sigma avg+n*sigma],
with n = 2
![](assets/adjusted_hist.jpg)

**aerial.tif**
a.
![](assets/aerial_eq_hist.jpg)

b. adjust image contrast based on the standard deviation and the mean of the image: [avg-n*sigma avg+n*sigma],
with n = 1
![](assets/aerial_adjusted_hist.jpg)


### 4. Transformations and Registration

#### Transformations
original:
![](assets/transformation_original.jpg)

fs:
![](assets/transformation_fs.jpg)

fsr:
![](assets/transformation_fsr.jpg)

fss:
![](assets/transformation_fss.jpg)


#### Registration - 4 Pairs

**fs**:
fs2:
![](assets/transformation_fs2.jpg)

original:
![](assets/transformation_original.jpg)

fs:
![](assets/transformation_fs.jpg)


**fsr**:
fs2:
![](assets/transformation_fsr2.jpg)

original:
![](assets/transformation_original.jpg)

fsr:
![](assets/transformation_fsr.jpg)


**fss**:
fss2:
![](assets/transformation_fss2.jpg)

original:
![](assets/transformation_original.jpg)

fss:
![](assets/transformation_fss.jpg)


#### Registration - 8 Pairs

**fs**:
fs2:
![](assets/transformation_fs2_8.jpg)

original:
![](assets/transformation_original.jpg)

fs:
![](assets/transformation_fs.jpg)


**fsr**:
fs2:
![](assets/transformation_fsr2_8.jpg)

original:
![](assets/transformation_original.jpg)

fsr:
![](assets/transformation_fsr.jpg)


**fss**:
fss2:
![](assets/transformation_fss2_8.jpg)

original:
![](assets/transformation_original.jpg)

fss:
![](assets/transformation_fss.jpg)


There aren't much difference between 4 pairs and 8 pairs.
