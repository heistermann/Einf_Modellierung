#Korrektur-Template Termin_5
################################################################################

# Bitte zuerst die zu beurteilende Lösung hierher kopieren.
# Dann gesamtes Skript mit Strg+Shift+S ausführen und Ausgabe am Ende beachten.

################################################################################
rm(list=ls()) #Speicher leeren
cat("\014") #Konsole leeren
kontrollergebnis_alle = data.frame() #gesammelte Korrekturergebnisse
################################################################################

#Aufgabe 01_welchertag; Musterlösung:
welchertag_muster_lsg  = function(datum) {
  return(strftime(as.Date(datum), format="%A"))
}

#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "welchertag", tests=4, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(welchertag(datum = "2016-11-15")) #Ergebnis der Einreichung
 muster_lsg  = try(welchertag_muster_lsg(datum = "2016-11-15")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(welchertag(datum = "2000-10-30")) #Ergebnis der Einreichung
 muster_lsg  = try(welchertag_muster_lsg(datum = "2000-10-30")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(welchertag(datum = "1999-05-10")) #Ergebnis der Einreichung
 muster_lsg  = try(welchertag_muster_lsg(datum = "1999-05-10")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test4
 einreichung = try(welchertag(datum = "1999-01-31")) #Ergebnis der Einreichung
 muster_lsg  = try(welchertag_muster_lsg(datum = "1999-01-31")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 02_ausschlafen; Musterlösung:
ausschlafen_muster_lsg  = function(datum) {
  name = strftime(as.Date(datum), format="%A")
  wochenende = c("Saturday", "Sunday")
  return(name %in% wochenende)
}

#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "ausschlafen", tests=4, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(ausschlafen(datum = "1944-05-03")) #Ergebnis der Einreichung
 muster_lsg  = try(ausschlafen_muster_lsg(datum = "1944-05-03")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(ausschlafen(datum = "1988-06-11")) #Ergebnis der Einreichung
 muster_lsg  = try(ausschlafen_muster_lsg(datum = "1988-06-11")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(ausschlafen(datum = "1915-08-16")) #Ergebnis der Einreichung
 muster_lsg  = try(ausschlafen_muster_lsg(datum = "1915-08-16")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test4
 einreichung = try(ausschlafen(datum = "2023-12-27")) #Ergebnis der Einreichung
 muster_lsg  = try(ausschlafen_muster_lsg(datum = "2023-12-27")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 03_vegetationsperiode; Musterlösung:
vegetationsperiode_muster_lsg  = function(datum, start, ende) {
  doy = as.numeric(strftime(as.Date(datum), format="%j"))
  if ((doy>= start) & (doy<=ende)) {
	return(TRUE)
  } else return(FALSE)
}

#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "vegetationsperiode", tests=4, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(vegetationsperiode(datum = "1944-05-03", start = 90L, ende = 300L)) #Ergebnis der Einreichung
 muster_lsg  = try(vegetationsperiode_muster_lsg(datum = "1944-05-03", start = 90L, ende = 300L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(vegetationsperiode(datum = "2025-02-15", start = 132L, ende = 196L)) #Ergebnis der Einreichung
 muster_lsg  = try(vegetationsperiode_muster_lsg(datum = "2025-02-15", start = 132L, ende = 196L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(vegetationsperiode(datum = "2015-10-15", start = 132L, ende = 196L)) #Ergebnis der Einreichung
 muster_lsg  = try(vegetationsperiode_muster_lsg(datum = "2015-10-15", start = 132L, ende = 196L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test4
 einreichung = try(vegetationsperiode(datum = "1993-07-23", start = 101L, ende = 290L)) #Ergebnis der Einreichung
 muster_lsg  = try(vegetationsperiode_muster_lsg(datum = "1993-07-23", start = 101L, ende = 290L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 04_ereignisdauer; Musterlösung:
ereignisdauer_muster_lsg  = function(start, ende) {
  dauer = difftime(as.POSIXct(ende), as.POSIXct(start), units="hours")
  return(round(as.numeric(dauer), 2))
}

#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "ereignisdauer", tests=4, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(ereignisdauer(start = "2011-03-05 09:02:34", ende = "2011-03-05 16:40:43")) #Ergebnis der Einreichung
 muster_lsg  = try(ereignisdauer_muster_lsg(start = "2011-03-05 09:02:34", ende = "2011-03-05 16:40:43")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(ereignisdauer(start = "1999-04-06 20:00:00", ende = "1999-04-08 17:40:00")) #Ergebnis der Einreichung
 muster_lsg  = try(ereignisdauer_muster_lsg(start = "1999-04-06 20:00:00", ende = "1999-04-08 17:40:00")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(ereignisdauer(start = "2023-04-06 19:30:00", ende = "2023-05-08 17:40:00")) #Ergebnis der Einreichung
 muster_lsg  = try(ereignisdauer_muster_lsg(start = "2023-04-06 19:30:00", ende = "2023-05-08 17:40:00")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test4
 einreichung = try(ereignisdauer(start = "2011-03-05 10:02:00", ende = "2011-03-05 16:40:43")) #Ergebnis der Einreichung
 muster_lsg  = try(ereignisdauer_muster_lsg(start = "2011-03-05 10:02:00", ende = "2011-03-05 16:40:43")) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 05_niederschlagsintensitaet; Musterlösung:
niederschlagsintensitaet_muster_lsg  = function(start, ende, volumen, radius) {
  dauer = difftime(as.POSIXct(ende), as.POSIXct(start), units="hours")
  hoehe = volumen * 1e3 / (pi*(radius*10)^2)
  return(round(hoehe / as.numeric(dauer), digits=2))
}
#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "niederschlagsintensitaet", tests=4, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(niederschlagsintensitaet(start = "2011-03-05 09:02:00", ende = "2011-03-05 16:40:00", volumen = 101L, radius = 5.64)) #Ergebnis der Einreichung
 muster_lsg  = try(niederschlagsintensitaet_muster_lsg(start = "2011-03-05 09:02:00", ende = "2011-03-05 16:40:00", volumen = 101L, radius = 5.64)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(niederschlagsintensitaet(start = "2012-03-06 10:02:34", ende = "2012-03-06 13:40:43", volumen = 206L, radius = 5.64)) #Ergebnis der Einreichung
 muster_lsg  = try(niederschlagsintensitaet_muster_lsg(start = "2012-03-06 10:02:34", ende = "2012-03-06 13:40:43", volumen = 206L, radius = 5.64)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(niederschlagsintensitaet(start = "2011-03-05 09:02:00", ende = "2011-03-05 16:40:00", volumen = 300L, radius = 11.3)) #Ergebnis der Einreichung
 muster_lsg  = try(niederschlagsintensitaet_muster_lsg(start = "2011-03-05 09:02:00", ende = "2011-03-05 16:40:00", volumen = 300L, radius = 11.3)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test4
 einreichung = try(niederschlagsintensitaet(start = "2012-03-06 10:02:34", ende = "2012-03-06 13:40:43", volumen = 563L, radius = 5.64)) #Ergebnis der Einreichung
 muster_lsg  = try(niederschlagsintensitaet_muster_lsg(start = "2012-03-06 10:02:34", ende = "2012-03-06 13:40:43", volumen = 563L, radius = 5.64)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern


################################################################################
kontrollergebnis_alle$anteil_richtig = kontrollergebnis_alle$richtig / kontrollergebnis_alle$tests
kontrollergebnis_alle$punkte = 100 / nrow(kontrollergebnis_alle) * kontrollergebnis_alle$anteil_richtig
print(kontrollergebnis_alle)
print(paste0("Gesamtpunktzahl für diesen Termin: ", round(sum(kontrollergebnis_alle$punkte))))
print(paste0("Bitte Punktzahl in Moodle eintragen, obenstehende Tabelle und etwaige weitere Hinweise als Kommentar hinzufügen."))

