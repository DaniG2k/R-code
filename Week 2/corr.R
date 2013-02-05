corr <- function(directory, threshold = 0) {
	result <- c()
	for(f in list.files(directory, pattern='.csv')){
                data <- read.csv(paste(directory, '/', f, sep=''))
		obs <- sum(complete.cases(data))
		if(obs > threshold){
			complete <- subset(data, complete.cases(data))
			sulf <- complete$sulfate
			nitr <- complete$nitrate
			result <- union(result, cor(sulf, nitr))
		}
        }
	return(result)
}
