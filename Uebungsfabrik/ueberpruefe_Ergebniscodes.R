# Überprüfung der Aufgaben anhand der Checksummen, speichert die Punktezahlen in Sammeldatei
#
# Anleitung:
# - nach dem Stichtag in Moodle auf "Abgabe für Lektion n" klicken
# - unten Button "Alle Abgaben zeigen" klicken
# - oben Dropdown "Bewertungstabelle herunterladen" klicken
# - Name der heruntergeladenen Datei in "datei_bewertungstabelle" einstellen
# - Name der Datei in für gesammelte Bewertungen in "datei_bewertungstabelle_gesamt" einstellen

# Achtung: Überprüfung geht (noch) nicht für Python-Einreichungen
#
# Till Francke, Nov, 2021

datei_bewertungstabelle = "Bewertungen-UmweltDV-2021-Abgabe für Lektion 2 (Arbeitsumgebung)-1419470.csv" #Textdatei mit zurückgemeldeten Checksummen / Ergebniscodes
datei_bewertungstabelle_gesamt = "gesamtpunkte.txt" #Textdatei mit gesammelten Punkten

bewertungstabelle = read.table(datei_bewertungstabelle, sep=",", header = TRUE)
bewertungstabelle_header = read.table(datei_bewertungstabelle, sep=",", header = FALSE, nrows = 1)

bewertungstabelle$checksummen = "" #für die Extraktion der Checksummen
bewertungstabelle$resultat_ueberprüfung = "" #für etwaige manuell zu prüfende Einträge
bewertungstabelle$sprache = "" #R/Python unterscheidung

#R-Checksummen behandeln ####
  #finde Zeilen mit R-Checksummen
  if (!require("openssl"))
  {  
    install.packages("openssl")
    library(openssl)
  }  

  R_nutzer_index = grepl(x = bewertungstabelle$Texteingabe.online, pattern="##.*Checksum:.*##")
  bewertungstabelle$sprache[ R_nutzer_index] = "R"
  bewertungstabelle$sprache[!R_nutzer_index] = "Python"
  bewertungstabelle$checksummen[R_nutzer_index] = sub(x = bewertungstabelle$Texteingabe.online[R_nutzer_index], pattern=".*##(.*)##.*", repl="\\1")

  report_str         = sub(x=bewertungstabelle$checksummen[R_nutzer_index], pattern = "^ (.*); Checksum:.*", repl="\\1")
  checksum_eingereicht = sub(x=bewertungstabelle$checksummen[R_nutzer_index], pattern = ".*Checksum:([^ ]*) *", repl="\\1")
  name_eingereicht    = sub(report_str, pattern="[^;]*;([^;]*);[^;]*;[^;]*", repl="\\1")
  lektion_eingereicht = sub(report_str, pattern="([^;]*);[^;]*;[^;]*;[^;]*", repl="\\1")
  punkte              = sub(report_str, pattern="[^;]*;[^;]*;[^;]*;([^;])*", repl="\\1")
  
  #überprüfe Checksumme
  checksum_erwartet  = md5(report_str) #erwartete Checksummen berechnen
  check_checksum = checksum_eingereicht != checksum_erwartet
  warn_zeilen = which(R_nutzer_index)[check_checksum]
  bewertungstabelle$resultat_ueberprüfung[warn_zeilen] = paste0(bewertungstabelle$resultat_ueberprüfung[warn_zeilen],"; Checksumme falsch")

  #überprüfe Namen der Aufgabe
  lektionsname = names(sort(table(lektion_eingereicht))[1]) #häufigster Name in den Enreichungen ist vermutlich der richtige
  check_aufgabenname = lektion_eingereicht != lektionsname
  warn_zeilen = which(R_nutzer_index)[check_aufgabenname]
  bewertungstabelle$resultat_ueberprüfung[warn_zeilen] = paste0(bewertungstabelle$resultat_ueberprüfung[warn_zeilen],"; Falscher lektionsname")

  #überprüfe Namen der Teilnehmer
  name_eingereicht = gsub(x=name_eingereicht, pattern = " ", repl=".*") #erlaubt toleranteteren Vergleich mit registrierten Namen
  name_eingereicht = gsub(x=name_eingereicht, pattern = "\\[", repl="\\\\[") 
  name_eingereicht = gsub(x=name_eingereicht, pattern = "\\]", repl="\\\\]") 
  check_namen = !mapply(FUN=grepl, x=bewertungstabelle$VollstÃ.ndiger.Name [R_nutzer_index], pattern = name_eingereicht)
  warn_zeilen = which(R_nutzer_index)[check_namen]
  bewertungstabelle$resultat_ueberprüfung[warn_zeilen] = paste0(bewertungstabelle$resultat_ueberprüfung[warn_zeilen],"; Namensprüfung gescheitert")
  
    
  bewertungstabelle$Bewertung[R_nutzer_index] = punkte


  bewertungstabelle$checksummen = NULL
  
  manuell_zu_pruefen = which(bewertungstabelle$resultat_ueberprüfung!="")
  if (any(manuell_zu_pruefen))
  {
    #Meldungen zusammenfassen
    meldungen = unique(strsplit(x=paste0(bewertungstabelle$resultat_ueberprüfung[manuell_zu_pruefen], collapse=";"), split=";")[[1]])
    meldungen = meldungen[meldungen != ""]
        print(paste0("Bitte Zeile(n) ", paste0(manuell_zu_pruefen, collapse = ", "), " prüfen (",
              paste0(meldungen, collapse = " ,"), ")."))
             
  }
  
  # maskiere_anfuehrungszeichen = function(x)
  #   #ersetze " durch "" (erforderliche formatierung für Moodle)
  # {
  #   for (col in 1:ncol(x))
  #     x[, col] = sub(x=x[, col], pattern = "\"", repl="\"\"")
  #   return(x)
  # }
  
  #Ergebnisdate speichern (ursprüngliche Tabellenform) ####
  write.table(file=sub(x = datei_bewertungstabelle, pattern = "\\.", repl="_ergaenzt."), 
              x=bewertungstabelle, row.names=FALSE, sep=",", quote=TRUE, qmethod = "double")
  
  
  #Ergebnisdate speichern (reduzierte Tabellenform) ####
  felder = grepl(x=names(bewertungstabelle), pattern="Vollst|sprache|Bewertung$")
  reduzierte_tabelle = cbind(lektion=lektionsname, bewertungstabelle[, felder]) #nur relevante Felder auswählen
  names(reduzierte_tabelle)[grepl(x=names(reduzierte_tabelle), pattern="Vollst")] = "name"
  if (file.exists(datei_bewertungstabelle_gesamt))
    bewertungstabelle_gesamt = read.table(datei_bewertungstabelle_gesamt, sep="\t", header = TRUE, quote="") else
    bewertungstabelle_gesamt = reduzierte_tabelle #noch keine Daten da? Nimm die aktuellen, damit der folgende Code durchläuft

  # #entferne bereits exitierende Einträge aus der Tabelle  
  # require(dplyr) 
  # bewertungstabelle_gesamt = anti_join(bewertungstabelle_gesamt, reduzierte_tabelle, by=c("name", "lektion"))
   
  bewertungstabelle_gesamt = rbind(bewertungstabelle_gesamt, reduzierte_tabelle)
  
  # entferne bereits exitierende Einträge aus der Tabelle  
  dups = duplicated(bewertungstabelle_gesamt[, names(bewertungstabelle_gesamt)!="Bewertung"], fromLast=TRUE)
  bewertungstabelle_gesamt =bewertungstabelle_gesamt[!dups,]
    
  write.table(file=datei_bewertungstabelle_gesamt, 
              x=bewertungstabelle_gesamt, row.names=FALSE, sep="\t", quote=FALSE)
  
  