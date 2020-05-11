amax.config <- list(
  
  atlas.rh=list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/atlas/:/usr/lib64/R/lib",
  ),
  
  atlas.rh.serial=list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/atlas-serial/:/usr/lib64/R/lib",
  ),
  
  atlas.build = list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/atlas-build/:/usr/lib64/R/lib",
  ),
  
  atlas.build.serial =list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/atlas-build-serial/:/usr/lib64/R/lib",
  ),
  
  gpuR = list(
    
    
  ),
  
  mkl.1 = list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/mkl:/opt/intel/lib/intel64:/opt/intel/mkl/lib/intel64/:/usr/lib64/R/lib",
    MKL_NUM_THREADS="1"
  ),
  mkl.2 = list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/mkl:/opt/intel/lib/intel64:/opt/intel/mkl/lib/intel64/:/usr/lib64/R/lib",
    MKL_NUM_THREADS="2"
  ),
  mkl.4 = list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/mkl:/opt/intel/lib/intel64:/opt/intel/mkl/lib/intel64/:/usr/lib64/R/lib",
    MKL_NUM_THREADS="4"
  ),
  mkl.8 = list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/mkl:/opt/intel/lib/intel64:/opt/intel/mkl/lib/intel64/:/usr/lib64/R/lib",
    MKL_NUM_THREADS="8"
  ),
  mkl.16 = list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/mkl:/opt/intel/lib/intel64:/opt/intel/mkl/lib/intel64/:/usr/lib64/R/lib",
    MKL_NUM_THREADS="16"
  ),
  mkl.24 = list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/mkl:/opt/intel/lib/intel64:/opt/intel/mkl/lib/intel64/:/usr/lib64/R/lib",
    MKL_NUM_THREADS="24"
  ),
  mkl.32 = list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/mkl:/opt/intel/lib/intel64:/opt/intel/mkl/lib/intel64/:/usr/lib64/R/lib",
    MKL_NUM_THREADS="32"
  ),
  
  openblas.1 = list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/openblas:/usr/lib64/R/lib",
    OPENBLAS_NUM_THREADS=1
  ),
  openblas.2 = list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/openblas:/usr/lib64/R/lib",
    OPENBLAS_NUM_THREADS=2
  ),
  openblas.4 = list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/openblas:/usr/lib64/R/lib",
    OPENBLAS_NUM_THREADS=4
  ),
  openblas.8 = list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/openblas:/usr/lib64/R/lib",
    OPENBLAS_NUM_THREADS=8
  ),
  openblas.16 = list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/openblas:/usr/lib64/R/lib",
    OPENBLAS_NUM_THREADS=16
  ),
  openblas.24 = list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/openblas:/usr/lib64/R/lib",
    OPENBLAS_NUM_THREADS=24
  ),
  openblas.32 = list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/openblas:/usr/lib64/R/lib",
    OPENBLAS_NUM_THREADS=32
  ),
  openblas.rh.1 = list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/openblas-rh:/usr/lib64/R/lib",
    OPENBLAS_NUM_THREADS=1
  ),
  reference = list(
    R_LD_LIBRARY_PATH="/home/nfultz/rcfg/reference:/usr/lib64/R/lib"
  )
  
  
)

