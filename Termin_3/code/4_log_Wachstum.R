# Seminar zu "Einfuehrung in die Modellierung"

# Populationswachstum: logistisches Modell

# Funktion "log_Wachstum" definieren
#<
log_Wachstum = function (n0, r_max, K, nt)
#>
{  
# n0 : Startpopulation
# r_max : maximale Wachstumsrate
# K : Kapazitaet
# nt : Anzahl Zeitschritte
 
  
  # Variablen vorbereiten
  n = rep(NA,nt) #Vektor fuer zeitlichen Verlauf der Population
  n[1] = n0
  
  # Iterationsschleife
  for (t in 2:nt)
  #<
  {
    # Wachstumsrate als Funktion von aktueller Population und Kapazitaet
    r = r_max * (1 - n[t-1]/K)
    n[t] = n[t-1] + r * n[t-1]
  }
  #>
  
  # Ergebnis zurueckgeben
  return(n)
}
  
#Funktion mit n0 = 2, r_max=0.2, K=100, nt = 50 aufrufen, Rueckgabewert in n_1 speichern
#<
n_1 = log_Wachstum(n0 = 2, r_max=0.2, K=100, nt = 50)
#>

#Funktion mit n0 = 2, r_max=0.6, K=100, nt = 50 aufrufen, Rueckgabewert in n_2 speichern
#<
n_2 = log_Wachstum(n0 = 2, r_max=0.6, K=100, nt = 50)
#>

#Funktion mit n0 = 2, r_max=1, K=100, nt = 50 aufrufen, Rueckgabewert in n_3 speichern
#<
n_3 = log_Wachstum(n0 = 2, r_max=1, K=100, nt = 50)
#>

#Funktion mit n0 = 2, r_max=0.2, K=50, nt = 50 aufrufen, Rueckgabewert in n_4 speichern
#<
n_4 = log_Wachstum(n0 = 2, r_max=0.2, K=50, nt = 50)
#>

#Funktion mit n0 = 60, r_max=0.2, K=50, nt = 50 aufrufen, Rueckgabewert in n_5 speichern
#<
n_5 = log_Wachstum(n0 = 60, r_max=0.2, K=50, nt = 50)
#>


#Resultate (n_1 - n_4) in einer Grafik darstellen
#<
plot  (x=1:length(n_1), y=n_1, type="l", col="black", xlab = "Zeitschritte", ylab="Populationsgroesse", 
       ylim=range(c(n_1, n_2, n_3, n_4)))
lines(x=1:length(n_2), y=n_2, col="red")
lines(x=1:length(n_3), y=n_3, col="blue")
lines(x=1:length(n_4), y=n_4, col="green")
lines(x=1:length(n_5), y=n_5, col="magenta")
legend("bottomright", legend=c("n_1", "n_2", "n_3", "n_4", "n_4"), col=c("black","red","blue","green","magenta"), pch = 21)
#>



### Hohe Wachstumsraten

#Funktion mit n0 = 2, r_max=1, K=100, nt = 50 aufrufen, Rueckgabewert in n_1 speichern
#<
n_1 = log_Wachstum(n0 = 2, r_max=1, K=100, nt = 50)
#>

#Funktion mit n0 = 2, r_max=2, K=100, nt = 50 aufrufen, Rueckgabewert in n_2 speichern
#<
n_2 = log_Wachstum(n0 = 2, r_max=2, K=100, nt = 50)
#>

#Funktion mit n0 = 2, r_max=2.5, K=100, nt = 50 aufrufen, Rueckgabewert in n_2_5 speichern
#<
n_2_5 = log_Wachstum(n0 = 2, r_max=2.5, K=100, nt = 50)
#>

#Funktion mit n0 = 2, r_max=3, K=100, nt = 50 aufrufen, Rueckgabewert in n_3 speichern
#<
n_3 = log_Wachstum(n0 = 2, r_max=3, K=100, nt = 50)
#>


# Resultate (n_1 - n_3) in einer Grafik darstellen
#<
plot  (x=1:length(n_1), y=n_1, type="l", col="black", xlab = "Zeitschritte", ylab="Populationsgroesse", 
       ylim=range(c(n_1, n_2, n_2_5, n_3)))
lines(x=1:length(n_2), y=n_2, col="red")
lines(x=1:length(n_2_5), y=n_2_5, col="blue")
lines(x=1:length(n_3), y=n_3, col="green")
legend("bottomright", legend=c("n_1", "n_2", "n_2_5", "n_3"), col=c("black","red","blue","green"), pch = 21)
#>
  
#? Was bedeutet es inhaltlich, wenn die Population die Kapazitaet ueberschreitet?
#? Wann sollte dieses Verhalten unterbunden werden?
#? Wie koennte dieses Verhalten unterbunden werden?

#? Was bedeutet es inhaltlich, wenn die Population Werte nahe Null annimmt?
#? Wann ist die nachfolgende Entwicklung noch realistisch, wann nicht?
#? Wie koennte ggf. korrigiert werden?

#? Ausgehend von der obigen Funktion log_Wachstum, erstelle eine Variante "log_Wachstum_lim", 
#? die die beiden o.g. Punkte beruecksichtigt

log_Wachstum_lim = function (n0, r_max, K, nt)
{  
  # n0 : Startpopulation
  # r_max: maximale Wachstumsrate
  # K : Kapazitaet
  # nt : Anzahl Zeitschritte
  # seed (optional) : Initialisierung des Zufallsgenerators  
  n_min = 2      # minimal ueberlebensfaehige Population
  
  #Variablen vorbereiten
  n = rep(NA,nt) # Vektor fuer zeitlichen Verlauf der Population
  n[1] = n0
  
  # Iterationsschleife
  for (t in 2:nt)
  {
    #<
    # Wachstumsrate als Funktion von aktueller Population und Kapazitaet
    r = r_max * (1 - n[t-1]/K)
    n[t] = n[t-1] + r * n[t-1]

    #if (n[t] > K) n[t] = K         # Population kann nicht groesser als K werden
    if (n[t] < n_min) n[t] = 0     # Population kleiner als N_min stirbt aus
    #>
  }

  # Ergebnis zurueckgeben
  return(n)
}

 
# veraenderte Funktion mit den gleichen Parametern wie oben erneut aufrufen
n_1   = log_Wachstum_lim(n0 = 2, r_max=1, K=100, nt = 50)
n_2   = log_Wachstum_lim(n0 = 2, r_max=2, K=100, nt = 50)
n_2_5 = log_Wachstum_lim(n0 = 2, r_max=2.5, K=100, nt = 50)
n_3   = log_Wachstum_lim(n0 = 2, r_max=3, K=100, nt = 50)

# Resultate (n_1 - n_3) in einer Grafik darstellen (wie oben)
plot  (x=1:length(n_1), y=n_1, type="l", col="black", xlab = "Zeitschritte", ylab="Populationsgroesse", 
       ylim=range(c(n_1, n_2, n_2_5, n_3)))
lines(x=1:length(n_2), y=n_2, col="red")
lines(x=1:length(n_2_5), y=n_2_5, col="blue")
lines(x=1:length(n_3), y=n_3, col="green")
legend("bottomright", legend=c("n_1", "n_2", "n_2_5", "n_3"), col=c("black","red","blue","green"), pch = 21)


