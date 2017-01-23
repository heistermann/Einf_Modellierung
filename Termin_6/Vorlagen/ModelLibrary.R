# R-Bibliothek mit Funktionen fuer den Kurs "Einfuehrung in die Modellierung".

# Die Funktion "abcd" erhaelt zwei Argumente:
#   - "meteo" ist ein data.frame, der monatl. Zeitreihen
#     mit Niederschag und PET enthaelt
#   - "params" ist ein Vektor mit den "benamten" Elementen a, b, c und d
#
#   Die Funktion gibt einen data.frame mit den Spalten
#   Q, QD, QB, ET, S, G zurueck.
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

# Die Funktion "abc" erhaelt zwei Argumente:
#   - "meteo" ist ein data.frame, der monatl. Zeitreihen
#     mit Niederschag und PET enthaelt
#   - "params" ist ein Vektor mit den "benamten" Elementen a, b, c und d
#
#   Die Funktion gibt einen data.frame mit den Spalten
#   Q, QD, QB, ET, G zurueck.
abc = function(meteo, params) {
  # Generiere lokale Variablen aus den Argumenten
  a = params[1]
  b = params[2]
  c = params[3]
  P = meteo$precip
  # Für den Grundwassspeicher G muessen wir einen Startwert annehmen.
  G = 0
  # Ergebniscontainer für den Gesamtabfluss
  out = data.frame(Q=rep(0., length(P)), 
                   QB=rep(0., length(P)),
                   G=rep(0., length(P))  )
  for (i in 1:length(P)) {
    out$G[i] = G
    out$Q[i] = (1-a-b) * P[i] + c * G
    out$QB[i] = c * G
    out$QD[i] = (1-a-b) * G
    out$ET[i] = b * G
    G = (1-c)*G + a*P[i]
  }
  return(out)
}




# Die Funktion "read.mopex" liest eine MOPEX-Datensatz als data.frame ein
#   und formatiert die Datumsspalte als Datum.
#   Die Funktion erhaelt als Argument den Namen/Pfad der MOPEX-Datei.
read.mopex = function(fname) {
  out = read.table(fname, sep=";", header=TRUE, 
                   stringsAsFactors=FALSE)
  # Konvertiere String zu Datumsobjekt
  out$date = as.Date(out$date)
  return(out)
}

# Die Funktion "plot.hydro" zeichnet Ganglinien des
#   beobachteten und simulierten Abflusses.
#   Die Funktion erhaelt folgende Argumente:
#   - mopex: ein data.frame, die mit read.mopex eingelesen wurde
#   - model: ein data.frame, die Ergebnisse von abcd oder abc enthaelt
#   - zoominto: ein Vektor mit zwei Date-Objekten, 
#     der ein Zoom-Zeitfenster spezifiziert (default: NULL --> kein Zoom)
#   - baseflow: wenn TRUE, wird auch der Baseflow (QB) geplottet
#   - fmt: String zur Formatierung des Datums auf der x-Achse
#     (default: "%Y")
plot.hydro = function(mopex, model, zoominto=NULL, 
                           baseflow=FALSE, fmt="%Y") {
  
  plot(mopex$date, model$Q, type="n",
       xlim=zoominto,
       ylim=c(0, max(c(model$Q, mopex$discharge), na.rm=TRUE)),
       xlab="Zeit", ylab="Abfluss", xaxt="n")
  axis.Date(1, at=mopex$date, format=fmt)
  lines(mopex$date, model$Q,  col="black", lwd=2)
  if(baseflow) lines(mopex$date, model$QB, col="blue", lwd=2)
  lines(mopex$date, mopex$discharge, col="red", lwd=2)
  legend("topright", c("obs", "sim"), col=c("red", "black"), lwd=2)

}


