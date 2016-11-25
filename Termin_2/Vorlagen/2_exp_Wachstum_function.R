# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"
# 1.11.2016
# Populationswachstum, exponentielles Modell, als Funktion umgesetzt
# Funktion "exp_Wachstum" definieren
#...hier ergänzen...
{  
# n0 : Startpopulation
# r  : Wachstumsrate
# nt : Anzahl Zeitschritte
  
  #Variablen vorbereiten
  n = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population
  n[1] = n0
  
  # Iterationsschleife
  for (t in 2:nt)
    n[t] = n[t-1] + r * n[t-1]
  
  # Ergebnis zurückgeben
  #...hier ergänzen...
}
  
  #Funktion mit n0 = 2, r  = 0.2, nt = 30 aufrufen, Rückgabewert in n_1 speichern
  #...hier ergänzen...
  
  #Funktion mit n0 = 4, r  = 0.2, nt = 30 aufrufen, Rückgabewert in n_2 speichern
  #...hier ergänzen...
  #Resultate (n_1, n_2) in einer Grafik darstellen
  #...hier ergänzen...
  
  #? Wie groß muss die Anfangspopulation sein, damit bei halbsogroßem Wachstum
  #? nach 30 Zeitschritten etwa die gleiche Population wie bei n_1 besteht?
  #...hier ergänzen...