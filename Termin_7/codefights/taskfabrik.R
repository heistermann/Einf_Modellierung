rm(list=ls())

# Task 01
namenseintrag = function(vorname, nachname) {
  return (paste(nachname, vorname, sep=", "))
}

namenseintrag("Henry", "Darcy")
namenseintrag("Lorenzo A.", "Richards")
namenseintrag("Claude-Louis", "Navier")
namenseintrag("George Gabriel", "Stokes")


# Task 02
umkehren = function(name) {
  teile = strsplit(name, ", ")
  teile = unlist(teile)
  return (paste(teile[2], teile[1], sep=" "))
}

umkehren("Darcy, Henry")
umkehren("Richards, Lorenzo A.")
umkehren("Navier, Claude-Louis")
umkehren("Stokes, George Gabriel")


# Task 03
initialen = function(vorname, nachname) {
  ini1 = substr(vorname, 1, 1)
  ini2 = substr(nachname, 1, 1)
  return (paste(ini1, ".", ini2, ".", sep=""))
}

initialen("Henry", "Darcy")
initialen("Lorenzo A.", "Richards")
initialen("Claude-Louis", "Navier")
initialen("George Gabriel", "Stokes")


# Task 04
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


# Task 05
afd_rede = function(text, abstand, schwort)
{  
  woerter = unlist(strsplit(text, " "))
  
  #woerter[1:length(woerter) %% abstand ==0] =  schwort
  woerter[seq(abstand,length(woerter),abstand)] =  schwort
  return(paste(woerter, collapse=" "))
}

afd_rede("Denk ich an Deutschland in der Nacht, bin ich um den Schlaf gebracht", 4, "Patrioten")
afd_rede("Fuer jedes komplexe Problem gibt es eine Loesung, die einfach, einleuchtend und falsch ist", 1, "Aussengrenze")
afd_rede("Drei Chinesen mit nem Kontrabass sassen auf der Strasse", 2, "Sauerkraut")


# Task 06
#sieb = function(bis)
#{  
#  
#  zahlen = 2:bis
#  primzahlen = NULL
#  while (length(zahlen)>0)
#  {  
#    primzahlen = c(primzahlen, zahlen[1])
#    zahlen = zahlen[zahlen %% zahlen[1]!=0]                   
#  }  
#  return(primzahlen)
#}

#sieb = function(bis)
#{  
#  zahlen = 2:bis
#  primzahlen = c(2)
#  for (zahl in zahlen)
#  { 
#    mod = (zahl %% 2:(zahl-1))
#    if (!(0 %in% mod)) {
#      primzahlen = c(primzahlen, zahl)
#    }
#  }  
#  return(primzahlen)
#}

#sieb(2)
#sieb(30)
#sieb(50)





