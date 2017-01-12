# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"

# Workspace ausleeren
rm(list = ls())


# ABC-MODELL
# ----------

# AUFGABE: Implementiere das abc-Modell als gleichnamige 
#   R-Funktion mit den Argumenten P, a, b, c. 
#   P: Vektor mit Niederschlagshoehen
#   a, b, c: Parameter des abc-Modells
#   return: Vektor des Abflusses (gleiche Laenge wie P)
abc = function(P, a, b, c) {
  #<
  stopifnot(a+b<=1)
  stopifnot(c<=1)
  # Für den Grundwassspeicher G müssen wir einen Startwert annehmen.
  G = 0
  # Ergebniscontainer für den Gesamtabfluss
  Q = rep(0., length(P))
  for (i in 1:length(P)) {
    Q[i] = (1-a-b) * P[i] + c * G
    G = (1-c)*G + a*P[i]
  }
  return(Q)
  #>
}

# AUFGABE: Wende nun die Funktion auf einen ausgedachten Nieder-
#   schlag an und spiele mit den Parametern a, b und c. Beschreibe
#   die Effekte unterschiedlicher Parameterwerte und versuche,
#   diese hydrologisch zu interpretieren! 
zeit = 1:40 # Tage, Monate, Jahre?
P = rep(0., length(zeit))
# Wir lassen es in den Zeitschritten 10 und 20 jeweils 10 Einheiten regnen...
P[c(10,20)] = 10.
# Anwendung der Funktion
Q = abc(P, 0.5, 0.5, 0.1)

# Darstellung als Zeitreihendiagramm
par(mar = c(5,5,2,5))
plot(zeit, Q, type="l", lwd=2, col="red", 
     xlab="Zeitindex", ylab="Abfluss", ylim=c(0,5))
abline(v=zeit, col="grey")
par(new = T)
plot(zeit, P, type="h", lwd=2, axes=F, xlab=NA, ylab=NA)
axis(side = 4)
mtext(side = 4, line = 3, "Niederschlag")
legend("topright", legend=c("Abfluss", "Niederschlag"),
       lwd=c(2,2), col=c("red", "black"))

# AUFGABE: Modifiziere Deine Funktion abc so, dass nicht nur die
#   Ganglinie des Gesamtabflusses, sondern auch die Ganglinie
#   des Grundwasserabflusses zurückgegeben wird. Nutze dafuer
#   den Datentyp einer Liste (list), in welchen man beliebige
#   Datentypen einbetten kann, z.B. so: return(list(Q=x1, Qgw=x2))
abc2 = function(P, a, b, c) {
  #<
  stopifnot(a+b<=1)
  stopifnot(c<=1)
  # Für den Grundwassspeicher G muessen wir einen Startwert annehmen.
  G = 0
  # Ergebniscontainer für den Gesamtabfluss
  Q = rep(0., length(P))
  # Ergebniscontainer für den GW-Abfluss
  Qgw = rep(0., length(P))
  for (i in 1:length(P)) {
    Q[i] = (1-a-b) * P[i] + c * G
    Qgw[i] = c * G
    G = (1-c)*G + a*P[i]
  }
  return(list(Q=Q, Qgw=Qgw))
  #>
}

# AUFGABE: Wende die neue Funktion an. Erstelle dann
#   ein Diagramm, in welchem Du Gesamtabfluss und 
#   Grundwasserabfluss einzeichnest (basierend auf dem ersten 
#   Diagramm).

#   ACHTUNG: Deine Funktion gibt nun eine Liste
#   zurueck (zeige dies mit Hilfe des "str"-Befehls).
#   Auf Element x einer Liste y greift man so zu: y$x
out = abc2(P, 0.5, 0.3, 0.1)
str(out)

#<
# Darstellung als Zeitreihendiagramm
par(mar = c(5,5,2,5))
plot(zeit, out$Q, type="l", lwd=2, col="red", 
     xlab="Zeitindex", ylab="Abfluss", ylim=c(0,5))
lines(zeit, out$Qgw, lwd=2, col="blue", lty="dashed")
abline(v=zeit, col="grey")
par(new = T)
plot(zeit, P, type="h", lwd=2, axes=F, xlab=NA, ylab=NA)
axis(side = 4)
mtext(side = 4, line = 3, "Niederschlag")
legend("topright", 
       legend=c("Abfluss (gesamt)", "Abfluss (GW)", "Niederschlag"),
       lwd=2, col=c("red","blue", "black"), cex=0.75)
#>
