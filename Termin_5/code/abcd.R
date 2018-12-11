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
#   Graphische Darstellung
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


# Workspace ausleeren
rm(list = ls())


# AUFGABE: Bearbeite die folgenden sechs Aufgaben
#   auf Grundlage der untenstehenden Implementierung
#   des abcd-Modells.
#
#   1. Beschreibe die Argumente der Funktion
#      im Hinblick auf Datentyp und Bedeutung.
#
#   2. Um welchen Datentyp handelt es sich beim 
#      Rueckgabewert der Funktion? Welche Informationen
#      enthaelt dieser Rueckgabewert? (Nutze den "str"-Befehl)
#
#   3. Versuche den Code auf Grundlage der Gleichungen
#      auf Folie #15 zu verstehen. An welchen Stellen werden
#      Bodenfeuchte und Grundwasserspeicher aktualisiert?
#
#   4. Vor der Schleife werden Startwerte fuer S und G gesetzt.
#      Was ist hier das Problem? Was bedeutet das fuer
#      die ersten Zeitschritte?
#
#   5. Unter der abcd-Funktion findest Du Testdaten (P, PET, a, b, c, d)
#      und ein paar Zeilen Code zur Darstellung von Niederschlag,
#      Gesamtabfluss und Basisabfluss. Experimentiere mit P, PET und den
#      Parametern und beschreibe die beobachteten Effekte.
#
#   6. Wie kannst Du ueberpruefen, ob die Massenbilanz des Modells
#      ausgeglichen ist?
           
abcd = function(P, PET, a, b, c, d) {
  # Definiere Dataframe, in den die Ergebnisse geschrieben werden
  dummy = rep(0., length(P))
  out = data.frame(Q=dummy, QD=dummy, QB=dummy, 
                   ET=dummy, S=dummy, G=dummy)
  # Definiere Startwerte fuer Boden- und Grundwasserspeicher
  S = 0.
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
    QD = (1 - c) * (W-Y)
    # Grundwasserneubildung
    RG = c * (W-Y)
    # Aktualisierung des Grundwasserspeichers
    #  und Berechnung des Basisabflusses
    G = (G + RG) / (1 + d)
    QB = d * G
    # Gesamtabfluss
    Q = QB + QD
    # Schreibe Ergebnisse fuer diesen Zeitschritt in Dataframe
    out[i,] = c(Q, QD, QB, ET, S, G)    
  }
  return(out)
}

windows()
# 12 Monate Testdaten fuer Niederschlag (P)
testP = c(0, 0, 0, 200, 0, 0, 200, 0, 0, 0, 0, 0, 0, 0, 0)
# 12 Monate Testdaten fuer PET
testPET = rep(100, length(testP))
# Parameterwerte
a = 0.95 
b = 300
c = 0.5
d = 0.1
# Funktionsaufruf von abcd wird in Ergebnisvariable geschrieben
result = abcd(testP, testPET, a, b, c, d)
# Vektor mit Zeitschritten (hier: einfach Monatsnummern)
zeit = 1:nrow(result)
op = par(mar = c(5,5,2,5))
# Niederschlag
plot(zeit, testP, type="h", lwd=5, ylim=c(0,300),
     col="darkgrey", ylab="Niederschlag, Boden & GW-Speicher")
# Bodenspeicher
lines(zeit, result$S, lwd=2, col="orange", type="b")
# GW-Speicher
lines(zeit, result$G, lwd=2, col="darkgreen", type="b")
#   Vertikale Linien zur besseren Orientierung
abline(v=zeit, col="grey")
#   Sekundaerachse anlegen
par(new = T)
# Gesamtabfluss
plot(zeit, result$Q, type="l", lwd=2, col="black", 
     axes=F, xlab=NA, ylab=NA, ylim=c(0,20))
# Grundwasserabfluss
lines(zeit, result$QB, lwd=2, col="red", type="l", lty="dashed")
#   Sekundaerachse zeichnen
axis(side = 4)
#   Achsenbeschriftung
mtext(side = 4, line = 3, "Abfluss")
#   Legende definieren
legend("topright", 
       legend=c("Abfluss (gesamt)", "Abfluss (GW)", "Niederschlag", 
                "Bodenspeicher", "GW-Speicher"),
       lwd=2, col=c("black","red", "darkgrey", "orange", "darkgreen"), 
       cex=0.75)

# Pruefe Massenbilanz
ET_Q_deltas = sum(result$ET, result$Q, 
                  result$S[nrow(result)], result$G[nrow(result)])
print(paste("P = ", sum(testP)))
print(paste("ET + Q + deltaS + deltaG = ", ET_Q_deltas))
