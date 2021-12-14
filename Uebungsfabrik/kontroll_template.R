# Uebungsaufgaben - Testen und Einreichen

#########################################
# Anleitung:
# 1. Datei "Uebungen_template.R" der aktuellen Lektion herunterladen und bearbeiten.
# 2. Datei "kontroll_template.R" und Hilfsdatei "teste_alles.RData" fuer aktuelle Lektion herunterladen und in Arbeitsverzeichnis kopieren.
# 3. Datei "kontroll_template.R" oeffnen, ueber "Session"->"Set working dir" -> "to Source file location" das Arbeitsverzeichnis einstellen 
# 4. mit Strg+Shift+S ausfuehren und Ausgabe am Ende beachten.
##############################################

rm(list=ls()) #Workspace leeren

#Hier bitte den eigenen Namen eintragen:
name="Maxime Mustermaennin" 

#########################################################
# !!! Bitte keine Aenderungen unterhalb dieser Linie !!!

# Datei mit den eigenen Loesungen einbinden (normalerweise "aufgaben_template.R")
ueb_file = "Uebungen_template.R"
if (!file.exists(ueb_file))
{
  print(paste0("Datei mit den bearbeiteten Loesungen (", ueb_file, ") nicht gefunden."))
  print(paste0("- bearbeitete Datei unter korrektem Namen (", ueb_file, ") gespeichert?"))
  print(paste0("- bearbeitete Datei in selbem Verzeichnis wie kontroll_template.R gepeichert?"))
  print(paste0("- Arbeitsverzeichnis auf das Verzeichnis von kontroll_template.R gesetzt?"))
  stop()
}
source(ueb_file)

load("teste_alles.RData")
eval(test_routine_cd) # Deklaration der Testroutine
teste_alles()         # Aufruf der Testroutine
