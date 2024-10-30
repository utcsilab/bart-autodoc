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

# BART AVG

===========================================================================================================

The `bart avg` command is used to **average along a specific dimension of multi-dimensional arrays** using a **bitmask**.  

Where we can view the full usage string and optional arguments with the `-h` flag.


## How `bart avg` Works

The averaging process computes the mean value along the specified dimension(s). If you want to average over a given dimension, the formula is:

$${Average} = \frac{1}{N} {\sum_{i=1}^{N} x_i} $$

**where:**

- $N$ is the number of elements along the dimension to be averaged.
- $x_i$ represents the individual data points in the dimension being averaged.

```python
!bart avg -h
```

**Where:**

`-w`: This option enables weighted averaging.

`bitmask`: A bitmask to specify the dimensions along which to perform the averaging.

`<input>`: The input .cfl file.

`<output>`: The output .cfl file containing the averaged data.


## Example for Matrix (using Bash)


### Create a Matrix, Dimension as 2 x 2 x 2

```python
!bart vec $(seq 1 8) array # Generate a array with values from 1 to 8 
```

```python
!bart show array
```

```python
!bart reshape $(bart bitmask 0 1 2) 2 2 2 array matrix_array # Reshape the array to Dimension as 2 x 2 x 2
```

```python
!bart show matrix_array
```

```python
!bart show -m matrix_array
```

### Example 1.1

### Calculated the Average Along a Dimension "0" of the matrix_array

```python
!bart avg $(bart bitmask 0) matrix_array matrix1_array
```

```python
!bart show matrix1_array
```

**We can see the dimension for our new matrix (matrix1_array) become 1 x 2 x 2**

```python
!bart show -m matrix1_array
```

### Example 1.2

### Continue to Calculate avg for matrix1_arry along Demension "2"

```python
!bart avg $(bart bitmask 2) matrix1_array matrix2_array
```

```python
!bart show matrix2_array
```

```python
!bart show -m matrix2_array
```

### Example 1.3

### Calculate the avg Across all Dimensions of a Matrix using BART

```python
!bart avg $(bart bitmask 0 1 2) matrix_array matrix3_array
```

```python
!bart show matrix3_array
```

```python
!bart show -m matrix3_array
```

## Example Workflow for Images (in Python Kernel)

The `bart avg` command in BART is often used to calculate the **Average** data across one or more specified dimensions. It is typically employed in cases where multi-dimensional data, such as MRI data, needs to be averaged along specific axes, such as repetitions, coils, or slices.


### Example in Coils

```python
# Importing the required libraries
import numpy as np
import matplotlib.pyplot as plt
%matplotlib inline

import cfl
from bart import bart
```

### 1. Generate a multi-coil image using the `phantom` simulation tool in BART:


Generate a multi-coil image with size 128x128 and 8 coils.  
Note the convention is that the coil dimension is dimension 3

```python
# Generate a multi-coil image with size 128x128 and 8 coils
multi_coil_image = bart(1, 'phantom -x 128 -s 8')
print(multi_coil_image.shape)
```

```python
# Visualizing the multi-coil images using Matplotlib 
plt.figure(figsize=(16,20))
for i in range(8):
    plt.subplot(1, 8, i+1)
    plt.imshow(abs(multi_coil_image[...,i]), cmap='gray')
    plt.title('Coil image {}'.format(i))
```

### 2. Combine the Coil Images Using `avg` :


**The number of coils is located in dimension 3, and the corresponding `bitmask`  for dimension 3 is calculated to be 8**

```python
!bart bitmask 3
```

```python
avg_image = bart(1, 'avg 8 multi_coil_image') # Calculates the avg across coil dimension and named as avg_image
```

```python
# Visualizing the avg_image using Matplotlib
plt.figure(figsize=(4,6))
plt.imshow(abs(avg_image), cmap='gray')
plt.title('avg_image')
```

```python

```
