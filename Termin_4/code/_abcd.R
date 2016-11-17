# Quelldatei zur Definition des abcd-Modells und einer

abcd = function(P, PET, params) {
  # Definiere die Parameter aus dem param-Vektor
  a = params[1]
  b = params[2]
  c = params[3]
  d = params[4]
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
    # Neuer Bodenwasserspeicher
    S = Y * exp(-PET[i]/b)
    # Evapotranspiration
    ET = Y * (1 + exp(-PET[i]/b))
    # Direktabfluss
    QD = (1-c)*(W-Y)
    # Grundwasserneubildung
    RG = c*(W-Y)
    # Basisabfluss
    QB = d * G
    # Abfluss
    Q = QB + QD
    G = (G + RG)/(1+d)
    # Schreibe Ergebnisse fuer diesen Zeitschritt in Dataframe
    out[i,] = c(Q, QD, QB, ET, S, G)    
  }
  return(out)
}
