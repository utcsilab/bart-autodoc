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

## How `bart fmac` work


### Element-wise Multiplication

When both input tensors **A** and **B** have the same dimensions, `fmac` performs **element-wise multiplication**:

$$
O_{m,n} = A_{m,n} \cdot B_{m,n}
$$

### Example:
Given two matrices:

$$
A = \begin{bmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{bmatrix}, \quad
B = \begin{bmatrix} b_{11} & b_{12} \\ b_{21} & b_{22} \end{bmatrix}
$$

The element-wise multiplication produces:

$$
O = A \circ B = \begin{bmatrix} a_{11} \cdot b_{11} & a_{12} \cdot b_{12} \\ a_{21} \cdot b_{21} & a_{22} \cdot b_{22} \end{bmatrix}
$$



## Example for Matrix (using Bash)


### Create a Matrix (A), Dimension as 2 x 2 x 2

```python
!bart vec $(seq 1 8) array_A # Generate a array with values from 1 to 8 
```

```python
!bart reshape $(bart bitmask 0 1 2) 2 2 2 array_A matrix_A # Reshape the array to Dimension as 2 x 2 x 2
```

```python
!bart show matrix_A
```

### Create a Matrix (B), Dimension as 2 x 2 x 2

```python
!bart vec $(seq 2 9) array_B # Generate a array with values from 2 to 9 
```

```python
!bart reshape $(bart bitmask 0 1 2) 2 2 2 array_B matrix_B # Reshape the array to Dimension as 2 x 2 x 2
```

```python
!bart show matrix_B
```

### Example 1.1:

Performs element-wise multiplication of `matrix_A` and `matrix_B` and stores the result in `matrix_output`

```python
!bart fmac matrix_A matrix_B matrix_output
```

```python
!bart show matrix_output
```

## `-A`: Adds the computed result to an existing output file instead of overwriting it


### Mathematical Representation

Without `-A`:

$$
O = A \cdot B
$$

With `-A`:

$$
O = O_{\text{existing}} + (A \cdot B)
$$

where the previous values in $O_{\text{existing}}$ are updated by adding the new computation.



### Example 1.2:

Performs element-wise multiplication of `matrix_A` and `matrix_B`, and then adds the result to `matrix_output` for Example 1.1 instead of overwriting it.


```python
!bart fmac -A matrix_A matrix_B matrix_output
```

```python
!bart show matrix_output
```

## `-C`: Takes the *complex conjugate* of the second input (input2) before performing the element-wise multiplication.


Given two matrices:

$$
A = \begin{bmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{bmatrix}, \quad
B = \begin{bmatrix} b_{11} & b_{12} \\ b_{21} & b_{22} \end{bmatrix}
$$

The element-wise multiplication produces:

$$
O = A \circ B = \begin{bmatrix} a_{11} \cdot b_{11} & a_{12} \cdot b_{12} \\ a_{21} \cdot b_{21} & a_{22} \cdot b_{22} \end{bmatrix}
$$

### Using `-C` for Complex Conjugation

When using the `-C` option, the second input matrix **B** is conjugated before multiplication:

$$
O = A \cdot B^*
$$

where the complex conjugate of $B$ is:

$$
B^* = \begin{bmatrix} \overline{b_{11}} & \overline{b_{12}} \\ \overline{b_{21}} & \overline{b_{22}} \end{bmatrix}
$$



### Example 1.3:

Performs element-wise multiplication of `matrix_A` with the **complex conjugate** of `matrix_C`, and stores the result in `matrix_output_conjugate`.

```python
!bart vec 1+1i 2+2i matrix_C # Generate a matrix with Dimension as 2 x 1
```

```python
!bart show matrix_C
```

```python
!bart fmac -C matrix_A matrix_C matrix_output_conjugate
```

```python
!bart show matrix_output_conjugate
```

```python
!bart show -m matrix_output_conjugate
```

**Note**: As the example showing, if the dimensions of `matrix_A` and `matrix_C` do not match, BART will repeat the elements of `matrix_C` along the mismatched dimension to match `matrix_A`. As shown in the example, the `matrix_C` (2×1) is repeated to perform element-wise multiplication with `matrix_A`.


## `-s b`: Squashes dimensions (summed along the dimensions) specified by the bitmask b after performing element-wise multiplication.


### Example 1.4:

Performs element-wise multiplication and sums over the first dimension.

```python
!bart fmac -s 1 matrix_A matrix_B matrix_output_squash1
```

```python
!bart show matrix_output
```

```python
!bart show matrix_output_squash1
```

### Example 1.5:

Performs element-wise multiplication and sums over the all the dimensions.

```python
!bart fmac -s 7 matrix_A matrix_B matrix_output_squash2
```

```python
!bart show matrix_output_squash2
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
