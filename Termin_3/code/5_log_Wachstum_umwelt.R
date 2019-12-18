# Seminar zu "Einfuehrung in die Modellierung"

# Populationswachstum: logistisches Modell + Umwelteinfluss


# Konzept der umweltabhaengigen Kapazitaet ausprobieren

# Funktion "kapazitaet" definieren, die die Kapazitaet in Abhaengigkeit der Parameter
# K_opt, K_pess, theta_opt, praeferendumsbreite fuer eine gegebenes theta berechnet
#<
kapazitaet = function (K_opt, K_pess, theta_opt, praeferendumsbreite, theta)
{
  #K = K_pess + (K_opt-K_pess) * dnorm(theta, mean = theta_opt, sd = praeferendumsbreite/6) / dnorm(x=0, sd=praeferendumsbreite/6)
  #K = approx(x=c(theta_opt - praeferendumsbreite/2, theta_opt, theta_opt + praeferendumsbreite/2), y = c(K_pess, K_opt, K_pess), xout = theta, rule = 2)$y
  K = approx(x=c(theta_opt + praeferendumsbreite*c(-1.5, -0.5, 0.5, 1.5)), 
             y = c(K_pess, K_opt, K_opt, K_pess), xout = theta, rule = 2)$y
  return(K)
}
#>
  
# Funktion testen und Diagramm erzeugen:
theta_opt = 0.7 # Optimum hinsichtlich theta 
K_opt  = 100 # Habitatkapazitaet unter optimalen Bedingungen
K_pess = 3   # Habitatkapazitaet unter schlechtestmoeglichen Bedingungen
praeferendumsbreite = 0.2 #0.25

theta_plot = 0:100/100
K_plot = kapazitaet(K_opt = K_opt, K_pess=K_pess, theta_opt = theta_opt,
                    praeferendumsbreite = praeferendumsbreite, theta = theta_plot)
plot(theta_plot, K_plot, xlab="theta", ylab="K_max", type="l", col="blue")

# Funktion "log_Wachstum_umwelt" definieren (n_min=2)
#<
log_Wachstum_umwelt = function (N0, r_max, nt, K_opt, K_pess, theta_opt, praeferendumsbreite, theta, n_min=2)
#>
{  
# N0 :            Startpopulation
# r_max:   : maximale Wachstumsrate fuer aktuellen Zeitschritt
# nt :            Anzahl Zeitschritte
# K_opt, K_pess: Habitatkapazitaeten unter optimalen bzw. Pessimum-Bedingungen
# theta_opt: Schwellenwerte der Umweltfaktoren (z.B. Bodenfeuchte) zu o.g. Kapazitaeten
# praeferendumsbreite: Spannweite um das Optimum, in der die maximale Kapazitaet herrscht
# n_min: minimal ueberlebensfaehige Population
# theta:   Zeitreihe des Umweltfaktors


  #Variablen vorbereiten
  N = rep(NA,nt) #Vektor fuer zeitlichen Verlauf der Population
  N[1] = N0
  
  # Iterationsschleife
  for (t in 2:nt)
  {
    # Umweltabhaengige Kapazitaet  
    #<
    K = kapazitaet(K_opt = K_opt, K_pess=K_pess, theta_opt = theta_opt, praeferendumsbreite = praeferendumsbreite, theta = theta[t])
    #>
      
    # dichtegesteuerte Wachstumsrate (logistischer Regression)
    #<
    r = r_max* (1 - N[t-1]/K)
    #>
    
    N[t] = N[t-1] + r * N[t-1]
    if (N[t] < n_min) N[t] = 0     #Population kleiner als n_min stirbt aus
  }

  # Ergebnis zurueckgeben
  return(N)
}
  

# Umweltbedingung theta (hier synthetisch erzeugt)
  nt = 500
  set.seed(3) # Initialisierung des Zufallsgenerators fuer reproduzierbaren Zufall
  theta_min=0 #Minimum und Maximum der Umweltvariable
  theta_max=1
  theta = runif(N = nt, min=theta_min, max=theta_max)  #Zufallsgenerator
  theta = lowess(theta, f=0.05)$y  #Glaettung, damit sich ein kontinuierlicher Verlauf zeigt
  #theta = (theta - min(theta)) / diff(range(theta))* (theta_max-theta_min) + theta_min

#
  theta_opt = 0.7 #Optimum hinsichtlich theta 
  K_opt  = 100 #Habitatkapazitaet unter optimalen Bedingungen
  K_pess = 3   #Habitatkapazitaet unter schlechtestmoeglichen Bedingungen
  praeferendumsbreite = 0.2 #0.15
  r_max = 0.1

  
      
#Funktion mit N0 = 2, r_max aus Vektor, K = 100 aufrufen, Rueckgabewert in N_1 speichern
#<
N_1 = log_Wachstum_umwelt(N0 = 2, r_max=r_max, nt = nt, 
                          K_opt = K_opt, K_pess = K_pess, 
                          theta_opt=theta_opt, praeferendumsbreite = praeferendumsbreite,
                          theta=theta)
#>


#Population (N_1) darstellen
plot  (x=1:length(N_1), y=N_1, type="l", col="black", xlab = "Zeitschritte", ylab="Populationsgroesse")

#Zeitreihe von theta (Klima) in die gleich Grafik einzeichnen
  #weitere Grafik ueber die erstere legen, ohne diese zu loeschen
par(new=TRUE)

#Amplitude auf ca. Haelfte des Fensters skalieren (Tipp: plot(..., ymin=...))
#erneute Titelausgabe unterdruecken               (Tipp: plot(..., xlab=...))
#erneute Achsenbeschriftung unterdruecken         (Tipp: plot(..., axes=...))
#<
  plot(x=1:length(N_1), y = theta, col="blue", type="l", ylim = c(min(theta), 2*max(theta)), axes = FALSE,
     xlab="", ylab="" )
#>  
#zweite y-Achsenbeschriftung rechts einfuegen (Tipp: axis(...))
#<  
axis(side=4)
#>
#horizontale Linie bei theta_opt +/- praeferendumsbreite/2 einzeichnen
#<  
abline(h=c(theta_opt-praeferendumsbreite/2, theta_opt, theta_opt+praeferendumsbreite/2) , lty="dashed", col="black")
#>

legend("topleft", legend=c("N_1", "theta"), col=c("black","blue"), lty= 1)

#? Was passiert, wenn die Art etwas stenoeker (paeferendumsbreite=0.15) ist?


#? Vergleiche die Populationsdynamik mit einer zweiten Populationen N_2, 
#? die trockenresistenter (theta_opt=0.3) ist

#<
 N_2 = log_Wachstum_umwelt(N0 = 2, r_max=r_max, nt = nt, 
                          K_opt = K_opt, K_pess = K_pess, 
                          theta_opt=0.3, praeferendumsbreite = praeferendumsbreite,
                          theta=theta)
#> 

#Population (N_1 und N_2) in einer Grafik darstellen
plot  (x=1:length(N_1), y=N_1, type="l", col="black", xlab = "Zeitschritte", ylab="Populationsgroesse")
lines (x=1:length(N_2), y=N_2,           col="red")

#weitere Grafik ueber die erstere legen, ohne diese zu loeschen
par(new=TRUE)
plot(x=1:length(N_1), y = theta, col="blue", type="l", ylim = c(min(theta), 2*max(theta)), axes = FALSE,
     xlab="", ylab="" )
#zweite y-Achsenbeschriftung rechts einfuegen (Tipp: axis(...))
axis(side=4)
#horizontale Linie bei theta_opt +/- praeferendumsbreite/2 einzeichnen
abline(h=c(theta_opt-praeferendumsbreite/2, theta_opt, theta_opt+praeferendumsbreite/2) , lty="dashed", col="black")
abline(h=c(0.3-praeferendumsbreite/2, 0.3, 0.3+praeferendumsbreite/2) , lty="dashed", col="red")

legend("topleft", legend=c("N_1", "N_2", "theta"), col=c("black", "red", "blue"), lty= 1)

  
  
  

 
  
 
 