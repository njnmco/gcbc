
#hilbert <- function(n) {
#    i <- 1:n
#    1 / outer(i - 1, i, "+")
#}

getMatrix <- function(N) {
    on.exit(invisible(gc()))
    a <- rnorm(N*N)
    #a <- hilbert(N)
    dim(a) <- c(N,N)
    invisible(as(a, Sys.getenv("GCBC_MATRIX_TYPE", "matrix")))
}

matmultBenchmark <- function(N, n, trim=0.1) {
    a <- getMatrix(N)
    traw <- replicate(n, system.time(crossprod(a))[3])
    tmean <- mean(traw,trim=trim)
}



qrBenchmark <- function(N, n, trim=0.1) {
    a <- getMatrix(N)
    traw <- replicate(n, system.time(qr(a, LAPACK=TRUE))[3])
    tmean <- mean(traw,trim=trim)
}

svdBenchmark <- function(N, n, trim=0.1) {
    a <- getMatrix(N)
    traw <- replicate(n, system.time(svd(a))[3])
    tmean <- mean(traw,trim=trim)
}

luBenchmark <- function(N, n, trim=0.1) {
    a <- getMatrix(N)
    traw <- replicate(n, system.time(lu(a))[3])
    tmean <- mean(traw,trim=trim)
}


