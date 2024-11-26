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

# BART CDF97

==================================================================================================================

The `bart cdf97` command performs a wavelet (CDF 9/7) transform using the BART.The Cohen-Daubechies-Feauveau 9/7 (CDF97) wavelet transform is a widely used tool in image and signal processing. The `cdf97` command facilitates the application of this transform to multi-dimensional data.

Where we can view the full usage string and optional arguments with the `-h` flag.

```python
!bart cdf97 -h
```

**Where**:

- `-i`: Optional flag to perform the inverse wavelet transform.
  
- `bitmask`: Specifies the dimensions along which the transform is applied.

- `<input>`: Input file containing the data to be transformed.

- `<output>`: Output file to store the transformed data.



## Examples (Using Python)


## Example 1: Apply the CDF 9/7 wavelet transform

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

### Applies the CDF 9/7 wavelet transform to the given phantom_image, specifically along the first two dimensions (based on the bitmask 3).

```python
wavelet = bart(1, 'cdf97 3', phantom_image)
```

```python
# Visualizing the image using Matplotlib
plt.figure(figsize=(4,6))
plt.imshow(abs(wavelet)**.3, cmap='gray')
plt.title('Wavelet')
```

## Example 2: Apply the CDF 9/7 inverse wavelet transform

```python
# Performs the inverse CDF 9/7 wavelet transform on the given wavelet data, reconstructing the original data 
phantom = bart(1, 'cdf97 3 -i', wavelet)
```

```python
# Visualizing the image using Matplotlib
plt.figure(figsize=(4,6))
plt.imshow(abs(phantom), cmap='gray')
plt.title('Phantom')
```

```python

```
