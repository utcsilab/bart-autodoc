---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.16.4
  kernelspec:
    display_name: Python 3 (ipykernel)
    language: python
    name: python3
---

# `bart fft`

=================================================================================================================

The `bart fft` command  in BART command performs a Fast Fourier Transform (FFT) along selected dimensions of input data.

Where we can view the full usage string and optional arguments with the `-h` flag.

```python
!bart fft -h
```

## Mathematical Formulation

### Standard Forward FFT 

For an input signal $x(n)$, the **discrete Fourier transform (DFT)** is:

$$
X(k) = \sum_{n=0}^{N-1} x(n) e^{-j 2\pi kn / N}
$$

where:

- $x(n)$ is the input data.
  
- $X(k)$ is the FFT output.

- $N$ is the length of the transformed dimension.



## Inverse FFT (`-i` Option)

The **inverse FFT (IFFT)** transforms frequency-domain data back into the time/spatial domain:

$$
x(n) = \frac{1}{N} \sum_{k=0}^{N-1} X(k)e^{j 2\pi kn / N}
$$

Applying `bart fft -i` computes this **inverse transform**.



**k-space to Image Domain**: In MRI, data is initially acquired in k-space, which is the spatial frequency domain. To reconstruct an image, an inverse FFT is typically applied to the **k-space data** to transform it into the **image domain**.


## Unitary FFT (`-u` Option)

By default, the FFT scales the transformed values by **N**. The **unitary FFT** normalizes the result:

$$
X_u(k) = \frac{1}{\sqrt{N}} \sum_{n=0}^{N-1} x(n)e^{-j 2\pi kn / N}
$$

which ensures that applying `fft` followed by `ifft` returns the original signal **without scaling**.



## Uncentered FFT (`-n` Option)

The **uncentered FFT (`-n`)** performs a Fast Fourier Transform without shifting the zero-frequency (DC) component to the center. In standard FFT implementations, the output is usually shifted so that the **low frequencies** (including DC) are centered in k-space. Using `-n` keeps the DC component at its original location.

The frequency indices in the **uncentered FFT (`-n`)** are assigned **sequentially**:

$$
X_{\text{uncentered}}(k) = \sum_{n=0}^{N-1} x(n)e^{-j 2\pi kn / N}, \quad k = 0, 1, 2, ..., N - 1
$$

## Mathematical Interpretation of the Shift

The **FFT shift operation** is mathematically represented by multiplying the input signal by a phase term:

$$
x_{\text{shifted}}(n) = x(n) \cdot (-1)^n
$$

This results in a frequency-domain shift:

$$
X_{\text{shifted}}(k) = X \left( (k + N/2) \mod N \right)
$$



## Examples for 1D Array (Using Bash)


## FFT Numerical Comparison Chart

| Index | Original Signal (x) | Standard FFT (X_fft) | Unitary FFT (X_fft_u) | Uncentered FFT (X_fft_n) | 
|--------|--------------------|---------------------|----------------------|----------------------|
| 0      | 1.0                | (-2 + 0j)          | (-1 + 0j)           | (10 + 0j)           |
| 1      | 2.0                | (2 + 2j)           | (1 + 1j)            | (-2 + 2j)           |
| 2      | 3.0                | (10 + 0j)          | (5 + 0j)            | (-2 + 0j)           |
| 3      | 4.0                | (2 - 2j)           | (1 - 1j)            | (-2 - 2j)           |



### Creates a 1D vector in BART and stores it in the variable `x`.

```python
!bart vec 1 2 3 4 x
```

```python
!bart show x
```

### Example 1: Performs a Fast Fourier Transform (FFT) along the first dimension of the vector `x` and stores the output in `X_fft`.

```python
!bart fft 1 x X_fft
```

```python
!bart show X_fft
```

### Example 2: Performs a unitary Fast Fourier Transform (FFT) along the first dimension of the vector and stores the output in `X_fft_u`

```python
!bart fft 1 -u x X_fft_u
```

```python
!bart show X_fft_u
```

### Example 3: Performs a uncentered FFT along the first dimension of the vector and stores the output in `X_fft_n`

```python
!bart fft 1 -n x X_fft_n
```

```python
!bart show X_fft_n
```

## Examples for image(Using Python)

```python
# Importing the required libraries
import numpy as np
import matplotlib.pyplot as plt
%matplotlib inline

import cfl
from bart import bart
```

```python
phantom_image = bart(1, 'phantom -x 128') # Generate a phantom image with size 128x128
```

```python
# Visualizing the image using Matplotlib
plt.figure(figsize=(4,6))
plt.imshow(abs(phantom_image), cmap='gray')
plt.title('phantom_image')
```

### Exmaple 4: Applying FFT along the first and second dimensions (transform from **image domain** to **k-sapce data**).

```python
kspace = bart(1, 'fft 3', phantom_image)
```

```python
# Visualizing the image using Matplotlib
plt.figure(figsize=(4,6))
plt.imshow(abs(kspace)**.3, cmap='gray')
plt.title('K Space')
```

### Exmaple 5: Applying inverse FFT along the first and second dimensions (transform from **k-space data** to **image domain**).

By `-i`

```python
image = bart(1, 'fft -i 3', kspace)
```

```python
# Visualizing the image using Matplotlib
plt.figure(figsize=(4,6))
plt.imshow(abs(image), cmap='gray')
plt.title('IFFT Image')
```

### Exmaple 6: Applying un-centered IFFT along the first and second dimensions.

By `-in`

```python
image_n = bart(1, 'fft -in 3', kspace)
```

```python
# Visualizing the image using Matplotlib
plt.figure(figsize=(4,6))
plt.imshow(abs(image_n), cmap='gray')
plt.title('Un-centered Image')
```

```python

```

```python

```
