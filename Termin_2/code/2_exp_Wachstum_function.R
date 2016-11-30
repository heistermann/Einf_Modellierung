# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"
# 1.11.2016

# Populationswachstum, exponentielles Modell, als Funktion umgesetzt

# Funktion "exp_Wachstum" definieren
#<
exp_Wachstum = function (N0, r, nt)
#>
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
  #<
  return(N)
  #>
}
  
  #Funktion mit N0 = 2, r  = 0.2, nt = 30 aufrufen, Rückgabewert in N_1 speichern
  #<
  N_1 = exp_Wachstum(N0 = 2, r  = 0.2, nt = 30)
  #>
  
  #Funktion mit N0 = 4, r  = 0.2, nt = 30 aufrufen, Rückgabewert in N_2 speichern
  #<
  N_2 = exp_Wachstum(N0 = 4, r  = 0.2, nt = 30)
  #>


  #Resultate (N_1, N_2) in einer Grafik darstellen
  #<
  plot  (x=1:length(N_1), y=N_1, col="black", xlab = "Zeitschritte", ylab="Populationsgröße")
  points(x=1:length(N_2), y=N_2, col="red")
  legend("bottomright", legend=c("N_1", "N_2"), col=c("black","red"), pch = 21)
  #>
  
  #? Wie groß muss die Anfangspopulation sein, damit bei halbsogroßem Wachstum
  #? nach 30 Zeitschritten etwa die gleiche Population wie bei N_1 besteht?
  #<
  N_3 = exp_Wachstum(N0 = 25, r = 0.1, nt = 30)
  plot  (x=1:length(N_1), y=N_1, col="black", xlab = "Zeitschritte", ylab="Populationsgröße")
  points(x=1:length(N_3), y=N_3, col="blue")
  legend("bottomright", legend=c("N_1", "N_3"), col=c("black","blue"), pch = 21)
  #>
