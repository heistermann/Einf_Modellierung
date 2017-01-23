# Quelldatei zur Definition des abcd-Modells und einer

abcd = function(meteo, params) {
  # Generiere lokale Variablen aus den Argumenten
  a = params[1]
  b = params[2]
  c = params[3]
  d = params[4]
  P = meteo$precip
  PET = meteo$pet
  # Definiere Dataframe, in den die Ergebnisse geschrieben werden
  dummy = rep(0., length(P))
  out = data.frame(Q=dummy, QD=dummy, QB=dummy, ET=dummy, S=dummy, G=dummy)
  # Definiere Startwerte fuer Boden- und Grundwasserspeicher
  S = b/2.
  G = 0.
  for (i in 1:length(P)) {
    # Verfuegbares Wasser
    W = P[i] + S
    # "Verdunstbares Wasser"
    Y = (W + b)/(2*a) - sqrt( (((W+b)/(2*a))^2 - b*W/a) )
    # Aufteilung von Y zwischen Bodenwasser und ET
    x = exp(-PET[i]/b)
    # Neuer Bodenwasserspeicher
    S = x * Y
    # Evapotranspiration
    ET = (1 - x) * Y
    # Direktabfluss
    QD = (1-c)*(W-Y)
    # Grundwasserneubildung
    RG = c*(W-Y)
    # Basisabfluss
    QB = d * G
    # Aktualisierung des Grundwasserspeichers
    G = G + RG - d * G
    # Abfluss
    Q = QB + QD
    # Schreibe Ergebnisse fuer diesen Zeitschritt in Dataframe
    out[i,] = c(Q, QD, QB, ET, S, G)    
  }
  return(out)
}

abc = function(meteo, params) {
  # Generiere lokale Variablen aus den Argumenten
  a = params[1]
  b = params[2]
  c = params[3]
  P = meteo$precip
  # Für den Grundwassspeicher G müssen wir einen Startwert annehmen.
  G = 0
  # Ergebniscontainer für den Gesamtabfluss
  out = data.frame(Q=rep(0., length(P)) )
  for (i in 1:length(P)) {
    out$Q[i] = (1-a-b) * P[i] + c * G
    G = (1-c)*G + a*P[i]
  }
  return(out)
}

