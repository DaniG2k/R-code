rankhospital <- function(state, outcome, num){
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
		hospital_names <- subset(data$Hospital.Name, data$State==state & x != "Not Available")

		ordered_hnames <- hospital_names[order(sub, hospital_names)]

		if(num=="best"){
			num <- 1
		} else if(num=="worst"){
			num <- length(hospital_names)
		} else if(num > length(hospital_names) | num < 1){
			return(NA)
		}

		return( ordered_hnames[num] )

	}
}
