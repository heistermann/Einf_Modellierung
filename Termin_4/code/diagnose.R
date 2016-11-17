# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"

# Workspace ausleeren
rm(list = ls())

# DIAGNOSE, KALIBRIERUNG UND VALIDIERUNG MIT DEM ABCD-MODELL
# ----------------------------------------------------------

# AUFGABE: Beim letzten Mal hast Du das abcd-Modell als
#   Funktion entwickelt und mit Daten aus einem 
#   MOPEX-Gebiet angetrieben. Die Funktion für das abcd-Modell
#   haben wir für diesen Seminartermin nochmal in einer
#   gesonderten R-Datei (_abcd.R) bereitgestellt. 

#   Importiere die Funktion aus dieser Datei mit Hilfe 
#   des "source"-Befehls. Verfahre genauso mit der Datei
#   _mopex.R. Welche zusaetzlichen Funktionen stellt diese
#   Datei bereit? Nutze den "ls()"-Befehl oder schaue in die
#   Datei selbst.
#<
source("_abcd.R")
source("_mopex.R")
#>

# AUFGABE: Lese nun unter Nutzung der "read.mopex" Funktion die
#   Daten fuer das MOPEX-Gebiet 02296750 ein. Definiere einen
#   willkuerlichen Parametersatz und vergleiche Simulation und
#   Beobachtung visuell mit Hilfe des "plot.discharges"-Befehls.
#<
# Lese die Daten
mopex = read.mopex("../data/02296750.monthly")
# Parameter als Vektor
params = c(a=0.99, b=500., c=0.4, d=0.5)
# Ausfuehrung des Modells
sim = abcd(mopex, params)
plot.discharges(mopex, sim, baseflow=FALSE,
                zoominto=c(as.Date("1990-01-01"), 
                           as.Date("2000-01-01")))
#>

# Das Herausforderung fuer konzeptionelle Wasserhaushalts-
#   modelle wie das abcd-Modell ist die Identifikation der Modell-
#   parameter durch Kalibrierung. Prinzip: Definiere ein Guetemaß,
#   welches die Uebereinstimmung zwischen Modell und Beobachtungen
#   quantifiziert. Suche dann den Parametersatz, fuer welchen die
#   Guete maximal ist (oder der Fehler minimal).
#
# AUFGABE: Wir nutzen hier die sogenannte Nash-Sutcliffe-Effizienz (NSE),
#   eigentlich nichts anderes als das Bestimmtsheitsmaß.
#   Schreibe eine Funktion "nash", welche aus den Beobachtungen x
#   und den simulierten Werten y die NSE zurueckgibt.
#   Berechne dann unter Verwendung dieser Funktion die NSE
#   des abcd-Modells fuer das MOPEX-Gebiet 02296750 
#   unter Nutzung des von Dir gewahlten Parametersatzes.
#   Was faellt auf?
#<
nash= function(x,y) {
  return( 1. - sum((x-y)^2) / sum((x-mean(x))^2) )
}
nash(mopex$discharge, sim$Q)
#>

# AUFGABE: Richtig - die Funktion nash gibt NA zurück, weil
#   die Zeitreihe der beobachteten Abfluesse Fehlwerte enthaelt.
#   Schreibe eine neue Funktion "nash", die nur gueltige Zeit-
#   schritte auswertet. Nutze dazu den Befehl "is.finite".
#   Welchen nash-Wert erhaeltst Du nun? 
#   Was sagt Dir das ueber die Modellguete?
#<
nash = function(x,y) {
  ix = is.finite(x) & is.finite(y)
  x = x[ix]
  y = y[ix]
  return ( 1. - sum((x-y)^2) / sum((x-mean(x))^2) )
}
nash(mopex$discharge, sim$Q)
#>


# AUFGABE: Kalibrierung bedeutet nun, dass wir nach Parameter-
#   setzen suchen, die einen hoehere Nash produzieren.
#   Dafuer brauchen wir nun weitere R-Pakete: ppso und lhs. 
#   Pruefe zunaechst, ob die Pakete auf Deinem System 
#   installiert sind.

#<
#library(ppso)
#library(lhs)
#>

# AUFGABE: Falls die Pakete noch nicht vorhanden sind,
#   installiere sie nun mit Hilfe des "install.packages"-Befehls.
#   Fuer ppso brauchst Du besondere Argumente:
install.packages(pkgs="ppso", repos="http://rforge.net/", type = "source")
###install.packages("lhs")

library(ppso)

# AUFGABE: Nun muessen wir noch die gueltigen Wertebereiche
#   fuer unsere Parameter a, b, c und d festlegen. Definiere
#   dazu einen data.frame mit zwei Spalten und vier Zeilen.
#   Die erste Spalte lege die Untergrenze und die zweite Spalte
#   die Obergrenze fest. Die Zeilennamen (row.names) seien die
#   Namen der Paramenter.
#<
bounds = data.frame(lower=c(0.8, 0,     0,  0), 
                    upper=c(1.,  3000., 1., 1.))
row.names(bounds) = c("a", "b", "c", "d")
#>

# Zu guter letzt muessen wir noch eine Funktion definieren,
#   die fuer einen bestimmten Parametersatz den Wert der
#   Modellguete zurueckgibt - die Zielfunktion "ziel". 
#   Diese haben wir mal vorgegeben.
#   BEACHTE: "ziel" gibt die negativen NSE zurueck, weil
#   unser Suchalgorithmus immer nach einem Minimum sucht. 
ziel= function(params, model) {
  x = mopex$discharge
  y = model(mopex, params)$Q
#  # Es wird bestraft, wenn die Zielfunktion ungueltige Werte produziert 
#  if (length(which(!is.finite(y)))>0) return(1e6)
  return(-nash(x, y)) 
}

# Nun fuehren wir die eigentliche Kalibrierung durch.
#   Der Suchalgorithmus heißt optim_dds. Wer mehr ueber
#   diesen Algorithmus erfahren moechte:
#   dx.doi.org/10.1029/2005WR004723
#
# ACHTUNG: Die Suche dauert eine ganze Weile!
fit = optim_dds(objective_function=ziel,
                model=abcd,
                number_of_parameters=4,
                parameter_bounds = bounds,
                load_projectfile="no",
                max_number_function_calls=1000)

# Das Objekt "fit" informiert uns ueber das
#   Ergebnis der Kalibrierung.
print( paste("NSE nach Optimierung:", round(-fit$value,2)) )
print( paste(c("a:","b:","c:","d:"), round(fit$par,3)) )

# Mit Hilfe des folgenden Befehls erfahren wir mehr
#   ueber den Prozess der Kalibrierung.
plot_optimization_progress(logfile="dds.log", projectfile="dds.pro")

# Graphischer Vergleich des beobachteten und simulierten Abflusses 
bestabcd = abcd(mopex, fit$par)
par(mfrow=c(2,1), mar=c(5, 4, 1, 2) + 0.1 )
# Zeitreihe
plot.discharges(mopex, bestabcd, baseflow=FALSE,
                zoominto=c(as.Date("1970-01-01"), 
                           as.Date("1980-01-01")),fmt="%b'%y")
axlim = c(0, max(c(bestabcd$Q, mopex$discharge), na.rm=TRUE))
# Scatterplot
plot(mopex$discharge, bestabcd$Q, xlab="Observed discharge", 
     ylab="Simulated discharge", 
     xlim=axlim, ylim=axlim, cex=0.5)
lines(x=c(axlim[1]-100,axlim[2]+100), y=c(axlim[1]-100,axlim[2]+100))


# Nun probieren wir mal, das abc-Modell zu kalibrieren
abcbounds = data.frame(lower=c(0, 0, 0), upper=c(1.,1.,1.))
row.names(abcbounds) = c("a", "b", "c")

fitabc = optim_dds(objective_function=ziel,
                   model=abc,
                   number_of_parameters=3,
                   parameter_bounds = abcbounds,
                   load_projectfile="no",
                   max_number_function_calls=1000)
print( paste("NSE nach Optimierung:", round(-fitabc$value,2)) )
print( paste(c("a:","b:","c:"), round(fitabc$par,3)) )
plot_optimization_progress(logfile="dds.log", projectfile="dds.pro")

# Graphischer Vergleich des beobachteten und simulierten Abflusses 
bestabc = abc(mopex, fitabc$par)
par(mfrow=c(2,1), mar=c(5, 4, 1, 2) + 0.1 )
# Zeitreihe
plot.discharges(mopex, bestabcd, baseflow=FALSE,
                zoominto=c(as.Date("1970-01-01"), 
                           as.Date("1980-01-01")),fmt="%b'%y")
lines(mopex$date, bestabc$Q, lwd=2, col="blue")
legend("topleft", legend=c("obs", "abc", "abcd"), 
       col=c("red", "black", "blue"), lwd=2)
axlim = c(0, max(c(bestabcd$Q, mopex$discharge), na.rm=TRUE))
# Scatterplot
plot(mopex$discharge, bestabcd$Q, xlab="Observed discharge", 
     ylab="Simulated discharge", 
     xlim=axlim, ylim=axlim, cex=0.5)
points(mopex$discharge, bestabc$Q, cex=0.5, col="blue")
lines(x=c(axlim[1]-100,axlim[2]+100), y=c(axlim[1]-100,axlim[2]+100))
