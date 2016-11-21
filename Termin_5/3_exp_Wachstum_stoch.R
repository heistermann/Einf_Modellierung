# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"
# 1.11.2016

# Populationswachstum, exponentielles Modell mit Umweltstochastizität

# Funktion "exp_Wachstum_stoch" definieren
#<
exp_Wachstum_stoch = function (n0, R_pess, R_opt, nt, seed=NULL)
#>
{  
# n0 :               Startpopulation
# R_pess, R_opt:   : minimale und maximale Wachstumsrate
# nt :               Anzahl Zeitschritte
# seed (optional)  : Inititalisierung des Zufallsgenerators  
 
  #(optional): Inititalisierung des Zufallsgenerators für reproduzierbaren Zufall
  #<
  set.seed(seed)
  #>
  
  #Variablen vorbereiten
  n = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population
  n[1] = n0
  
  # Iterationsschleife
  for (t in 2:nt)
  # zufällige Ausprägung der Wachstumsrate (z.B. durch Klima)
  #<
  {
    # zufällige Ausprägung der Wachstumsrate (z.B. durch Klima)
    R = runif(n = 1, min=R_pess, max=R_opt)  
      
    n[t] = R * n[t-1]
  }
  #>
  
  # Ergebnis zurückgeben
  return(n)
}
  
  #Funktion mit n0 = 2, R_pess= 0.8, R_opt=1.2, nt = 100 aufrufen, Rückgabewert in n_1 speichern
  #<
  n_1 = exp_Wachstum_stoch(n0 = 2, R_pess  = 0.8, R_opt = 1.25, nt = 100)
  #>
  
  #Funktion mit n0 = 2, R_pess= 0.75, R_opt=1.2, nt = 100 aufrufen, Rückgabewert in n_2 speichern
  #<
  n_2 = exp_Wachstum_stoch(n0 = 2, R_pess  = 0.75, R_opt = 1.2, nt = 100)
  #>


  #Resultate (n_1, n_2) in einer Grafik darstellen
  #<
  plot  (x=1:length(n_1), y=n_1, type="l", col="black", xlab = "Zeitschritte", ylab="Populationsgröße")
  lines(x=1:length(n_2), y=n_2, col="red")
  legend("bottomright", legend=c("n_1", "n_2"), col=c("black","red"), pch = 21)
  #>
  
  #? Welche Population stirbt (meist) (früher) aus?
  #? Wie kann der Zufallsaspekt reproduzierbar gemacht werden (Tipp: set.seed)
  #<
  seed=6
  n_1 = exp_Wachstum_stoch(n0 = 2, R_pess  = 0.8, R_opt = 1.25, nt = 100, seed = seed)
  n_2 = exp_Wachstum_stoch(n0 = 2, R_pess  = 0.75, R_opt = 1.2, nt = 100, seed = seed)
  
  plot  (x=1:length(n_1), y=n_1, type="l", col="black", xlab = "Zeitschritte", ylab="Populationsgröße", main=seed)
  lines(x=1:length(n_2), y=n_2, col="red")
  legend("bottomright", legend=c("n_1", "n_2"), col=c("black","red"), pch = 21)
   
  #>