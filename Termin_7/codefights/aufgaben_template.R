#Aufgaben-Template Termin_7


################################################################################

#Aufgabe 01_schach

#Ein Schachfeld besteht aus acht mal acht Feldern. Wir bauen uns eines, auf dem wir *reproduzierbar* zufällig die Figuren verteilen: ``` figuren = rep(c("K","D","T","S","L","B"," "), times=c(2,2,4,4,4,16,32)) set.seed(1) brett = array(sample(figuren), c(8,8)) ```
#Die Felder werden üblicherweise über eine Kombination von Buchstabe a-h (Reihe) und Zahl 1-8 (Spalte) angesprochen. In R können wir für die gegebene 8x8-Matrix `brett` gleiches erreichen, indem wir folgenden Befehl ausführen:
#```
#   dimnames(brett)=list(8:1,letters[1:8])
#```
#Nun sieht das Schachbrett z.B. so aus:
#```
#   a   b   c   d   e   f   g   h  
#8 "B" " " " " "S" " " "B" "B" "B" 7 "B" "D" " " "L" " " " " " " " " 6 " " "S" "B" "K" " " " " "T" "L" 5 " " "S" " " "L" " " " " " " "T" 4 "L" " " " " "B" "B" "B" "B" " " 3 " " "B" " " " " "D" " " "B" " " 2 " " " " "B" " " "B" " " "B" "T" 1 " " "B" "T" " " " " "S" " " "K" ```
#und kann auch mittels der neu vergebenen Indizes angesprochen werden:
#```
#   brett["1", "f"]
#```
#liefert dann `"S"`, da dort der Springer steht.
#   
#Gib für das gegebene Spielbrett `brett` die Figur zurück, die auf dem Feld `feld` steht, das mittels Buchstaben-Zahlen-Kombination angegeben wird.
#Beispiel:
#
#Für `feld = "f1"` soll `"S"` zurückgegeben werden.
#### Hinweis
#Neben der oben angegeben Zeile könnte die Funktion `substr()` nützlich sein.


#Input(s)
#  Name: feld
#  Typ: string
#  Beschreibung: Verweis auf ein Spielfeld, notiert als Kleinbuchstabe (Spalte) und Zahl (Zeile).
#Output
#  Typ: string
#  Beschreibung: Spielfigur, die auf dem betreffenden Feld steht.
#Testbeispiel
#  Input: b7
#  Output: D
# (beim Aufruf von 'schach(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
schach = function(feld) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 02_sieb

### Das Sieb des Eratosthenes
#Um alle Primzahlen bis `bis` zu bestimmen, kann man das *Sieb des Eratosthenes* verwenden: Ausgehend von der Liste aller Zahlen werden nacheinander die Zahlen entfernt, die durch 2, 3, usw. teilbar sind. Übrig bleiben die Primzahlen.
#   
#Gib alle Primzahlen bis `bis` zurück! Hinweis: 1 ist keine Primzahl.  Teilbarkeit lässt sich elegant mit dem *modulo*-Operator (`%%`)überprüfen. Dieser liefert den Rest bei ganzzahliger Division:
#``` > 6 %% 4 [1] 2 ``` denn 6 erzeugt bei der ganzzahligen Division mit 4 den Rest 2.
#Beispiel:
#
#Für `bis = 10` soll der Vektor `c(2, 3, 5, 7)` zurückgegeben werden.
#


#Input(s)
#  Name: bis
#  Typ: integer
#  Beschreibung: Zahl, bis zu der alle Primzahlen gefunden werden sollen.
#Output
#  Typ: array of integers
#  Beschreibung: Vektor aller Primzahlen bis `bis`.
#Testbeispiel
#  Input: 10
#  Output: 2
#  Output: 3
#  Output: 5
#  Output: 7
# (beim Aufruf von 'sieb(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
sieb = function(bis) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################

#Aufgabe 03_afd_rede

### Redenschreiber Du bist als Redenschreiber für die AFD tätig. Um die Zielgruppe anzusprechen, ist es notwendig, dass im regelmäßigen Abstand `abstand` ein bestimmtes Schlüsselwort `schwort` in der Rede auftaucht. Entwirf eine Funktion, die in einen gegebenen Text `text` die nötigen Ersetzungen macht! Wahrheitsgehalt, guter Geschmack und Grammatik sind für das Resultat unerheblich.
#Beispiel:
# Für den Ausgangstext `text = "Denk ich an Deutschland in der Nacht, bin ich um den Schlaf gebracht"` soll jedes vierte Wort (`abstand = 4`) durch das Schlüsselwort `schwort = "Patriot"` ersetzt werden, so dass das Resultat `"Denk ich an Patrioten in der Nacht, Patrioten ich um den Patrioten gebracht"`.
#Hinweis: Die Funktionen `strsplit()`, `unlist()` und paste() könnten nützlich sein.


#Input(s)
#  Name: text
#  Typ: string
#  Beschreibung: Eingangstext der Rede.
#  Name: abstand
#  Typ: integer
#  Beschreibung: Gibt an, alle wieviel Worte das Schlüsselwort `schwort` in der Rede auftauchen soll.
#  Name: schwort
#  Typ: string
#  Beschreibung: Schlüsselwort, das in die Rede eingefügt werden soll, z.B. "Vaterland", "Lügenpresse", "Schande"
#Output
#  Typ: string
#  Beschreibung: Überarbeitete Rede, mit Inbrunst vorzutragen.
#Testbeispiel
#  Input: Denk ich an Deutschland in der Nacht, bin ich um den Schlaf gebracht
#  Input: 4
#  Input: Patrioten
#  Output: Denk ich an Patrioten in der Nacht, Patrioten ich um den Patrioten gebracht
# (beim Aufruf von 'afd_rede(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Lösung eintragen:
afd_rede = function(text, abstand, schwort) {
	output = 1 #hier die richtige Lösung eintragen
	return(output)
}
#[etwaige Tests und Zwischenlösungen bitte löschen]


################################################################################
#Zum Testen nun die ganze Datei ausführen - es dürfen keine Fehlermeldungen auftreten!
