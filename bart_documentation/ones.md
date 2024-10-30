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
# BART ONES

=================================================================================================================

The command `bart ones` is used in BART to create an array **filled with ones**. You specify the number of dimensions (dims) and the size of each dimension (dim1, dim2, ..., dimN). 

## Such as:


\begin{pmatrix}
1 & 1 & ... & 1 \\
1 & 1 & ... & 1 \\
... & ... & ... & ...\\
1 & 1 & ... & 1
\end{pmatrix}


We can use `-h` for every BART command.
<!-- #endregion -->

```python
!bart ones -h
```

**where**:

`dims`: The number of dimensions of the array.

`dim1 dim2 ... dimN`: The size of each dimension.

`<output>`: The output prefix for the file that will be created (<output>.cfl and <output>.hdr).


## Example 1(Using Bash)

```python
!bart ones 2 2 3 output_1
```

**This will create:**

A 2D array with dimensions 2 x 3 filled with ones.

The output files will be output.cfl and output.hdr.

```python
!bart show -m output_1
```

```python
!bart show output_1 # Display information about a .cfl file (without the .cfl extension)
```

## Example 2 (Using Bash)

```python
!bart ones 3 5 5 6 output_2
```

**This will create:**

A 3D array with dimensions 5 x 5 x 6 filled with ones.

```python
!bart show -m output_2
```

```python
!bart show output_2 # Display information about a .cfl file (without the .cfl extension)
```

```python

```
