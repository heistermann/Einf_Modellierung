# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"
# 1.11.2016

# Populationswachstum, exponentielles Modell

# n0 : Startpopulation
# r  : Wachstumsrate
# nt : Anzahl Zeitschritte
  
  n0 = 2
  r  = 1.1
  nt = 100
  
  #Variablen vorbereiten
  n = rep(NA,nt)
  n[1] = n0
  
  # Iterationsschleife
  #<
  for (t in 2:nt)
    n[t] = r * n[t-1]
  #>
  
  #Resultat darstellen
  #<
  plot(1:nt, n, xlab = "Zeitschritte", ylab="Populationsgröße")
  #>