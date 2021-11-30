# Testfunktion (via eval() einzubinden ). 
# Statisch, enthaelt aber ueber "source()" dynamische Bestandteile

teste_alles = function ()
{
  cat("\014") #Konsole leeren
  kontrollergebnis_alle = data.frame() #gesammelte Korrekturergebnisse
  identical2 = function(a, b){isTRUE(all.equal(a,b))} #etwas toleranterer Vergleich zweier Objekte (erlaubt Vergleich von real und integer-Werten als gleich)
  
  # Tests und Musterloesungen  ####
  lektion = "Termin_7/codefights" #lektion/Nr der Lektion
################################################################################
################################################################################

#Uebung namenseintrag; Musterloesung:
namenseintrag_muster_lsg  = function(vorname, nachname) {
  return (paste(nachname, vorname, sep=", "))
}
################################################################################

#Uebung umkehren; Musterloesung:
name_muster_lsg  = function(vorname, nachname) {
  return (paste(nachname, vorname, sep=", "))
}
################################################################################

#Uebung namenseintrag; Musterloesung:
namenseintrag_muster_lsg  = function(vorname, nachname) {
  return (paste(nachname, vorname, sep=", "))
}
################################################################################

#Uebung ; Musterloesung:
schach_muster_lsg  = function(feld) {
  figuren = rep(c("K","D","T","S","L","B"," "), times=c(2,2,4,4,4,16,32))
  set.seed(1)
  brett = array(sample(figuren), c(8,8))

  dimnames(brett)=list(8:1,letters[1:8])
  return(brett[substr(feld,2,2), substr(feld,1,1)])
}
################################################################################

#Uebung ; Musterloesung:
afd_rede_muster_lsg  = function(text, abstand, schwort) {
  woerter = unlist(strsplit(text, " "))
  woerter[1:length(woerter) %% abstand ==0] =  schwort
  return(paste(woerter, collapse=" "))
}
################################################################################

#Uebung ; Musterloesung:
sieb_muster_lsg  = function(bis) {  
  zahlen = 2:bis
  primzahlen = NULL
  while (length(zahlen)>0)
  {  
    primzahlen = c(primzahlen, zahlen[1])
    zahlen = zahlen[zahlen %% zahlen[1]!=0]                   
  }  
  return(primzahlen)
}


################################################################################   # Musterloesungen einbinden
  # Liste der Tests einbinden
  # dynamisch erzeugt mit Uebungen_Korrekturen_erzeugen.R
#Tests zu Lektion Termin_7/codefights
testliste =list()

#Uebung namenseintrag
testliste[["namenseintrag"]]=list(tests=list(
test1 = list(),
test2 = list(),
test3 = list(),
test4 = list()
), muster_lsg=namenseintrag_muster_lsg)

#Uebung umkehren
testliste[["umkehren"]]=list(tests=list(
test1 = list(),
test2 = list(),
test3 = list(),
test4 = list()
), muster_lsg=umkehren_muster_lsg)

#Uebung namenseintrag
testliste[["namenseintrag"]]=list(tests=list(
test1 = list(),
test2 = list(),
test3 = list(),
test4 = list()
), muster_lsg=namenseintrag_muster_lsg)

#Uebung 
testliste[[""]]=list(tests=list(
test1 = list(feld = "b7"),
test2 = list(feld = "d8"),
test3 = list(feld = "a2")
), muster_lsg=_muster_lsg)

#Uebung 
testliste[[""]]=list(tests=list(
test1 = list(text = "Denk ich an Deutschland in der Nacht, bin ich um den Schlaf gebracht", abstand = 4L, schwort = "Patrioten"),
test2 = list(text = "Für jedes komplexe Problem gibt es eine Lösung, die einfach, einleuchtend und falsch ist", abstand = 1L, schwort = "Außengrenze"),
test3 = list(text = "Drei Chinesen mit nem Kontrabass saßen auf der Straße", abstand = 2L, schwort = "Sauerkraut")
), muster_lsg=_muster_lsg)

#Uebung 
testliste[[""]]=list(tests=list(
test1 = list(bis = 10L),
test2 = list(bis = 30L),
test3 = list(bis = 50L)
), muster_lsg=_muster_lsg)


################################################################################   # tests einbinden

  
  for (aufgaben_zaehler in 1:length(testliste)) #durch alle Aufgaben
  {  
    # aufgaben_zaehler = 1
    # aufgabe = "Echo"
    aufgabe = names(testliste)[aufgaben_zaehler] #Name der aktuellen Aufgabe
    cat(paste0("\n\nPruefe Aufgabe \"", aufgabe,"\"...\n"))
    kontrollergebnis_t =  data.frame(aufgabe = aufgabe, tests=length(testliste[[aufgabe]]$tests), nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe
    for (test_no in 1:length(testliste[[aufgabe]]$tests)) #durch alle tests der aktuellen Aufgabe
    {
      #Ueberpruefung
      fun = aufgabe
      einreichung = try(do.call(fun, args = testliste[[aufgabe]]$tests[[test_no]]), silent = TRUE) #Ergebnis der Einreichung
      fun = testliste[[aufgabe]]$muster_lsg
      muster_lsg  = try(do.call(fun, args = testliste[[aufgabe]]$tests[[test_no]]), silent = TRUE) #Ergebnis der Musterloesung
      if (identical2(einreichung, muster_lsg)) 
      {  
        kontrollergebnis_t$richtig = kontrollergebnis_t$richtig + 1 #zaehle richtige Ergebnisse
      } else
      {
        cat(paste0("\n Test ", test_no,": "))
        if (class(einreichung) == "try-error")
        {  
          cat(paste0("Abbruch mit Fehlermeldung.\n"))
          kontrollergebnis_t$nicht_aufrufbar = kontrollergebnis_t$nicht_aufrufbar + 1 #zaehle fehlerhafte Aufrufe
        } else
        { #Aufruf ohne Fehlermeldung erfolgt  
          tt = testliste[[aufgabe]]$tests[[test_no]]
          input = paste0(paste0(names(tt), "=", tt), collapse=", ")
          cat(paste0(" mit Input <", input, ">:\n erwartet: ", 
                   paste0(muster_lsg, collapse=", "),
                   "\n erhalten: ", 
                   paste0(einreichung, collapse=", ")))        
        }
      }
    } #durch alle Tests
    if (kontrollergebnis_t$richtig == kontrollergebnis_t$tests)
      cat(paste0("ok\n")) #alle richtig
    kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern
  }
  
  #Report ####
  print(paste0(rep("#", 80), collapse = "")) #Trennlinie
  kontrollergebnis_alle$anteil_richtig = kontrollergebnis_alle$richtig / kontrollergebnis_alle$tests
  #Punktvergabe anteilig zu bestandenen Tests:
  kontrollergebnis_alle$punkte = 100 / nrow(kontrollergebnis_alle) * kontrollergebnis_alle$anteil_richtig
  #Punktvergabe nur fÃ¼r komplett richtige L?sungen:
  #kontrollergebnis_alle$punkte = as.numeric(kontrollergebnis_alle$anteil_richtig == 1)
  print(paste0("Testergebnisse fuer Lektion ", lektion))
  gesamtpunkte = round(sum(kontrollergebnis_alle$punkte))
  print(paste0("Gesamtpunktzahl fuer diesen Termin: ", gesamtpunkte))
  #print(paste0("Bitte in Moodle eintragen, (Feld <Bewertung fuer Kriterium 1>)."))
  print(kontrollergebnis_alle)
  #print(paste0("Bitte in Moodle eintragen, Textfeld <Kommentar fuer Kriterium 1>."))

  if (!exists("name")) name="[Name fehlt! Oben eintragen!]"
  abgabedatum = Sys.Date()
  report_str = paste(lektion, name, abgabedatum, gesamtpunkte, sep=";") #Zeichenkette mit allen Ergebnissen dieses lektionstests
  if (!require("openssl"))
  {  
    install.packages("openssl")
    library(openssl)
  }  
  hash = md5(report_str)
  print("Bitte folgenden Ergebniscode kopieren und einreichen:")
  print(paste0("## ",report_str,"; Checksum:", hash, " ##"))
  
  
}
