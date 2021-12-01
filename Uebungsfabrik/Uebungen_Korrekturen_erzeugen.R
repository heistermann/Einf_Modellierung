#Sucht alle yaml-Files in Unterverzeichnissen, und erzeugt Uebungen, Musterloesungen und Kontrolltemplate
#ACHTUNG! ueberschreibt eventuell vorhandenen Dateien

# Anleitung: siehe README.md

#Arbeitsverzeichnis in Verzeichnis dieser Datei setzen
if (!require("rstudioapi", quietly = TRUE)) install.packages("rstudioapi")
require(rstudioapi)
wd = rstudioapi::getActiveDocumentContext()$path
wd = sub(x=wd, pattern="(.*/)[^/]+$","\\1")
setwd(paste0(wd,"../"))

loesung_simulieren = TRUE #TRUE: Musterloesung als eingereichte Loesung einbinden, um Kontroll-Template zu testen.
                          #vor Herausgabe unbedingt auf FALSE setzen


if (!require("yaml", quietly = TRUE)) install.packages("yaml")
require(yaml)

subdirs=list.dirs()
subdirs = subdirs[grepl(subdirs, pattern = "/Termin_")] #[1] #[-(1:5)]
#sd = subdirs [2] #[-(1:5)]

for (sd in subdirs)
{
  if (sd == "./Termin_6/codefights") next #Termin 6 enth�lt ein Moodle-Quiz
  yaml_files = dir(path = sd, pattern = "\\.yaml$")
  if (length(yaml_files) == 0) next #no files found
  
  afil = paste0(sd,"/Uebungen_template.R") #Dateiname Uebungen-Template
  mfil = paste0(sd,"/musterloesungen_dyn.R") #Dateiname Muster-Loesungen
  tfil = paste0(sd,"/tests_dyn.R") #Dateiname Tests
  
        
  lektion = gsub(sd, pattern="(\\./)|(/R/uebung)", repl="") #lektion des Termins
  #if (lektion == "Termin_6") next #hier gibts keine Codefights, sondern ein Quiz
  
  #Templates anlegen
  # Uebungen-Template
  #write(paste0("# dynamisch erzeugt mit Uebungen_Korrekturen_erzeugen.R"), afil, append=FALSE)
  write(paste0("#Uebungen-Template <", lektion, ">"), afil, append=FALSE)
  #write(paste0("#Bitte erst unter dem Namen \"Uebungen.R\" speichern, dann bearbeiten."),afil, append=TRUE)
  
  #Musterloesungen-Include-Datei
  write(paste0("# dynamisch erzeugt mit Uebungen_Korrekturen_erzeugen.R"), mfil, append=FALSE)
  write(paste0("#Musterloesungen zu Lektion ", lektion), mfil, append=TRUE)
  write(paste0("lektion = \"", lektion, "\" #lektion/Nr der Lektion"), mfil, append=TRUE)
  #write("rm(list=ls()) #Speicher leeren", mfil, append=TRUE)
  write(paste0(rep("#", 80), collapse = ""), mfil, append=TRUE) #Trennlinie
  
  #Tests-Include-Datei
  write(paste0("# dynamisch erzeugt mit Uebungen_Korrekturen_erzeugen.R"), tfil, append=FALSE)
  write(paste0("#Tests zu Lektion ", lektion), tfil, append=TRUE)
  write(paste0("testliste =list()"), tfil, append=TRUE)
  
  #yaml_file=yaml_files[9]
  #yaml_file=yaml_files[3]
  for (yaml_file in yaml_files)
  {
    #Uebung lesen ####
    # cont=scan(file = paste0(sd, "/", yaml_file), what = character(), sep = "\n")
    # cont = gsub(x=cont, pattern = "^\\t", repl="   ")
    # cont = read_yaml(text=cont)
    cont = read_yaml(file = paste0(sd, "/", yaml_file))
    if (!"solution" %in% names(cont))
      stop(paste0("Syntax error in ", sd, "/", yaml_file, "(encoding, missing indent, tabs, ...)"))
    
    #next
    cont$description = sub(cont$description, pattern = "Achtung:[^`]*````[^`]*````", repl="") #remove codefights-specific workaround using "unlist"
    cont$description = gsub(cont$description, pattern = "\n+([^#])", repl="\n#\\1") #add #, where missing
    
    #schreibe Uebungen-Template ####
      write("\n", afil, append=TRUE) #Umbruch
      write(paste0(rep("#", 80), collapse = ""), afil, append=TRUE) #Trennlinie
      #lektion der Uebung
      write(paste0("\n#Uebung ", cont$task_name), afil, append = TRUE)
      
      #Uebungenbeschreibung
      str = gsub(cont$description, pattern="#### Input / Output", repl="")
      str = gsub(str, pattern="#+ Beispiel", repl="#Beispiel:\n#") 
      write(paste0("\n#", str), afil, append = TRUE)
      
      #Input(s)
      write("#Input(s)", afil, append = TRUE)
      inputs = grep(x = names(cont), pattern="input", value=TRUE)
      argms = data.frame()
      for (input in inputs)
      {
        feld = cont[[input]]
        if (feld$name == FALSE) feld$name = "n" #komische Auto-Ersetzung von loadyaml
        write(paste0("#  Name: ", feld$name), afil, append = TRUE)
        write(paste0("#  Typ: ", feld$type), afil, append = TRUE)
        write(paste0("#  Beschreibung: ", feld$description), afil, append = TRUE)
        argms = rbind(argms, data.frame(name=feld$name, type=feld$type)) #collect names and types of arguments for later use
      }
      
      #Output
      write("#Output", afil, append = TRUE)
      feld = cont$output
      write(paste0("#  Typ: ", feld$type), afil, append = TRUE)
      write(paste0("#  Beschreibung: ", feld$description), afil, append = TRUE)
      
      feld = cont$test1
      klammerstelle = regexpr(text=cont$solution, pattern = "\\{") #finde die erste {}
      kopf  = substr(cont$solution, start = 1, stop = klammerstelle)
      kopf = sub(x=kopf, pattern = "<-", replacement = "=")  #"<-" durch "=" ersetzen
      kopf = sub(x=kopf, pattern = "^(.)", replacement = "\\L\\1", perl=TRUE)  #Anafangsbuchstaben in Lowercase

      rumpf = substr(cont$solution, start = klammerstelle+1, stop = nchar(cont$solution))
      rumpf = strsplit(rumpf, split = "\n")[[1]] #zerlege in einzelen Zeilen
      zeilen_mit_doppelraute = grepl(x = rumpf, pattern = "##") #finde Zeilen, die erhalten bleiben sollen
      rumpf = rumpf[zeilen_mit_doppelraute] #entferen alle Zeilen, die nicht durch Doppelraute geschaetzt sind
      
      str2 =sub(kopf, pattern=" .*", repl="")
      
      write("#Testbeispiel", afil, append = TRUE)
      write(paste0("#  Input: ", feld$input), afil, append = TRUE)
      write(paste0("#  Output: ", feld$output), afil, append = TRUE)
      write(paste0("# (beim Aufruf von '", str2, "(...)' mit diesen Argumenten sollte der obige Output zurueckgeliefert werden.)"), afil, append = TRUE)
      
      write("#Hier die Funktion, die angepasst werden muss (Namen nicht veraendern!):", afil, append = TRUE)
      write(c(kopf, rumpf), afil, append = TRUE)
      write(x = "\t#... #hier die richtige Loesung ergaenzen\n\treturn(1)\n}",afil, append = TRUE)
      write("#[etwaige Tests und Zwischenloesungen bitte loeschen]", afil, append = TRUE)
      
    
    #schreibe Musterloesungen ####
    #write("\n", mfil, append=TRUE) #Umbruch
    write(paste0(rep("#", 80), collapse = ""), mfil, append=TRUE) #Trennlinie
    
    #lektion der Uebung
    #write(paste0("Uebungen_lektion = \"", str,"\""), mfil, append = TRUE)
    write(paste0("\n#Uebung ", cont$task_name, "; Musterloesung:"), mfil, append = TRUE)

    # Code der Musterloesung
    str = sub(x=cont$solution, pattern = "<-", replacement = "=")  #"<-" durch "=" ersetzen
    str = sub(str            , pattern = "(^.)", replacement = "\\L\\1", perl = TRUE)  #Großschreibung durch Kleinschreibung ersetzen
    #Codefights workarounds mit unlist() entfernen
    str = gsub(x=str, pattern = "\\n\\s*(.*)\\s*=\\s*unlist\\(\\1\\)", replacement = "\n")  
    str = gsub(x=str, pattern = "#Codefights-Bug, nicht noetig in richtigem R\n", replacement = "")  
    str = sub(x=str, pattern = "\n\\s*\\n", replacement = "\n")  
    #write(str, mfil, append = TRUE) 
    
    str = sub(str, pattern = "^[ \t]*([^ ]+)(.*)", replacement = "\\L\\1_muster_lsg \\2", perl = TRUE)
    str2 =sub(str, pattern="_muster_lsg.*", repl="") #Funktionsname
    
    #Musterloesung testen
    res = try(parse(text = str2), silent = TRUE)
    if (class(res)=="try-error")
    {  
      print(paste0("Fehler beim Parsen der Musterloesung <", str2,">."))
      print(" - pruefe musterloesungen_dyn.R!")
      print(" - pruefe Syntax des der yaml-Datei (4 Leerzeichen am Zeilenbeginn fuer Umbruch)!")
      print(paste0("Fehlermeldung der Musterloesung <", str2,">:", res))
      stop()
    }
    
    write(str, mfil, append = TRUE)
    
    #schreibe Tests ####
    #lektion der Uebung
    #str = gsub(yaml_file, pattern="\\.yaml", repl="") 
    write(paste0("\n#Uebung ", cont$task_name), tfil, append = TRUE)

    
    write(paste0("testliste[[\"", cont$task_name, "\"]]=list(tests=list("), tfil, append = TRUE)
   
    tests =grep(x = names(cont), pattern="test", value=TRUE) #extrahiere Namen der Tests
    
    #assemble arguemnts of all tests
    arg_strs = c() 
    #einzeltest="test1"
    for (einzeltest in tests)
     {
      feld = cont[[einzeltest]] #for tests with missing arguments
      if (is.null(feld$input)) next
       arg_strs = c(arg_strs, 
                    paste0(argms$name, " = ", lapply(feld$input, FUN = deparse, width.cutoff=500), collapse=", "))
    }
    write(paste0(tests, " = list(", arg_strs, ")", collapse=",\n"), tfil, append = TRUE) 
    
    #deparse(cont[["test1"]]$input[2], width.cutoff=500)
    #deparse(cont[["test2"]]$input[2])
    
    # for (einzeltest in tests)
    # {
    #   write(paste0("", einzeltest, " = list("), tfil, append = TRUE)
    #                
    #   feld = cont[[einzeltest]]
    #   arg_str=""
    #   for (i in 1:nrow(argms))
    #   {  
    #     value = feld$input[[i]]
    #     value = deparse(value)
    #     #if (is.vector(value)) value = paste0(c("(", value, collapse=",", ")"))
    #     arg_str = paste0(arg_str, argms$name[i], " = ",value, ", ")
    #   }
    #     
    #   
    #   if (einzeltest != tests[length(tests)])
    #     write(",", tfil, append = TRUE) #Komma, außer beim letzten Testen
    #   
    #   
    #   #write(paste0("loesung = ", str, "_lsg (" = Uebung[\"richtig\"] + 1"), mfil, append = TRUE)
    #   #write(paste0("if (identical2(einreichung, muster_lsg)) kontrollergebnis_t$richtig[1] = kontrollergebnis_t$richtig[1] + 1 #zaehle richtige Ergebnisse"), mfil, append = TRUE)
    #   #write(paste0("if (class(einreichung) == \"try-error\") kontrollergebnis_t$nicht_aufrufbar[1] = kontrollergebnis_t$nicht_aufrufbar[1] + 1 #zaehle fehlerhafte Aufrufe\n"), mfil, append = TRUE)
    #   
    # }
    #str = sub(x=str, pattern = "^([0-9]*_)", repl="" ) #keine Zahlen am Beginn des lektions erlaubt
    #str = sub(x=str, pattern = "^(.)", repl="\\L\\1", perl=TRUE ) #Großbuchstaben in Kleinbuchstaben umwandeln
    write(paste0("), muster_lsg=", tolower(cont$task_name),"_muster_lsg)"), tfil, append = TRUE)
  
    
  }  
  #Uebungen-Template abschliesen ####
  write("\n", afil, append=TRUE) #Umbruch
  write(paste0(rep("#", 80), collapse = ""), afil, append=TRUE) #Trennlinie
  write("#Zum Testen nun die ganze Datei ausfuehren - es duerfen keine Fehlermeldungen auftreten!", afil, append=TRUE) #
  
  #Musterloesung abschliesen ####
  write("\n", mfil, append=TRUE) #Umbruch
  write(paste0(rep("#", 80), collapse = ""), mfil, append=TRUE) #Trennlinie
  
  #Tests abschliesen ####
  write("\n", tfil, append=TRUE) #Umbruch
  write(paste0(rep("#", 80), collapse = ""), tfil, append=TRUE) #Trennlinie
  
  
  
  # Testroutine "verschluesseln" und speichern ####
  src_code = readLines(con = "Uebungsfabrik/teste_alles_fun.R") #
  src_code = paste0(src_code, collapse="\n") #alle Zeilen zusammenfassen
  
  #suche nach Zeilen mit "source()"-Befehl. Diese sollen schon jetzt "gesourct" werden, damit alles fertig in der "verschluesselten" *.RData liegt
  lines_with_source = gregexpr(pattern = "source\\([^)]+)", text = src_code)
  
  #escaping is necessary to use gsub (regular expressions) for replacements
  escape_backslashes = function(x)
  {
    x = gsub(x=x, pattern="\\\\", repl="\\\\\\\\") #mask backslashes
    return(x) 
  }
  
  escape_backslashes_parenthesis = function(x)
  {
    x = gsub(x=x, pattern="\\\\", repl="\\\\\\\\")  #mask backslashes
    x = gsub(x=x, pattern="\\(", repl="\\\\(") #mask parenthesis
    x = gsub(x=x, pattern="\\)", repl="\\\\)") #mask parenthesis
    return(x)
  }
  
  #
  for (i in rev(1:length(lines_with_source[[1]])))
  {
    start = lines_with_source[[1]][i]
    stop  = start + attr(lines_with_source[[1]], "match.length")[i] -1
    org_str = substr(src_code, start = start, stop = stop)
    org_str = escape_backslashes_parenthesis(org_str) #mask backslashes and parentheses in code, which will otherwise be corrupted during replacement
      
    src_file = sub(x = org_str, pattern=".*\"(.*)\".*", repl="\\1") #Dateinamen extrahieren

    external_code = readLines(con = paste0(sd, "/", src_file)) # Datei einlesen
    external_code = paste0(external_code, collapse="\n") #alle Zeilen zusammenfassen
    external_code = escape_backslashes(external_code) #mask backslashes in code, which will otherwise be corrupted during replacement
            
    # Zeilen mit source() durch den Inhalt der entsprechenden Datei ersetzen
    src_code = sub(x = src_code, pattern = org_str, replacement = external_code)
  }
  
  res = try(parse(text = src_code), silent = TRUE) #Umwandlung von Character in expression (Parsen)
  if (class(res)=="try-error")
  {  
    print(paste0("Fehler beim Parsen der teste_alles_fun()"))
    file2check = paste0(sd, "/","teste_alles_fun.R")
    print(paste0(" - pruefe ", file2check))
    print(" - pruefe musterloesungen_dyn.R!")
    print(paste0("Fehlermeldung: <", str2,">:", res))
    write(x=src_code, file =file2check)
    stop()
  }
  test_routine_cd = res
   
  eval(test_routine_cd)     #Ausfuehren der Expression --> Funktion "test_routine_cd()" ist nun verfuegbar
  
  save(file=paste0(sd, "/","teste_alles.RData"), list = "test_routine_cd")
 
}
