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

# `bart bitmask`

=================================================================================================================

The `bart bitmask` command is a utility for creating and manipulating **bitmasks**. BART uses bitmasks to indicate which dimensions of a multi-dimensional array an operation should be applied to. Each bit in the bitmask corresponds to a dimension in the array.

Bitmasks are frequently used in MRI to select specific dimensions or channels, enabling flexible data selection and manipulation.

Where we can view the full usage string and optional arguments with the `-h` flag.


# How `bart bitmask` Works

### 1. Bit Representation
Each position in a binary number (bit) corresponds to a power of 2, representing a specific dimension or feature. For instance, dimension \( d \) corresponds to \( 2^d \). Examples:

- Dimension 0 corresponds to \( 2^0 = 1 \): `0001`
- Dimension 1 corresponds to \( 2^1 = 2 \): `0010`
- Dimension 2 corresponds to \( 2^2 = 4 \): `0100`
- Dimension 3 corresponds to \( 2^3 = 8 \): `1000`

### 2. Creating a Bitmask
To create a bitmask representing multiple dimensions, use **bitmask** to combine the individual bits. For example, to select dimensions 1 and 3:

$${Bitmask} = 2^1 + 2^3 = 2 + 8 = 10$$


```python
!bart bitmask -h
```

### Example 1: Creating a Bitmask for a Single Dimension (using Bash)

This example generates a bitmask for dimension 3:

```python
!bart bitmask 3  # Outputs a bitmask with only the bit for dimension 3 set
```

### Example 2: Creating a Bitmask for Multiple Dimensions (using Bash)

A bitmask can represent multiple dimensions by setting bits for each dimension. 

```python
!bart bitmask 1 4  # Outputs a bitmask with bits set for dimensions 1 and 4
```

---

### Example 3: Convert Dimensions from a Bitmask (using Bash)

Use the `bart bitmask` command with the `-b` flag


```python
!bart bitmask -b 18 # Outputs demensions with a bitmask '18'
```

### Example 4: Using the output of bitmask directly with another tool
It is often useful to pass the output of the bitmask tool directly to another tool in bash. This can be done for example,
to pass the dimensions for FFT without precomputing the corresponding bitmask:

```python
!bart phantom -x 128 -k ksp # create a phantom in kspace
!bart show -m ksp
!bart fft -iu $(bart bitmask 0 1) ksp img # perform IFFT along dimensions 0 and 1
```

```python
import numpy as np
import matplotlib.pyplot as plt
import cfl
%matplotlib inline

ksp = cfl.readcfl('ksp')
img = cfl.readcfl('img')

plt.figure(figsize=(4,6))
plt.imshow(abs(ksp)**.3, cmap='gray')
plt.title('phantom (in k-space)')

plt.figure(figsize=(4,6))
plt.imshow(abs(img), cmap='gray')
plt.title('phantom (in image domain')
```
