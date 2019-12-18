# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"
# 1.11.2016
# Populationswachstum: exponentielles Modell mit Umwelteinwirkungen
# Funktion "exp_Wachstum_umwelt" definieren
#...hier ergänzen...
{  
# N0 :               Startpopulation
# r_pess, r_opt:   : minimale und maximale Wachstumsrate
# nt :               Anzahl Zeitschritte
  
  #Variablen vorbereiten
  N = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population
  N[1] = N0
  
  # Iterationsschleife
  for (t in 2:nt)
  # zufällige Ausprägung der Wachstumsrate (z.B. durch Klima) mit runif() erzeugen
  #...hier ergänzen...
  
  # Ergebnis zurückgeben
  return(N)
}
  
  # seed (optional)  : Initialisierung des Zufallsgenerators  
  
  #(optional): Initialisierung des Zufallsgenerators für reproduzierbaren Zufall
  seed=6
  set.seed(seed)
  
  #Funktion mit N0 = 2, r_pess= -0.2, r_opt=0.25, nt = 100 aufrufen, Rückgabewert in N_1 speichern
  #...hier ergänzen...
  
  #Funktion mit N0 = 2, r_pess= -0.25, r_opt=0.2, nt = 100 aufrufen, Rückgabewert in N_2 speichern
  #...hier ergänzen...
  #Resultate (N_1, N_2) in einer Grafik darstellen
  #...hier ergänzen...
  
  #? Welche Population stirbt (meist) (früher) aus?
  #? Für welche Initialisierung des Zufallsgenerators (seed) ist das nicht so?
  