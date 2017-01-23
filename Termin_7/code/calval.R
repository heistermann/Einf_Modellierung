# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"

# Workspace ausleeren
rm(list = ls())


# INSPEKTION EINES MOPEX-DATENSATZES
# ----------------------------------

# AUFGABE: Wir inspizieren nun einen Datensatz fuer den
#   MOPEX-Pegel "02296750" ("PEACE RIVER AT ARCADIA, FLORIDA").
#   Der Datensatz enthält u.a. monatliche Werte fuer Niederschlag,
#   Abfluss und Potenzielle Verdunstung. Diese Werte sind als
#   mm Wassersaeule über das gesamte Einzugsgebiet angegeben.
#   Wir belassen es bei dieser Einheit.
#
#   Die entsprechende Datei heißt "02296750.monthly" und wird
#   mit dem "read.table"-Befehl in R eingelesen. 

#   1. Schau Dir die Datei mit einem Text-Editor (notepad++) an.
#      Welches Zeichen wird als Spaltentrenner verwendet? Fuege
#      passende Argumente in den "read.table"-Befehl ein,
#      welche R den Spaltentrenner mitteilen sowie die Tatsache,
#      dass die Datei eine Kopfzeile (header) mit Spaltenbezeichnern
#      besitzt. Ersetze dazu die beiden Platzhalter {SPALTENTRENNUNG}
#      und {KOPFZEILE} durch sinnvolle Ausdruecke.
#
#   2. Welcher Datentyp wird von "read.table" zurueckgegeben?
#      Inspiziere die Variable "mopex" mit Hilfe des "str"-Befehls.
#      - Welche Spalten gibt es, welchen Datentyp haben diese?
#      - Wieviel Zeilen hat der Datensatz?
#      - Wie lauten Anfangs- und Enddatum?
#
#   3. Nutze nun den untenstehende Code, um die Ganglinien
#      von Niederschlag und Abfluss in EINE Abbildung zu plotten.
#
#   4. Ergaenze den Code mit einem weiteren Aufruf des "lines"-Befehls,
#      um auch noch die PET als Ganglinie (in rot) darzustellen.
#
#   5. Ergaenze den "legend"-Befehl, so dass auch PET in der
#      Legende auftaucht.
#
#   6. Was faellt an der PET-Ganglinie auf?
#
#   7. Schaue Dir auch andere Zeitfenster an. 
#      Aendere dafuer die Variable "zoominto".

# Lese die Daten (ERSETZE DIE PLATZHALTER!)
mopex = read.table("02296750.monthly", stringsAsFactors=FALSE,
                   {SPALTENTRENNUNG}, {KOPFZEILE})
# DELETE
mopex = read.table("02296750.monthly", stringsAsFactors=FALSE,
                   sep=";", header=TRUE)

# Struktur und Datentyp des Rueckgabewertes
str(mopex)

# Konvertiere Strings aus der Spalte "date" zu Datumsobjekten 
mopex$date = as.Date(mopex$date)

# Schaue Dir nun erneut die Struktur an... was hat sich geaendert?
str(mopex)

# Graphische Darstellung als Ganglinien mit Datum
zoominto = c(as.Date("1990-01-01"), as.Date("1995-01-01"))
plot(mopex$date, mopex$discharge, type="n", ylim = c(0,300),
     xlab = "Zeit", ylab = "Q, P, PET (mm)", xaxt="n",
     xlim=zoominto)
axis.Date(1, at=mopex$date, format="%m/%y")
lines(mopex$date, mopex$discharge, type="l", col="black", lwd=2)
lines(mopex$date, mopex$precip,    type="l", col="blue",  lwd=2)
# Zeichne die Ganglinie fuer PET mit Hilfe des "lines"-Befehls
#<
lines(mopex$date, mopex$pet,       type="l", col="red",   lwd=2)
# Legende zeichnen (ERGAENZE DEN EINTRAG FUER PET!)
legend("topright", 
       legend=c("Abfluss (mm)", "Niederschlag (mm)"),
       lwd=2, col=c("black","blue"))


# Workspace ausleeren
rm(list = ls())


# ANWENDUNG UND DIAGNOSE DES ABCD-MODELLS
# ---------------------------------------

# Du verstehst nun die Implementierung und das Verhalten des 
#   abcd-Modells und kennst die Struktur des MOPEX-Datensatzes
#   "02296750.monthly". Du sollst nun das abcd-Modell mit Hilfe
#   dieses Datensatzes antreiben und untersuchen, wie gut das
#   Modell fuer das betreffende Einzugsgebiet des Peace River
#   funktioniert.

# AUFGABE: Wende das abcd-Modell exemplarisch fuer den Peace River an
#   und vergleiche die simulierten Werte des Abflusses mit den
#   Beobachtungen. Gehe dazu schrittweise vor: 
#
#   1. Wir haben die Funktion "abcd" gegenueber dem letzten
#      Termin geringfuegig geaendert: Anstatt der einzelne Argumente
#      fuer P, PET, a, b, c und d erhaelt die Funktion nun einen
#      data.frame mit dem MOPEX-Datensatz sowie einen Vektor
#      mit den Parameters a, b, c und d. Die neue Funktion haben wir
#      in der Datei "ModelLibrary.R" abgelegt. Du kannst die Funktion
#      in Deinen Workspace importieren. Nutze dazu den Befehl "source".
#      Wenn Du Dir die neue Funktion abcd anschauen moechtest, kannst
#      Du einfach die Datei "ModelLibary.R" in RStudio oeffnen.
#
#   2. Mit dem "source"-Befehl haben wir noch weitere Funktionen
#      aus "ModelLibary.R" importiert:
#      - "read.mopex" liest eine MOPEX-Datei ein;
#      - "plot.hydro" zeichnet Ganglinien des beobachteten
#        und simulierten Abflusses.
#      Lies nun also mit Hilfe des untenstehenden Codes den
#      Datensatz "02296750.monthly" ein, definiere den Parametervektor,
#      fuhre das abcd-Modell aus und stelle die Abflussganglinien dar.
#
#   3. Spiele nun mit den Parameterwerten, um eine moeglichst
#      gute Uebereinstimmung des simulierten mit dem beobachteten
#      Abfluss zu erreichen. Mit Hilfe des "zoominto"-Arguments
#      kannst Du unterschiedliche Zeitfenster betrachten.

# Importiere mit dem Befehl "source" die Funktionen aus "ModelLibrary.R"
#<
source("ModelLibrary.R")
#>

# Daten lesen
mopex = read.mopex("02296750.monthly")
# Parameter als Vektor definieren
params = c(a=0.99, b=100, c=0.4, d=0.1)
# Ausfuehrung des Modells
sim = abcd(mopex, params)
# Darstellung der Ganglinien
plot.hydro(mopex, sim, baseflow=FALSE,
                zoominto=c(as.Date("1990-01-01"), 
                           as.Date("2000-01-01")))


# AUFGABE: Die visuelle Betrachtung ermoeglicht einen guten Eindruck der
#   Uebereinstimmung zwischen Simulation und Beobachtung.
#
#   Allerdings waere ein objektives, quantitatives Uebereinstimmungsmaß
#   wuenschenswert (Guetemaß oder Fehlermaß). Ein verbreitetes
#   Fehlermaß ist der "Root Mean Squared Error" (RMSE).
#
#   1. Uebersetze "Root Mean Squared Error" ins Deutsche.
#
#   2. Als "Error" bezeichnet man die Differenz zwischen Beobachtung
#      und Simulation fuer einen einzelnen Zeitschritt. Definiere
#      auf dieser Grundlage die Formel fuer den RMSE (recherchiere
#      im Internet, wenn Du es nicht schaffst).
#
#   3. Implementiere nun die Funktion rmse, welche aus zwei Argumenten
#      "obs" und "sim" den RMSE berechnet.
#
#   4. Wende nun die Funktion rmse an. Nutze dafuer zunaechst die
#      beiden ausgedachten Vektoren x (als Beobachtung) und 
#      y (als Simulation). Wenn Deine Funktion "rmse" richtig ist,
#      muesste als Ergebnis "1" zurueckgegeben werden.
#
#   4. Wende nun die Funktion "rmse" auf das  abcd-Modell fuer
#      dem Peace River an (siehe oben). Berechne also den RMSE
#      des simulierten Abflusses im Vergleich zum beobachteten Abfluss
#      fuer einen beliebigen Parametersatz param.
#
#   5. Mist! Heraus kommt der Wert "NA". Was hat das zu bedeuten?

# Schreibe hier die Funktion zur Berechnung des RMSE
rmse = function(obs, sim) {
  #<
  return(sqrt(mean((obs-sim)^2)))
  #>
}

# Teste Deine Funktion rmse anhand der Testdatensaetze x und y
#   Richtiges Ergebnis: RMSE = 1
x = c(2, 3, 2, 5, 1)
y = c(1, 3, 4, 5, 1)
rmse(x, y)

# Berechnung des RMSE fuer das abcd-Modell im Peace River Einzugsgebiet
rmse( mopex$discharge, abcd(mopex, params)$Q )


# AUFGABE: Die Berechnung des RMSE mit Hilfe der Funktion rmse
#   ergibt NA, also einen Fehlwert (Not Available, Missing Value).
#   Dies liegt daran, dass die Zeitreihe der beobachten MOPEX-Abfluesse
#   Ebenfalls Fehlwerte (NA) enthaelt.
#
#   1. Eine Rechenoperation mit NA-Werten ergibt immer NA. 
#      Probiere es aus.
#
#   2. Um den RMSE fuer das abcd-Modell zu berechnen, duerfen wir
#      folglich nur Zeitschritte beruecksichtigen, die keine Fehlwerte
#      enthalten. Dies bewerkstelligt die untenstehende Funktion
#      "rmse2". Probiere es nun also mit dieser Funktion.
#
#   3. Wenn die monatlichen Abfluesse in "mm" vorliegen, welche Einheit
#      hat dann der RMSE?
#
#   6. Wer schafft es, den kleinsten RMSE zu erzeugen?

# Diese Funktion entfernt Zeitschritte mit NA
#   und berechnet dann den RMSE.
rmse2 = function(obs, sim) {
  ix = is.finite(obs) & is.finite(sim)
  return ( rmse(obs[ix], sim[ix]) )
}

# Und nun nochmal Berechnung des RMSE fuer das abcd-Modell
#   im Peace River Einzugsgebiet
params = c(a=0.99, b=100, c=0.4, d=0.1)
rmse2( mopex$discharge, abcd(mopex, params)$Q )




# Die Herausforderung fuer konzeptionelle Wasserhaushalts-
#   modelle wie das abcd-Modell ist die Identifikation der Modell-
#   parameter durch Kalibrierung. Prinzip: Definiere ein Guetemaß,
#   welches die Uebereinstimmung zwischen Modell und Beobachtungen
#   quantifiziert. Suche dann den Parametersatz, fuer welchen die
#   Guete maximal ist (oder der Fehler minimal).


# AUFGABE: Wir nutzen hier die sogenannte Nash-Sutcliffe-Effizienz (NSE),
#   eigentlich nichts anderes als das Bestimmtsheitsmaß (Anteil
#   erklaerter Varianz). Der bestmögliche Wert fuer den NSE ist 1,
#   der schlechteste Wert ist minus unendlich. Der NSE-Wert sollte
#   also maximal werden. Die Funktion "nash" gibt fuer einen 
#   Vektor von Beobachtungen x und einen Vektor simulierter 
#   Werte y den NSE zurueck.

#   Berechne unter Verwendung dieser Funktion die NSE
#   des abcd-Modells fuer das MOPEX-Gebiet 02296750 
#   unter Nutzung des von Dir gewahlten Parametersatzes.
#   Was faellt auf?

nash= function(x,y) {
  return( 1. - sum((x-y)^2) / sum((x-mean(x))^2) )
}

# HIER DIE PASSENDEN ARGUMENTE EINFUEGEN 
nash(..., ...)


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
library(ppso)
library(lhs)
#>

# AUFGABE: Falls die Pakete noch nicht vorhanden sind,
#   installiere sie nun mit Hilfe des "install.packages"-Befehls.
#   Fuer ppso brauchst Du besondere Argumente:
if(!require(ppso)) install.packages(pkgs="ppso", repos="http://rforge.net/", type = "source")
if(!require(lhs)) install.packages(pkgs="lhs")#, repos="http://rforge.net/", type = "source")
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
                   max_number_function_calls=200)
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
