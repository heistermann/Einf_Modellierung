#Sucht alle yaml-Files in Unterverzeichnissen */codefights (Tiefe 1),
#erzeugt Aufgabenstellungen (R-Template mit Aufgabenstellung und Beispiel) sowie Kontroll-Template (fuer Kontrolleur)
#speichert Dateien in Unterordern "Codefights"
#ACHTUNG! ueberschreibt eventuell vorhandenen Dateien

#Arbeitsverzeichnis in Verzeichnis dieser Datei setzen
if (!require("rstudioapi", quietly = TRUE)) install.packages("rstudioapi")
require(rstudioapi)
wd = rstudioapi::getActiveDocumentContext()$path
wd = sub(x=wd, pattern="(.*/)[^/]+$","\\1")
setwd(wd)

loesung_simulieren = FALSE #TRUE: Musterloesung als eingereichte Loesung einbinden, um Template zu testen.
                          #vor Herausgabe unbedingt auf FALSE setzen


if (!require("yaml", quietly = TRUE)) install.packages("yaml")
require(yaml)

subdirs=list.dirs()
subdirs = subdirs[grepl(subdirs, pattern = "/codefights$")] #[5] #[-(1:5)]
sd = subdirs #[1] #[-(1:5)]

for (sd in subdirs)
{
  yaml_files = dir(path = sd, pattern = "\\.yaml$")
  if (length(yaml_files) == 0) next #no files found
  
  tfil = paste0(sd,"/aufgaben_template.R") #Dateiname Aufgaben-Template
  if (loesung_simulieren)
    kfil = paste0(sd,"/kontroll_tmpl_lsg.R") else #Dateiname Kontroll-Template mit Lösung
    kfil = paste0(sd,"/kontroll_template.R")      #Dateiname Kontroll-Template
  
  
  titel = gsub(sd, pattern="(\\./)|(/codefights)", repl="") #Titel des Termins
  if (titel == "Termin_6") next #hier gibts keine Codefights, sondern ein Quiz
  
  #Templates anlegen
  write(paste0("#Aufgaben-Template ", titel), tfil)
  write(paste0("#Korrektur-Template ", titel), kfil)
  write("rm(list=ls()) #Speicher leeren", kfil, append=TRUE)
  write(paste0(rep("#", 80), collapse = ""), kfil, append=TRUE) #Trennlinie
  write(paste0(rep("#", 80), collapse = ""), kfil, append=TRUE) #Trennlinie
  write(paste0("\n# Bitte zuerst die zu beurteilende Loesung hierher kopieren.\n# Dann gesamtes Skript mit Strg+Shift+S ausfuehren und Ausgabe am Ende beachten.\n"), kfil, append=TRUE)
  write("# !!! Bitte keine Aenderungen unterhalb dieses Blocks !!!", kfil, append=TRUE)
  
  write(paste0(rep("#", 80), collapse = ""), kfil, append=TRUE) #Trennlinie
  write(paste0(rep("#", 80), collapse = ""), kfil, append=TRUE) #Trennlinie
  
  write("\ncat(\"\\014\") #Konsole leeren", kfil, append=TRUE)
  write(paste0("kontrollergebnis_alle = data.frame() #gesammelte Korrekturergebnisse"), kfil, append = TRUE)
  write("identical2 = function(a, b){isTRUE(all.equal(a,b))} #etwas toleranterer Vergleich zweier Objekte (erlaubt Vergleich von real und integer-Werten als gleich)", kfil, append = TRUE)

  yaml_file=yaml_files[2]
  #yaml_file=yaml_files[3]
  for (yaml_file in yaml_files)
  {
    #Aufgabe lesen ####
    # cont=scan(file = paste0(sd, "/", yaml_file), what = character(), sep = "\n")
    # cont = gsub(x=cont, pattern = "^\\t", repl="   ")
    # cont = read_yaml(text=cont)
    cont = read_yaml(file = paste0(sd, "/", yaml_file))
    if (!"solution" %in% names(cont))
      stop(paste0("Syntax error in ", sd, "/", yaml_file, "(encoding, missing indent, tabs, ...)"))
    
    #next
    cont$description = sub(cont$description, pattern = "Achtung:[^`]*````[^`]*````", repl="") #remove codefights-specific workaround using "unlist"
    cont$description = gsub(cont$description, pattern = "\n+([^#])", repl="\n#\\1") #add #, where missing
    
    #Schreibe Aufgaben-Template ####
    write("\n", tfil, append=TRUE) #Umbruch
    write(paste0(rep("#", 80), collapse = ""), tfil, append=TRUE) #Trennlinie
    #Titel der Aufgabe
    str = gsub(yaml_file, pattern="\\.yaml", repl="") 
    write(paste0("\n#Aufgabe ", str), tfil, append = TRUE)
    
    #Aufgabenbeschreibung
    str = gsub(cont$description, pattern="#### Input / Output", repl="")
    str = gsub(str, pattern="#+ Beispiel", repl="#Beispiel:\n#") 
    write(paste0("\n#", str), tfil, append = TRUE)
    
    #Input(s)
    write("#Input(s)", tfil, append = TRUE)
    inputs = grep(x = names(cont), pattern="input", value=TRUE)
    argms = data.frame()
    for (input in inputs)
    {
      feld = cont[[input]]
      if (feld$name == FALSE) feld$name = "n" #komische Auto-Ersetzung von loadyaml
      write(paste0("#  Name: ", feld$name), tfil, append = TRUE)
      write(paste0("#  Typ: ", feld$type), tfil, append = TRUE)
      write(paste0("#  Beschreibung: ", feld$description), tfil, append = TRUE)
      argms = rbind(argms, data.frame(name=feld$name, type=feld$type)) #collect names and types of arguments for later use
    }
    
    #Output
    write("#Output", tfil, append = TRUE)
    feld = cont$output
    write(paste0("#  Typ: ", feld$type), tfil, append = TRUE)
    write(paste0("#  Beschreibung: ", feld$description), tfil, append = TRUE)
    
    feld = cont$test1
    str = sub(x=cont$solution, pattern = "^([^\\{]*\\{).*", replacement = "\\1")
    str = sub(x=str, pattern = "<-", replacement = "=")  #"<-" durch "=" ersetzen
    
    str2 =sub(str, pattern=" .*", repl="")
    
    write("#Testbeispiel", tfil, append = TRUE)
    write(paste0("#  Input: ", feld$input), tfil, append = TRUE)
    write(paste0("#  Output: ", feld$output), tfil, append = TRUE)
    write(paste0("# (beim Aufruf von '", str2, "(...)' mit diesem Input sollte dieser Output erzeugt werden.)"), tfil, append = TRUE)
    
    write("#Hier die Loesung eintragen:", tfil, append = TRUE)
    write(str, tfil, append = TRUE)
    write(x = "\toutput = 1 #hier die richtige Loesung eintragen\n\treturn(output)\n}",tfil, append = TRUE)
    write("#[etwaige Tests und Zwischenloesungen bitte loeschen]", tfil, append = TRUE)
    
    
    #Kontroll-Template ####
    #write("\n", kfil, append=TRUE) #Umbruch
    write(paste0(rep("#", 80), collapse = ""), kfil, append=TRUE) #Trennlinie
    
    #Titel der Aufgabe
    str = gsub(yaml_file, pattern="\\.yaml", repl="") 
    #write(paste0("aufgaben_titel = \"", str,"\""), kfil, append = TRUE)
    write(paste0("\n#Aufgabe ", str, "; Musterloesung:"), kfil, append = TRUE)

    # Code der Musterloesung
    str = sub(x=cont$solution, pattern = "<-", replacement = "=")  #"<-" durch "=" ersetzen
    #Codefights workarounds mit unlist() entfernen
    str = gsub(x=str, pattern = "\\n\\s*(.*)\\s*=\\s*unlist\\(\\1\\)", replacement = "\n")  
    str = gsub(x=str, pattern = "#Codefights-Bug, nicht noetig in richtigem R\n", replacement = "")  
    str = sub(x=str, pattern = "\n\\s*\\n", replacement = "\n")  
    if (loesung_simulieren)
      write(str, kfil, append = TRUE) #Loesung mit Musterloesung simulieren, um template testen zu koennen
    
    str = sub(str, pattern = "^[ \t]*([^ ]+)(.*)", replacement = "\\1_muster_lsg \\2")
    str2 =sub(str, pattern="_muster_lsg.*", repl="") #Funktionsname
    
    write(str, kfil, append = TRUE)
    
    write("#Ueberpruefung: ", kfil, append = TRUE)
    tests =grep(x = names(cont), pattern="test", value=TRUE) #extrahiere Namen der Tests
    
    write(paste0(" kontrollergebnis_t =  data.frame(aufgabe = \"", str2, "\", tests=", length(tests),", nicht_aufrufbar=0, richtig=0) #Korrekturergebnis der aktuellen Aufgabe"), kfil, append = TRUE)
    

  #  do.call(what=schach_muster_lsg, args = )
    
    
    #write(paste0("tests = c(\"", paste0(tests, collapse = "\", \""),"\")"), kfil, append = TRUE)
    
    for (einzeltest in tests)
    {
      write(paste0(" #", einzeltest), kfil, append = TRUE)
      
      feld = cont[[einzeltest]]
      arg_str=""
      for (i in 1:nrow(argms))
      {  
        value = feld$input[[i]]
        value = deparse(value)
        #if (is.vector(value)) value = paste0(c("(", value, collapse=",", ")"))
        arg_str = paste0(arg_str, argms$name[i], " = ",value, ", ")
      }
      arg_str = sub(arg_str, pattern = ", $", repl="")
      write(paste0(" einreichung = try(", str2, "(", arg_str, ")) #Ergebnis der Einreichung"), kfil, append = TRUE)
      write(paste0(" muster_lsg  = try(", str2, "_muster_lsg(", arg_str, ")) #Ergebnis der Musterloesung"), kfil, append = TRUE)

      #write(paste0("loesung = ", str, "_lsg (" = aufgabe[\"richtig\"] + 1"), kfil, append = TRUE)
      write(paste0("if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse"), kfil, append = TRUE)
      write(paste0("if (class(einreichung) == \"try-error\") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe\n"), kfil, append = TRUE)
      
    }
    write("kontrollergebnis_alle = rbind(kontrollergebnis_alle, kontrollergebnis_t) #Ergebnis dieser Aufgabe speichern", kfil, append = TRUE)
    
    # write("#Output", kfil, append = TRUE)
    # feld = cont$output
    # write(paste0("#  Typ: ", feld$type), kfil, append = TRUE)
    # write(paste0("#  Beschreibung: ", feld$description), kfil, append = TRUE)
    # 
    # feld = cont$test1
    # write("#Testbeispiel", kfil, append = TRUE)
    # write(paste0("#  Input: ", feld$input), kfil, append = TRUE)
    # write(paste0("#  Output: ", feld$output), kfil, append = TRUE)
    # write(paste0("# (beim Aufruf von '", str2, "(...)' mit diesem Input sollte dieser Output erzeugt werden.)"), kfil, append = TRUE)
    # 
    # write("#Hier die Loesung eintragen:", kfil, append = TRUE)
    # write(str, kfil, append = TRUE)
    # write(x = "...\nreturn(...)\n}",kfil, append = TRUE)
    # write("#[etwaige Tests und Zwischenloesungen bitte loeschen]", kfil, append = TRUE)
    
    
  }  
  #Aufgaben-Template abschliessen ####
  write("\n", tfil, append=TRUE) #Umbruch
  write(paste0(rep("#", 80), collapse = ""), tfil, append=TRUE) #Trennlinie
  write("#Zum Testen nun die ganze Datei ausfuehren - es duerfen keine Fehlermeldungen auftreten!", tfil, append=TRUE) #
  
  #Kontroll-Template abschliessen ####
  write("\n", kfil, append=TRUE) #Umbruch
  write(paste0(rep("#", 80), collapse = ""), kfil, append=TRUE) #Trennlinie
  
  
  write(paste0(
  "print(paste0(rep(\"#\", 80), collapse = \"\")) #Trennlinie\n",
  "kontrollergebnis_alle$anteil_richtig = kontrollergebnis_alle$richtig / kontrollergebnis_alle$tests\n",
  "kontrollergebnis_alle$punkte = 100 / nrow(kontrollergebnis_alle) * kontrollergebnis_alle$anteil_richtig\n",
  "print(\"Testergebnisse:\")\n",
  "print(paste0(\"Gesamtpunktzahl fuer diesen Termin: \", round(sum(kontrollergebnis_alle$punkte))))\n",
  "print(paste0(\"Bitte in Moodle eintragen, (Feld <Bewertung fuer Kriterium 1>).\"))\n",
  "print(kontrollergebnis_alle)\n",
  "print(paste0(\"Bitte in Moodle eintragen, Textfeld <Kommentar fuer Kriterium 1>.\"))\n"
  
  ), kfil, append=TRUE) 
  
  
 #stop("alles ok")
 
}
