#Korrektur-Template Termin_7
################################################################################

# Bitte zuerst die zu beurteilende Lösung hierher kopieren.
# Dann gesamtes Skript mit Strg+Shift+S ausführen und Ausgabe am Ende beachten.

################################################################################
rm(list=ls()) #Speicher leeren
cat("\014") #Konsole leeren
kontrollergebnis_alle = data.frame() #gesammelte Korrekturergebnisse
################################################################################

#Aufgabe 01_schach; Musterlösung:
schach_muster_lsg  = function(feld) {  
  figuren = rep(c("K","D","T","S","L","B"," "), times=c(2,2,4,4,4,16,32))
  set.seed(1)
  brett = array(sample(figuren), c(8,8))

  dimnames(brett)=list(8:1,letters[1:8])
  return(brett[substr(feld,2,2), substr(feld,1,1)])
}
#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "schach", tests=3, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(schach(feld = "b7")) #Ergebnis der Einreichung
 muster_lsg  = try(schach_muster_lsg(feld = "b7")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(schach(feld = "d8")) #Ergebnis der Einreichung
 muster_lsg  = try(schach_muster_lsg(feld = "d8")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(schach(feld = "a2")) #Ergebnis der Einreichung
 muster_lsg  = try(schach_muster_lsg(feld = "a2")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 02_sieb; Musterlösung:
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
#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "sieb", tests=3, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(sieb(bis = 10L)) #Ergebnis der Einreichung
 muster_lsg  = try(sieb_muster_lsg(bis = 10L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(sieb(bis = 30L)) #Ergebnis der Einreichung
 muster_lsg  = try(sieb_muster_lsg(bis = 30L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(sieb(bis = 50L)) #Ergebnis der Einreichung
 muster_lsg  = try(sieb_muster_lsg(bis = 50L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 03_afd_rede; Musterlösung:
afd_rede_muster_lsg  = function(text, abstand, schwort) {  
  woerter = unlist(strsplit(text, " "))
  woerter[1:length(woerter) %% abstand ==0] =  schwort
  return(paste(woerter, collapse=" "))
}

#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "afd_rede", tests=3, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(afd_rede(text = "Denk ich an Deutschland in der Nacht, bin ich um den Schlaf gebracht", abstand = 4L, schwort = "Patrioten")) #Ergebnis der Einreichung
 muster_lsg  = try(afd_rede_muster_lsg(text = "Denk ich an Deutschland in der Nacht, bin ich um den Schlaf gebracht", abstand = 4L, schwort = "Patrioten")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(afd_rede(text = "Für jedes komplexe Problem gibt es eine Lösung, die einfach, einleuchtend und falsch ist", abstand = 1L, schwort = "Außengrenze")) #Ergebnis der Einreichung
 muster_lsg  = try(afd_rede_muster_lsg(text = "Für jedes komplexe Problem gibt es eine Lösung, die einfach, einleuchtend und falsch ist", abstand = 1L, schwort = "Außengrenze")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(afd_rede(text = "Drei Chinesen mit nem Kontrabass saßen auf der Straße", abstand = 2L, schwort = "Sauerkraut")) #Ergebnis der Einreichung
 muster_lsg  = try(afd_rede_muster_lsg(text = "Drei Chinesen mit nem Kontrabass saßen auf der Straße", abstand = 2L, schwort = "Sauerkraut")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern


################################################################################
kontrollergebnis_alle$anteil_richtig = kontrollergebnis_alle$richtig / kontrollergebnis_alle$tests
kontrollergebnis_alle$punkte = 100 / nrow(kontrollergebnis_alle) * kontrollergebnis_alle$anteil_richtig
print(kontrollergebnis_alle)
print(paste0("Gesamtpunktzahl für diesen Termin: ", round(sum(kontrollergebnis_alle$punkte))))
print(paste0("Bitte Punktzahl in Moodle eintragen, obenstehende Tabelle und etwaige weitere Hinweise als Kommentar hinzufügen."))

