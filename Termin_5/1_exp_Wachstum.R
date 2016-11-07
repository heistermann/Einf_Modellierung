# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"
# 1.11.2016

# Populationswachstum, exponentielles Modell

# n0 : Startpopulation
# r  : Wachstumsrate
# nt : Anzahl Zeitschritte
  
  #Parameter (s.o.) zuweisen
#<
n0 = 2
R  = 1.5
nt = 30
#>

  #Variablen vorbereiten
  n = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population
  n[1] = n0
  
  # Iterationsschleife
  #<
  for (t in 2:nt)
    n[t] = R * n[t-1]
  #>
  
  #Resultat darstellen
  #<
  plot(1:nt, n, xlab = "Zeitschritte", ylab="Populationsgröße")
  #>
  
  #? Wann überschreitet die Population den Wert 10000?
  #? Unter welchen Bedingungen bleibt die Population konstant?
  #? Kann die Population auch schrumpfen? (Wann) stirbt dann sie aus?