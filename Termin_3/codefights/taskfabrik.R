rm(list=ls())


# Task 01
instoepfchen = function(erbsen, gut) {
  return(length(which(erbsen==gut)))
}
# Tests
instoepfchen(c(0,1,0,1,0,1), 1)
instoepfchen(c(0,0,1,1,1,1), 0)
instoepfchen(c(0,1,1,1,1,1), 1)
instoepfchen(c(1,1,1,1,0,0), 0)


# Task 02
sommerhochwasser = function(abfluss, monat, beginn, ende) {
  return( round(mean(abfluss[(monat>=beginn) & (monat<=ende)]),2 ))
}
# Tests
sommerhochwasser(c(1,7,3,2,4,8,3,8,7,3,5,1), 
                 c(1,2,7,4,9,10,6,8,5,11,12,3), 5, 7)
sommerhochwasser(c(8,4,3,5,2,3,8,7,1,7,3,1), 
                 c(5,1,2,9,10,7,6,11,3,12,4,8), 4, 9)
sommerhochwasser(c(3,3,3,1,8,7,4,8,1,2,5,7), 
                 c(5,1,3,10,4,8,12,2,6,9,7,11), 5, 9)
sommerhochwasser(c(5,2,3,8,3,7,3,7,4,8,1,1), 
                 c(8,4,7,5,2,3,1,11,12,6,9,10), 6, 10)

# Task 03
gradtage = function(temp, minT, erntereif) {
  x = temp - minT
  x[x<0] = 0
  return( which(cumsum(x)>=erntereif)[1] )
}
# Tests
gradtage(c(1,7,3,2,4,8,3,8,7,3,5,1), 2, 10)
gradtage(c(1,7,3,2,4,8,3,8,7,3,5,1), 4, 10)
gradtage(c(1,7,3,2,4,8,3,8,7,3,5,1), 4, 12)
gradtage(c(1,7,3,2,4,8,3,8,7,3,5,1), 4, 15)

bodentyp = function() {
  
}


curveNumber = function(ln1, ln2, boden) {
  tab = "LN1;LN2;A;B;C;D
  Freiflaeche;geringer Wiesenanteil;68;79;86;89
  Freiflaeche;mittlerer Wiesenanteil;49;69;79;84
  Freiflaeche;hoher Wiesenanteil;39;61;74;80
  Strasse;vollversiegelt;98;98;98;98
  Strasse;offener Wegerand;83;89;92;93
  Strasse;Schotterweg;76;85;89;91
  Strasse;Feldweg;72;82;87;89
  Urbane Flaeche;Geschaeftsflaeche;89;92;94;95
  Urbane Flaeche;Insustrieflaeche;81;88;91;93
  Wohngebiet;>65% bebaut;77;85;90;92
  Wohngebiet;38% bebaut;61;75;83;87
  Wohngebiet;30% bebaut;57;72;81;86
  Wohngebiet;25% bebaut;54;70;80;85
  Wohngebiet;20%bebaut;51;68;79;84
  Wohngebiet;<12%bebaut;46;65;77;82"
  con = textConnection(text)
  data = read.table(con, header=TRUE, sep=";", stringsAsFactors=FALSE, strip.white=TRUE)
  return(subset(data, LN1==ln1 & LN2==ln2)[,boden])
}

curveNumber("Freiflaeche","hoher Wiesenanteil","B")
curveNumber("Wohngebiet","30% bebaut","A")
curveNumber("Strasse","Feldweg","A")
curveNumber("Freiflaeche","mittlerer Wiesenanteil","D")