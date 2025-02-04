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

# `bart fmac`

=================================================================================================================

The `bart fmac` command  in BART performs element-wise multiplication and summation over specified dimensions, which is particularly useful for operations like applying coil sensitivity maps to k-space data.

Where we can view the full usage string and optional arguments with the `-h` flag.

```python
!bart fmac -h
```

## Example Workflow (python)

```python
# Importing the required libraries
import numpy as np
import matplotlib.pyplot as plt
%matplotlib inline

import cfl
from bart import bart
```

### 1. Generate Phantom in k-Space Directly


Generate Shepp-Logan phantom directly in k-space:

```python
phantom = bart(1, 'phantom -x 128 -k -s 8')
```

```python
# Visualizing the images using Matplotlib 
plt.figure(figsize=(16,20))
for i in range(8):
    plt.subplot(1, 8, i+1)
    plt.imshow(abs(phantom[...,i]**.3), cmap='gray')
    plt.title('kspace image {}'.format(i))
```

### 2. Generate Sensitivity Maps


Create sensitivity maps for 8 coils:

`-m 1`: Compute one set of sensitivity maps.

```python
sens = bart(1, 'ecalib -m 1', phantom)
```

```python
# Visualizing the sensitivity maps using Matplotlib 
plt.figure(figsize=(16,20))
for i in range(8):
    plt.subplot(1, 8, i+1)
    plt.imshow(abs(sens[...,i]), cmap='gray')
    plt.title('Sensitivity {}'.format(i))
```

### Example 1: Use `bart fmac` to apply sensitivity maps to the phantom k-space:

```python
phantom_fmac = bart(1, 'fmac', phantom, sens)
```

```python
phantom_fmac.shape
```

```python
# Visualizing the images using Matplotlib 
plt.figure(figsize=(16,20))
for i in range(8):
    plt.subplot(1, 8, i+1)
    plt.imshow(abs(phantom_fmac[...,i]**.3), cmap='gray')
    plt.title('Phantom_fmac {}'.format(i))
```

### Example 2: Use `bart fmac` to apply sensitivity maps to the phantom k-space by option `-A`:

`-A`: add to existing output (instead of overwriting)

```python
phantom_fmac_A = bart(1, 'fmac -A', phantom, sens)
```

```python
# Visualizing the images using Matplotlib 
plt.figure(figsize=(16,20))
for i in range(8):
    plt.subplot(1, 8, i+1)
    plt.imshow(abs(phantom_fmac_A[...,i]**.3), cmap='gray')
    plt.title('fmac_A {}'.format(i))
```

### Example 3: Use `bart fmac` to apply sensitivity maps to the phantom k-space by option `-C`:

`-C`: conjugate input2

```python
phantom_fmac_C = bart(1, 'fmac -C', phantom, sens)
```

```python
# Visualizing the images using Matplotlib 
plt.figure(figsize=(16,20))
for i in range(8):
    plt.subplot(1, 8, i+1)
    plt.imshow(abs(phantom_fmac_C[...,i]**.3), cmap='gray')
    plt.title('fmac_C {}'.format(i))
```

### Example 4: Use `bart fmac` to apply sensitivity maps to the phantom k-space by option `-s`:

`-s b`: squash dimensions selected by bitmask b

`-s 8`: squash 3rd dimesnsion

```python
phantom_fmac_s = bart(1, 'fmac -s 8', phantom, sens)
```

```python
phantom_fmac_s.shape
```

```python
# Visualizing the image using Matplotlib
plt.figure(figsize=(4, 6))
plt.imshow(np.abs(phantom_fmac_s**.3), cmap='gray')
plt.title('Ksapce Image')
```

```python

```

```python

```
