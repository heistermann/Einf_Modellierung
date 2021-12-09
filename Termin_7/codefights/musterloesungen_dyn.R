# dynamisch erzeugt mit Uebungen_Korrekturen_erzeugen.R
#Musterloesungen zu Lektion Termin_7/codefights
lektion = "Termin_7/codefights" #lektion/Nr der Lektion
################################################################################
################################################################################

#Uebung namenseintrag; Musterloesung:
namenseintrag_muster_lsg  = function(vorname, nachname) {
  return (paste(nachname, vorname, sep=", "))
}
################################################################################

#Uebung umkehren; Musterloesung:
name_muster_lsg  = function(vorname, nachname) {
  return (paste(nachname, vorname, sep=", "))
}
################################################################################

#Uebung namenseintrag; Musterloesung:
namenseintrag_muster_lsg  = function(vorname, nachname) {
  return (paste(nachname, vorname, sep=", "))
}
################################################################################

#Uebung Schach; Musterloesung:
schach_muster_lsg  = function(feld) {
  figuren = rep(c("K","D","T","S","L","B"," "), times=c(2,2,4,4,4,16,32))
  set.seed(1, kind = "Super-Duper") #reproduzierbarer Zufall auf allen Plattformen
  brett = array(sample(figuren), c(8,8))
  dimnames(brett)=list(8:1,letters[1:8])
  return(brett[substr(feld,2,2), substr(feld,1,1)])
}
################################################################################

#Uebung afd_rede; Musterloesung:
afd_rede_muster_lsg  = function(text, abstand, schwort) {
  woerter = unlist(strsplit(text, " "))
  woerter[1:length(woerter) %% abstand ==0] =  schwort
  return(paste(woerter, collapse=" "))
}
################################################################################

#Uebung T7_02_Sieb; Musterloesung:
sieb_muster_lsg  = function(bis) {  
  zahlen = 2:bis
  primzahlen = NULL
  while (length(zahlen)>0)
  {  
    primzahlen = c(primzahlen, zahlen[1])
    zahlen = zahlen[zahlen %% zahlen[1]!=0]                   
  }  
  return(primzahlen)
}


################################################################################
