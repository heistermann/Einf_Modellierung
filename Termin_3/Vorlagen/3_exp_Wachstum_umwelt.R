# Seminar zu "Einfuehrung in die Modellierung"
# Populationswachstum: exponentielles Modell mit Umwelteinwirkungen
# Funktion "exp_Wachstum_umwelt" definieren
#...hier ergänzen...
{  
# N0 :               Startpopulation
# r_pess, r_opt:   : minimale und maximale Wachstumsrate
# nt :               Anzahl Zeitschritte
  
  #Variablen vorbereiten
  N = rep(NA,nt) #Vektor fuer zeitlichen Verlauf der Population
  N[1] = N0
  
  # Iterationsschleife
  for (t in 2:nt)
  {
    # zufaellige Auspraegung der Wachstumsrate (z.B. durch Klima)  mit runif() erzeugen
    #<
    r = runif(N = 1, min=r_pess, max=r_opt)
    #<
    N[t] = N[t-1] + r * N[t-1]
  }
  
  # Ergebnis zurueckgeben
  return(N)
}
  
  # seed (optional)  : Initialisierung des Zufallsgenerators  
  
  # (optional): Initialisierung des Zufallsgenerators fuer reproduzierbaren Zufall
  seed=6
  set.seed(seed)
  
  #Funktion mit N0 = 2, r_pess= -0.2, r_opt=0.25, nt = 100 aufrufen, Rueckgabewert in N_1 speichern
  #...hier ergänzen...
  
  #Funktion mit N0 = 2, r_pess= -0.25, r_opt=0.2, nt = 100 aufrufen, Rueckgabewert in N_2 speichern
  #...hier ergänzen...
  #Resultate (N_1, N_2) in EINER Grafik darstellen
  #...hier ergänzen...
  
  #? Welche Population stirbt (meist) (frueher) aus? DafÃ¼r die Berechnungen fÃ¼r N_1 nd N_2 mehrfach wiederholen.
  #? FÃ¼r welche Initialisierung des Zufallsgenerators (seed) ist das nicht so?