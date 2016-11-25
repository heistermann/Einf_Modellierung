# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"
# 1.11.2016
# Populationswachstum, exponentielles Modell mit Umwelteinwirkungen
# Funktion "exp_Wachstum_umwelt" definieren
#...hier ergänzen...
{  
# n0 :               Startpopulation
# r_pess, r_opt:   : minimale und maximale Wachstumsrate
# nt :               Anzahl Zeitschritte
  
  #Variablen vorbereiten
  n = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population
  n[1] = n0
  
  # Iterationsschleife
  for (t in 2:nt)
  # zufällige Ausprägung der Wachstumsrate (z.B. durch Klima) mit runif() erzeugen
  #...hier ergänzen...
  
  # Ergebnis zurückgeben
  return(n)
}
  
  # seed (optional)  : Initialisierung des Zufallsgenerators  
  
  #(optional): Initialisierung des Zufallsgenerators für reproduzierbaren Zufall
  seed=6
  set.seed(seed)
  
  #Funktion mit n0 = 2, r_pess= -0.2, r_opt=0.25, nt = 100 aufrufen, Rückgabewert in n_1 speichern
  #...hier ergänzen...
  
  #Funktion mit n0 = 2, r_pess= 0.75, r_opt=1.2, nt = 100 aufrufen, Rückgabewert in n_2 speichern
  #...hier ergänzen...
  #Resultate (n_1, n_2) in einer Grafik darstellen
  #...hier ergänzen...
  
  #? Welche Population stirbt (meist) (früher) aus?
  #? Wie kann der Zufallsaspekt reproduzierbar gemacht werden (Tipp: set.seed)
  seed=6
  set.seed(seed)
  
  #...hier ergänzen...