# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"
# 1.11.2016

# Populationswachstum: exponentielles Modell

# N0 : Startpopulation
# r  : Wachstumsrate
# nt : Anzahl Zeitschritte
  
#Parameter (s.o.) zuweisen
  #<
  N0 = 2
  r  = 0.2
  nt = 30
  #>

  #Variablen vorbereiten
  N = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population anlegen
  # Startwerte an die erste Stelle des Vektors schreiben
  #<
  N[1] = N0
  #>
  
  # Iterationsschleife über alle weiteren Zeitschritte
  #<
  for (t in 2:nt)
    N[t] = N[t-1] + r * N[t-1]
  #>
  
  #Resultat darstellen
  #<
  plot(1:nt, N, xlab = "Zeitschritte", ylab="Populationsgröße")
  #>
  
  #? Wann überschreitet die Population den Wert 10000?
  #? Unter welchen Bedingungen bleibt die Population konstant?
  #? Kann die Population auch schrumpfen? (Wann) stirbt dann sie aus?