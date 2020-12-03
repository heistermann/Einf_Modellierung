#Korrektur-Template Termin_2
################################################################################

# Bitte zuerst die zu beurteilende Lösung hierher kopieren.
# Dann gesamtes Skript mit Strg+Shift+S ausführen und Ausgabe am Ende beachten.

################################################################################
rm(list=ls()) #Speicher leeren
cat("\014") #Konsole leeren
kontrollergebnis_alle = data.frame() #gesammelte Korrekturergebnisse
################################################################################

#Aufgabe 01_schwimmbad; Musterlösung:
schwimmbad_muster_lsg  = function(n0, r, n_grenzwert) {
  exp_Wachstum = function (n0, r, nt)
  {  
      # n0 : Startpopulation
      # r  : Wachstumsrate
      # nt : Anzahl Zeitschritte
      
      n = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population anlegen
      n[1] = n0
      
      for (t in 2:nt)
      n[t] = n[t-1] + r * n[t-1]
      
      return(n)
  }
  
  n = exp_Wachstum (n0, r, 1000)
  sperrtag = which (n > n_grenzwert)[1]
  
  if (is.na(sperrtag)) sperrtag = -1
  
  return (sperrtag)
}
#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "schwimmbad", tests=5, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(schwimmbad(n0 = 2L, r = 0.1, n_grenzwert = 100L)) #Ergebnis der Einreichung
 muster_lsg  = try(schwimmbad_muster_lsg(n0 = 2L, r = 0.1, n_grenzwert = 100L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(schwimmbad(n0 = 50L, r = 0.01, n_grenzwert = 200L)) #Ergebnis der Einreichung
 muster_lsg  = try(schwimmbad_muster_lsg(n0 = 50L, r = 0.01, n_grenzwert = 200L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(schwimmbad(n0 = 5L, r = 0.001, n_grenzwert = 1000L)) #Ergebnis der Einreichung
 muster_lsg  = try(schwimmbad_muster_lsg(n0 = 5L, r = 0.001, n_grenzwert = 1000L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test4
 einreichung = try(schwimmbad(n0 = 10L, r = 1.2, n_grenzwert = 100L)) #Ergebnis der Einreichung
 muster_lsg  = try(schwimmbad_muster_lsg(n0 = 10L, r = 1.2, n_grenzwert = 100L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test5
 einreichung = try(schwimmbad(n0 = 200L, r = 0.1, n_grenzwert = 100L)) #Ergebnis der Einreichung
 muster_lsg  = try(schwimmbad_muster_lsg(n0 = 200L, r = 0.1, n_grenzwert = 100L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 02_schwimmbad2; Musterlösung:
schwimmbad2_muster_lsg  = function(n0, r, n_grenzwert, r_chlor) {
   exp_Wachstum = function (n0, r, nt)
   {  
     # n0 : Startpopulation
     # r  : Wachstumsrate
     # nt : Anzahl Zeitschritte
     
     n = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population anlegen
     n[1] = n0
     
     for (t in 2:nt)
       n[t] = n[t-1] + r * n[t-1]
     
     return(n)
   }
   
   n = exp_Wachstum (n0=n0, r=r, nt=1000)
   sperrtag = which (n > n_grenzwert)[1]
   
   if (is.na(sperrtag)) return(round(max(n)))   #Grenzwert wurde nicht überschritten, gib Maximalpopulation zurück
   
   N_chlor = exp_Wachstum (n0=n[sperrtag], r=r_chlor, nt=4)  #Wachstum unter Chloreinfluss
   
   return (round(N_chlor[4]))
}
#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "schwimmbad2", tests=5, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(schwimmbad2(n0 = 2L, r = 0.1, n_grenzwert = 100L, r_chlor = -0.1)) #Ergebnis der Einreichung
 muster_lsg  = try(schwimmbad2_muster_lsg(n0 = 2L, r = 0.1, n_grenzwert = 100L, r_chlor = -0.1)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(schwimmbad2(n0 = 50L, r = 0.01, n_grenzwert = 200L, r_chlor = 0L)) #Ergebnis der Einreichung
 muster_lsg  = try(schwimmbad2_muster_lsg(n0 = 50L, r = 0.01, n_grenzwert = 200L, r_chlor = 0L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(schwimmbad2(n0 = 5L, r = 0.001, n_grenzwert = 1000L, r_chlor = -0.1)) #Ergebnis der Einreichung
 muster_lsg  = try(schwimmbad2_muster_lsg(n0 = 5L, r = 0.001, n_grenzwert = 1000L, r_chlor = -0.1)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test4
 einreichung = try(schwimmbad2(n0 = 10L, r = 1.2, n_grenzwert = 100L, r_chlor = 0.3)) #Ergebnis der Einreichung
 muster_lsg  = try(schwimmbad2_muster_lsg(n0 = 10L, r = 1.2, n_grenzwert = 100L, r_chlor = 0.3)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test5
 einreichung = try(schwimmbad2(n0 = 200L, r = 0.1, n_grenzwert = 100L, r_chlor = 0.01)) #Ergebnis der Einreichung
 muster_lsg  = try(schwimmbad2_muster_lsg(n0 = 200L, r = 0.1, n_grenzwert = 100L, r_chlor = 0.01)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 03_wuerfel; Musterlösung:
wuerfel_muster_lsg  = function(n_wuerfe, seed) {
   set.seed(seed)
   wuerfe = ceiling(runif(n = n_wuerfe, min = 0, max=6))
   return (wuerfe)
}
#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "wuerfel", tests=4, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(wuerfel(n_wuerfe = 2L, seed = 1L)) #Ergebnis der Einreichung
 muster_lsg  = try(wuerfel_muster_lsg(n_wuerfe = 2L, seed = 1L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(wuerfel(n_wuerfe = 5L, seed = 3L)) #Ergebnis der Einreichung
 muster_lsg  = try(wuerfel_muster_lsg(n_wuerfe = 5L, seed = 3L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(wuerfel(n_wuerfe = 7L, seed = 0L)) #Ergebnis der Einreichung
 muster_lsg  = try(wuerfel_muster_lsg(n_wuerfe = 7L, seed = 0L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test4
 einreichung = try(wuerfel(n_wuerfe = 3L, seed = 1000L)) #Ergebnis der Einreichung
 muster_lsg  = try(wuerfel_muster_lsg(n_wuerfe = 3L, seed = 1000L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 04_wuerfel_gezinkt; Musterlösung:
wuerfel_gezinkt_muster_lsg  = function(wurf) {
   n_wuerfe = length(wurf)
   testwurf = rep(0, n_wuerfe)
   seed=0
   while(any(testwurf != wurf))
   {
    seed=seed+1
    set.seed(seed)
    testwurf = sample(x = 1:6, size = n_wuerfe, replace = TRUE)
   }
   return (seed)
}
#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "wuerfel_gezinkt", tests=4, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(wuerfel_gezinkt(wurf = 1L)) #Ergebnis der Einreichung
 muster_lsg  = try(wuerfel_gezinkt_muster_lsg(wurf = 1L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(wuerfel_gezinkt(wurf = 6L)) #Ergebnis der Einreichung
 muster_lsg  = try(wuerfel_gezinkt_muster_lsg(wurf = 6L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(wuerfel_gezinkt(wurf = 1L)) #Ergebnis der Einreichung
 muster_lsg  = try(wuerfel_gezinkt_muster_lsg(wurf = 1L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test4
 einreichung = try(wuerfel_gezinkt(wurf = 1L)) #Ergebnis der Einreichung
 muster_lsg  = try(wuerfel_gezinkt_muster_lsg(wurf = 1L)) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
################################################################################

#Aufgabe 05_interpolation; Musterlösung:
interpolation_muster_lsg  = function(t_mess, x_mess, t_approx) { return(round(approx(x=t_mess, y = x_mess, xout =t_approx)$y, digits=1)) }
#Überprüfung: 
 kontrollergebnis_t =  data.frame(aufgabe = "interpolation", tests=3, nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
 #test1
 einreichung = try(interpolation(t_mess = 0:1, x_mess = c(0L, 30L), t_approx = list(0.5, 1L))) #Ergebnis der Einreichung
 muster_lsg  = try(interpolation_muster_lsg(t_mess = 0:1, x_mess = c(0L, 30L), t_approx = list(0.5, 1L))) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test2
 einreichung = try(interpolation(t_mess = list(0L, 1L, 2.5), x_mess = c(0L, 30L, 31L), t_approx = list(0.5, 1L, 1.1))) #Ergebnis der Einreichung
 muster_lsg  = try(interpolation_muster_lsg(t_mess = list(0L, 1L, 2.5), x_mess = c(0L, 30L, 31L), t_approx = list(0.5, 1L, 1.1))) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

 #test3
 einreichung = try(interpolation(t_mess = c(2L, 4L, 5L, 8L), x_mess = c(1L, 2L, 5L, 10L), t_approx = list(2.6, 2.6, 3L))) #Ergebnis der Einreichung
 muster_lsg  = try(interpolation_muster_lsg(t_mess = c(2L, 4L, 5L, 8L), x_mess = c(1L, 2L, 5L, 10L), t_approx = list(2.6, 2.6, 3L))) #Ergebnis der Musterlösung
if (identical(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zähle richtige Ergebnisse
if (class(einreichung) == "try-error") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zähle fehlerhafte Aufrufe

kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern


################################################################################
kontrollergebnis_alle$anteil_richtig = kontrollergebnis_alle$richtig / kontrollergebnis_alle$tests
kontrollergebnis_alle$punkte = 100 / nrow(kontrollergebnis_alle) * kontrollergebnis_alle$anteil_richtig
print(kontrollergebnis_alle)
print(paste0("Gesamtpunktzahl für diesen Termin: ", round(sum(kontrollergebnis_alle$punkte))))
print(paste0("Bitte Punktzahl in Moodle eintragen, obenstehende Tabelle und etwaige weitere Hinweise als Kommentar hinzufügen."))

