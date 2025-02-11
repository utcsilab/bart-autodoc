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

<!-- #region -->
# `bart poisson`

=================================================================================================================

The `bart poisson` command in the BART is used to construct a binary Poisson-disk sampling mask. This type of mask is useful for undersampling k-space data in MRI, which can accelerate the scan.

**Purpose**: It generates a binary mask that can be applied to k-space data to simulate undersampling.


**Poisson-Disk Sampling**: is a technique for randomly picking tightly-packed points but with a minimum distance constraint between them.

Where we can view the full usage string and optional arguments with the `-h` flag.
<!-- #endregion -->

```python
!bart poisson -h
```

## Examples (python)

```python
# Importing the required libraries
import numpy as np
import matplotlib.pyplot as plt
%matplotlib inline

import cfl
from bart import bart
```

## Exmaple 1 

`-Y 128`: Specifies a 128-point size for the first dimension.

`-y 10`: Specifies an acceleration factor of 10 along this dimension.

```python
poisson_mask_1 = bart(1, 'poisson -Y 128 -y 10').squeeze()
```

```python
# Visualizing the images using Matplotlib 
plt.figure(figsize=(4,6))
plt.imshow(abs(poisson_mask_1), cmap='gray')
plt.title('Poisson Mask')
plt.show()
```

## Exmaple 2 

`-Y 128`: Sets the size of dimension 1 (128).

`-Z 128`: Sets the size of dimension 2 (128).

`-y 10`: Acceleration factor 10× along dimension 1.

`-z 5`: Acceleration factor 5× along dimension 2.


```python
poisson_mask_2 = bart(1, 'poisson -Y 128 -Z 128 -y 10 -z 5').squeeze()
```

```python
# Visualizing the images using Matplotlib 
plt.figure(figsize=(4,6))
plt.imshow(abs(poisson_mask_2), cmap='gray')
plt.title('Poisson Mask')
plt.show()
```

## Exmaple 3

`-Y 128`: Sets the first dimension size to 128.

`-Z 128`: Sets the second dimension size to 128.

`-y 2`: Acceleration factor 2× along dimension 1.

`-z 2`: Acceleration factor 2× along dimension 2.

`-v`: Enables **variable-density Poisson-disc sampling**, leading to denser sampling in the center and sparser sampling in outer regions.

```python
poisson_mask_3 = bart(1, 'poisson -Y 128 -Z 128 -y 2 -z 2 -v').squeeze()
```

```python
# Visualizing the images using Matplotlib 
plt.figure(figsize=(4,6))
plt.imshow(abs(poisson_mask_3), cmap='gray')
plt.title('Poisson Mask')
plt.show()
```

## Exmaple 4

`-e`: Enables **elliptical scanning**, meaning the sampling follows an elliptical shape rather than a full rectangular grid.


```python
poisson_mask_4 = bart(1, 'poisson -Y 128 -Z 128 -y 2 -z 2 -e').squeeze()
```

```python
# Visualizing the images using Matplotlib 
plt.figure(figsize=(4,6))
plt.imshow(abs(poisson_mask_4), cmap='gray')
plt.title('Poisson Mask')
plt.show()
```

```python

```
