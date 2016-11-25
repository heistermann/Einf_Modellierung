# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"

# Workspace ausleeren
rm(list = ls())



# ABCD-MODELL
# ----------

# AUFGABE: Entwickle die Funktion Y(W, a, b) und stelle den
#   Einfluss der Parameter a und b auf den Zusammenhang
#   zwischen Y und W graphisch dar.   
Y = function(W, a, b) {
  #<
  out = (W + b)/(2*a) - sqrt( (((W+b)/(2*a))^2 - b*W/a) )
  return(out)  
  #>
}
#<
W = seq(0,50,0.1)
plot(W,  Y(W, 0.9, 10), type="l", lwd=2, 
     xlab="W = P[i]+S[i-1] (mm)", ylab="ET[i]+S[i] (mm)",
     ylim=c(0,12), col="black")
lines(W, Y(W, 0.7, 10), type="l", col="blue",  lwd=2)
lines(W, Y(W, 0.5, 10), type="l", col="red", lwd=2)
abline(h=10, lty="dashed")
text(3, 11,"b=10")
lines(W, Y(W, 0.9, 5), type="l", col="black", lwd=2)
lines(W, Y(W, 0.7, 5), type="l", col="blue", lwd=2)
lines(W, Y(W, 0.5, 5), type="l", col="red", lwd=2)
abline(h=5, lty="dashed", col="black")
text(3, 6,"b=5")
legend("bottomright", 
       legend=c("a=0.9","a=0.7","a=0.5"),
       lwd=2, col=c("black", "blue", "red"))
#>


# AUFGABE: Entwickle das vollstaendige abcd-Modell als Funktion.
#   (siehe Ablauf auf Folie #15).
#   Meteorologischer Antrieb: P, PET
#   Parameter: a, b, c, d
#   Return: Liste mit monatlichen Werten für Abfluss Q, 
#           Direktabfluss QD, Basisabfluss QB, Verdunstung ET,
#           Bodenwasserspeicher S, Grundwasserspeicher G
#           
abcd = function(P, PET, a, b, c, d) {
  #<
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
  #>  
}


# AUFGABE: Lies den monatlichen MOPEX-Datensatz "02296750.monthly"
#    fuer den Pegel "PEACE RIVER AT ARCADIA, FLA."
#    unter Nutzung der read.table Funktion ein. Schaue Dir
#    Die Datei selbst in einem Text-Editor an (z.B. notepad++).
#    Inspiziere den Datensatz mit dem "str"-Befehl und stelle
#    die unterschiedlichen Größen graphisch dar.
#<
# Lese die Daten
mopex = read.table("02296750.monthly", sep=";", header=TRUE, stringsAsFactors=FALSE)
# Konvertiere String zu Datumsobjekt
mopex$date = as.Date(mopex$date)
# Struktuzr des Dataframes
str(mopex)
#>
plot(mopex$date, mopex$discharge, type="l", col="black", lwd=2)
lines(mopex$date, mopex$precip, type="l", col="blue", lwd=2)
lines(mopex$date, mopex$PET, type="l", col="red", lwd=2)


# AUFGABE: Nutze nun den MOPEX-Datensatz zum Antrieb Deines 
#   abcd-Modells. Stelle die Dynamik des Abflusses, der einzelnen
#   Abflusskomponenten und der Zustandsvariablen graphisch dar.
#   Experimentiere mit den Parametern a, b, c und d.
#<
# Parameter als Vektor
params = c(a=0.99, b=500., c=0.4, d=0.5)
# Ausfuehrung des Modells
out = abcd(mopex$precip, mopex$pet, 
           params["a"], params["b"], params["c"], params["d"])

# Graphische Darstellung der Abflusskomponenten
zoominto = NULL #c(as.Date("1990-01-01"), as.Date("2000-01-01"))
plot(mopex$date, out$Q, type="n",
     xlim=zoominto,
     ylim=c(0, max(c(out$Q, mopex$discharge), na.rm=TRUE)),
     xlab="Zeit", ylab="Abfluss")
lines(mopex$date, out$Q,  col="black", lwd=2)
lines(mopex$date, out$QB, col="blue", lwd=2)
lines(mopex$date, mopex$discharge, col="red")
#>

