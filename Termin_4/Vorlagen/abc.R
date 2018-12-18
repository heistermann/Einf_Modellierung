# Seminar zu "Einfuehrung in die Modellierung"

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
  #...hier ergaenzen...
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
#   des Grundwasserabflusses zurueckgegeben wird. Nutze dafuer
#   den Datentyp einer Liste (list), in welchen man beliebige
#   Datentypen einbetten kann, z.B. so: return(list(Q=x1, Qgw=x2))

abc2 = function(P, a, b, c) {
  #...hier ergaenzen...
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
#...hier ergaenzen...
