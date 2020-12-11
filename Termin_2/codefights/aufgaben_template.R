#Aufgaben-Template Termin_2


################################################################################

#Aufgabe 01_schwimmbad

#Die Vermehrung von Coli-Bakterien in einem Schwimmbad lasse sich mit dem Ansatz des exponentiellen Wachstums beschreiben. Dafür haben wir folgende Funktion verwendet:
# exp_Wachstum = function (n0, r, nt)
# {  
#    n = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population anlegen
#   n[1] = n0
#   
#   for (t in 2:nt)
#     n[t] = n[t-1] + r * n[t-1]
#   
#   return(n)
# }
#Ab einer Bakterienpopulation `N_grenzwert` ist das Baden nicht mehr gefahrlos möglich. Gib an, ab welchem Zeitschritt der Badebetrieb bei den gegebenen Parametern `n0, r, nt` und `N_grenzwert` eingestellt werden muss. Wird der Schwellenwert innerhalb von 1000 Tagen nicht überschritten, gib -1 zurück.
#Beispiel:
# Für `n0 = 2`, `r = 0.1` entwickelt sich die Bakterienpopulations wie `[2.0, 2.2, 2.4, 2.6, ... , 82.2, 90.5,  99.5, 109.5, ...]`. Am 43. Tag wird der Grenzwert `n_grenzwert=100` überschritten. Es soll als das Ergebnis `43` erzeugt werden. 

#Input(s)
#  Name: n0
#  Typ: float
#  Beschreibung: Startpopulation der Bakterien
#  Name: r
#  Typ: float
#  Beschreibung: Wachstumsrate
#  Name: n_grenzwert
#  Typ: float
#  Beschreibung: Grenzwert für Sperrung des Badegewässers
#Output
#  Typ: integer
#  Beschreibung: Zeitschritt, in dem der Grenzwert erstmals überschritten wird
#Testbeispiel
#  Input: 2
#  Input: 0.1
#  Input: 100
#  Output: 43
# (beim Aufruf von 'schwimmbad(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Loesung eintragen:
schwimmbad = function(n0, r, n_grenzwert) {
	output = 1 #hier die richtige Loesung eintragen
	return(output)
}
#[etwaige Tests und Zwischenloesungen bitte loeschen]


################################################################################

#Aufgabe 02_schwimmbad2

#Wie in der vorherigen Aufgabe betrachten wir ein Schwimmbad, in dem sich Bakterien mit exponentiellen Wachstum vermehren. Wenn der Bademeister bemerkt, dass der Grenzwert `n_grenzwert` überschritten wird, setzt er Chlor zum Becken hinzu. Dadurch verändert sich die Wachstumsrate auf `r_chlor`. Gib an, wie groß die Bakterienpopulation 3 Tage nach der Chlorzugabe ist (ganzzahlig gerundet). Wurde der Grenzwert nicht überschritten und war eine Chlorzugabe somit nicht nötig, gib die maximal beobachtetet Bakteriendichte zurück (ganzzahlig gerundet).
#Diese Funktion für das exponentielle Wachstum kannst Du verwenden:
# exp_Wachstum = function (n0, r, nt)
# {  
#    n = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population anlegen
#   n[1] = n0
#   
#   for (t in 2:nt)
#     n[t] = n[t-1] + r * n[t-1]
#   
#   return(n)
# }
#
#Beispiel:
# Für `n0 = 2`, `r = 0.1` entwickelt sich die Bakterienpopulations wie `[2.0, 2.2, 2.4, 2.6, ... , 82.2, 90.5,  99.5, 109.5, ...]`. Am 43. Tag wird der Grenzwert `n_grenzwert=100` überschritten. Nun wird Chlor zugegeben, wodurch die Bakterien in den folgenden Tagen reduziert werden:  `[109.5, 98.5, 88.7, 79.8]`.  Es soll als das Ergebnis `80` (gerundete von 79.8) erzeugt werden. 

#Input(s)
#  Name: n0
#  Typ: float
#  Beschreibung: Startpopulation der Bakterien
#  Name: r
#  Typ: float
#  Beschreibung: Wachstumsrate
#  Name: n_grenzwert
#  Typ: float
#  Beschreibung: Grenzwert für Sperrung des Badegewässers (Chlorzugabe)
#  Name: r_chlor
#  Typ: float
#  Beschreibung: Wachstumsrate nach Chlorzugabe
#Output
#  Typ: integer
#  Beschreibung: Bakterienpopulation drei Tage nach Chlorzugabe (gerundet)
#Testbeispiel
#  Input: 2
#  Input: 0.1
#  Input: 100
#  Input: -0.1
#  Output: 80
# (beim Aufruf von 'schwimmbad2(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Loesung eintragen:
schwimmbad2 = function(n0, r, n_grenzwert, r_chlor) {
	output = 1 #hier die richtige Loesung eintragen
	return(output)
}
#[etwaige Tests und Zwischenloesungen bitte loeschen]


################################################################################

#Aufgabe 03_wuerfel

#Simuliere das Werfen eines normalen sechsseitigen Würfels mit `runif()`! Der Würfel soll `n_wuerfe` mal geworfen werden, das Ergebnis in Form eines Vektors zurückgegeben werden. Damit die Augenzahl eine ganze Zahl ist, benutze die Funktion `ceiling()`. Um das Zufallsereignis reproduzierbar zu machen, initialisiere den Zufallsgenerator mit `set.seed(seed)`.
#   
#Beispiel:
# Für `n_wuerfe = 5` und `seed = 3` werden die Zahlen `[2, 5, 3, 2, 4]` gewürfelt.    

#Input(s)
#  Name: n_wuerfe
#  Typ: integer
#  Beschreibung: Anzahl von Würfelwürfen
#  Name: seed
#  Typ: integer
#  Beschreibung: Initialisierungswert des Zufallsgenerators
#Output
#  Typ: array.integer
#  Beschreibung: Vektor mit den Augenzahlen der Würfelwürfe
#Testbeispiel
#  Input: 2
#  Input: 1
#  Output: 2
#  Output: 3
# (beim Aufruf von 'wuerfel(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Loesung eintragen:
wuerfel = function(n_wuerfe, seed) {
	output = 1 #hier die richtige Loesung eintragen
	return(output)
}
#[etwaige Tests und Zwischenloesungen bitte loeschen]


################################################################################

#Aufgabe 04_wuerfel_gezinkt

#Die Würfelsimulation lässt sich auch elegant mit der Zeile `sample(x = 1:6, size = 2, replace = TRUE)` umsetzen, wobei das Argument `size` die Anzahl der Würfe beschreibt. Für einen Besuch im Casino wollen wir unsere Würfel etwas präparieren: Indem wir die Initialisierung des Zufallsgenerators `seed` beeinflussen, bestimmen wir das folgende Würfelergebnis. Nur, welchen Initialisierungswert `seed` braucht man, um dann mit o.g. Zeile das Ergebnis `wurf` zu erzeugen?
#Beispiel:
# Wenn man den Zufallsgenerator mit `seed = 42` initialisiert, werden die Zahlen `[6, 6]` gewürfelt.    

#Input(s)
#  Name: wurf
#  Typ: array.integer
#  Beschreibung: Vektor mit den Augenzahlen der Würfelwürfe, die erzielt werden sollen
#Output
#  Typ: integer
#  Beschreibung: Initialisierungswert des Zufallsgenerators, der das Ergebnis `wurf` erzeugt. `seed`<1000.
#Testbeispiel
#  Input: 1
#  Output: 12
# (beim Aufruf von 'wuerfel_gezinkt(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Loesung eintragen:
wuerfel_gezinkt = function(wurf) {
	output = 1 #hier die richtige Loesung eintragen
	return(output)
}
#[etwaige Tests und Zwischenloesungen bitte loeschen]


################################################################################

#Aufgabe 05_interpolation

#Ein Zoologe hat einem Wal einen Sensor angelegt, der die zurückgelegte Strecke aufzeichnet. Wenn der Wal auftaucht, sendet der Sensor die Zeit und die seit Messbeginn zurückgelegte Strecke. Die Position des Wals für beliebige Zeitpunkte zwischen den Auftauchpasen soll durch lineare Interpolation abgeschätzt werden. Benutze dafür die Funktion `approx()`. 
#Beispiel:
# Zu den Zeitpunkten `[0, 1, 2.5]` wurden die Strecken `[0, 30, 45]` bestimmt. Für die Zeitpunkte `[0.5, 1]` befand sich der Wal vermutlich jeweils bei `[15, 30]`.    

#Input(s)
#  Name: t_mess
#  Typ: array.float
#  Beschreibung: Zeitpunkte, zu denen die Position aufgezeichnet wurde
#  Name: x_mess
#  Typ: array.float
#  Beschreibung: Zurückgelegte Strecke zu den Zeitpunkten `t_mess`
#  Name: t_approx
#  Typ: array.float
#  Beschreibung: Zeitpunkte, für die die Stecke geschätzt werden soll
#Output
#  Typ: array.float
#  Beschreibung: Geschätzte Strecke zu den Zeitpunkten in `t_approx`, gerundet auf eine Nachkommastelle
#Testbeispiel
#  Input: 0:1
#  Input: c(0, 30)
#  Input: list(0.5, 1)
#  Output: 15
#  Output: 30
# (beim Aufruf von 'interpolation(...)' mit diesem Input sollte dieser Output erzeugt werden.)
#Hier die Loesung eintragen:
interpolation = function(t_mess, x_mess, t_approx) {
	output = 1 #hier die richtige Loesung eintragen
	return(output)
}
#[etwaige Tests und Zwischenloesungen bitte loeschen]


################################################################################
#Zum Testen nun die ganze Datei ausfuehren - es duerfen keine Fehlermeldungen auftreten!
