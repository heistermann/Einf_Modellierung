#Aufgaben-Template Termin_4


################################################################################

#Aufgabe 01_aschenbroedel

### Aschenbrödel
#Wie viele Elemente des Vektors `erbsen` entsprechen der Zahl `gut`?
#Beispiel:
# Wenn `erbsen=c(1,5,3,5)` und `gut=5`, dann liegen 2  *gute* Erbsen in der Schüssel. 
# 

#Input(s)
#  Name: erbsen
#  Typ: Array of integers
#  Beschreibung: Eine Schuessel voll Erbsen
#  Name: gut
#  Typ: Integer
#  Beschreibung: Zahl, die eine gute Erbse markiert.
#Output
#  Typ: Integer
#  Beschreibung: Anzahl der guten Erbsen in der Schuessel
#Testbeispiel
#  Input: c(0, 1, 0, 1, 0, 1)
#  Input: 1
#  Output: 3
# (beim Aufruf von 'instoepfchen(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
instoepfchen = function(erbsen, gut) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 02_sommerhochwasser

### Sommerhochwasser
#Gegeben ist ein Vektor mit Hochwasserabfluessen (`abfluss`) und ein weiterer Vektor mit den Monaten, in welchen diese Abfluesse jeweils gemessen wurden (`monat`). Ermittle den mittleren Hochwasserabfluss im Sommer. 
#Aber was heißt eigentlich Sommer? Das Argument `beginn` definiert den ersten Sommermonat und das Argument `ende` den letzten.
#Runden Sie das Ergebnis auf zwei Nachkommastellen (Funktion `round`).
#Beispiel:
# In den Monaten `monat=c(1,3,5,7,9,11,2,4,6,8,10,12)` wurde der Spitzenabfluss `abfluss=c(10,20,15,30,5,25,11,14,30,18,24,20)`  gemessen. Als Sommer gelten alle Monate von `beginn=6` bis `ende=9`. Der mittlere HW-Abfluss im	Sommer beträgt also 20.75  (Mittelwert aus 30, 5, 30 und 18).
# 

#Input(s)
#  Name: abfluss
#  Typ: Array of floats
#  Beschreibung: Vektor mit 12 Hochwasserabfluessen.
#  Name: monat
#  Typ: Integer
#  Beschreibung: Monat, in dem der HW-Abfluss gemessen wurde
#  Name: beginn
#  Typ: Integer
#  Beschreibung: Erster Sommermonat
#  Name: ende
#  Typ: Integer
#  Beschreibung: Letzter Sommermonat
#Output
#  Typ: Float
#  Beschreibung: Mittlerer Hochwasserabfluss im Sommer
#Testbeispiel
#  Input: c(1, 7, 3, 2, 4, 8, 3, 8, 7, 3, 5, 1)
#  Input: c(1, 2, 7, 4, 9, 10, 6, 8, 5, 11, 12, 3)
#  Input: 5
#  Input: 7
#  Output: 4.33
# (beim Aufruf von 'sommerhochwasser(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
sommerhochwasser = function(abfluss, monat, beginn, ende) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 03_gradtage

### Gradtage
#Das Tag-Grad-Verfahren ermittelt fuer mehrere aufeinanderfolgende Tage die **Summe** der Tagesmitteltemperaturen, die einen Schwellenwert `minT` ueberschreiten. Das Verfahren wird in unterschiedlichsten Bereichen eingesetzt: z.B. bei der Modellierung der Schneeschmelze, des Heizwaermebedarfs oder der phaenologischen Entwicklung von Pflanzen.
#Wir nehmen an, eine Feldfrucht ist nach einer bestimmten Zahl Gradtagen `erntereif` (Einheit: Grad Celsius*Tag).  Bestimme den Zeitpunkt der Ernte.
#Beispiel:
# Der Vektor der Tagesmitteltemperaturen (in Grad Celsius) sei `temp = c(1,7,3,2,4)`. Bei einem Schwellenwert von `minT = 2` ergibt sich für die Gradtagwerte der betreffenden fünf Tage: ``` 1. Tag: min(0,1 - 2)= 0 2. Tag: (7 - 2) + 0 = 5 3. Tag: (3 - 1) + 5 = 7 4. Tag: (2 - 2) + 7 = 7 5. Tag: (4 - 2) + 7 = 9 ``` Wenn die Feldfrucht bei 7 Gradtagen reif ist (`erntereif = 7`), kann sie folglich nach 3 Tagen geerntet werden.
# 

#Input(s)
#  Name: temp
#  Typ: Array of floats
#  Beschreibung: Vektor der Tagesmitteltemperaturen
#  Name: minT
#  Typ: Float
#  Beschreibung: Schwellenwert der Temperatur, ab welcher Gradtage gezaehlt werden.
#  Name: erntereif
#  Typ: Integer
#  Beschreibung: Gradtage, die zur Ernte erreicht werden muessen.
#Output
#  Typ: Integer
#  Beschreibung: Zahl der Tage, nach denen geerntet wird.
#Testbeispiel
#  Input: c(1, 7, 3, 2, 4, 8, 3, 8, 7, 3, 5, 1)
#  Input: 2
#  Input: 10
#  Output: 6
# (beim Aufruf von 'gradtage(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
gradtage = function(temp, minT, erntereif) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 04_cn1

### Das US-SCS Curve Number Verfahren (Teil 1)
#Das Curve Number (CN) Verfahren wurde urspruenglich vom US Soil Conservation Service (US-SCS) entwickelt und ist auch heute noch weit verbreitet. Der CN-Wert beeinflusst den Ereignisabflussbeiwert und wird auf Grundlage von Gebietseigenschaften sowie dem Vorereignisniederschlag bestimmt.
#Im ersten Schritt wird die sogenannte "Curve Number" aus der Landnutzung und dem Bodentyp ermittelt. Dazu gibt es Tabellenwerke. Die folgende Tabelle stellt die CN-Werte fuer urbane Flaechen dar.
#``` tab = "LANU1;LANU2;A;B;C;D Freiflaeche;geringer Wiesenanteil;68;79;86;89 Freiflaeche;mittlerer Wiesenanteil;49;69;79;84 Freiflaeche;hoher Wiesenanteil;39;61;74;80 Verkehrsflaeche;vollversiegelt;98;98;98;98 Verkehrsflaeche;offener Wegerand;83;89;92;93 Verkehrsflaeche;Schotterweg;76;85;89;91 Verkehrsflaeche;Feldweg;72;82;87;89 Gewerbeflaeche;Geschaeftsflaeche;89;92;94;95 Gewerbeflaeche;Industrieflaeche;81;88;91;93 Wohngebiet;>65% bebaut;77;85;90;92 Wohngebiet;38% bebaut;61;75;83;87 Wohngebiet;30% bebaut;57;72;81;86 Wohngebiet;25% bebaut;54;70;80;85 Wohngebiet;20%bebaut;51;68;79;84 Wohngebiet;<12%bebaut;46;65;77;82" ```
#Leider erlaubt Codefights keine Datenbereitstellung via URL.  Daher muss diese Tabelle zunaechst in den Code kopiert werden. Mit den folgenden beiden Zeilen kann man daraus einen `data.frame` erzeugen:
#``` con = textConnection(tab) df = read.table(con, header=TRUE, sep=";", stringsAsFactors=FALSE, strip.white=TRUE) ```
#Nutze nun diesen `data.frame`, um aus den folgenden Argumenten  den passenden CN-Wert zu ermitteln: Landnutzung Typ 1 (`lanu1`), Landnutzung Typ 2 (`lanu2`) und Bodentyp `boden` (kann die Werte "A", "B", "C" oder "D" annehmen). Nutze dazu z.B. die `subset` Funktion:
#``` subset(df, LANU1==lanu1 & LANU2==lanu2)[,boden])  ```
#Beispiel:
#
#Wenn `lanu1=Verkehrsflaeche`, `lanu2=Feldweg` und `boden="B"`, dann ist die Kurvennummer *CN=82*.
# 

#Input(s)
#  Name: lanu1
#  Typ: String
#  Beschreibung: Landnutzung Typ 1
#  Name: lanu2
#  Typ: String
#  Beschreibung: Landnutzung Typ 2 (Untertyp)
#  Name: boden
#  Typ: String
#  Beschreibung: Bodentyp (A, B, C oder D)
#Output
#  Typ: Integer
#  Beschreibung: CN-Wert fuer den Standort
#Testbeispiel
#  Input: Freiflaeche
#  Input: hoher Wiesenanteil
#  Input: B
#  Output: 61
# (beim Aufruf von 'curveNumber1(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
curveNumber1 = function(lanu1, lanu2, boden) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 05_cn2

### Das US-SCS Curve Number Verfahren (Teil 2)
#Das Curve Number (CN) Verfahren wurde urspruenglich vom US Soil Conservation Service (US-SCS) entwickelt und ist auch heute noch weit verbreitet. Der CN-Wert beeinflusst den Ereignisabflussbeiwert und wird auf Grundlage von Gebietseigenschaften sowie dem Vorereignisniederschlag bestimmt.
#Im ersten Schritt wurde bereits der CN-Wert aus Landnutzung und Bodentyp ermittelt. Dieser Wert gilt fuer eine "normale" Gebietsvorfeuchte (engl.: *antecedent moisture condition*, AMC). Fuer feuchte oder trockene Bedingungen muss dieser CN-Wert angepasst werden. Die Entscheidung, ob die Bedingungen trocken, normal oder feucht sind,  wird auf Grundlage der Niederschlagssumme der vorangegangenen fuenf Tage (P5, in mm) getroffen (Mishra & Singh, 2003): - trocken: wenn P5 < 13 mm (Vegetationsperiode: P5 < 36 mm) - feucht : wenn P5 > 28 mm (Vegetationsperiode: P5 > 53 mm) - normal : sonst
#Entsprechend erfolgt die Umrechung des CN-Wertes von normalen zu trockenen oder feuchten Bedingungen mit Hilfe von Anpassungsfaktoren, die der folgenden Tabelle entnommen werden koennen:
#``` tab = "normal;trocken;feucht 10;0.40;2.22 20;0.45;1.85 30;0.50;1.67 40;0.55;1.50 50;0.62;1.40 60;0.67;1.30 70;0.73;1.21 80;0.79;1.14 90;0.87;1.07 100;1.00;1.00" ```
#Auch diese Tabelle kann in den Code kopiert und dann wie gehabt als `data.frame` eingelesen werden:
#``` con = textConnection(tab) df = read.table(con, header=TRUE, sep=";", stringsAsFactors=FALSE, strip.white=TRUE) ```
#Wenn trockene oder feuchte Bedinungen herrschen, wird der entsprechende Faktor mit dem CN-Wert fuer normale Bedingungen multipliziert. 
#Berechne nun den resultierenden CN-Wert auf Grundlage - des CN-Wertes fuer normale Bedingungen (`cn2`),  - der Niederschlagshoehen (in mm) der jeweils fuenf vorangegangenen Tage (`precip`), - der Angabe, ob man sich innerhalb der Vegetationsperiode befindet (`vegetation`). 
#Beispiel:
# Der CN-Wert fuer normale Bedingungen sei `cn2=72`. Der Niederschlag der Vortage sei `precip=c(4,3,0,2,1)`. Damit ergibt sich der P5-Wert zu `sum(precip)=10`. Wenn `vegetation=FALSE`, dann befinden wir uns außerhalb der Vegetationsperiode. Die Bedingungen sind somit **trocken**. Der Tabellenwert, welcher unserem CN-Wert  fuer normale Bedingungen (`cn2`) am naechsten kommt ist `70`.  Der Anpassungfaktor ist also `0.73`, und der resultierende CN-Wert ergibt sich zu CN = 0.73 * 72.
#*Hinweis*: Die Funktion `which.min` gibt für einen Vektor diejenige Position ("Index") zurück, an welcher sich der kleinste Wert befindet. Das könnte beim Auffinden des Anpassungsfaktors hilfreich sein.

#Input(s)
#  Name: cn2
#  Typ: Integer
#  Beschreibung: CN-Wert fuer normale Gebietsvorfeuchte
#  Name: precip
#  Typ: Array of floats
#  Beschreibung: Vektor der Laenge 5 mit den Niederschlagshoehen der letzten 5 Tage (in mm)
#  Name: vegetation
#  Typ: Boolean
#  Beschreibung: Ist TRUE, wenn wir uns in der Vegetationsperiode befinden (sonst FALSE)
#Output
#  Typ: Float
#  Beschreibung: Resultierender CN-Wert
#Testbeispiel
#  Input: 72
#  Input: c(2, 5, 3, 6, 0)
#  Input: TRUE
#  Output: 52.56
# (beim Aufruf von 'curveNumber2(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
curveNumber2 = function(cn2, precip, vegetation) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################
#Zum Testen nun die ganze Datei ausführen - es dürfen keine Fehlermeldungen auftreten!
