complete <- function(directory, id = 1:332) {
	df <- data.frame()
	for(i in id){
		if( i < 10 ){
			n <- paste('00',i,sep='')
		} else if( i < 100 ){
			n <- paste('0',i,sep='')
		} else {
			n <- as.character(i)
		}
		file <- read.csv(paste(directory, '/', n, '.csv', sep=''))
		nobs <- sum(complete.cases(file))
		newrow <- c(i, nobs)
		df <- rbind(df, newrow)
	}
	colnames(df) <- c('id', 'nobs')
	return(df)
}
