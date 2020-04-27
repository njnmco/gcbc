
.dbfile <- "~/gcbc.sqlite"

requirements <- function() {

    # is database available ?
    if ( ! file.exists(.dbfile)) {
        createDatabase(.dbfile)
    }

    invisible(TRUE)
}


createDatabase <- function(dbfile=.dbfile) {
    dbcon <- dbConnect(dbDriver("SQLite"), dbname=dbfile)
    on.exit(dbDisconnect(dbcon))
    dftypes <- list(host="text", datum="text", env="text", type="text",
                    nobs="integer", nrun="integer")
    sql <- sqlCreateTable(dbcon, "benchmark", fields=dftypes, row.names = FALSE)
    dbExecute(dbcon, sql)
}

databaseResult <- function(data,dbfile=.dbfile) {

    newdf <- data.frame(host=Sys.info()["nodename"],
                        datum=format(Sys.Date()),
                        data)
    dbcon <- dbConnect(dbDriver("SQLite"), dbname=.dbfile)
    res <- dbWriteTable(dbcon, "benchmark", newdf, row.names=FALSE, overwrite=FALSE, append=TRUE)
    dbDisconnect(dbcon)

}

isPackageInstalled <- function(package) { 	# Henrik Bengtsson, r-devel, 24 Aug 2010
    system.file(package=package)  != ""
}


hasGpuR <- function() {
    isPackageInstalled("gpuR")
}

getBenchmarkData <- function(host, dbfile=.dbfile) {
    dbcon <- dbConnect(dbDriver("SQLite"), dbname=.dbfile)
    data <- dbGetQuery(dbcon, paste('select * from benchmark where host="',
                                    host, '" order by nobs', sep=""))
    invisible(dbDisconnect(dbcon))
    invisible(data)
}
