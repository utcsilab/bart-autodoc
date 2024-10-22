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

# BART SHOW

==================================================================================================================

The `bart ones` command is used in BART to display information about a .cfl file. It gives a quick way to inspect the dimensions of the data stored in the file.

We can use `-h` for every BART command.

```python
!bart show -h
```

## Example for Array (Using Bash)


## Example 1

```python
!bart ones 2 2 3 output_1
```

**This will create:**

A 2D array with dimensions 2 x 3 filled with ones.

The output files will be output.cfl and output.hdr.

```python
!bart show output_1 
```

 **This will Display mata data about a .cfl file** (without the .cfl extension)

```python
!bart show -m output_1 
```

Which is similar when we use `cat` command

```python
!cat output_1.hdr
```

**This will provide detailed metadata including the active dimensions**

```python
!bart show -d 1 output_1
```

`-d 1`: This specifies that you want detailed information about dimension 1.

If you want to inspect another dimension, just change the number after `-d`. For example:

`-d 0`: Would show details for dimension 0.

`-d 2`: Would show details for dimension 2.

The `-d` flag works only with a **specific dimension index**

```python
!bart show -N output_1 # Print the index imformation
```

## Example 2 for -s sep as the separator

### Example 2.1

Display the Data with **Comma** Separator:

Now, to print the values of output_1 with a comma separating the values, use the bart show command with the `-s` flag:

```python
!bart show -s "," output_1
```

### Example 2.2

Display the Data with **Semicolon** Separator:

If you want to use a semicolon amd space as the separator, modify the -s flag:

```python
!bart show -s ";     " output_1
```

### Example 2.3:  Combining Format with Separator:

You can also **combine** the `-f` flag with the `-s` flag to control both the format and the separator.

To display Complex number format with three decimal places for both real and imaginary parts and commas as the separator:

```python
!bart show -s " , " -f "%+.3f%+.3fi" output_1
```

## Example for Images (Using Bash)


### Generate a multi-coil image using the `phantom` simulation tool in BART:

```python
!bart phantom -x 128 -s 8 multi_coil_image
```

 **Display mata data about the multi_coil_image**

```python
!bart show -m multi_coil_image
```

```python

```
