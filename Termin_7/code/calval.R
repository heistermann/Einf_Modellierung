# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"

# Workspace ausleeren
rm(list = ls())


# DIE NASH-SUTCLIFFE MODELLEFFIZIENZ

# AUFAGBE: Beim letzten Termin hast Du bereits eine
#   Funktion zur Berechnung des RMSE geschrieben.
#
#   1. Schreibe nun eine Funktion "nash" zur Berechnung der
#      Modelleffizienz nach Nash und Sutcliffe (NSE, siehe Folie #8!).
#
#   2. Ueberpruefe mit Hilfe der Testdaten x und y, 
#      ob die Funktion richtig funktioniert. Schiebe gleich noch eine Funktion "nash2" hinterher,
#      welche vor der Berechnung die NA-Werte aussortiert.
#      Orientiere dich dabei am Code vom letzten Termin.
#
#   3. Was ist der bestmögliche NSE-Wert?
#
#   4. Was ist der denkbar schlechteste NSE-Wert?

nash = function(obs, sim) {
  #<
  return( 1. - sum((obs-sim)^2) / sum((obs-mean(obs))^2) )
  #>
}

# Teste mit Hilfe von x und y
x = c(2, 3, 2, 5, 1)
y = c(1, 3, 4, 5, 1)
round( nash(x, y), 2) == 0.46

# Schreibe hier die Funktion, welche die NA Werte aussortiert
nash2 = function(obs, sim) {
  #<
  ix = is.finite(obs) & is.finite(sim)
  return ( nash(obs[ix], sim[ix]) )
  #>
}


# AUTOMATISCHE KALIBRIERUNG DES ABCD-MODELLS
# ------------------------------------------

# AUFGABE: Wir nutzen erneut den Datensatz fuer den
#   MOPEX-Pegel "02296750" ("PEACE RIVER AT ARCADIA, FLORIDA")
#   und unsere Funktionsbibliothek "ModelLibrary.R".
#   Berechne testweise mal den NSE-Wert fuer einen beliebigen
#   Parametersatz params.

source("ModelLibrary.R")
# Daten lesen
mopex = read.mopex("02296750.monthly")
# Parameter als Vektor definieren
params = c(a=0.99, b=100, c=0.4, d=0.1)
# Ausfuehrung des Modells
sim = abcd(mopex, params)
# Berechne den NSE-Wert (ARGUMENTE EINFUEGEN)
nash2(..., ...)


# AUFGABE: Du sollst nun einen Suchalgorithmus zur automatischen
#   Kalibrierung anwenden. Dieser Algorithmus soll die Modellparameter
#   a, b, c und d so optimieren, dass der NSE-Wert maximal wird.
#
#   1. Wir brauchen dafuer ein neues R-Paket namens "ppso". Dieses
#      Paket gehoert nicht zum Standardumfang von R. Installiere ppso
#      mit Hilfe des install.packages-Befehls.
#
#   2. Importiere nun ppso mit Hilfe des "library"-Befehls
#      in Deine Arbeitsumgebung.
#
#   3. Bevor ppso mit der Suche loslegt, muss noch Einiges geklaert
#      werden, z.B. die erlaubten Wertebereiche fuer a, b, c und d.
#      Diese Information legen wir in einem 4x2 data.frame fest, der als
#      Spaltennamen "lower" und "upper" (Unter- und Obergrenze) und
#      Zeilennamen "a", "b", "c" und "d" traegt. Trage in den data.frame
#      "bounds" sinnvolle Werte fuer a, b, c und d ein.
#
#   4. Zu guter letzt muessen wir noch eine Funktion definieren,
#      die fuer einen bestimmten Parametervektor direkt den Wert der
#      Modellguete zurueckgibt (hier der NSE-Wert). Diese
#      Funktion nennen wir "zielfunktion" - sie ist unten
#      bereits vorgegeben. Schaue Dir die Funktion an - was
#      ist merkwuerdig?
#
#   5. Nun kann optim_dds aufgerufen werden. Das Ergebnis der 
#      Kalibrierung wird in der Liste "fit" abgelegt. 
#      - Welcher NSE-Wert wird erreicht?
#      - Wie lauten die optimalen Paramater a, b, c und d?
#
#   6. Wenn Du dem dem Suchalgorithmus mehr Zeit gibst, wird das
#      Ergebnis evtl. besser. Setze das Argument 
#      max_number_function_calls hoch - aendert sich das Suchergebnis?

install.packages(pkgs="ppso", repos="http://rforge.net/", type = "source")

# Importiere ppso mit Hilfe des "library"-Befehls
#<
library(ppso)
#>

# Trage hier sinnvolle Unter- und Obergrenzen fuer a, b, c und d ein.
bounds = data.frame(lower=c(..., ..., ..., ...), 
                    upper=c(..., ..., ..., ...))
# DELETE
bounds = data.frame(lower=c(0.8, 0,     0,  0), 
                    upper=c(1.,  3000., 1., 1.))
row.names(bounds) = c("a", "b", "c", "d")

# Diese Funktion erhaelt einen Parametervektor und eine Modellfunktion
zielfunktion= function(params, model, data) {
  x = data$discharge
  y = model(data, params)$Q
  return(-nash2(x, y)) 
}

# Nun fuehren wir die eigentliche Kalibrierung durch.
#   Der Suchalgorithmus heißt optim_dds. Wer mehr ueber
#   den DDS-Algorithmus erfahren moechte: 
#   dx.doi.org/10.1029/2005WR004723
#
#   ACHTUNG: Die Suche dauert eine Weile!
fit = optim_dds(objective_function=zielfunktion,
                model=abcd,
                data=mopex,
                number_of_parameters=4,
                parameter_bounds = bounds,
                load_projectfile="no",
                max_number_function_calls=50)

# Das Objekt "fit" informiert uns ueber das
#   Ergebnis der Kalibrierung.
print( paste("NSE nach Optimierung:", round(-fit$value,2)) )
print( paste(c("a:","b:","c:","d:"), round(fit$par,2)) )

# Mit Hilfe des folgenden Befehls erfahren wir mehr
#   ueber den Prozess der Kalibrierung.
plot_optimization_progress(logfile="dds.log", projectfile="dds.pro")


# AUFGABE: Nun visualisieren wir das Ergebnis der Kalibrierung nochmal.
#   Wir basteln dazu eine zweiteilige Abbildung. Der obere Teil stellt
#   die Ganglinien des beobachteten und simulierten Abflusses dar.
#   Der untere Teil stellt Beobachtung und Simulation in einem
#   sog. Scatterplot gegenueber.
#
#   1. Was sind die Vor- und Nachteile der beiden Darstellungsformen?
#
#   2. Mit welchem Befehl unterteilen wir die Abbildung?

# Zunaechst nutzen wir den "besten" Parametersatz fuer die Simulation
bestabcd = abcd(mopex, fit$par)
# Abbildung mit zwei Zeilen und einer Spalte
par(mfrow=c(2,1), mar=c(5, 4, 1, 2) + 0.1 )
# Ganglinie
plot.hydro(mopex, bestabcd, fmt="%b'%y", 
           zoominto=c(as.Date("1970-01-01"), as.Date("1980-01-01")) )
# Maximum           
axlim = c(0, max(c(bestabcd$Q, mopex$discharge), na.rm=TRUE))
# Scatterplot
plot(mopex$discharge, bestabcd$Q, 
     xlab="Beobachtung", 
     ylab="Simulation", 
     xlim=axlim, ylim=axlim)
# Winkelhalbierende
lines(x=c(axlim[1]-100,axlim[2]+100), y=c(axlim[1]-100,axlim[2]+100))


# AUFGABE: Schreibe nun den Code, um das abc-Modell zu kalibrieren. 
#   Denke an die erforderlichen Schritte: 
#   - data.frame mit Ober- und Untergrenzen definieren
#   - optim_dds aufrufen: ACHTE auf die richtigen Argumente
#     fuer "model", "number_of_parameters" und "parameter_bounds"
#   - Ergebnis inspizieren
#
#  MASTERFRAGE: Was funktioniert besser: abc oder abcd?

#<
abcbounds = data.frame(lower=c(0, 0, 0), 
                       upper=c(1.,1.,1.))
row.names(abcbounds) = c("a", "b", "c")

fitabc = optim_dds(objective_function=zielfunktion,
                   model=abc,
                   data=mopex,
                   number_of_parameters=3,
                   parameter_bounds = abcbounds,
                   load_projectfile="no",
                   max_number_function_calls=50)
print( paste("NSE nach Optimierung:", round(-fitabc$value,2)) )
print( paste(c("a:","b:","c:"), round(fitabc$par,2)) )
plot_optimization_progress(logfile="dds.log", projectfile="dds.pro")
#>


# AUFGABE (optional): Implementiere fuer das abcd-Modell
#   Kalibierung UND Validierung als Split-Sampling. Gehe dafuer
#   wie folgt vor:
#
#   1. Generiere einen zwei Index-Vektoren, welche Deinen Datensatz
#      in zwei Teile zerlegen: einen fuer die Kalibrierung und einen
#      fuer die Validierung.
#
#   2. Fuehre dann mit dem einen Datensatz die Kalibrierung durch.
#
#   3. Fuehre dann das Modell mit dem besten Parametersatz aus und
#      berechne anhand des zweiten Datensatzteils die den NSE-Wert.
#
#   4. Vergleiche die NSE-Werte, die Du jeweils fuer Kalibrierung und
#      Validierung erreicht hast. Was schließt Du im Hinblick auf die
#      Modellguete?

#<
calix = 1:(nrow(mopex)/2)
valix = (nrow(mopex)/2):nrow(mopex)
fit = optim_dds(objective_function=zielfunktion,
                   model=abcd,
                   data=mopex[calix,],
                   number_of_parameters=4,
                   parameter_bounds = bounds,
                   load_projectfile="no",
                   max_number_function_calls=500)
print( paste("NSE nach Kalibrierung:", round(-fit$value,2)) )
print( paste(c("a:","b:","c:","d:"), round(fit$par,2)) )
print( paste("NSE nach Validierung:", 
             round(nash2(mopex$discharge[valix], 
                         abcd(mopex[valix,], fit$par)$Q)
                   ,2)) )
#>
