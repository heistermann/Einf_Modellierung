# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"
# Workspace ausleeren
rm(list = ls())
# EINHEITSGANGLINIENVERFAHREN
# ---------------------------
# Effektivniederschlagsganglinie (in mm/h) 
precip = c(1., 5., 10.)
# Einheitsganglinie
egl = c(0.1, 0.4, 0.3, 0.2)
# Abflussganglinie (in m3/s) - Container
out = rep(0., length(precip) + length(egl) - 1)
# So sieht die Abflussganglinie vor Ausfuehrung aus
print(out)
# Flaeche des Einzugsgebiets (km2)
area = 7.2
# Schleife über alle Niederschlagsimpulse
for (i in 1:length(precip)) {
  # Abflussantwort auf Impuls i
  out_i = precip[i] * egl * area / 3.6 
  # Zeitindices, auf welche sich Impuls i verteilt
  ix = i:(i+length(egl)-1)
  # Addiere auf Abflussganglinie
  out[ix] = out[ix] + out_i
}
# Ergebnis (Abflussganglinie) anzeigen
print(out)
# Workspace ausleeren
rm(list = ls())
# Besser: Implementierung als Funktion
func_egl = function(precip, egl, area) {
  # Abflussganglinie (in m3/s)
  out = rep(0., length(precip) + length(egl) - 1)        
  for (i in 1:length(precip)) {
    # Abflussantwort auf Impuls i
    out_i = precip[i] * egl * area / 3.6 
    # Zeitindices, auf welche sich Impuls i verteilt
    ix = i:(i+length(egl)-1)
    # Addiere auf Abflussganglinie
    out[ix] = out[ix] + out_i
  }          
  return(out)
}
# Aufruf der Funktion mit beliebigen Argumenten 
func_egl(c(1., 5., 10.), c(0.1, 0.4, 0.3, 0.2), 7.2)
func_egl(c(6, 3, 4), c(0.2, 0.5, 0.3), 10.8)
# AUFGABE: Schreibe nun eine Funktion func_egl2, 
#   die den (konstanten) Basisabfluss beruecksichtigt.
#   Fuehre dazu ein zusätzliches Argument baseflow ein.
#...hier ergänzen...
# Nutzung der Funktion für beliebige Argumente 
func_egl2(c(1., 5., 10.), c(0.1, 0.4, 0.3, 0.2), 7.2, 2.)
func_egl2(c(6, 3, 4), c(0.2, 0.5, 0.3), 10.8, 0.)
# AUFGABE: Nutze nun den "plot"-Befehl, um die resultierende 
#   Abflussganglinie (LINIE!) fuer Q zu zeichnen. 
#   Nutze ggf. die Hilfe: ?plot
#   Erweitere den Plot wie folgt:
#   - fuege Achsenbeschriftungen und einen Titel hinzu,
#   - sorge dafür, dass die y-Achse bei "0" beginnt
#   - ziehe mit "abline" eine horizotale Linie auf Basisabflussniveau
precip = c(0., 1., 10, 5., 1., 0., 0.)
egl = c(0.1, 0.4, 0.3, 0.2)
area = 7.2
basisabfluss = 2.
Q = func_egl2(precip, egl, area, basisabfluss)
#...hier ergänzen...