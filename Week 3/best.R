best <- function(state, outcome){
	data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
	o <- c("heart attack", "heart failure", "pneumonia")

	if(is.na(match(state, data$State))){
		stop("invalid state")
	} else if(is.na(match(outcome, o))){
		stop("invalid outcome")
	} else {
		if( outcome == "heart attack" ){
			x <- data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
		} else if( outcome == "heart failure" ){
			x <- data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
		} else if( outcome == "pneumonia" ){
			x <- data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
		}
		
		sub <- as.numeric(subset(x, data$State == state & x != "Not Available"))
		small <- min(sub)

		if( small%%1 == 0){
			small <- paste(small,'.0',sep='')
		} else {
			small <- as.character(small)
		}
		answer <- min(data$Hospital.Name[ data$State == state & x == small ])
		return(answer)
	}
}
