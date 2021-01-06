# Seminar zu "Einfü¾˜¶˜¼hrung in die Modellierung/Integrierte Modellierung"
# 1.11.2016
# Populationswachstum, exponentielles Modell, als Funktion umgesetzt
# Funktion "exp_Wachstum" definieren
#...hier erg?nzen...
{  
# N0 : Startpopulation
# r  : Wachstumsrate
# nt : Anzahl Zeitschritte
  
  #Variablen vorbereiten
  N = rep(NA,nt) #Vektor fü¾˜¶˜¼r zeitlichen Verlauf der Population anlegen
# Startwerte an die erste Stelle des Vektors schreiben
  N[1] = N0
  
# Iterationsschleife ü¾˜¶˜¼ber alle weiteren Zeitschritte
  for (t in 2:nt)
    N[t] = N[t-1] + r * N[t-1]
  
  # Ergebnis zurü¾˜¶˜¼ckgeben
  #...hier erg?nzen...
}
  
  #Funktion mit N0 = 2, r  = 0.2, nt = 30 aufrufen, Rü¾˜¶˜¼ckgabewert in N_1 speichern
  #...hier erg?nzen...
  
  #Funktion mit N0 = 4, r  = 0.2, nt = 30 aufrufen, Rü¾˜¶˜¼ckgabewert in N_2 speichern
  #...hier erg?nzen...
  #Resultate (N_1, N_2) in einer Grafik darstellen
  #...hier erg?nzen...
  
  #? Wie groü¾™¦¼ muss die Anfangspopulation sein, damit bei halbsogroü¾™¦¼em Wachstum
  #? nach 30 Zeitschritten etwa die gleiche Population wie bei N_1 besteht?
  #...hier erg?nzen...