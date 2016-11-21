# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"
# 1.11.2016

# Populationswachstum, exponentielles Modell mit Umweltstochastizität

# Funktion "log_Wachstum" definieren
#<
log_Wachstum = function (n0, r_max, K, nt)
#>
{  
# n0 :            Startpopulation
# Rmax:   :  maximale Wachstumsrate
# K :            Kapazität
# nt :            Anzahl Zeitschritte
# seed (optional) : Inititalisierung des Zufallsgenerators  
 
  
  #Variablen vorbereiten
  n = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population
  n[1] = n0
  
  # Iterationsschleife
  for (t in 2:nt)
  #<
  {
    # Wachstumsrate als Funktion von aktueller Population und Kapazität
    r = r_max* (1 - n[t-1]/K)
    n[t] = n[t-1] + r * n[t-1]
  }
  #>
  
  # Ergebnis zurückgeben
  return(n)
}
  
  #Funktion mit n0 = 2, r_max=1, K=100, nt = 50 aufrufen, rückgabewert in n_1 speichern
  #<
  n_1 = log_Wachstum(n0 = 2, r_max=1, K=100, nt = 50)
  #>
  
  #Funktion mit n0 = 2, r_max=2, K=100, nt = 50 aufrufen, rückgabewert in n_2 speichern
  #<
  n_2 = log_Wachstum(n0 = 2, r_max=2, K=100, nt = 50)
  #>
  
  #Funktion mit n0 = 2, r_max=2.5, K=100, nt = 50 aufrufen, rückgabewert in n_3 speichern
  #<
  n_2_5 = log_Wachstum(n0 = 2, r_max=2.5, K=100, nt = 50)
  #>
  
  #Funktion mit n0 = 2, r_max=3, K=100, nt = 50 aufrufen, rückgabewert in n_4 speichern
  #<
  n_3 = log_Wachstum(n0 = 2, r_max=3, K=100, nt = 50)
  #>
  
  
  #Resultate (n_1 - n_4) in einer Grafik darstellen
  #<
  plot  (x=1:length(n_1), y=n_1, type="l", col="black", xlab = "Zeitschritte", ylab="Populationsgröße", 
         ylim=range(c(n_1, n_2, n_2_5, n_3)))
  lines(x=1:length(n_2), y=n_2, col="red")
  lines(x=1:length(n_2_5), y=n_2_5, col="blue")
  lines(x=1:length(n_3), y=n_3, col="green")
  legend("bottomright", legend=c("n_1", "n_2", "n_2_5", "n_3"), col=c("black","red","blue","green"), pch = 21)
  #>
  
  #? Was bedeutet es inhaltlich, wenn die Population die Kapazität überschreitet?
  #? Wann sollte dieses Verhalten unterbunden werden?
  #? Wie könnte dieses Verhalten unterbunden werden?
 