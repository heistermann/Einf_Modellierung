# Task 04
vektorteil = function(v, start, laenge) {
  if (start+laenge -1 > length(v))
    return(c())
  return(v[start:(start+laenge-1)])
}

vektorteil(c(1, 2, 3), 1, 2)
vektorteil(c(5, 2, 3, 9), 2, 3 )
vektorteil(c(15, 13, 20), 3, 1)
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


