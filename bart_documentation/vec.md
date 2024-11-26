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

# `bart vec`

==================================================================================================================

The `bart vec` command in BART is used to create a vector of values from a list of inputs.

Where we can view the full usage string and optional arguments with the `-h` flag.

```python
!bart vec -h
```

**where:**

`val1 ... valN`: A list of numerical values that will be placed in the vector.

`<output>`: The output file where the vector will be saved.


## Examples (Using Bash)


### Example 1

#### Generate a vector with values from 1 to 8 

```python
!bart vec $(seq 1 8) vector
```

```python
!bart show vector #display the vector
```

### Example 2

#### Generate a vector with complex numbers 

```python
!bart vec 1 2+2i 3 4i vector_1
```

```python
!bart show vector_1
```

```python

```

```python

```
