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
instoepfchen(c(1,2,1,4,0,0), 2)


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


curveNumber1 = function(lanu1, lanu2, boden) {
  tab = "LANU1;LANU2;A;B;C;D
	Freiflaeche;geringer Wiesenanteil;68;79;86;89
	Freiflaeche;mittlerer Wiesenanteil;49;69;79;84
	Freiflaeche;hoher Wiesenanteil;39;61;74;80
	Verkehrsflaeche;vollversiegelt;98;98;98;98
	Verkehrsflaeche;offener Wegerand;83;89;92;93
	Verkehrsflaeche;Schotterweg;76;85;89;91
	Verkehrsflaeche;Feldweg;72;82;87;89
	Gewerbeflaeche;Geschaeftsflaeche;89;92;94;95
	Gewerbeflaeche;Industrieflaeche;81;88;91;93
	Wohngebiet;>65% bebaut;77;85;90;92
	Wohngebiet;38% bebaut;61;75;83;87
	Wohngebiet;30% bebaut;57;72;81;86
	Wohngebiet;25% bebaut;54;70;80;85
	Wohngebiet;20%bebaut;51;68;79;84
	Wohngebiet;<12%bebaut;46;65;77;82"
  con = textConnection(tab)
  df = read.table(con, header=TRUE, sep=";", stringsAsFactors=FALSE, strip.white=TRUE)
  return(subset(df, LANU1==lanu1 & LANU2==lanu2)[,boden])
}

curveNumber1("Freiflaeche","hoher Wiesenanteil","B")
curveNumber1("Wohngebiet","30% bebaut","A")
curveNumber1("Verkehrsflaeche","Feldweg","A")
curveNumber1("Freiflaeche","mittlerer Wiesenanteil","D")


curveNumber2 = function(cn2, precip, vegetation) {
  tab = "normal;trocken;feucht
  10;0.40;2.22
  20;0.45;1.85
  30;0.50;1.67
  40;0.55;1.50
  50;0.62;1.40
  60;0.67;1.30
  70;0.73;1.21
  80;0.79;1.14
  90;0.87;1.07
  100;1.00;1.00"
  con = textConnection(tab)
  df = read.table(con, header=TRUE, sep=";", stringsAsFactors=FALSE, strip.white=TRUE)

  P5 = sum(precip)
  amc = "normal"
  if (vegetation) {
    if (P5<36) amc = "trocken"
    if (P5>53) amc = "feucht"
  } else {
    if (P5<13) amc = "trocken"
    if (P5>28) amc = "feucht"
  }
  
  if (amc=="normal") {
    return(cn2)
  } else {
    return( df[which.min(abs(df$normal - cn2)),amc] * cn2 )
  }
}

curveNumber2(72, c(2,5,3,6,0), TRUE)
curveNumber2(57, c(2,20,30,6,0), FALSE)
curveNumber2(63, c(2,1,3,1,0), FALSE)
curveNumber2(92, c(2,5,3,6,30), TRUE)