# Seminar zu "Einfuehrung in die Modellierung"

# Populationswachstum: logistisches Modell

# Funktion "log_Wachstum" definieren
#<
log_Wachstum = function (N0, r_max, K, nt)
#>
{  
# N0 : Startpopulation
# r_max : maximale Wachstumsrate
# K : Kapazitaet
# nt : Anzahl Zeitschritte
 
  
  # Variablen vorbereiten
  N = rep(NA,nt) #Vektor fuer zeitlichen Verlauf der Population
  N[1] = N0
  
  # Iterationsschleife
  for (t in 2:nt)
  #<
  {
    # Wachstumsrate als Funktion von aktueller Population und Kapazitaet
    r = r_max * (1 - N[t-1] / K)
    N[t] = N[t-1] + r * N[t-1]
  }
  #>
  
  # Ergebnis zurueckgeben
  return(N)
}
  
#Funktion mit N0 = 2, r_max=0.2, K=100, nt = 50 aufrufen, Rueckgabewert in N_1 speichern
#<
N_1 = log_Wachstum(N0 = 2, r_max=0.2, K=100, nt = 50)
#>

#Funktion mit N0 = 2, r_max=0.6, K=100, nt = 50 aufrufen, Rueckgabewert in N_2 speichern
#<
N_2 = log_Wachstum(N0 = 2, r_max=0.6, K=100, nt = 50)
#>

#Funktion mit N0 = 2, r_max=1, K=100, nt = 50 aufrufen, Rueckgabewert in N_3 speichern
#<
N_3 = log_Wachstum(N0 = 2, r_max=1, K=100, nt = 50)
#>

#Funktion mit N0 = 2, r_max=0.2, K=50, nt = 50 aufrufen, Rueckgabewert in N_4 speichern
#<
N_4 = log_Wachstum(N0 = 2, r_max=0.2, K=50, nt = 50)
#>

#Funktion mit N0 = 60, r_max=0.2, K=50, nt = 50 aufrufen, Rueckgabewert in N_5 speichern
#<
N_5 = log_Wachstum(N0 = 60, r_max=0.2, K=50, nt = 50)
#>


#Resultate (N_1 - N_4) in einer Grafik darstellen
#<
plot  (x=1:length(N_1), y=N_1, type="l", col="black", xlab = "Zeitschritte", ylab="Populationsgroesse", 
       ylim=range(c(N_1, N_2, N_3, N_4)))
lines(x=1:length(N_2), y=N_2, col="red")
lines(x=1:length(N_3), y=N_3, col="blue")
lines(x=1:length(N_4), y=N_4, col="green")
lines(x=1:length(N_5), y=N_5, col="magenta")
legend("bottomright", legend=c("N_1", "N_2", "N_3", "N_4", "N_4"), col=c("black","red","blue","green","magenta"), pch = 21)
#>

#? Was bedeutet es inhaltlich, wenn die Population die Kapazitaet ueberschreitet?
#? Wann sollte dieses Verhalten unterbunden werden?
#? Wie koennte dieses Verhalten unterbunden werden?



### Sehr hohe Wachstumsraten ####

#Funktion mit N0 = 2, r_max=1, K=100, nt = 50 aufrufen, Rueckgabewert in N_1 speichern
#<
N_1 = log_Wachstum(N0 = 2, r_max=1, K=100, nt = 50)
#>

#Funktion mit N0 = 2, r_max=2, K=100, nt = 50 aufrufen, Rueckgabewert in N_2 speichern
#<
N_2 = log_Wachstum(N0 = 2, r_max=2, K=100, nt = 50)
#>

#Funktion mit N0 = 2, r_max=2.5, K=100, nt = 50 aufrufen, Rueckgabewert in n_2_5 speichern
#<
n_2_5 = log_Wachstum(N0 = 2, r_max=2.5, K=100, nt = 50)
#>

#Funktion mit N0 = 2, r_max=3, K=100, nt = 50 aufrufen, Rueckgabewert in N_3 speichern
#<
N_3 = log_Wachstum(N0 = 2, r_max=3, K=100, nt = 50)
#>

# Resultate (N_1 - N_3) in einer Grafik darstellen
#<
plot  (x=1:length(N_1), y=N_1, type="l", col="black", xlab = "Zeitschritte", ylab="Populationsgroesse", 
       ylim=range(c(N_1, N_2, n_2_5, N_3)))
lines(x=1:length(N_2), y=N_2, col="red")
lines(x=1:length(n_2_5), y=n_2_5, col="blue")
lines(x=1:length(N_3), y=N_3, col="green")
legend("bottomright", legend=c("N_1", "N_2", "n_2_5", "N_3"), col=c("black","red","blue","green"), pch = 21)
#>
  
#? Wie sind die Unterschiede in den Kruven zu erklären? Wie geht man damit um? 


#? Was bedeutet es inhaltlich, wenn die Population Werte nahe Null annimmt?
#? Wann ist die nachfolgende Entwicklung noch realistisch, wann nicht?
#? Wie koennte ggf. korrigiert werden?
#? Ausgehend von der obigen Funktion log_Wachstum, erstelle eine Variante "log_Wachstum_lim", 
#? die die beiden o.g. Punkte beruecksichtigt
#<
log_Wachstum_lim = function (N0, r_max, K, nt)
{  
  # N0 : Startpopulation
  # r_max: maximale Wachstumsrate
  # K : Kapazitaet
  # nt : Anzahl Zeitschritte
  # seed (optional) : Initialisierung des Zufallsgenerators  
  n_min = 2      # minimal ueberlebensfaehige Population
  
  #Variablen vorbereiten
  N = rep(NA,nt) # Vektor fuer zeitlichen Verlauf der Population
  N[1] = N0
  
  # Iterationsschleife
  for (t in 2:nt)
  {
    #<
    # Wachstumsrate als Funktion von aktueller Population und Kapazitaet
    r = r_max * (1 - N[t-1]/K)
    N[t] = N[t-1] + r * N[t-1]

    #if (N[t] > K) N[t] = K         # Population kann nicht groesser als K werden
    if (N[t] < n_min) N[t] = 0     # Population kleiner als N_min stirbt aus
    #>
  }

  # Ergebnis zurueckgeben
  return(N)
}
#>
 
# veraenderte Funktion log_Wachstum_lim mit den gleichen Parametern wie oben erneut aufrufen
#<
N_1   = log_Wachstum_lim(N0 = 2, r_max=1, K=100, nt = 50)
N_2   = log_Wachstum_lim(N0 = 2, r_max=2, K=100, nt = 50)
n_2_5 = log_Wachstum_lim(N0 = 2, r_max=2.5, K=100, nt = 50)
N_3   = log_Wachstum_lim(N0 = 2, r_max=3, K=100, nt = 50)
#>

# Resultate (N_1 - N_3) in einer Grafik darstellen (wie oben)
#<
plot  (x=1:length(N_1), y=N_1, type="l", col="black", xlab = "Zeitschritte", ylab="Populationsgroesse", 
       ylim=range(c(N_1, N_2, n_2_5, N_3)))
lines(x=1:length(N_2), y=N_2, col="red")
lines(x=1:length(n_2_5), y=n_2_5, col="blue")
lines(x=1:length(N_3), y=N_3, col="green")
legend("bottomright", legend=c("N_1", "N_2", "n_2_5", "N_3"), col=c("black","red","blue","green"), pch = 21)
#>


