# Seminar zu "Einf�hrung in die Modellierung/Integrierte Modellierung"
# 1.11.2016

# Populationswachstum: exponentielles Modell mit Umwelteinwirkungen

# Funktion "exp_Wachstum_umwelt" definieren
#<
exp_Wachstum_umwelt = function (n0, r_pess, r_opt, nt)
#>
{  
# n0 :               Startpopulation
# r_pess, r_opt:   : minimale und maximale Wachstumsrate
# nt :               Anzahl Zeitschritte
  
  #Variablen vorbereiten
  n = rep(NA,nt) #Vektor f�r zeitlichen Verlauf der Population
  n[1] = n0
  
  # Iterationsschleife
  for (t in 2:nt)
  # zuf�llige Auspr�gung der Wachstumsrate (z.B. durch Klima) mit runif() erzeugen
  #<
  {
    # zuf�llige Auspr�gung der Wachstumsrate (z.B. durch Klima)
    r = runif(n = 1, min=r_pess, max=r_opt)  
      
    n[t] = n[t-1] + r * n[t-1]
  }
  #>
  
  # Ergebnis zur�ckgeben
  return(n)
}
  
  # seed (optional)  : Initialisierung des Zufallsgenerators  
  
  #(optional): Initialisierung des Zufallsgenerators f�r reproduzierbaren Zufall
  seed=6
  set.seed(seed)
  

  #Funktion mit n0 = 2, r_pess= -0.2, r_opt=0.25, nt = 100 aufrufen, R�ckgabewert in n_1 speichern
  #<
  n_1 = exp_Wachstum_umwelt(n0 = 2, r_pess  = -0.2, r_opt = 0.25, nt = 100)
  #>
  
  #Funktion mit n0 = 2, r_pess= -0.25, r_opt=0.2, nt = 100 aufrufen, R�ckgabewert in n_2 speichern
  #<
  n_2 = exp_Wachstum_umwelt(n0 = 2, r_pess  = -0.25, r_opt = 0.2, nt = 100)
  #>


  #Resultate (n_1, n_2) in einer Grafik darstellen
  #<
  plot  (x=1:length(n_1), y=n_1, type="p", col="black", xlab = "Zeitschritte", ylab="Populationsgr��e")
  points(x=1:length(n_2), y=n_2, col="red")
  legend("bottomright", legend=c("n_1", "n_2"), col=c("black","red"), pch = 21)
  #>
  
  #? Welche Population stirbt (meist) (fr�her) aus?
  #? F�r welche Initialisierung des Zufallsgenerators (seed) ist das nicht so?
  