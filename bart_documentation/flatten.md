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

# BART FLATTEN

==============================================================================================================

The `bart flatten` command is used to convert a multi-dimensional array into a **single dimension**, effectively collapsing all dimensions into a single vector.

Where we can view the full usage string and optional arguments with the `-h` flag.

```python
!bart flatten -h
```

**where:**

`<input>`: The file containing the input data.

`<output>`: The file where the result will be saved.


## Example for Matrix (using Bash)


### Create a Matrix Filled with the Value of 1, Dimension as 2 x 4 x 2

```python
!bart ones 3 2 4 2 matrix 
```

```python
!bart show matrix # Display the matrix
```

```python
!bart show -m matrix # Display the dimension of the matrix
```

## Flatten this Matrix to a Single Dimension Array

```python
!bart flatten matrix flat_matrix # Flatten this Matrix to a Single Dimension Array named as "flat_matrix"
```

```python
!bart show flat_matrix  # Display the array
```

```python
!bart show -m flat_matrix # Display the dimension of the array
```

## Example for k-space MRI Data Images (in Python)

The `bart flatten` command is used to convert a multi-dimensional array into a single dimension. This is particularly useful in image processing, data preparation for machine learning, or any scenario where a 1D representation of data is required.

```python
# Importing the required libraries
import numpy as np
import matplotlib.pyplot as plt
%matplotlib inline

import cfl
from bart import bart
```

### Generate a phantom image in k-space and print the dimension of it 

```python
phantom = bart(1, 'phantom -x 128 -k') # Generate a phantom image in k-space with size 128x128  
print(phantom.shape)
```

### Flatten the k-space data into a single dimension array

```python
flat_phantom = bart(1, 'flatten', phantom)
print(flat_phantom.shape)
```

```python

```
