# Seminar zu "Einf¸hrung in die Modellierung/Integrierte Modellierung"

# Workspace ausleeren
rm(list = ls())


# INSPEKTION EINES MOPEX-DATENSATZES
# ----------------------------------

# AUFGABE: Wir inspizieren nun einen Datensatz fuer den
#   MOPEX-Pegel "02296750" ("PEACE RIVER AT ARCADIA, FLORIDA").
#   Der Datensatz enth‰lt u.a. monatliche Werte fuer Niederschlag,
#   Abfluss und Potenzielle Verdunstung. Diese Werte sind als
#   mm Wassersaeule ¸ber das gesamte Einzugsgebiet angegeben.
#   Wir belassen es bei dieser Einheit.
#
#   Die entsprechende Datei heiﬂt "02296750.monthly" und wird
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
#>
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
#   Allerdings waere ein objektives, quantitatives Uebereinstimmungsmaﬂ
#   wuenschenswert (Guetemaﬂ oder Fehlermaﬂ). Ein verbreitetes
#   Fehlermaﬂ ist der "Root Mean Squared Error" (RMSE).
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
#   4. Probiere nun Deine Funktion rmse aus. Nutze dafuer zunaechst die
#      beiden ausgedachten Vektoren x (als Beobachtung) und 
#      y (als Simulation). Wenn Deine Funktion "rmse" richtig ist,
#      muesste als Ergebnis "1" zurueckgegeben werden.
#
#   4. Wende nun die Funktion "rmse" auf das  abcd-Modell fuer
#      dem Peace River an (siehe oben). Berechne also den RMSE
#      des simulierten Abflusses im Vergleich zum beobachteten Abfluss
#      fuer einen beliebigen Parametersatz param.
#
#   5. Mist! Was funktioniert da nicht???

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
