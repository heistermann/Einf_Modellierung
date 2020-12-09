#Aufgaben-Template Termin_3


################################################################################

#Aufgabe 01_qualitaetskontrolle

#Du erhältst eine Zeitreihe täglicher Niederschlagshöhen als Vektor `precip` (in mm). Zusätzlich wirst Du informiert, an welchen Tagen der Niederschlagsschreiber aufgrund einer Funktionsstörung unzuverlässig gemessen hat (Vektor `stoertage`). Du möchtest nun die Werte für die betreffenden Tage als Fehlwerte markieren. Als Fehlwertmarker wird oft der Wert -9999 genutzt. Ersetze also alle unzuverlässigen Messungen durch den Wert -9999 und gib den somit korrigierten Vektor zurück.
#
#Beispiel:
# Wenn `precip = c(1, 5.5, 10.1, 0, 3)` und `stoertage = c(2, 4)`, dann ist das Ergebnis `c(1, -9999, 10.1, -9999, 3)`.
# 

#Input(s)
#  Name: precip
#  Typ: array.float
#  Beschreibung: Vektor mit täglichen Niederschlagshöhen (in mm)
#  Name: stoertage
#  Typ: array.integer
#  Beschreibung: Vektor, welcher die Tage mit Funktionsstörung anzeigt
#Output
#  Typ: array.float
#  Beschreibung: Vektor mit Niederschlagshöhen und Fehlwertmarkierung
#Testbeispiel
#  Input: list(20, 50, 0.3, 0, 0.7, 1)
#  Input: 1:2
#  Output: -9999
#  Output: -9999
#  Output: 0.3
#  Output: 0
#  Output: 0.7
#  Output: 1
# (beim Aufruf von 'qualitatetskontrolle(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
qualitatetskontrolle = function(precip, stoertage) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 02_gebietsniederschlag

#In einem Einzugsgebiet stehen drei Niederschlagsstationen. Mit dem Thiessen-Verfahren wurden 50 Prozent des Gebiets der Station 1 zugeordnet, 30 Prozent der Station 2 und 20 Prozent der Station 3. Der Vektor `messungen` enthält die drei jeweils an den Stationen gemessenen Niederschläge (in mm). Berechne auf Grundlage  dieser Informationen den Gebietsniederschlag. 
#
#Beispiel:
#
#Wenn `messungen = c(4, 10, 5)`, dann ist der Gebietsniederschlag `0.5 * 4 + 0.3 * 10 + 0.2 * 5 = 6` (mm).
# 

#Input(s)
#  Name: messungen
#  Typ: array.float
#  Beschreibung: Vektor mit drei Niederschlagshöhen (in mm)
#Output
#  Typ: float
#  Beschreibung: Das gewichtete Mittel der drei Messungen
#Testbeispiel
#  Input: 1
#  Input: 2
#  Input: 3
#  Output: 1.7
# (beim Aufruf von 'gebietsniederschlag(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
gebietsniederschlag = function(messungen) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 03_egl1

#Ihr erinnert Euch: Das Einheitsganglinienverfahren  beschreibt die Abflusskonzentration im Einzugsgebiet:Der Vektor der Einheitsganglinie stellt dar, wie sich ein Effektivniederschlagsimpuls am Gebietsauslass  als Abfluss über die Zeit verteilt.
#
#Beispiel:
#
#Der Vektor der Einheitsganglinie heiße `egl` und habe den Wert `egl = c(0.2, 0.5, 0.3)`. Der Zeitschritt der Einhheitsganglinie sei eine Stunde. Dies bedeutet, dass innerhalb der ersten Stunde 20 % des Effektivniederschlagsimpulses am Gebietsauslass abfließen. In der zweiten Stunde fließen 50 % ab, und in der dritten Stunde 30 %. Nach drei Stunden ist der Effektivniederschlagsimpuls vollständig aus dem Gebiet abgeflossen.
#Bevor man jedoch die Abflussantwort auf einen Effektivniederschlagsimpuls  berechnen kann, muss man den Effektivniederschlag in die Einheit des Abflusses umrechnen. Falls der Effektivniederschlag `precip` in *mm/h* und die Einzugsgebietsgröße `area` in *km²* gegeben ist,  ergibt sich der Effektivniederschlag in der Einheit *m³/s* aus `precip * area / 3.6`. Ein Effektivniederschlagsimpuls mit der Intensität *2 mm/h* ergibt auf einem *7.2 km²* großen Einzugsgebiet somit einen Direktabflussimpuls von *4 m³/s*, der dann mit Hilfe der Einheitganglinie über die Zeit verteilt wird. Für die oben angebene Einheitsganglinie `egl = c(0.2, 0.5, 0.3)` ergäbe sich sich somit als Direktabflussganglinie `c(0.8, 2, 1.2)` (in m3/s).
#Berechne nun also für **einen einzigen** Effektivniederschlagsimpuls `precip` (in *mm/h*) die Abflussganglinie (*m³/s*) am Auslass des Einzugsgebiets der Größe `area` (*km²*). Das Zeitintervall der Einheitsganglinie `egl` und die Dauer des	Niederschlagsimpulses seien je eine Stunde.
# 

#Input(s)
#  Name: precip
#  Typ: float
#  Beschreibung: EIN Effektivniederschlagsimpuls (mm/h)
#  Name: egl
#  Typ: array.float
#  Beschreibung: Einheitsganglinie als Vektor von Gewichten
#  Name: area
#  Typ: float
#  Beschreibung: Fläche des Einzugsgebiets (km²)
#Output
#  Typ: array.float
#  Beschreibung: Abflussganglinie (m³/s)
#Testbeispiel
#  Input: 5
#  Input: c(0.2, 0.5, 0.3)
#  Input: 3.6
#  Output: 1
#  Output: 2.5
#  Output: 1.5
# (beim Aufruf von 'egl1(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
egl1 = function(precip, egl, area) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 04_egl2

#Gegeben seien der Vektor der Einheitsganglinie `egl` und der Vektor der Effektivniederschlagsganglinie `precip` (diese Ganglinie kann also nun im Unterschied zur vorherigen Aufgabe mehrere zeitlich aufeinanderfolgende Effektivniederschlagsimpulse enthalten).
#Berechnen nun die Länge der resultierenden Direktabflussganglinie.  Alle Ganglinien liegen jeweils in stündlicher Auflösung vor.
# 
# #Beispiel:
#
# Wenn `egl = c(0.2, 0.5, 0.3)` und `precip = c(2.0, 3.5)`, dann hat
# die Direktabflussganglinie eine Länge von `4` Stunden.
# 

#Input(s)
#  Name: precip
#  Typ: array.float
#  Beschreibung: Effektivniederschlagsganglinie
#  Name: egl
#  Typ: array.float
#  Beschreibung: Einheitsganglinie
#Output
#  Typ: integer
#  Beschreibung: Länge der Abflussganglinie
#Testbeispiel
#  Input: c(2, 6, 3, 2, 7, 4, 5)
#  Input: c(0.2, 0.5, 0.3)
#  Output: 9
# (beim Aufruf von 'egl2(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
egl2 = function(precip, egl) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 05_egl3

#Bevor Du Dich an dieser Aufgabe versuchst, solltest Du die Aufgaben `egl1` und `egl2` lösen.
#Berechne wie in der Aufgabe `egl1` aus den gegebenen Argumenten die Direktabflussganglinie (*m3/s*) am Auslass  des Einzugsgebiets. Für den Effektivniederschlag liegt nun aber nicht ein einzelner Impuls, sondern eine beliebig lange Ganglinie (Vektor) vor. Die zeitliche Auflösung aller Ganglinien sei eine Stunde. 
#
#Beispiel:
#
#Die Einheitsganglinie sei `egl = c(0.2, 0.8)`, die Effektivniederschlagsganglinie (in *mm/h*) sei `precip = c(2, 4)`, die Einzugsbietsfläche (in *km²*) sei `area = 7.2`. Die Direktabflussganglinie ist somit `3` Stunden lang und ergibt sich zu `c(0.8, 4.8, 6.4)`.
# 

#Input(s)
#  Name: precip
#  Typ: array.float
#  Beschreibung: Effektivniederschlagsganglinie(mm/h)
#  Name: egl
#  Typ: array.float
#  Beschreibung: Einheitsganglinie als Vektor von Gewichten
#  Name: area
#  Typ: float
#  Beschreibung: Fläche des Einzugsgebiets (km²)
#Output
#  Typ: array.float
#  Beschreibung: Abflussganglinie (m³/s)
#Testbeispiel
#  Input: c(2, 6)
#  Input: c(0.2, 0.5, 0.3)
#  Input: 3.6
#  Output: 0.4
#  Output: 2.2
#  Output: 3.6
#  Output: 1.8
# (beim Aufruf von 'egl3(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
egl3 = function(precip, egl, area) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################
#Zum Testen nun die ganze Datei ausführen - es dürfen keine Fehlermeldungen auftreten!
