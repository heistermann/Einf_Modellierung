nicht verwendet
# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"
# 1.11.2016
# Populationswachstum, exponentielles Modell mit Umweltstochastizität
# Funktion "log_Wachstum_korr" definieren
#...hier ergänzen...
{  
# n0 :            Startpopulation
# Rmax:   :  maximale Wachstumsrate
# K :            Kapazität
# nt :            Anzahl Zeitschritte
# seed (optional) : Initialisierung des Zufallsgenerators  
 
  
  #Variablen vorbereiten
  n = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population
  n[1] = n0
  
  # Iterationsschleife
  for (t in 2:nt)
  #...hier ergänzen...
  
  # Ergebnis zurückgeben
  return(n)
}
  
  #Funktion mit n0 = 2, R_max=1, K=1000, nt = 50 aufrufen, Rückgabewert in n_1 speichern
  #...hier ergänzen...
  
  #Funktion mit n0 = 2, R_max=2, K=1000, nt = 50 aufrufen, Rückgabewert in n_1 speichern
  #...hier ergänzen...
  
  #Funktion mit n0 = 2, R_max=2.5, K=1000, nt = 50 aufrufen, Rückgabewert in n_1 speichern
  #...hier ergänzen...
  
  #Funktion mit n0 = 2, R_max=3, K=1000, nt = 50 aufrufen, Rückgabewert in n_1 speichern
  #...hier ergänzen...
  
  
  #Resultate (n_1, n_2) in einer Grafik darstellen
  #...hier ergänzen...
  
 