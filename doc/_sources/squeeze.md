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

# BART SQUEEZE

==============================================================================================================

The `bart squeeze` command in BART is used to remove singleton dimensions (dimensions with size 1) from arrays. This is often necessary in array processing and image reconstruction tasks where extra dimensions may appear due to data manipulation, but they do not contain any additional information.

Where we can view the full usage string and optional arguments with the `-h` flag.

```python
!bart squeeze -h
```

## Example for Matrix (using Bash)


### Create a Matrix Filled with the Value of 1, Dimension as 3 x 1 x 2

```python
!bart ones 3 3 1 2 matrix 
```

```python
!bart show matrix
```

```python
!bart show -m matrix
```

**We can see the dimension for our matrix is 3 x 1 x 2**


### Remove singleton dimensions of the matrix that we created.

```python
!bart squeeze matrix matrix_squeeze
```

```python
!bart show -m matrix_squeeze
```

**We can see the dimension for our queeze_matrix became 3 x 2**
