# Seminar zu "Einfuehrung in die Modellierung"

# Populationswachstum: exponentielles Modell mit Umwelteinwirkungen

# Funktion "exp_Wachstum_umwelt" definieren
# --> hier ergaenzen
{  
# n0 :               Startpopulation
# r_pess, r_opt:   : minimale und maximale Wachstumsrate
# nt :               Anzahl Zeitschritte
  
  #Variablen vorbereiten
  n = rep(NA,nt) #Vektor fuer zeitlichen Verlauf der Population
  n[1] = n0
  
  # Iterationsschleife
  for (t in 2:nt)
  {
    # zufaellige Auspraegung der Wachstumsrate (z.B. durch Klima)  mit runif() erzeugen
    # --> hier ergaenzen
    n[t] = n[t-1] + r * n[t-1]
  }
  
  # Ergebnis zurueckgeben
  return(n)
}
  
  # seed (optional)  : Initialisierung des Zufallsgenerators  
  
  # (optional): Initialisierung des Zufallsgenerators fuer reproduzierbaren Zufall
  seed=6
  set.seed(seed)
  

  #Funktion mit n0 = 2, r_pess= -0.2, r_opt=0.25, nt = 100 aufrufen, Rueckgabewert in n_1 speichern
  # --> hier ergaenzen
  
  #Funktion mit n0 = 2, r_pess= -0.25, r_opt=0.2, nt = 100 aufrufen, Rueckgabewert in n_2 speichern
  # --> hier ergaenzen

  #Resultate (n_1, n_2) in EINER Grafik darstellen
  # --> hier ergaenzen
  
  #? Welche Population stirbt (meist) (frueher) aus?
  