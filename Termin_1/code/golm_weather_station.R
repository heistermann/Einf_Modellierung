# Daten einlesen
data = read.table("golm_data.txt", sep="", nrows=20000, dec=",", 
                  na.strings=c("???","???,?","!!,!"), 
                  stringsAsFactors=FALSE)

# Spalten benennen
names(data) = c("stamp","winspd","windir","humid200","airt200",
                "humid50","airt50","soilt5","soilt20", 
                "albedo", "globrad","nn1","nn2","precip",
                "etp","date","time")

# Datumsvektor zusammenbasteln
dtimes = paste(data$date, data$time)
charlen = sapply(data$dtimes, nchar, USE.NAMES=FALSE)
dtimes[charlen==16] = paste("0", dtimes, sep="")
dtimes = strptime(dtimes, "%d,%m,%y %H,%M,%S")

# Duplikate rausschmeissen
data = data[!duplicated(dtimes),]
dtimes = dtimes[!duplicated(dtimes)]

# Abbildung erzeugen
library(zoo)
data_zoo <- zoo( data, order.by=dtimes)
plotvars = c("winspd","humid200","airt200", 
             "globrad", "soilt20")
plot(data_zoo[,plotvars], xlab="Zeit", main="", nc=1)

