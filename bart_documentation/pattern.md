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

# `bart pattern`

=================================================================================================================

The `bart pattern` command in the BART calculates the sampling pattern of k-space data by identifying where the data is non-zero. This command is useful for visualizing and confirming undersampling in k-space

Where we can view the full usage string and optional arguments with the `-h` flag.

```python
!bart pattern -h
```

**Where:**

`<kspace>`: This is the input k-space data from which the sampling pattern is derived.

`<pattern>`: This is the output file where the computed sampling pattern will be stored.


### Key aspects of the `pattern` command:

**Non-zero data**: The command determines the sampling pattern by checking for non-zero values in the input data.

**Output**: The output of the command is often complex-valued, which may need to be cast to a real value using `.real` for visualization or further processing.


## Example Workflow (python)

```python
import numpy as np
import matplotlib.pyplot as plt
from bart import bart
import h5py
%matplotlib inline
```

### 1. Generate a Fully Sampled k-Space Phantom Directly

```python
fully_sampled_kspace = bart(1, 'phantom -x 128 -k')
```

### 2. Create a Sampling Mask Using `poisson`

`-Y 128`: Specifies the size of the k-space (128).

`-y 2`: Specifies the acceleration factor in the direction (5x acceleration)

```python
sampling_mask = bart(1, 'poisson -Y 128 -y 2').squeeze()
```

### 3. Apply the Sampling Mask to Create Undersampled k-space by `famc`

```python
undersampled_kspace = bart(1, 'fmac', fully_sampled_kspace, sampling_mask)
```

```python
# Visualizing the images using Matplotlib
fig, axes = plt.subplots(1, 2, figsize=(8, 4))

# Plot undersampled k-space
axes[0].imshow((abs(undersampled_kspace)**0.3), cmap='gray')
axes[0].set_title('Undersampled K-space')
axes[0].axis('off')  # Hide axes

# Plot fully sampled k-space
axes[1].imshow((abs(fully_sampled_kspace)**0.3), cmap='gray')
axes[1].set_title('Fully Sampled K-space')
axes[1].axis('off')  # Hide axes

plt.show()
```

### 4. Computes the inverse Fourier transform of the k-space data to obtain the image by `fft`

`-i`: Computes the inverse Fourier transform

`-u`: Unitary inverse Fourier transform

`3`: Corresponds to the first two dimensions

```python
fully_sampled_image = bart(1, 'fft -i -u 3', fully_sampled_kspace)
```

```python
undersampled_image = bart(1, 'fft -i -u 3', undersampled_kspace)
```

```python
# Visualizing the images using Matplotlib
fig, axes = plt.subplots(1, 2, figsize=(8, 4))

# Plot undersampled image
axes[0].imshow((abs(undersampled_image)), cmap='gray')
axes[0].set_title('Undersampled Image')
axes[0].axis('off')  # Hide axes

# Plot fully sampled image
axes[1].imshow((abs(fully_sampled_image)), cmap='gray')
axes[1].set_title('Fully Sampled Image')
axes[1].axis('off')  # Hide axes

plt.show()
```

## Example 

```python
pattern = bart(1, 'pattern', undersampled_kspace).real
```

```python
# Visualizing the images using Matplotlib 
plt.figure(figsize=(4,6))
plt.imshow((abs(pattern)**.3), cmap='gray')
plt.title('Pattern')
plt.show()
```

```python

```
