# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"
# 1.11.2016
# Populationswachstum, exponentielles Modell mit Umweltstochastizität
# Funktion "log_Wachstum" definieren
#...hier ergänzen...
{  
# n0 :            Startpopulation
# r_max:   :  maximale Wachstumsrate
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
  
#Funktion mit n0 = 2, r_max=0.2, K=100, nt = 50 aufrufen, Rückgabewert in n_1 speichern
#...hier ergänzen...
#Funktion mit n0 = 2, r_max=0.6, K=100, nt = 50 aufrufen, Rückgabewert in n_2 speichern
#...hier ergänzen...
#Funktion mit n0 = 2, r_max=1, K=100, nt = 50 aufrufen, Rückgabewert in n_3 speichern
#...hier ergänzen...
#Funktion mit n0 = 2, r_max=0.2, K=50, nt = 50 aufrufen, Rückgabewert in n_4 speichern
#...hier ergänzen...
#Funktion mit n0 = 60, r_max=0.2, K=50, nt = 50 aufrufen, Rückgabewert in n_5 speichern
#...hier ergänzen...
#Resultate (n_1 - n_4) in einer Grafik darstellen
#...hier ergänzen...
### Hohe Wachstumsraten
#Funktion mit n0 = 2, r_max=1, K=100, nt = 50 aufrufen, Rückgabewert in n_1 speichern
#...hier ergänzen...
#Funktion mit n0 = 2, r_max=2, K=100, nt = 50 aufrufen, Rückgabewert in n_2 speichern
#...hier ergänzen...
#Funktion mit n0 = 2, r_max=2.5, K=100, nt = 50 aufrufen, Rückgabewert in n_3 speichern
#...hier ergänzen...
#Funktion mit n0 = 2, r_max=3, K=100, nt = 50 aufrufen, Rückgabewert in n_4 speichern
#...hier ergänzen...
#Resultate (n_1 - n_4) in einer Grafik darstellen
#...hier ergänzen...
  
  #? Was bedeutet es inhaltlich, wenn die Population die Kapazität überschreitet?
  #? Wann sollte dieses Verhalten unterbunden werden?
  #? Wie könnte dieses Verhalten unterbunden werden?
 