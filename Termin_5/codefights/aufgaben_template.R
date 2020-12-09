#Aufgaben-Template Termin_5


################################################################################

#Aufgabe 01_welchertag

### Welcher Tag ist heute?
#Gegeben ist eine Zeichenkette (auch String genannt) der Form "2016-12-03", die ein Datum repräsentiert  (in diesem Beispiel den 3. Dezember 2016).  Das entsprechende Argument heißt `datum`.
#Gib den englischen Namen des Wochentages zurück, der `datum` entspricht. 
#Beispiel:
#
#Wenn `datum="2017-01-17"`, dann soll `"Tuesday"`  zurückgegeben werden. 
#### Hinweise
#- Mit der Funktion `as.Date` teilst Du R mit, 
#  dass der String als Datum interpretiert werden soll;
#- Mit der Funktion `strftime` kannst Du das Datum dann
#  umformatieren - z.B. zum Namen des entsprechenden 
#  englischen Wochentags. Dazu muss ein passender Wert 
#  für das Argument `format` übergeben werden. Konsultiere dafür die Hilfe
#  zu `strftime`.
#Die Lösung hat daher die Form
#``` return(strftime(as.Date(datum), format="...")) ```
#in der Du das `...` ersetzen musst.
# 

#Input(s)
#  Name: datum
#  Typ: String
#  Beschreibung: Datum als YYYY-MM-DD
#Output
#  Typ: String
#  Beschreibung: Englischer Name des zugehörigen Wochentages
#Testbeispiel
#  Input: 2016-11-15
#  Output: Tuesday
# (beim Aufruf von 'welchertag(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
welchertag = function(datum) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 02_ausschlafen

### Heute ausschlafen?
#Gegeben ist eine Zeichenkette (auch String genannt) der Form "2016-12-03", die ein Datum repräsentiert  (in diesem Beispiel den 3. Dezember 2016).  Das entsprechende Argument heißt `datum`.
#Deine Funktion soll entscheiden, ob Du an diesem Tag ausschlafen kannst. Falls es sich um einen Tag am  Wochenende handelt, soll die Funktion `TRUE` zurückgeben. Für Wochentage soll die Funktion `FALSE` zurückgeben.
#Beispiel:
#
#Wenn `datum="2017-01-17`, dann soll `FALSE`  zurückgegeben werden. Wenn `datum="2017-01-15"`, dann soll `TRUE` zurückgegeben werden.
#### Hinweise
#Nutze den Code aus der ersten Aufgabe (`welchertag`) und mache von dort aus weiter.
# 

#Input(s)
#  Name: datum
#  Typ: String
#  Beschreibung: Datum als YYYY-MM-DD
#Output
#  Typ: Boolean
#  Beschreibung: Information, ob Sie ausschlafen können.
#Testbeispiel
#  Input: 1944-05-03
#  Output: FALSE
# (beim Aufruf von 'ausschlafen(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
ausschlafen = function(datum) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 03_vegetationsperiode

### Vegetationsperiode
#Gegeben ist eine Zeichenkette (auch String genannt) der Form "2016-12-03", die ein Datum repräsentiert  (in diesem Beispiel den 3. Dezember 2016).  Das entsprechende Argument heißt `datum`.
#Außerdem erhältst Du Informationen, wann die Vegetationsperiode beginnt (`start`) und endet (`ende`). `start` und `ende` liegen als  "Tag im Jahr" vor - ein Wert von 1 entspräche  also dem 1. Januar eines beliebigen Jahres, 32 dem 1. Februar usw.
#Wenn das gegebene Datum innerhalb der Vegetationsperiode liegt, soll die Funktion `TRUE` zurückgeben, sonst `FALSE`.
#Beispiel:
#
#Wenn `datum="2015-11-13"` sowie `beginn=120` und `ende=273`, dann soll `FALSE` zurückgegeben werden.
#### Hinweise
#Gehe ähnlich vor wie in den beiden vorherigen Aufgaben: 
#- Wandle zunächst den String in ein Datum um (`as.Date`); - wandle dann das Datum in den "Tag im Jahr" um (wieder mit
#  `strftime`, diesmal aber mit einem anderen Wert für `format`);
#- der Rückgabewert ist auch ein String und muss mit
#  `as.numeric` in eine Zahl umgewandelt werden;
#- schließlich kannst Du prüfen, ob dieser Tag nach Beginn (>=) und vor
#  Ende (<=) der Vegetationsperiode liegt.
# 

#Input(s)
#  Name: datum
#  Typ: String
#  Beschreibung: Datum als YYYY-MM-DD
#  Name: start
#  Typ: Integer
#  Beschreibung: Start der Vegetationsperiode (Day of Year)
#  Name: ende
#  Typ: Integer
#  Beschreibung: Ende der Vegetationsperiode (Day of Year)
#Output
#  Typ: Boolean
#  Beschreibung: Aussage, ob der Tag innerhalb der Vegetationsperiode liegt.
#Testbeispiel
#  Input: 1944-05-03
#  Input: 90
#  Input: 300
#  Output: TRUE
# (beim Aufruf von 'vegetationsperiode(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
vegetationsperiode = function(datum, start, ende) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 04_ereignisdauer

### Dauer eines Ereignisses
#Gegeben sind zwei Zeichenketten der Form "2016-12-03 10:30:00",  die Beginn (`start`) und Ende (`ende`) eines Niederschlagsereignisses repräsentieren.
#Berechne die Dauer des Niederschlagsereingisses in Stunden, und zwar mit einer Genauigkeit von zwei Nachkommastellen.
#Beispiel:
#
#Wenn `start="2016-12-03 10:00:00"` und `ende="2016-12-03 12:20:00"`, dann ist das Ergebnis `2.33` (Dauer in Stunden, gerundet auf zwei Stellen).
#### Hinweise
#- Mit `as.POSIXct` wandelst Du die Zeichenketten in eine Datumszeit um; - mit `difftime` berechnest Du die Zeitdifferenz (beachte Argument `units`!) - mit `round` rundest Du das Ergebnis.
# 

#Input(s)
#  Name: start
#  Typ: String
#  Beschreibung: Datum/Zeit als YYYY-MM-DD HH:MM:SS
#  Name: ende
#  Typ: String
#  Beschreibung: Datum/Zeit als YYYY-MM-DD HH:MM:SS
#Output
#  Typ: Float
#  Beschreibung: Dauer des Ereignisses (Stunden mit zwei Nachkommastellen)
#Testbeispiel
#  Input: 2011-03-05 09:02:34
#  Input: 2011-03-05 16:40:43
#  Output: 7.64
# (beim Aufruf von 'ereignisdauer(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
ereignisdauer = function(start, ende) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 05_niederschlagsintensitaet

### Mittlere Intensität eines Ereignisses
#Gegeben sind zwei Zeichenketten der Form "2016-12-03 10:30:00",  die Beginn (`start`) und Ende (`ende`) eines Niederschlagsereignisses repräsentieren. Außerdem kennst Du das in diesem Zeitraum aufgefangene Niederschlagsvolumen (`volumen`, in ml) sowie den Radius der  kreisförmigen Auffangfläche	des Totalisators (`radius`, in cm).
#Berechne nun die mittlere Niederschlagsintensität des Ereignisses (in mm/h) mit einer Genauigkeit von zwei Nachkommastellen.
#Beispiel:
#
#Wenn `start="2016-12-03 10:00:00"`, `ende="2016-12-03 12:20:00"`, `volumen=400` (ml) und `radius=10` (cm), dann ist die mittlere  Niederschlagsintensität	für das Ereignis  `400e3 / (10e1^2 * pi) / 2.33 = 5.46` (mm/h).
#### Hinweise
#- Nutze den Code aus der vorherigen Aufgabe (`ereignisdauer`), 
#  um die Ereignisdauer (in Stunden) zu ermitteln;
#- den Wert von *Pi* kennt R unter der Variable `pi`; - ein Milliliter (ml) ist ein Kubikzentimeter; - die Zieleinheit ist `mm/h`; - der Ausdruck `400e3` ist äquivalent zu `400*1000`.
# 

#Input(s)
#  Name: start
#  Typ: String
#  Beschreibung: Datum/Zeit als YYYY-MM-DD HH:MM:SS
#  Name: ende
#  Typ: String
#  Beschreibung: Datum/Zeit als YYYY-MM-DD HH:MM:SS
#  Name: volumen
#  Typ: Float
#  Beschreibung: Aufgefangenes Volumen (ml)
#  Name: radius
#  Typ: Float
#  Beschreibung: Radius der kreisfoermigen Auffangflaeche (cm)
#Output
#  Typ: Float
#  Beschreibung: Niederschlagsintensitat in mm/h (mit zwei Nachkommastellen)
#Testbeispiel
#  Input: 2011-03-05 09:02:00
#  Input: 2011-03-05 16:40:00
#  Input: 101
#  Input: 5.64
#  Output: 1.32
# (beim Aufruf von 'niederschlagsintensitaet(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
niederschlagsintensitaet = function(start, ende, volumen, radius) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################
#Zum Testen nun die ganze Datei ausführen - es dürfen keine Fehlermeldungen auftreten!
