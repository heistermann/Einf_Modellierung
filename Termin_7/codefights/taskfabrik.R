rm(list=ls())

# Task 01
schach = function(feld)
{  
  
  figuren = rep(c("K","D","T","S","L","B"," "), times=c(2,2,4,4,4,16,32))
  set.seed(1)
  brett = array(sample(figuren), c(8,8))
  
  dimnames(brett)=list(8:1,letters[1:8])
  return(brett[substr(feld,2,2), substr(feld,1,1)])
}


schach("b7")

schach("d8")

schach("a2")


# Task 02
sieb = function(bis)
{  
  
  zahlen = 2:bis
  primzahlen = NULL
  while (length(zahlen)>0)
  {  
    primzahlen = c(primzahlen, zahlen[1])
    zahlen = zahlen[zahlen %% zahlen[1]!=0]                   
  }  
  return(primzahlen)
}


sieb(10)

sieb(30)

sieb(50)

# Task 02
afd_rede = function(text, abstand, schwort)
{  
  woerter = unlist(strsplit(text, " "))
  
  woerter[1:length(woerter) %% abstand ==0] =  schwort
  return(paste(woerter, collapse=" "))
}
  
afd_rede("Denk ich an Deutschland in der Nacht, bin ich um den Schlaf gebracht", 4, "Patrioten")

afd_rede("Für jedes komplexe Problem gibt es eine Lösung, die einfach, einleuchtend und falsch ist", 1, "Außengrenze")

afd_rede("Drei Chinesen mit nem Kontrabass saßen auf der Straße", 2, "Sauerkraut")



