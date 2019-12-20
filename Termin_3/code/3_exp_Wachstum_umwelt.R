# Seminar zu "Einfuehrung in die Modellierung"

# Populationswachstum: exponentielles Modell mit Umwelteinwirkungen

# Funktion "exp_Wachstum_umwelt" definieren
#<
exp_Wachstum_umwelt = function (N0, r_pess, r_opt, nt)
#>
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
  #<
  N_1 = exp_Wachstum_umwelt(N0 = 2, r_pess  = -0.2, r_opt = 0.25, nt = 100)
  #>
  
  #Funktion mit N0 = 2, r_pess= -0.25, r_opt=0.2, nt = 100 aufrufen, Rueckgabewert in N_2 speichern
  #<
  N_2 = exp_Wachstum_umwelt(N0 = 2, r_pess  = -0.25, r_opt = 0.2, nt = 100)
  #>


  #Resultate (N_1, N_2) in EINER Grafik darstellen
  #<
  plot  (x=1:length(N_1), y=N_1, type="p", col="black", xlab = "Zeitschritte", ylab="Populationsgroesse")
  points(x=1:length(N_2), y=N_2, col="red")
  legend("bottomright", legend=c("N_1", "N_2"), col=c("black","red"), pch = 21)
  #>
  
  #? Welche Population stirbt (meist) (frueher) aus?
  