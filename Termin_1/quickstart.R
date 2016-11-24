# Einsteiger Befehlssammlung for R


# Die Raute (#) markiert einen Kommentar. R ignoriert alles, was in der Zeile dann folgt. 
#i Hinweise zur Softwarebedienung
#? Zusatzaufgaben
#! Lösung Zusatzaufgabe


#i R als reine Konsolenanwendung starten --> R ist im Kern eine Konsolenprogramm

# R als Taschenrecher
  5 + 7
#? Welches ist die größte darstellbare Zahl?
#! ~ 1e308  
#i vorherige Befehle können über die Pfeiltasten wiederholt werden  
#i Bequemer mit RStudio: Rstudio starten, History-Fenster benutzen
  
    
# Einfache Zuweisungen
  x = 3
# genau das gleiche: die Variante der R-Puristen
  x <- 3
#i Variable erscheint im Environment-Fenster

# Wert von x ausgeben
  x
  print(x)
#? Wie werden Zeichenketten zugewiesen bzw. ausgegeben?  
#! stadt = "Potsdam"  

# etwas rechnen
  y = x^2 + 3
  y
#? Wie werden Winkelfunktion berechnet?  
#! sin(3.14)
#i Funktionshilfe durch Druck auf F1 oder z.B. ?sin
#i Befehlsvervollständigung und Argumenthilfe durch Tab

  
# Vektoren oder Arrays
  v = 1:5
  v
  
  w = 9:5
  w
  
#? Erzeuge einen Vektor mit den geraden Zahlen bis 10! Tipp: Funktion "seq"  
#! q = seq(from = 2, to = 10, by = 2)
  q

#erstes Element im Vektor verändern
  v[1] = 1.5 
#? Gib die ersten drei Elemente aus v aus!
#! v[1:3]  
  
# Vektoren verketten
  beide = c(v,w) 
  beide
#i Befehle oder ganze Programme in Dateien speichern: Datei -> Neu
#i Befehle aus History kopieren
#i Workspace leeren und Skript-Datei über "Run" ausführen (Strg+Shift+Enter)
#i auch Ausführen von Einzelzeilen oder markierten Passagen (Strg+Enter))
#i Skript kann gespeichert und wieder geladen werden  
#i (Workspace kann auch direkt gespeichert und geladen werden)
  

# Rechnen mit Vektoren
  #alle Elemente in v um 1 erhöhen
  v = v + 1 
  
#v und w elementweise addieren
  u = v + w 
  
  v+stadt
#? Warn- und Fehlermeldungen helfen (meist). Was stimmt nicht?
#! stadt ist keine Zahl, die man addieren kann.
  
  
  sum(u)   #Summe   aller Elemente
  mean(u)  #Mittel  aller Elemente
  max(u)   #Maximum aller Elemente
#? Bestimme den Mittelwert aller Elemente von u und v!
#! mean(c(u, v))  


# Dateiein- und -ausgabe, Beispiel "data_table.txt"

#Textdatei mit Kopfzeile importieren ("data_table.txt")
  imported_data = read.table(file = "data_table.txt", header = TRUE) 
  #? Warn- und Fehlermeldungen helfen (meist). Was stimmt nicht?
  #! Arbeitsverzeichnis muss gewechselt werden
  #i Arbeitsverzeichnis wechseln (z.B. via "Session" = "Set working directory" 
  #i oder Kommando "setwd()" )  
  
  
  #Ergebnis ist ein "dataframe": Tabelle mit verschiedenen Werten (Zahlen, Wörter, ...)
  imported_data
  
#Zugriff auf erste Tabellenspalte  
  imported_data$Rknowledge 
  imported_data[,1] 
#? Gib die komplette zweite Zeile aus!  
#! imported_data[2,]
  
#Einzelwert der ersten Spalte abrufen
  imported_data$Rknowledge[2] 
  imported_data[2,1] 
  
# Spalte löschen
  imported_data$Rknowledge = NULL 
# Spalte hinzufügen  
  imported_data$Rdesire = "high"  
  imported_data
  
#? Stelle knowledge_index gegen happyness_index grafisch dar!
#! plot(imported_data$knowledge_index, imported_data$happyness_index) #plot contents of dataframe
  
# Tabelle mit Trennzeichen ";" exportieren
    write.table(file = "output.csv", x = imported_data, sep = ";") 
#? Öffen die entstandene Tabelle z.B. mit Calc oder Excel. Was fällt auf? Korrigiere dies!   
#! write.table(file = "output.csv", x = imported_data, sep = ";", row.names=FALSE) 
    
    
#Programmstrukturen
  tier = "Katze"
  
#Benutze "==", nicht "=" für Vergleiche
  if (tier == "Katze")          
  {
    print("Miau!")
  } else
  {  
    print("[anderes Geräusch]")
  }
        
#Schleife mit vorgegebener Anzahl an Iterationen
    for (counter in 1:10)
    {
      print(counter)
    }
  
#? Zähle bis 20 und gib bei jeder durch drei teilbaren Zahl "Hurra!" aus! Tipp: rseek.org, "modulus"  
#!  for (counter in 1:20)
#!  {
#!    print(counter)
#!    if (counter %% 3 ==0) print("Hurra!")
#!  }
  
# Schleife mit Abbruchkriterium
  countdown = 10
  while (countdown > 0)        
  {                                
    print(countdown)
    countdown = countdown - 1
  }
  print("ignition!")
  

#selbstdefinierte Funktionen - die Helfer im Alltag
 
 #einfache Funktion ohne Argumente und Rückgabewert
 abwasch = function() #Funktion für den gesamten Abwasch definieren
 {
	print("Gläser spülen")
	print("Teller spülen")
	print("Besteck spülen")
 } 
 
 abwasch() #Funktion aufrufen, d.h. benutzen
 
#Funktion mit Argument
 abwasch2 = function(was_noch) #Funktion für den gesamten Abwasch definieren
 {
	print("Gläser spülen")
	print("Teller spülen")
	print("Besteck spülen")
	print(paste0(was_noch, " spülen"))
 } 

#? Lass zusätzlich noch die Töpfe abspülen! 
#! abwasch2("Töpfe") #Funktion mit Argument benutzen
  
#Funktion mit Argument und Rückgabewert
 abwasch3 = function(was_noch) #Funktion für den gesamten Abwasch definieren
 {
	print("Gläser spülen")
	print("Teller spülen")
	print("Besteck spülen")
	print(paste0(was_noch, " spülen"))
	sauberkeit = runif(n=1, min = 1, max=10) #eine Zufallszahl zwischen 1 und 10
	return(sauberkeit)
 } 

 sauberkeit = abwasch3("Töpfe") #Funktion mit Argument benutzen, Rückgabewert in Variable speichern
 print(sauberkeit) 

#? Wasche ab, bis die Sauberkeit mindestens 8 ist!
#! while (sauberkeit < 8)
#!   sauberkeit = abwasch3("Töpfe") #Funktion mit Argument benutzen, Rückgabewert in Variable speichern


#Diagramme
 # einfaches Punktdiagramm
 plot (v, w) 
 
 #? Warn- und Fehlermeldungen helfen (meist). Was stimmt nicht?  
 plot (v, beide) 
 
 # Funktionsargumente können auch benannt werden
 plot (x=v, y=w) 
 
 #Liniengrafik, vorherige Grafik wird überschrieben
 plot (v, w, type = "l") 
 #i vorherige Grafiken sind mit den Pfeil-Icons abrufbar
 
 # Linie zur bestehenden Grafik hinzufügen
 lines(v,3.5*sqrt(v), col = "red") 
 # Legende
 legend("topright", legend = c("Das ist v","irgendeine Wurzelfunktion"), col = c("black", "red"), lty = 1)
 #? Füge einen Punkt in X-Form bei 5;5 ein! Tipp: Hilfe für lines, Abschnitt "See Also"
 #! points(5,5, pch="X")   
 #i Grafiken können über "Export" exportiert werden 
 
 
 
# Pakete installieren / laden: zusätzliche Funktionen können durch Pakete hinzugefügt werden.
# Diese müssen ggf. installiert werden.
 #Befehl anwenden: zoomen - Geht noch nicht
 zm() 

#i Reiter "packages", "Install" oder
 install.packages("zoom")
 
 #Paket laden
 library(zoom)
 
 #Befehl anwenden: zoomen
 zm() 

 
 
  