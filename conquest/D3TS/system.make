#
# For Docker (2021/04/14 zhonger)

# Set compilers
FC=mpif90
F77=mpif77

# Linking flags
LINKFLAGS = -L$(MKLROOT)/lib/intel64 $(MKLROOT)/lib/intel64/libmkl_blacs_openmpi_lp64.a $(MKLROOT)/lib/intel64/libmkl_lapack95_lp64.a -lmkl_scalapack_lp64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lmkl_blacs_openmpi_lp64  -lpthread -lm
#LINKFLAGS= -L/usr/local/lib
ARFLAGS=

# Compilation flags
COMPFLAGS= -I$(MKLROOT)/include/intel64/lp64 -I$(MKLROOT)/include
#COMPFLAGS= -O3 $(XC_COMPFLAGS)
COMPFLAGS_F77= $(COMPFLAGS)

# Set BLAS and LAPACK libraries
#BLAS= -lvecLibFort

# Full library call; remove scalapack if using dummy diag module
LIBS= $(FFT_LIB) $(XC_LIB) $(BLAS) $(DFT_D3_LIB)
#LIBS= $(FFT_LIB) $(XC_LIB) -lscalapack $(BLAS)

# In case of using Grimme's DFT_D3 program and Aradi's DFT_D3 library
DFT_D3_module = DFT_D3_module
DFT_D3_LIB = dft-d3/libdftd3.a

# LibXC compatibility (LibXC below) or Conquest XC library

# In case of not using ELPA instead of ScaLapack for eigenvalue problem
ELPA_module = ELPA_dummy
ELPA_LIB=

# Conquest XC library
XC_LIBRARY = CQ
XC_LIB =
XC_COMPFLAGS =

# LibXC compatibility
# Choose old LibXC (v2.x) or modern versions
#XC_LIBRARY = LibXC_v2
#XC_LIBRARY = LibXC
#XC_LIB = -lxcf90 -lxc
#XC_COMPFLAGS = -I/usr/local/include

# Set FFT library
FFT_LIB= -L/opt/fftw3/lib/ -lfftw3
#FFT_LIB=-lfftw3
FFT_OBJ=fft_fftw3.o

# Matrix multiplication kernel type
MULT_KERN = default
# Use dummy DiagModule or not
DIAG_DUMMY =