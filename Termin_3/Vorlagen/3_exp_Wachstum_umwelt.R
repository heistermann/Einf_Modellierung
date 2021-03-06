# Seminar zu "Einf�hrung in die Modellierung/Integrierte Modellierung"
# 1.11.2016
# Populationswachstum: exponentielles Modell mit Umwelteinwirkungen
# Funktion "exp_Wachstum_umwelt" definieren
#...hier erg�nzen...
{  
# N0 :               Startpopulation
# r_pess, r_opt:   : minimale und maximale Wachstumsrate
# nt :               Anzahl Zeitschritte
  
  #Variablen vorbereiten
  N = rep(NA,nt) #Vektor f�r zeitlichen Verlauf der Population
  N[1] = N0
  
  # Iterationsschleife
  for (t in 2:nt)
  # zuf�llige Auspr�gung der Wachstumsrate (z.B. durch Klima) mit runif() erzeugen
  #...hier erg�nzen...
  
  # Ergebnis zur�ckgeben
  return(N)
}
  
  # seed (optional)  : Initialisierung des Zufallsgenerators  
  
  #(optional): Initialisierung des Zufallsgenerators f�r reproduzierbaren Zufall
  seed=6
  set.seed(seed)
  
  #Funktion mit N0 = 2, r_pess= -0.2, r_opt=0.25, nt = 100 aufrufen, R�ckgabewert in N_1 speichern
  #...hier erg�nzen...
  
  #Funktion mit N0 = 2, r_pess= -0.25, r_opt=0.2, nt = 100 aufrufen, R�ckgabewert in N_2 speichern
  #...hier erg�nzen...
  #Resultate (N_1, N_2) in einer Grafik darstellen
  #...hier erg�nzen...
  
  #? Welche Population stirbt (meist) (fr�her) aus?
  #? F�r welche Initialisierung des Zufallsgenerators (seed) ist das nicht so?
  