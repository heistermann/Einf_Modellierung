#Korrektur-Template Termin_3
################################################################################

# Bitte zuerst die zu beurteilende Lösung hierher kopieren.
# Dann gesamtes Skript mit Strg+Shift+S ausführen und Ausgabe am Ende beachten.

################################################################################
rm(list=ls()) #Speicher leeren
cat("\014") #Konsole leeren
kontrollergebnis_alle = data.frame() #gesammelte Korrekturergebnisse
################################################################################

#Aufgabe 01_qualitaetskontrolle; Musterlösung:
qualitatetskontrolle_muster_lsg  = function(precip, stoertage) {
 #Codefights-bug; sonst nicht nötig
  precip[stoertage] = -9999
  return(precip)
}
#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "qualitatetskontrolle", tests=3, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(qualitatetskontrolle(precip = list(20L, 50L, 0.3, 0L, 0.7, 1L), stoertage = 1:2)) #Ergebnis der Einreichung
 muster_lsg  = try(qualitatetskontrolle_muster_lsg(precip = list(20L, 50L, 0.3, 0L, 0.7, 1L), stoertage = 1:2)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(qualitatetskontrolle(precip = 1:6, stoertage = 4:5)) #Ergebnis der Einreichung
 muster_lsg  = try(qualitatetskontrolle_muster_lsg(precip = 1:6, stoertage = 4:5)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(qualitatetskontrolle(precip = 1:6, stoertage = c(1L, 3L, 6L))) #Ergebnis der Einreichung
 muster_lsg  = try(qualitatetskontrolle_muster_lsg(precip = 1:6, stoertage = c(1L, 3L, 6L))) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 02_gebietsniederschlag; Musterlösung:
gebietsniederschlag_muster_lsg  = function(messungen) { messungen=unlist(messungen) #Codefights-Bug
  return(0.5*messungen[1] + 0.3*messungen[2] + 0.2*messungen[3])
}

#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "gebietsniederschlag", tests=3, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(gebietsniederschlag(messungen = 1L)) #Ergebnis der Einreichung
 muster_lsg  = try(gebietsniederschlag_muster_lsg(messungen = 1L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(gebietsniederschlag(messungen = 5L)) #Ergebnis der Einreichung
 muster_lsg  = try(gebietsniederschlag_muster_lsg(messungen = 5L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(gebietsniederschlag(messungen = 15L)) #Ergebnis der Einreichung
 muster_lsg  = try(gebietsniederschlag_muster_lsg(messungen = 15L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 03_egl1; Musterlösung:
egl1_muster_lsg  = function(precip, egl, area) {
 #Codefights Bug
  return(precip * area * egl / 3.6)
}

#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "egl1", tests=3, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(egl1(precip = 5L, egl = c(0.2, 0.5, 0.3), area = 3.6)) #Ergebnis der Einreichung
 muster_lsg  = try(egl1_muster_lsg(precip = 5L, egl = c(0.2, 0.5, 0.3), area = 3.6)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(egl1(precip = 10L, egl = c(0.1, 0.6, 0.3), area = 7.2)) #Ergebnis der Einreichung
 muster_lsg  = try(egl1_muster_lsg(precip = 10L, egl = c(0.1, 0.6, 0.3), area = 7.2)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(egl1(precip = 0L, egl = c(0.1, 0.6, 0.3), area = 10.8)) #Ergebnis der Einreichung
 muster_lsg  = try(egl1_muster_lsg(precip = 0L, egl = c(0.1, 0.6, 0.3), area = 10.8)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 04_egl2; Musterlösung:
egl2_muster_lsg  = function(precip, egl) {
 #Codefights Bug
  return(length(precip) + length(egl) - 1)
}

#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "egl2", tests=3, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(egl2(precip = c(2L, 6L, 3L, 2L, 7L, 4L, 5L), egl = c(0.2, 0.5, 0.3))) #Ergebnis der Einreichung
 muster_lsg  = try(egl2_muster_lsg(precip = c(2L, 6L, 3L, 2L, 7L, 4L, 5L), egl = c(0.2, 0.5, 0.3))) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(egl2(precip = 2L, egl = c(0.1, 0.6, 0.2, 0.1))) #Ergebnis der Einreichung
 muster_lsg  = try(egl2_muster_lsg(precip = 2L, egl = c(0.1, 0.6, 0.2, 0.1))) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(egl2(precip = c(2L, 6L, 3L, 2L, 7L, 4L, 5L, 15L), egl = c(0.1, 0.6, 0.2, 0.1))) #Ergebnis der Einreichung
 muster_lsg  = try(egl2_muster_lsg(precip = c(2L, 6L, 3L, 2L, 7L, 4L, 5L, 15L), egl = c(0.1, 0.6, 0.2, 0.1))) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 05_egl3; Musterlösung:
egl3_muster_lsg  = function(precip, egl, area) {
 #Codefights Bug
  out = rep(0, length(precip) + length(egl) - 1)
  for (i in 1:length(precip)) {
	ix = i:(i+length(egl)-1)
	out[ix] = out[ix] + precip[i] * egl * area / 3.6
  }  
  return(out)
}

#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "egl3", tests=3, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(egl3(precip = c(2L, 6L), egl = c(0.2, 0.5, 0.3), area = 3.6)) #Ergebnis der Einreichung
 muster_lsg  = try(egl3_muster_lsg(precip = c(2L, 6L), egl = c(0.2, 0.5, 0.3), area = 3.6)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(egl3(precip = c(3L, 10L, 5L), egl = c(0.1, 0.6, 0.2, 0.1), area = 7.2)) #Ergebnis der Einreichung
 muster_lsg  = try(egl3_muster_lsg(precip = c(3L, 10L, 5L), egl = c(0.1, 0.6, 0.2, 0.1), area = 7.2)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(egl3(precip = c(6L, 3L, 4L), egl = c(0.2, 0.5, 0.3), area = 10.8)) #Ergebnis der Einreichung
 muster_lsg  = try(egl3_muster_lsg(precip = c(6L, 3L, 4L), egl = c(0.2, 0.5, 0.3), area = 10.8)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern


################################################################################
kontrollergebnis_alle$anteil_richtig = kontrollergebnis_alle$richtig / kontrollergebnis_alle$tests
kontrollergebnis_alle$punkte = 100 / nrow(kontrollergebnis_alle) * kontrollergebnis_alle$anteil_richtig
print(kontrollergebnis_alle)
print(paste0("Gesamtpunktzahl für diesen Termin: ", round(sum(kontrollergebnis_alle$punkte))))
print(paste0("Bitte Punktzahl in Moodle eintragen, obenstehende Tabelle und etwaige weitere Hinweise als Kommentar hinzufügen."))

