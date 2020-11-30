# Task 02
	Summe <- function(arg1, arg2) {
	   return(arg1+arg2)
	}

Summe(1, 2)
#	output: 2

test2:
	input:
	- 2
	- 3
	output: 5

test3:
	input:
	- 4
	- 4
	output: 8



# Task 03
max_maximum <- function(v1, v2) {
   return(max(c(v1,v2)))
	}

max_maximum(c(1, 2, 3), c(1, 2, 3, 4))
#	output: 4

max_maximum(c(5, 2, 3), 0)
# output: 5

max_maximum(1000, c(1, 2, 3, 4, 5, 6, 7))
#	output: 1000



vektorteil(c(1, 2, 3), 1, 2)
# Task 04
vektorteil = function(v, start, n_e) {
  if (start+n_e -1 > length(v))
    return(c())
  return(v[start:(start+n_e-1)])
}

vektorteil(c(1, 2, 3), 1, 2)
vektorteil(c(5, 2, 3, 9), 2, 3 )
vektorteil(c(15, 13, 20, 21), 3, 2)
vektorteil(1:20, 19, 2)
vektorteil(1:3, 3, 2)


# Task 05
draengler = function(reihe) {
  reihe = reihe[reihe >= 1]
  for (i in 2:length(reihe)) {
    if (reihe[i] > reihe[i-1])
      reihe[(i-1):i] = reihe[i:(i-1)]
  }
  return(reihe)
}

draengler (c(1.8, 1.2, 1.7))
draengler (c(1.1, 1.8, 1.2, 1.7, 1.3))
draengler (c(1, 1, 0.8, 2, 0.9))
draengler (c(1.4, 1.3, 1.2, 1.1, 0.9))


#Task 6
hitzephasen = function(zeitreihe_temp, schwellenwert_temp, schwellenwert_laenge)
{
  hitzetage = as.numeric(zeitreihe_temp > schwellenwert_temp)
  phasen = strsplit(x = paste0(hitzetage, collapse = ""), split = "0+") 
  phasenlaenge = sapply(phasen[[1]], FUN = nchar)         
  return(sum(phasenlaenge >= schwellenwert_laenge))
}  
  

hitzephasen( c(19, 23, 24, 25, 19, 21), 20, 1)
hitzephasen( c(30, 33, 19, 23, 24, 25, 19, 21, 22), 20, 3)
hitzephasen( c(30, 33, 27, 15, 30, 31, 33, 20, 32, 33), 20, 1)
hitzephasen( c(30, 33, 27, 15, 30, 31, 33, 20, 32, 33), 15, 2)
hitzephasen( c(30, 33, 27, 15, 30, 31, 33, 20, 32, 33), 40, 2)




R_bug <- function(arg1) {
if (arg1==0) return (NULL)  else
  return(as.array(as.integer(1)))
}

R_bug(0)
str(R_bug(1))

a=1:3


