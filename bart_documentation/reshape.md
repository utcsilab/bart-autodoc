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

# BART RESHAPE

===============================================================================================================

The `bart reshape` command is used in BART to reshape **multi-dimensional arrays** by changing the shape of the input data according to specified dimensions. It allows you to change the size of one or more dimensions of the data without changing the total number of elements.

Where we can view the full usage string and optional arguments with the `-h` flag.

```python
!bart reshape -h
```

**where:**

`flags`: A bitmask specifying which dimensions you want to reshape.

`dim1 dim2 ... dimN`: The size of each dimension.

`<input>`: The input file in BART’s `.cfl` format that you want to reshape.

`<output>`: The output file where the reshaped data will be saved.


## Example for Matrix (Using Bash)


## Example 1.1

### Generate a array with values from 1 to 8 

```python
!bart vec $(seq 1 8) array 
```

```python
!bart show array
```

### Reshape the array to Dimension as 2 x 2 x 2

```python
!bart reshape $(bart bitmask 0 1 2) 2 2 2 array matrix_array 
```

```python
!bart show matrix_array
```

**We can see the dimension for our new matrix (matrix_array) become 2 x 2 x 2**

```python
!bart show -m matrix_array
```

## Example 1.2

## Reshape the array to Demension 4 x 2

```python
!bart reshape $(bart bitmask 0 1) 4 2 array matrix_array_1 
```

```python
!bart show matrix_array_1
```

**We can see the dimension for our new matrix (matrix_array_1) become 4 x 2**

```python
!bart show -m matrix_array_1
```

## Example for Images (in Python Kernel)

Use BART's `reshape` command to change the dimensions of the image matrix. 

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
multi_coil_image = bart(1, 'phantom -x 128 -s 8')
print(multi_coil_image.shape)
```

**The number of coils is located in dimension '3'.**

We are trying to reshape Dimension '1' & Dimension '3' and the corresponding `bitmask` for dimension '1' and '3' is calculated to be "10".

```python
!bart bitmask 1 3 
```

### 2. Reshape multi-coil images to a flat image using the `reshape` tool in BART:

Reshape the Dimension '1' from '128' to '128 x 8 = 1024'

Reshape the Dimension '3' from '8' to '1'

```python
image_flat = bart(1, 'reshape 10 1024 1', multi_coil_image)
```

```python
# Visualizing image_flat using Matplotlib
plt.figure(figsize=(15,20))
plt.imshow(abs(image_flat), cmap='gray')
plt.title('Multi Coils Flat Image')
```

```python

```
