# dynamisch erzeugt mit Uebungen_Korrekturen_erzeugen.R
#Musterloesungen zu Lektion Termin_4/codefights
lektion = "Termin_4/codefights" #lektion/Nr der Lektion
################################################################################
################################################################################

#Uebung aschenbroedel; Musterloesung:
instoepfchen_muster_lsg  = function(erbsen, gut) {
  return(length(which(erbsen==gut)))
}
################################################################################

#Uebung Jahresniederschlag; Musterloesung:
jahresniederschlag_muster_lsg  = function(niederschlaege, jahre, jahr) {
  return( niederschlaege[jahre==jahr])
}
################################################################################

#Uebung Jahresniederschlagsmittel; Musterloesung:
niederschlagsmittel_muster_lsg  = function(niederschlaege, jahre, anfang, ende) {
  return( mean(niederschlaege[(jahre>=anfang) & (jahre<=ende)]))
}
################################################################################

#Uebung gradtage; Musterloesung:
gradtage_muster_lsg  = function(temp, erntereif) {
  temp[temp<0] = 0
  gradtage = cumsum(temp)
  ueber = which(gradtage>=erntereif)
  return( ueber[1] )
}

################################################################################

#Uebung curveNumber1; Musterloesung:
curvenumber1_muster_lsg  = function(lanu1, lanu2, boden) {
  con = "https://raw.githubusercontent.com/heistermann/served/master/txt/CN_Tabelle.csv"
  df = read.table(con, header=TRUE, sep=";", stringsAsFactors=FALSE, strip.white=TRUE)
  return(subset(df, LANU1==lanu1 & LANU2==lanu2)[,boden])
}
################################################################################

#Uebung curveNumber2; Musterloesung:
curvenumber2_muster_lsg  = function(cn2, precip, vegetation) {
  con = "https://raw.githubusercontent.com/heistermann/served/master/txt/CN_anpassung.csv"
  df = read.table(con, header=TRUE, sep=";", stringsAsFactors=FALSE, strip.white=TRUE)
  p5 = sum(precip)
  amc = "normal"
  if (vegetation) {
    if (p5<36) amc = "trocken"
    if (p5>53) amc = "feucht"
  } else {
    if (p5<13) amc = "trocken"
    if (p5>28) amc = "feucht"
  }
  output = round(subset(df,cn==cn2)[,amc] * cn2)
  return( output )

}



################################################################################
