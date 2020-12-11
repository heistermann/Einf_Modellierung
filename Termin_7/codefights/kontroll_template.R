#Korrektur-Template Termin_7
rm(list=ls()) #Speicher leeren
################################################################################
################################################################################

# Bitte zuerst die zu beurteilende Loesung hierher kopieren.
# Dann gesamtes Skript mit Strg+Shift+S ausfuehren und Ausgabe am Ende beachten.

# !!! Bitte keine Aenderungen unterhalb dieses Blocks !!!
################################################################################
################################################################################

cat("\014") #Konsole leeren
kontrollergebnis_alle = data.frame() #gesammelte Korrekturergebnisse
identical2 = function(a, b){isTRUE(all.equal(a,b))} #etwas toleranterer Vergleich zweier Objekte (erlaubt Vergleich von real und integer-Werten als gleich)
################################################################################

#Aufgabe 01_name; Musterloesung:
namenseintrag_muster_lsg  = function(vorname, nachname) {
  return (paste(nachname, vorname, sep=", "))
}
#Ueberpruefung: 
 kontrollergebnis_t =  data.frame(aufgabe = "namenseintrag", tests=4, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(namenseintrag(vorname = NULL, nachname = NULL)) #Ergebnis der Einreichung
 muster_lsg  = try(namenseintrag_muster_lsg(vorname = NULL, nachname = NULL)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test2
 einreichung = try(namenseintrag(vorname = NULL, nachname = NULL)) #Ergebnis der Einreichung
 muster_lsg  = try(namenseintrag_muster_lsg(vorname = NULL, nachname = NULL)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test3
 einreichung = try(namenseintrag(vorname = NULL, nachname = NULL)) #Ergebnis der Einreichung
 muster_lsg  = try(namenseintrag_muster_lsg(vorname = NULL, nachname = NULL)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test4
 einreichung = try(namenseintrag(vorname = NULL, nachname = NULL)) #Ergebnis der Einreichung
 muster_lsg  = try(namenseintrag_muster_lsg(vorname = NULL, nachname = NULL)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 02_umkehren; Musterloesung:
name_muster_lsg  = function(vorname, nachname) {
  return (paste(nachname, vorname, sep=", "))
}
#Ueberpruefung: 
 kontrollergebnis_t =  data.frame(aufgabe = "name", tests=4, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(name(name = NULL)) #Ergebnis der Einreichung
 muster_lsg  = try(name_muster_lsg(name = NULL)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test2
 einreichung = try(name(name = NULL)) #Ergebnis der Einreichung
 muster_lsg  = try(name_muster_lsg(name = NULL)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test3
 einreichung = try(name(name = NULL)) #Ergebnis der Einreichung
 muster_lsg  = try(name_muster_lsg(name = NULL)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test4
 einreichung = try(name(name = NULL)) #Ergebnis der Einreichung
 muster_lsg  = try(name_muster_lsg(name = NULL)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 03_initialen; Musterloesung:
namenseintrag_muster_lsg  = function(vorname, nachname) {
  return (paste(nachname, vorname, sep=", "))
}
#Ueberpruefung: 
 kontrollergebnis_t =  data.frame(aufgabe = "namenseintrag", tests=4, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(namenseintrag(vorname = NULL, nachname = NULL)) #Ergebnis der Einreichung
 muster_lsg  = try(namenseintrag_muster_lsg(vorname = NULL, nachname = NULL)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test2
 einreichung = try(namenseintrag(vorname = NULL, nachname = NULL)) #Ergebnis der Einreichung
 muster_lsg  = try(namenseintrag_muster_lsg(vorname = NULL, nachname = NULL)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test3
 einreichung = try(namenseintrag(vorname = NULL, nachname = NULL)) #Ergebnis der Einreichung
 muster_lsg  = try(namenseintrag_muster_lsg(vorname = NULL, nachname = NULL)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test4
 einreichung = try(namenseintrag(vorname = NULL, nachname = NULL)) #Ergebnis der Einreichung
 muster_lsg  = try(namenseintrag_muster_lsg(vorname = NULL, nachname = NULL)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 04_schach; Musterloesung:
schach_muster_lsg  = function(feld) {
  figuren = rep(c("K","D","T","S","L","B"," "), times=c(2,2,4,4,4,16,32))
  set.seed(1)
  brett = array(sample(figuren), c(8,8))

  dimnames(brett)=list(8:1,letters[1:8])
  return(brett[substr(feld,2,2), substr(feld,1,1)])
}
#Ueberpruefung: 
 kontrollergebnis_t =  data.frame(aufgabe = "schach", tests=3, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(schach(feld = "b7")) #Ergebnis der Einreichung
 muster_lsg  = try(schach_muster_lsg(feld = "b7")) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test2
 einreichung = try(schach(feld = "d8")) #Ergebnis der Einreichung
 muster_lsg  = try(schach_muster_lsg(feld = "d8")) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test3
 einreichung = try(schach(feld = "a2")) #Ergebnis der Einreichung
 muster_lsg  = try(schach_muster_lsg(feld = "a2")) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 05_afd_rede; Musterloesung:
afd_rede_muster_lsg  = function(text, abstand, schwort) {
  woerter = unlist(strsplit(text, " "))
  woerter[1:length(woerter) %% abstand ==0] =  schwort
  return(paste(woerter, collapse=" "))
}
#Ueberpruefung: 
 kontrollergebnis_t =  data.frame(aufgabe = "afd_rede", tests=3, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(afd_rede(text = "Denk ich an Deutschland in der Nacht, bin ich um den Schlaf gebracht", abstand = 4L, schwort = "Patrioten")) #Ergebnis der Einreichung
 muster_lsg  = try(afd_rede_muster_lsg(text = "Denk ich an Deutschland in der Nacht, bin ich um den Schlaf gebracht", abstand = 4L, schwort = "Patrioten")) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test2
 einreichung = try(afd_rede(text = "Für jedes komplexe Problem gibt es eine Lösung, die einfach, einleuchtend und falsch ist", abstand = 1L, schwort = "Außengrenze")) #Ergebnis der Einreichung
 muster_lsg  = try(afd_rede_muster_lsg(text = "Für jedes komplexe Problem gibt es eine Lösung, die einfach, einleuchtend und falsch ist", abstand = 1L, schwort = "Außengrenze")) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test3
 einreichung = try(afd_rede(text = "Drei Chinesen mit nem Kontrabass saßen auf der Straße", abstand = 2L, schwort = "Sauerkraut")) #Ergebnis der Einreichung
 muster_lsg  = try(afd_rede_muster_lsg(text = "Drei Chinesen mit nem Kontrabass saßen auf der Straße", abstand = 2L, schwort = "Sauerkraut")) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe out_sieb; Musterloesung:
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
#Ueberpruefung: 
 kontrollergebnis_t =  data.frame(aufgabe = "sieb", tests=3, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(sieb(bis = 10L)) #Ergebnis der Einreichung
 muster_lsg  = try(sieb_muster_lsg(bis = 10L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test2
 einreichung = try(sieb(bis = 30L)) #Ergebnis der Einreichung
 muster_lsg  = try(sieb_muster_lsg(bis = 30L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test3
 einreichung = try(sieb(bis = 50L)) #Ergebnis der Einreichung
 muster_lsg  = try(sieb_muster_lsg(bis = 50L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern


################################################################################
print(paste0(rep("#", 80), collapse = "")) #Trennlinie
kontrollergebnis_alle$anteil_richtig = kontrollergebnis_alle$richtig / kontrollergebnis_alle$tests
kontrollergebnis_alle$punkte = 100 / nrow(kontrollergebnis_alle) * kontrollergebnis_alle$anteil_richtig
print("Testergebnisse:")
print(paste0("Gesamtpunktzahl fuer diesen Termin: ", round(sum(kontrollergebnis_alle$punkte))))
print(paste0("Bitte in Moodle eintragen, (Feld <Bewertung fuer Kriterium 1>)."))
print(kontrollergebnis_alle)
print(paste0("Bitte in Moodle eintragen, Textfeld <Kommentar fuer Kriterium 1>."))

