# Testfunktion (via eval() einzubinden ). 
# Statisch, enthaelt aber ueber "source()" dynamische Bestandteile

teste_alles = function ()
{
  cat("\014") #Konsole leeren
  kontrollergebnis_alle = data.frame() #gesammelte Korrekturergebnisse
  identical2 = function(a, b){isTRUE(all.equal(a,b))} #etwas toleranterer Vergleich zweier Objekte (erlaubt Vergleich von real und integer-Werten als gleich)
  
  # Tests und Musterloesungen  ####
  source("musterloesungen_dyn.R")   # Musterloesungen einbinden
  # Liste der Tests einbinden
  source("tests_dyn.R")   # tests einbinden

  
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
  #Punktvergabe nur für komplett richtige L?sungen:
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
