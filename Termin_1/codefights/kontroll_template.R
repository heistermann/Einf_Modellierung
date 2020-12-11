#Korrektur-Template Termin_1
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

#Aufgabe 01_Echo; Musterloesung:
Echo_muster_lsg  = function(n) {
   return(n)
}
#Ueberpruefung: 
 kontrollergebnis_t =  data.frame(aufgabe = "Echo", tests=3, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(Echo(n = 1L)) #Ergebnis der Einreichung
 muster_lsg  = try(Echo_muster_lsg(n = 1L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test2
 einreichung = try(Echo(n = 2L)) #Ergebnis der Einreichung
 muster_lsg  = try(Echo_muster_lsg(n = 2L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test3
 einreichung = try(Echo(n = 3L)) #Ergebnis der Einreichung
 muster_lsg  = try(Echo_muster_lsg(n = 3L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 02_summe; Musterloesung:
Summe_muster_lsg  = function(arg1, arg2) {
   return(arg1+arg2)
}

#Ueberpruefung: 
 kontrollergebnis_t =  data.frame(aufgabe = "Summe", tests=3, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(Summe(arg1 = 1L, arg2 = 2L)) #Ergebnis der Einreichung
 muster_lsg  = try(Summe_muster_lsg(arg1 = 1L, arg2 = 2L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test2
 einreichung = try(Summe(arg1 = 2L, arg2 = 3L)) #Ergebnis der Einreichung
 muster_lsg  = try(Summe_muster_lsg(arg1 = 2L, arg2 = 3L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test3
 einreichung = try(Summe(arg1 = 4L, arg2 = 4L)) #Ergebnis der Einreichung
 muster_lsg  = try(Summe_muster_lsg(arg1 = 4L, arg2 = 4L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 03_max_maximum; Musterloesung:
max_maximum_muster_lsg  = function(v1, v2) {
  #Codefights-Bug, nicht nötig in richtigem R
  max(c(v1,v2))
}

#Ueberpruefung: 
 kontrollergebnis_t =  data.frame(aufgabe = "max_maximum", tests=3, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(max_maximum(v1 = 1:3, v2 = 1:4)) #Ergebnis der Einreichung
 muster_lsg  = try(max_maximum_muster_lsg(v1 = 1:3, v2 = 1:4)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test2
 einreichung = try(max_maximum(v1 = c(5L, 2L, 3L), v2 = 0L)) #Ergebnis der Einreichung
 muster_lsg  = try(max_maximum_muster_lsg(v1 = c(5L, 2L, 3L), v2 = 0L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test3
 einreichung = try(max_maximum(v1 = 1000L, v2 = 1:7)) #Ergebnis der Einreichung
 muster_lsg  = try(max_maximum_muster_lsg(v1 = 1000L, v2 = 1:7)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 04_vektorteil; Musterloesung:
vektorteil_muster_lsg  = function(v, start, n_e) {
  if (start+n_e -1 > length(v))
  return(c())
  return(v[start:(start+n_e-1)])
}
#Ueberpruefung: 
 kontrollergebnis_t =  data.frame(aufgabe = "vektorteil", tests=5, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(vektorteil(v = 1:3, start = 1L, n_e = 2L)) #Ergebnis der Einreichung
 muster_lsg  = try(vektorteil_muster_lsg(v = 1:3, start = 1L, n_e = 2L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test2
 einreichung = try(vektorteil(v = c(5L, 2L, 3L, 9L), start = 2L, n_e = 3L)) #Ergebnis der Einreichung
 muster_lsg  = try(vektorteil_muster_lsg(v = c(5L, 2L, 3L, 9L), start = 2L, n_e = 3L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test3
 einreichung = try(vektorteil(v = c(15L, 13L, 20L, 21L), start = 3L, n_e = 2L)) #Ergebnis der Einreichung
 muster_lsg  = try(vektorteil_muster_lsg(v = c(15L, 13L, 20L, 21L), start = 3L, n_e = 2L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test4
 einreichung = try(vektorteil(v = 1:20, start = 19L, n_e = 2L)) #Ergebnis der Einreichung
 muster_lsg  = try(vektorteil_muster_lsg(v = 1:20, start = 19L, n_e = 2L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test5
 einreichung = try(vektorteil(v = 1:3, start = 3L, n_e = 2L)) #Ergebnis der Einreichung
 muster_lsg  = try(vektorteil_muster_lsg(v = 1:3, start = 3L, n_e = 2L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 05_draengler; Musterloesung:
draengler_muster_lsg  = function(reihe) {
  reihe = reihe[reihe >= 1]
  for (i in 2:length(reihe)) {
	if (reihe[i] > reihe[i-1])
	  reihe[(i-1):i] = reihe[i:(i-1)]
  }
  return(reihe)
}

#Ueberpruefung: 
 kontrollergebnis_t =  data.frame(aufgabe = "draengler", tests=4, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(draengler(reihe = c(1.8, 1.2, 1.7))) #Ergebnis der Einreichung
 muster_lsg  = try(draengler_muster_lsg(reihe = c(1.8, 1.2, 1.7))) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test2
 einreichung = try(draengler(reihe = c(1.1, 1.8, 1.2, 1.7, 1.3))) #Ergebnis der Einreichung
 muster_lsg  = try(draengler_muster_lsg(reihe = c(1.1, 1.8, 1.2, 1.7, 1.3))) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test3
 einreichung = try(draengler(reihe = c(1, 1, 0.8, 2, 0.9))) #Ergebnis der Einreichung
 muster_lsg  = try(draengler_muster_lsg(reihe = c(1, 1, 0.8, 2, 0.9))) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test4
 einreichung = try(draengler(reihe = c(1.4, 1.3, 1.2, 1.1, 0.9))) #Ergebnis der Einreichung
 muster_lsg  = try(draengler_muster_lsg(reihe = c(1.4, 1.3, 1.2, 1.1, 0.9))) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 06_hitzephasen; Musterloesung:
hitzephasen_muster_lsg  = function(zeitreihe_temp, schwellenwert_temp, schwellenwert_laenge) {
  hitzetage = as.numeric(zeitreihe_temp > schwellenwert_temp)
  phasen = strsplit(x = paste0(hitzetage, collapse = ""), split = "0+") 
  phasenlaenge = sapply(phasen[[1]], FUN = nchar)         
  return(sum(phasenlaenge >= schwellenwert_laenge))
}  

#Ueberpruefung: 
 kontrollergebnis_t =  data.frame(aufgabe = "hitzephasen", tests=5, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(hitzephasen(zeitreihe_temp = c(19L, 23L, 24L, 25L, 19L, 21L), schwellenwert_temp = 20L, schwellenwert_laenge = 1L)) #Ergebnis der Einreichung
 muster_lsg  = try(hitzephasen_muster_lsg(zeitreihe_temp = c(19L, 23L, 24L, 25L, 19L, 21L), schwellenwert_temp = 20L, schwellenwert_laenge = 1L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test2
 einreichung = try(hitzephasen(zeitreihe_temp = c(30L, 33L, 19L, 23L, 24L, 25L, 19L, 21L, 22L), schwellenwert_temp = 20L, schwellenwert_laenge = 3L)) #Ergebnis der Einreichung
 muster_lsg  = try(hitzephasen_muster_lsg(zeitreihe_temp = c(30L, 33L, 19L, 23L, 24L, 25L, 19L, 21L, 22L), schwellenwert_temp = 20L, schwellenwert_laenge = 3L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test3
 einreichung = try(hitzephasen(zeitreihe_temp = c(30L, 33L, 27L, 15L, 30L, 31L, 33L, 20L, 32L, 33L), schwellenwert_temp = 20L, schwellenwert_laenge = 1L)) #Ergebnis der Einreichung
 muster_lsg  = try(hitzephasen_muster_lsg(zeitreihe_temp = c(30L, 33L, 27L, 15L, 30L, 31L, 33L, 20L, 32L, 33L), schwellenwert_temp = 20L, schwellenwert_laenge = 1L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test4
 einreichung = try(hitzephasen(zeitreihe_temp = c(30L, 33L, 27L, 15L, 30L, 31L, 33L, 20L, 32L, 33L), schwellenwert_temp = 15L, schwellenwert_laenge = 2L)) #Ergebnis der Einreichung
 muster_lsg  = try(hitzephasen_muster_lsg(zeitreihe_temp = c(30L, 33L, 27L, 15L, 30L, 31L, 33L, 20L, 32L, 33L), schwellenwert_temp = 15L, schwellenwert_laenge = 2L)) #Ergebnis der Musterloesung
if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe

 #test5
 einreichung = try(hitzephasen(zeitreihe_temp = c(30L, 33L, 27L, 15L, 30L, 31L, 33L, 20L, 32L, 33L), schwellenwert_temp = 40L, schwellenwert_laenge = 2L)) #Ergebnis der Einreichung
 muster_lsg  = try(hitzephasen_muster_lsg(zeitreihe_temp = c(30L, 33L, 27L, 15L, 30L, 31L, 33L, 20L, 32L, 33L), schwellenwert_temp = 40L, schwellenwert_laenge = 2L)) #Ergebnis der Musterloesung
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

