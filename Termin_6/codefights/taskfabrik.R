# QUIZ 02
a = "Greet"
if (a = "Greet") print("Hello!")

a = "Do not greet."
if (a == "Greet") print("Hello!")

a = "Do not greet."
if (a == Greet) print("Hello!")

a = "Greet"
if (a == "Greet") print "Hello!"

a = "Greet"
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
x = 1:5
y = 10:15
plot(x, ylim=c(5,20), type="b")
lines(y, type="b")



# QUIZ 7
df = read.table("input.csv", sep=";", header=TRUE)
df$date = as.Date(df$date, format="%d.%m.%y")
df$date

df = read.csv("input.csv", sep=";", header=TRUE)
df$date = as.Date(df$date, format="%d/%m/%y")
df$date

df = read.table("input.csv", sep=";")
df$date = as.Date(df$date, format="%d.%m.%y")
df$date

df = read.table("input.csv", sep=";", header=TRUE)
df$date = as.Date(df$date)
df$date

df = read.table("input.csv", sep=";", header="TRUE")
df$date = as.Date(df$date, format="%d.%m.%y")
df$date

# QUIZ 8
qd = function(p, egl) {
  out = rep(0., length(p) + length(egl) - 1)        
  for (i in 1:length(p)) {
    out_i = p[i] * egl 
    ix = i:(i+length(egl)-1)
    out[ix] = out[ix] + out_i
  }          
  #return(out)
}
# Aufruf der Funktion mit beliebigen Argumenten 
qd(c(1., 5., 10.), c(0.1, 0.4, 0.3, 0.2))

# QUIZ 09
obs = runif(10,0,1)
sim = runif(10,0,1)
x = sum((obs - sim)^2)
x = sqrt( sum((obs - sim)^2) )
x = 1 - sum((obs - sim)^2) / s
(x = cor(obs, sim))
(x = mean(abs(obs - sim)))
