getmonitor <- function(id, directory, summarize = FALSE) {
	id <- as.numeric(id)
	if( id < 10 ) {
		id <- paste("00",id,sep="")
	} else if( id < 100 ) {
		id <- paste("0",id,sep="")
	} else {
		id <- as.character(id)
	}

	df <- read.csv(paste(directory, "/", id, ".csv", sep=""))

	if(summarize){
		print(summary(df))
	}

	return(df)
}
