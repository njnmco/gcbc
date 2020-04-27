#!/usr/bin/r -t

suppressMessages(library(gcbc))
suppressMessages(library(getopt))

## default values
N <- 250				# nobs
n <- 30 				# runs
verbose <- FALSE			# verbosity
benchmark <- "matmult"			# benchmark to run

## option specification
options <- matrix(c('verbose',   'v', 0, "integer",   paste("verbose operations, default is", ifelse(verbose, "true", "false")),
                    'help',      'h', 0, "logical",   paste("help on options"),
                    'nobs',      'n', 1, "integer",   paste("number of rows and columns in matrix, default is", N),
                    'runs',      'r', 1, "integer",   paste("number of benchmark runs, default is", n),
                    'benchmark', 'b', 1, "character", paste("benchmark to run (matmult, qr, svd, lu), default is", benchmark)),
                    ncol=5,
                    byrow=TRUE)

## parse argv
opt <- getopt(options, opt=argv)

if (!is.null(opt$help)) {
    cat(getopt(options, opt=argv, command="benchmark.r", usage=TRUE))
    q(status=100)
}

N         <- ifelse(is.null(opt$nobs), N, opt$nobs)
n         <- ifelse(is.null(opt$runs), n, opt$runs)
verbose   <- ifelse(is.null(opt$verbose), verbose, opt$verbose)
benchmark <- ifelse(is.null(opt$benchmark), benchmark, opt$benchmark)

benchmark <- match.arg(benchmark, c("matmult", "qr", "svd", "lu"))

if (verbose) {
    cat("Running", benchmark, "on dimension", N, "for", n, "repeats\n")
}

requirements()

cmd      <- paste('r -lgcbc,Matrix   -e"cat(', benchmark, 'Benchmark(', N, ",", n, '))"', sep="")
cmdgpu   <- paste('r -lgcbc,gpuR -e"cat(', benchmark, 'Benchmarkgputools(', N, ",", n, '))"', sep="")
cmdtest  <- paste('r -lgcbc,Matrix   -e"cat(', benchmark, 'BenchmarkTEST(', N, ",", n, '))"', sep="")

ref <- as.numeric(system(cmd, intern=TRUE))

##SETENV

# for b in lu qr svd matmult;
# do 
# ##for n in 250 500 750 1000 1250 1500 1750 2000 2250 2500 2750 3000 3250 3500 3750 4000; 
# for n in 100 200 300 400 500 600 700 800 900 1000 1250 1500 1750 2000 2500 3000 3500 4000 4500 5000;
# do
# if [ $n -lt 1000 ]; then
# r=50
# elif [ $n -lt 2000 ]; then
# r=30
# elif [ $n -lt 3000 ]; then
# r=20
# elif [ $n -ge 3000 ]; then
# r=5
# fi
# echo "Now starting $n $r $b"
# ./benchmark.r -n $n -r $r -b $b -v
# done
# done

atlas      <- as.numeric(system(cmd,      intern=TRUE))

atl39      <- as.numeric(system(cmd,      intern=TRUE))

mkl      <- as.numeric(system(cmd,      intern=TRUE))

goto      <- as.numeric(system(cmd,      intern=TRUE))

gpu <- ifelse( hasGpuR(), as.numeric(system(cmdgpu, intern=TRUE)), NA)

res <- data.frame(type=benchmark, nobs=N, nrun=n,
                  ref=ref, atlas=atlas, atl39=atl39,
                  mkl=mkl, gotob=goto, gpu=gpu)

if (verbose) print(res)
databaseResult(res)
