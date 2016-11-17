rm(list=ls())


# Task 01
erbsenzaehler = function(array1, target) {
  return(length(which(array1==target)))
}
# Tests
erbsenzaehler(c(1,4,3,7,5,8), 8)
erbsenzaehler(c(1,4,8,3,8,7,5,8), 8)
erbsenzaehler(c(2,4,8,2,2,7,5,8), 2)
erbsenzaehler(c(2,4,8,2,2,7,5,8), 10)

# Task 02
auswahl = function(array1, array2, lower, upper) {
  return(array2[(array1>lower) & (array1<upper)])
}
# Tests
auswahl(c(1,7,3,2,7,5,2), c(1,7,3,2,7,5,2))

bodentyp = function() {
  
}