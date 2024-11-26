# Linear Operators

## linop interface {#linop}

The linop interface provides an abstraction for linear operators. For
each linop $A$, it supports forward operation $x \rightarrow A(x)$,
adjoint operation $x \rightarrow A^\top(x)$ and normal operation
$x \rightarrow A^\top A(x)$.

## linop_chain

The linop_chain function is arguably the most powerful feature of the
linop interface. Given two linops $A$ and $B$, the composite linear
operator $A(B)$ can be created by doing:

    AB = linop_chain(A, B)

This automatically chains the forward operation, adjoint operation, and
normal operation.

## fft

fft implements the fast Fourier transform using the FFTW library for CPU
and cudaFFT for GPU.

## nufft

## sense

## wavelet

## finite_diff
