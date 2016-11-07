# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"
# 1.11.2016

# Populationswachstum, exponentielles Modell, als Funktion umgesetzt

# Funktion "exp_Wachstum" definieren
#<
exp_Wachstum = function (n0, R, nt)
#>
{  
# n0 : Startpopulation
# R  : Wachstumsrate
# nt : Anzahl Zeitschritte
  
  #Variablen vorbereiten
  n = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population
  n[1] = n0
  
  # Iterationsschleife
  for (t in 2:nt)
    n[t] = R * n[t-1]
  
  # Ergebnis zurückgeben
  #<
  return(n)
  #>
}
  
  #Funktion mit n0 = 2, r  = 1.5, nt = 30 aufrufen, Rückgabewert in n_1 speichern
  #<
  n_1 = exp_Wachstum(n0 = 2, R  = 1.5, nt = 30)
  #>
  
  #Funktion mit n0 = 4, r  = 1.5, nt = 30 aufrufen, Rückgabewert in n_2 speichern
  #<
  n_2 = exp_Wachstum(n0 = 4, R  = 1.5, nt = 30)
  #>


  #Resultate (n_1, n_2) in einer Grafik darstellen
  #<
  plot  (x=1:length(n_1), y=n_1, col="black", xlab = "Zeitschritte", ylab="Populationsgröße")
  points(x=1:length(n_2), y=n_2, col="red")
  legend("bottomright", legend=c("n_1", "n_2"), col=c("black","red"), pch = 21)
  #>
  
  #? Wie groß muss die Anfangspopulation sein, damit bei halbsogroßem Wachstum
  #? nach 30 Zeitschritten etwa die gleiche Population wie bei n_1 besteht?
  #<
  n_3 = exp_Wachstum(n0 = 400, R  = 1.25, nt = 30)
  plot  (x=1:length(n_1), y=n_1, col="black", xlab = "Zeitschritte", ylab="Populationsgröße")
  lines(x=1:length(n_2), y=n_2, col="red")
  legend("bottomright", legend=c("n_1", "n_3"), col=c("black","red"), pch = 21)
  #>
