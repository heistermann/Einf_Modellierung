#Korrektur-Template Termin_4
################################################################################

# Bitte zuerst die zu beurteilende Lösung hierher kopieren.
# Dann gesamtes Skript mit Strg+Shift+S ausführen und Ausgabe am Ende beachten.

################################################################################
rm(list=ls()) #Speicher leeren
cat("\014") #Konsole leeren
kontrollergebnis_alle = data.frame() #gesammelte Korrekturergebnisse
################################################################################

#Aufgabe 01_aschenbroedel; Musterlösung:
instoepfchen_muster_lsg  = function(erbsen, gut) {
  return(length(which(erbsen==gut)))
}

#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "instoepfchen", tests=5, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(instoepfchen(erbsen = c(0L, 1L, 0L, 1L, 0L, 1L), gut = 1L)) #Ergebnis der Einreichung
 muster_lsg  = try(instoepfchen_muster_lsg(erbsen = c(0L, 1L, 0L, 1L, 0L, 1L), gut = 1L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(instoepfchen(erbsen = c(0L, 0L, 1L, 1L, 1L, 1L), gut = 0L)) #Ergebnis der Einreichung
 muster_lsg  = try(instoepfchen_muster_lsg(erbsen = c(0L, 0L, 1L, 1L, 1L, 1L), gut = 0L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(instoepfchen(erbsen = c(0L, 1L, 1L, 1L, 1L, 1L), gut = 1L)) #Ergebnis der Einreichung
 muster_lsg  = try(instoepfchen_muster_lsg(erbsen = c(0L, 1L, 1L, 1L, 1L, 1L), gut = 1L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test4
 einreichung = try(instoepfchen(erbsen = c(1L, 1L, 1L, 1L, 0L, 0L), gut = 0L)) #Ergebnis der Einreichung
 muster_lsg  = try(instoepfchen_muster_lsg(erbsen = c(1L, 1L, 1L, 1L, 0L, 0L), gut = 0L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test5
 einreichung = try(instoepfchen(erbsen = c(1L, 2L, 1L, 4L, 0L, 0L), gut = 2L)) #Ergebnis der Einreichung
 muster_lsg  = try(instoepfchen_muster_lsg(erbsen = c(1L, 2L, 1L, 4L, 0L, 0L), gut = 2L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 02_sommerhochwasser; Musterlösung:
sommerhochwasser_muster_lsg  = function(abfluss, monat, beginn, ende) {
  return( round(mean(abfluss[(monat>=beginn) & (monat<=ende)]),2 ))
}

#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "sommerhochwasser", tests=4, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(sommerhochwasser(abfluss = c(1L, 7L, 3L, 2L, 4L, 8L, 3L, 8L, 7L, 3L, 5L, 1L), monat = c(1L, 2L, 7L, 4L, 9L, 10L, 6L, 8L, 5L, 11L, 12L, 3L), beginn = 5L, ende = 7L)) #Ergebnis der Einreichung
 muster_lsg  = try(sommerhochwasser_muster_lsg(abfluss = c(1L, 7L, 3L, 2L, 4L, 8L, 3L, 8L, 7L, 3L, 5L, 1L), monat = c(1L, 2L, 7L, 4L, 9L, 10L, 6L, 8L, 5L, 11L, 12L, 3L), beginn = 5L, ende = 7L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(sommerhochwasser(abfluss = c(8L, 4L, 3L, 5L, 2L, 3L, 8L, 7L, 1L, 7L, 3L, 1L), monat = c(5L, 1L, 2L, 9L, 10L, 7L, 6L, 11L, 3L, 12L, 4L, 8L), beginn = 4L, ende = 9L)) #Ergebnis der Einreichung
 muster_lsg  = try(sommerhochwasser_muster_lsg(abfluss = c(8L, 4L, 3L, 5L, 2L, 3L, 8L, 7L, 1L, 7L, 3L, 1L), monat = c(5L, 1L, 2L, 9L, 10L, 7L, 6L, 11L, 3L, 12L, 4L, 8L), beginn = 4L, ende = 9L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(sommerhochwasser(abfluss = c(3L, 3L, 3L, 1L, 8L, 7L, 4L, 8L, 1L, 2L, 5L, 7L), monat = c(5L, 1L, 3L, 10L, 4L, 8L, 12L, 2L, 6L, 9L, 7L, 11L), beginn = 5L, ende = 9L)) #Ergebnis der Einreichung
 muster_lsg  = try(sommerhochwasser_muster_lsg(abfluss = c(3L, 3L, 3L, 1L, 8L, 7L, 4L, 8L, 1L, 2L, 5L, 7L), monat = c(5L, 1L, 3L, 10L, 4L, 8L, 12L, 2L, 6L, 9L, 7L, 11L), beginn = 5L, ende = 9L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test4
 einreichung = try(sommerhochwasser(abfluss = c(5L, 2L, 3L, 8L, 3L, 7L, 3L, 7L, 4L, 8L, 1L, 1L), monat = c(8L, 4L, 7L, 5L, 2L, 3L, 1L, 11L, 12L, 6L, 9L, 10L), beginn = 6L, ende = 10L)) #Ergebnis der Einreichung
 muster_lsg  = try(sommerhochwasser_muster_lsg(abfluss = c(5L, 2L, 3L, 8L, 3L, 7L, 3L, 7L, 4L, 8L, 1L, 1L), monat = c(8L, 4L, 7L, 5L, 2L, 3L, 1L, 11L, 12L, 6L, 9L, 10L), beginn = 6L, ende = 10L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 03_gradtage; Musterlösung:
gradtage_muster_lsg  = function(temp, minT, erntereif) {
  x = temp - minT
  x[x<0] = 0
  return( which(cumsum(x)>=erntereif)[1] )
}
#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "gradtage", tests=4, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(gradtage(temp = c(1L, 7L, 3L, 2L, 4L, 8L, 3L, 8L, 7L, 3L, 5L, 1L), minT = 2L, erntereif = 10L)) #Ergebnis der Einreichung
 muster_lsg  = try(gradtage_muster_lsg(temp = c(1L, 7L, 3L, 2L, 4L, 8L, 3L, 8L, 7L, 3L, 5L, 1L), minT = 2L, erntereif = 10L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(gradtage(temp = c(1L, 7L, 3L, 2L, 4L, 8L, 3L, 8L, 7L, 3L, 5L, 1L), minT = 4L, erntereif = 10L)) #Ergebnis der Einreichung
 muster_lsg  = try(gradtage_muster_lsg(temp = c(1L, 7L, 3L, 2L, 4L, 8L, 3L, 8L, 7L, 3L, 5L, 1L), minT = 4L, erntereif = 10L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(gradtage(temp = c(1L, 7L, 3L, 2L, 4L, 8L, 3L, 8L, 7L, 3L, 5L, 1L), minT = 4L, erntereif = 12L)) #Ergebnis der Einreichung
 muster_lsg  = try(gradtage_muster_lsg(temp = c(1L, 7L, 3L, 2L, 4L, 8L, 3L, 8L, 7L, 3L, 5L, 1L), minT = 4L, erntereif = 12L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test4
 einreichung = try(gradtage(temp = c(1L, 7L, 3L, 2L, 4L, 8L, 3L, 8L, 7L, 3L, 5L, 1L), minT = 4L, erntereif = 15L)) #Ergebnis der Einreichung
 muster_lsg  = try(gradtage_muster_lsg(temp = c(1L, 7L, 3L, 2L, 4L, 8L, 3L, 8L, 7L, 3L, 5L, 1L), minT = 4L, erntereif = 15L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 04_cn1; Musterlösung:
curveNumber1_muster_lsg  = function(lanu1, lanu2, boden) {
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

#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "curveNumber1", tests=4, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(curveNumber1(lanu1 = "Freiflaeche", lanu2 = "hoher Wiesenanteil", boden = "B")) #Ergebnis der Einreichung
 muster_lsg  = try(curveNumber1_muster_lsg(lanu1 = "Freiflaeche", lanu2 = "hoher Wiesenanteil", boden = "B")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(curveNumber1(lanu1 = "Wohngebiet", lanu2 = "30% bebaut", boden = "A")) #Ergebnis der Einreichung
 muster_lsg  = try(curveNumber1_muster_lsg(lanu1 = "Wohngebiet", lanu2 = "30% bebaut", boden = "A")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(curveNumber1(lanu1 = "Verkehrsflaeche", lanu2 = "Feldweg", boden = "A")) #Ergebnis der Einreichung
 muster_lsg  = try(curveNumber1_muster_lsg(lanu1 = "Verkehrsflaeche", lanu2 = "Feldweg", boden = "A")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test4
 einreichung = try(curveNumber1(lanu1 = "Freiflaeche", lanu2 = "mittlerer Wiesenanteil", boden = "D")) #Ergebnis der Einreichung
 muster_lsg  = try(curveNumber1_muster_lsg(lanu1 = "Freiflaeche", lanu2 = "mittlerer Wiesenanteil", boden = "D")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 05_cn2; Musterlösung:
curveNumber2_muster_lsg  = function(cn2, precip, vegetation) {
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

#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "curveNumber2", tests=4, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(curveNumber2(cn2 = 72L, precip = c(2L, 5L, 3L, 6L, 0L), vegetation = TRUE)) #Ergebnis der Einreichung
 muster_lsg  = try(curveNumber2_muster_lsg(cn2 = 72L, precip = c(2L, 5L, 3L, 6L, 0L), vegetation = TRUE)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(curveNumber2(cn2 = 57L, precip = c(2L, 20L, 30L, 6L, 0L), vegetation = FALSE)) #Ergebnis der Einreichung
 muster_lsg  = try(curveNumber2_muster_lsg(cn2 = 57L, precip = c(2L, 20L, 30L, 6L, 0L), vegetation = FALSE)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(curveNumber2(cn2 = 63L, precip = c(2L, 1L, 3L, 1L, 0L), vegetation = FALSE)) #Ergebnis der Einreichung
 muster_lsg  = try(curveNumber2_muster_lsg(cn2 = 63L, precip = c(2L, 1L, 3L, 1L, 0L), vegetation = FALSE)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test4
 einreichung = try(curveNumber2(cn2 = 92L, precip = c(2L, 5L, 3L, 6L, 30L), vegetation = TRUE)) #Ergebnis der Einreichung
 muster_lsg  = try(curveNumber2_muster_lsg(cn2 = 92L, precip = c(2L, 5L, 3L, 6L, 30L), vegetation = TRUE)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern


################################################################################
kontrollergebnis_alle$anteil_richtig = kontrollergebnis_alle$richtig / kontrollergebnis_alle$tests
kontrollergebnis_alle$punkte = 100 / nrow(kontrollergebnis_alle) * kontrollergebnis_alle$anteil_richtig
print(kontrollergebnis_alle)
print(paste0("Gesamtpunktzahl für diesen Termin: ", round(sum(kontrollergebnis_alle$punkte))))
print(paste0("Bitte Punktzahl in Moodle eintragen, obenstehende Tabelle und etwaige weitere Hinweise als Kommentar hinzufügen."))

