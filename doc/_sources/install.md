# Installation

## Prerequisites

BART requires the GCC compiler, the FFTW library, the BLAS/LAPACK
library and optionally CUDA for NVIDIA GPU computing. (see
`cudaon`{.interpreted-text role="ref"})

The software can be used in combination with Matlab, python or octave.

There is limited support for reading Cartesian data encoded with the
ISMRM Raw Data format when linking with the ISMRMRD library (version
0.5.2) (<http://ismrmrd.sourceforge.net/>).

In the following, the symbol `$` indicates a shell prompt. Please do not
type `$` when entering commands.

### Linux

BART should run on any recent Linux distribution.

To install the required libraries on Debian and Ubuntu run:

``` rst
$ sudo apt-get install gcc make libfftw3-dev liblapacke-dev
```

### Mac OS X

Xcode command line tools are required and can be installed by running:

``` rst
$ xcode-select --install
```

#### Mac installation with Macports

Follow the instruction at <https://www.macports.org/install.php> to
install Macports.

To install the required libraries, run:

``` rst
$ sudo port install fftw-3-single gcc6 openblas
```

#### Mac installation with Homebrew

To install Homebrew (<http://brew.sh>), run:

``` rst
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

To install BART, run :

``` rst
$ brew install homebrew/science/bart
```

### Windows

You can use BART on Windows using Cygwin:

<https://www.cygwin.com/>

Install Cygwin and select the following packages:

``` rst
Devel: gcc, make
Math: fftw3, fftw3-doc, libfftw3-devel, libfftw3_3
Math: liblapack-devel, liblapack-doc, liblapack0
```

Then use the cygwin shell to compile BART as described below.

An alternative to using Cygwin is a virtual machine with Linux.

## Download and Compilation

If you are a git user, you can simply clone our public repository:

``` rst
$ git clone https://github.com/mrirecon/bart
```

Otherwise, please download the latest version as a zip file from Github:

> <http://github.com/mrirecon/bart/releases/latest>

and unpack it somewhere on your computer.

Open a terminal window and enter the bart directory (the top-level
directory with the Makefile in it). To build the reconstruction tools
type:

``` rst
$ make
```

If you have installed the ISMRMRD library version 0.5.2, you can also
build the ISMRM raw data import tool:

``` rst
$ make ismrmrd
```

## Optional: Turn on GPU acceleration {#cudaon}

To turn on GPU acceleration using CUDA, you can toggle the CUDA flag in
the [Makefile](https://github.com/mrirecon/bart/blob/master/Makefile):

``` rst
CUDA=1
```
