rankall <- function(outcome, num="best"){
	data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
	o <- c("heart attack", "heart failure", "pneumonia")

	if(is.na(match(outcome, o))){
		stop("invalid outcome")
	} else {
		if( outcome == "heart attack" ){
			x <- data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
		} else if( outcome == "heart failure" ){
			x <- data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
		} else if( outcome == "pneumonia" ){
			x <- data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
		}

		nums <- suppressWarnings(as.numeric(x))
		hospitals <- data$Hospital.Name[order(nums, data$Hospital.Name)]
		state <- data$State[order(nums, data$Hospital.Name)]
		split_hospitals <- split(hospitals, state)
	
		if(num == "worst"){
			newlist <- sapply(split_hospitals, function(x){ cbind( tail(x, 1) ) })
		} else {
			if(num == "best"){
				num <- 1
			}
			newlist <- sapply(split_hospitals, function(x){ cbind( x[num] ) })
		}
			
		df <- data.frame(hospital=newlist, state=sort(subset(data$State, duplicated(data$State)==F)))
		return(df)
	}
}
