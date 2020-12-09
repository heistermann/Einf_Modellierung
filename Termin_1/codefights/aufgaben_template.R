#Aufgaben-Template Termin_1


################################################################################

#Aufgabe 01_Echo

#Gib die übergebene Zahl `n` wieder zurück.
#Beispiel:
# Für `n = 7` soll das Ergebnis `7` erzeugt werden. 

#Input(s)
#  Name: n
#  Typ: integer
#  Beschreibung: eine Zahl
#Output
#  Typ: integer
#  Beschreibung: Die selbe Zahl wie das Eingabeargument.
#Testbeispiel
#  Input: 1
#  Output: 1
# (beim Aufruf von 'Echo(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
Echo = function(n) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 02_summe

#Gib die Summe der beiden Argumente `arg1` und `arg2` zurück!
#Beispiel:
# Für die Zahlen `arg1 = 17` und `arg2 = 4` soll das Ergebnis `21` erzeugt werden. 

#Input(s)
#  Name: arg1
#  Typ: float
#  Beschreibung: Eine Zahl
#  Name: arg2
#  Typ: float
#  Beschreibung: Noch eine Zahl
#Output
#  Typ: float
#  Beschreibung: Die Summe beider Zahlen
#Testbeispiel
#  Input: 1
#  Input: 2
#  Output: 3
# (beim Aufruf von 'Summe(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
Summe = function(arg1, arg2) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 03_max_maximum

#Gib die größte Zahl zurück, die in den beiden gegebenen Vektoren `v1` und `v2` enthalten ist!
#
#Beispiel:
# Für  die Vektoren `v1 = c(23, 17, 1)` und `v2 = c(5, 4)` soll das Ergebnis `23` erzeugt werden. 
# 

#Input(s)
#  Name: v1
#  Typ: array.integer
#  Beschreibung: Erster Vektor
#  Name: v2
#  Typ: array.integer
#  Beschreibung: Zweiter Vektor
#Output
#  Typ: integer
#  Beschreibung: Das größte Element beider Vektoren.
#Testbeispiel
#  Input: 1:3
#  Input: 1:4
#  Output: 4
# (beim Aufruf von 'max_maximum(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
max_maximum = function(v1, v2) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 04_vektorteil

#Gib aus einem gegebenen Vektor `v` den Teilvektor zurück, der bei Position `start` beginnt und die folgenden `n_e`  Elemente hat. Sollte dabei die Länge von _v_ überschritten werden, gib einen leeren Vektor zurück.
#Beispiel:
# Für  den Vektor `v = c(2, 5, 4, 3, 6)` soll mit  `start = 2` und `n_e = 3` das Ergebnis `[5, 4, 3]` erzeugt werden. 
# 

#Input(s)
#  Name: v
#  Typ: array.integer
#  Beschreibung: ganzer Vektor
#  Name: start
#  Typ: integer
#  Beschreibung: Position, ab der der Teilvektor extrahiert werden soll
#  Name: n_e
#  Typ: integer
#  Beschreibung: Länge des zu extrahierenden Vektors
#Output
#  Typ: array.integer
#  Beschreibung: Der gesuchte Teil-Vektor.
#Testbeispiel
#  Input: 1:3
#  Input: 1
#  Input: 2
#  Output: 1
#  Output: 2
# (beim Aufruf von 'vektorteil(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
vektorteil = function(v, start, n_e) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 05_draengler

#In einer Schlange stehen Kinder an der Essensausgabe.  Der beaufsichtigende Lehrer wendet kurz den Blick ab. Sofort beginnt die Drängelei: Kinder kleiner als 1 m werden gleich ganz aus der Schlange geschubst. Danach, beginnend am Kopf der Schlange, drängelt jedes Kind _ein Mal_ vor seinen Vordermann, wenn es größer ist als dieser. Gib die neue Reihenfolge der Kinder (d.h. den Vektor ihrer Körpergrößen) zurück, wenn der Lehrer sich wieder zurückgewendet hat.
#
#Beispiel:
# Für den Vektor `reihe = c(1.3, 1.4, 1.2, 1.1, 0.9)` soll das Ergebnis `[ 1.4, 1.3, 1.2, 1.1 ]` erzeugt werden. 
# 

#Input(s)
#  Name: reihe
#  Typ: array.float
#  Beschreibung: Vektor der Körpergrößen der Kinder (in m) in der Reihenfolge, wie sie in der Schlange stehen
#Output
#  Typ: array.float
#  Beschreibung: Vektor der Körpergrößen der Kinder, nachdem gedrängelt wurde.
#Testbeispiel
#  Input: c(1.8, 1.2, 1.7)
#  Output: 1.8
#  Output: 1.7
#  Output: 1.2
# (beim Aufruf von 'draengler(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
draengler = function(reihe) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 06_hitzephasen

#Wenn die mittlere Tagestemperatur den Werte `schwellenwert_temp` an mindestens `schwellenwert_laenge` aufeinanderfolgenden Tagen überschreitet, sprich man von einer Hitzephase. Wieviele Hitzephasen enthält die Zeitreihe der Tagestemperaturen `zeitreihe_temp` ?
#Beispiel:
# Für den Vektor `zeitreihe_temp = c(19, 23, 24, 18, 19, 21)` soll mit `schwellenwert_temp = 20` und `schwellenwert_laenge = 2`  das Ergebnis `1` erzeugt werden.  

#Input(s)
#  Name: zeitreihe_temp
#  Typ: array.float
#  Beschreibung: Vektor der mittleren Tagestemperaturen.
#  Name: schwellenwert_temp
#  Typ: float
#  Beschreibung: Schwellenwert der Temperatur, der überschritten werden muss.
#  Name: schwellenwert_laenge
#  Typ: integer
#  Beschreibung: Anzahl von aufeinanderfolgenden Tagen, die die Schwellentemperatur überschreiten müssen.
#Output
#  Typ: integer
#  Beschreibung: Anzahl der Hitzephasen.
#Testbeispiel
#  Input: c(19, 23, 24, 25, 19, 21)
#  Input: 20
#  Input: 1
#  Output: 2
# (beim Aufruf von 'hitzephasen(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
hitzephasen = function(zeitreihe_temp, schwellenwert_temp, schwellenwert_laenge) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################
#Zum Testen nun die ganze Datei ausführen - es dürfen keine Fehlermeldungen auftreten!
