# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"
# 1.11.2016
# Populationswachstum, exponentielles Modell, als Funktion umgesetzt
# Funktion "exp_Wachstum" definieren
#...hier ergänzen...
{  
# N0 : Startpopulation
# r  : Wachstumsrate
# nt : Anzahl Zeitschritte
  
  #Variablen vorbereiten
  N = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population anlegen
# Startwerte an die erste Stelle des Vektors schreiben
  N[1] = N0
  
# Iterationsschleife über alle weiteren Zeitschritte
  for (t in 2:nt)
    N[t] = N[t-1] + r * N[t-1]
  
  # Ergebnis zurückgeben
  #...hier ergänzen...
}
  
  #Funktion mit N0 = 2, r  = 0.2, nt = 30 aufrufen, Rückgabewert in N_1 speichern
  #...hier ergänzen...
  
  #Funktion mit N0 = 4, r  = 0.2, nt = 30 aufrufen, Rückgabewert in N_2 speichern
  #...hier ergänzen...
  #Resultate (N_1, N_2) in einer Grafik darstellen
  #...hier ergänzen...
  
  #? Wie groß muss die Anfangspopulation sein, damit bei halbsogroßem Wachstum
  #? nach 30 Zeitschritten etwa die gleiche Population wie bei N_1 besteht?
  #...hier ergänzen...