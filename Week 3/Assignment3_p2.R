outcome <- read.csv("outcome-of-care-measures.csv", colClasses="character")
#histogram <- hist(as.numeric(outcome[,11], xlab = "30-day Death Rate", main="Heart Attack 30-day Death Rate"))

heart_attack <- as.numeric(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)

heart_failure <- as.numeric(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)

pneumonia <- as.numeric(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)

par(mfrow = c(3,1))
hist(heart_attack, xlab="30-day Death Rate", main="Heart Attack",xlim=range(5,20))
hist(heart_failure, xlab="30-day Death Rate", main="Heart Failure", xlim=range(5,20))
hist(pneumonia, xlab="30-day Death Rate", main="Pneumonia", xlim=range(5,20))
