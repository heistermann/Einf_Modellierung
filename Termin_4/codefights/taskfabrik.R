# QUIZ 02
a = "Greet."
if (a == "Greet") print("Hello!")

# QUIZ 03
x = c(1,5,NA,20,NA,13)
mean(x)
mean(x, na.rm=NULL)
mean(x, rm.na=TRUE)
mean(x[!is.na(x)])
mean(x, na.rm=FALSE)
mean(x[is.na(x)])
mean(x, na.rm=TRUE)

# QUIZ 5
par(mfcol=c(1,2), mar=c(5, 4, 1, 2) + 0.1 )
plot(1:10)
plot(20:29)

layout(matrix(c(2,1), 2, 1))
plot(1:10)
plot(20:29)

# QUIZ 7
df = read.table("input.csv", sep=";", header=TRUE, stringsAsFactors=FALSE)
df$date = as.Date(df$date, format="%d.%m.%y")

df = read.csv("input.csv", header=TRUE, stringsAsFactors=FALSE)
df$date = as.Date(df$date)

df = read.table("input.csv", sep=";", header=TRUE, stringsAsFactors=FALSE)
df$date = as.POSIXct(df$date)

df = read.table("input.csv", sep=";", header=TRUE, stringsAsFactors=FALSE)
df$date = as.Date(df$date)

df = read.table("input.csv", sep=";", header=TRUE, stringsAsFactors=FALSE)
df$date = as.Date(df$date, format="%d.%m.%Y")

df = read.csv("input.csv", sep=";", header=TRUE, stringsAsFactors=TRUE)
df$date = as.Date(df$date, format="%d.%m.%Y")

# QUIZ 8
func_egl = function(precip, egl) {
  # Abflussganglinie (in m3/s)
  out = rep(0., length(precip) + length(egl) - 1)        
  for (i in 1:length(precip)) {
    # Abflussantwort auf Impuls i
    out_i = precip[i] * egl 
    # Zeitindices, auf welche sich Impuls i verteilt
    ix = i:(i+length(egl)-1)
    # Addiere auf Abflussganglinie
    out[ix] = out[ix] + out_i
  }          
  return(out)
}
# Aufruf der Funktion mit beliebigen Argumenten 
func_egl(c(1., 5., 10.), c(0.1, 0.4, 0.3, 0.2))



