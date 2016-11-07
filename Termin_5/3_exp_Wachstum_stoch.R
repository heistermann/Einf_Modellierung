# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"
# 1.11.2016

# Populationswachstum, exponentielles Modell mit Umweltstochastizität

# Funktion "exp_Wachstum_stoch" definieren
#<
exp_Wachstum_stoch = function (n0, R_pess, R_opt, nt)
#>
{  
# n0 :            Startpopulation
# Rmin, Rmax:   : minimale und maximale Wachstumsrate
# nt :            Anzahl Zeitschritte
 
  
  #Variablen vorbereiten
  n = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population
  n[1] = n0
  
  # Iterationsschleife
  for (t in 2:nt)
  # zufällige Ausprägung der Wachstumsrate (z.B. durch Klima)
  #<
  {
    # zufällige Ausprägung der Wachstumsrate (z.B. durch Klima)
    if (runif(1) < 0.5)
      R = R_pess else
      R = R_opt  
    R = runif(n = 1, min=R_pess, max=R_opt)  
      
    n[t] = R * n[t-1]
  }
  #>
  
  # Ergebnis zurückgeben
  return(n)
}
  
  #Funktion mit n0 = 2, R_pess= 0.8, R_opt=1.2, nt = 30 aufrufen, Rückgabewert in n_1 speichern
  #<
  n_1 = exp_Wachstum_stoch(n0 = 2, R_pess  = 0.8, R_opt = 1.2, nt = 100)
  #>
  
  #Funktion mit n0 = 4, r  = 1.1, nt = 30 aufrufen, Rückgabewert in n_2 speichern
  #<
  n_2 = exp_Wachstum_stoch(n0 = 2, R_pess  = 0.75, R_opt = 1.2, nt = 100)
  #>


  #Resultate (n_1, n_2) in einer Grafik darstellen
  #<
  plot  (x=1:length(n_1), y=n_1, type="l", col="black", xlab = "Zeitschritte", ylab="Populationsgröße")
  lines(x=1:length(n_2), y=n_2, col="red")
  legend("bottomright", legend=c("n_1", "n_2"), col=c("black","red"), pch = 21)
  #>
  
  