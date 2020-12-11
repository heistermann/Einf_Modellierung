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


jahresniederschlag = function(niederschlaege, jahre, jahr) {
  return( niederschlaege[jahre==jahr])
}
# Tests
jahresniederschlag(c(100,500,300,2500), 
                 c(1999,2000,2001,2002), 2000)
jahresniederschlag(c(100,500,300,2500), 
                   c(1999,2005,2001,2002), 2005)
jahresniederschlag(c(200,600,400,1500), 
                   c(1997,2000,2001,2010), 2010)
jahresniederschlag(c(200,600,400,1500), 
                   c(1997,2000,2001,2010), 2000)



niederschlagsmittel = function(niederschlaege, jahre, anfang, ende) {
  return( mean(niederschlaege[(jahre>=anfang) & (jahre<=ende)]))
}


# Tests
niederschlagsmittel(c(100,500,300,2500,200,600), 
                   c(1999,2000,2001,2002,2003,2004), 2000, 2002)
niederschlagsmittel(c(100,500,300,2500,200,600), 
                   c(1999,2000,2001,2002,2003,2004), 2002, 2004)
niederschlagsmittel(c(100,500,300,2500,200,600), 
                   c(1999,2000,2001,2002,2003,2004), 1999, 2002)
niederschlagsmittel(c(100,500,300,2500,200,600), 
                   c(1899,1900,1901,1902,1903,1904), 1900, 1903)



# Task 03
gradtage = function(temp, erntereif) {
  temp[temp<0] = 0
  gradtage = cumsum(temp)
  ueber = which(gradtage>=erntereif)
  return( ueber[1] )
}
# Tests
gradtage(c(1,7,3,2,4,8,3,8,7,3,5,1), 10)
gradtage(c(1,7,3,2,4,8,3,8,7,3,5,1), 20)
gradtage(c(1,7,3,2,4,8,3,8,7,3,5,1), 25)
gradtage(c(1,7,3,2,4,8,3,8,7,3,5,1), 40)


curveNumber1 = function(lanu1, lanu2, boden) {
  con = "https://raw.githubusercontent.com/heistermann/served/master/txt/CN_Tabelle.csv"
  df = read.table(con, header=TRUE, sep=";", stringsAsFactors=FALSE, strip.white=TRUE)
  return(subset(df, LANU1==lanu1 & LANU2==lanu2)[,boden])
}

curveNumber1("Freiflaeche","hoher Wiesenanteil","B")
curveNumber1("Wohngebiet","30% bebaut","A")
curveNumber1("Verkehrsflaeche","Feldweg","A")
curveNumber1("Freiflaeche","mittlerer Wiesenanteil","D")



curveNumber2 = function(cn2, precip, vegetation) {
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

curveNumber2(72, c(2,5,3,6,0), TRUE)
curveNumber2(57, c(2,20,30,6,0), FALSE)
curveNumber2(63, c(2,1,3,1,0), FALSE)
curveNumber2(92, c(2,5,3,6,30), TRUE)
