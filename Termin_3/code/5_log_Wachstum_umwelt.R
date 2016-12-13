# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"
# 1.11.2016

# Populationswachstum: logistisches Modell + Umwelteinfluss


# Konzept der umweltabhängigen Kapazität ausprobieren
  # Funktion "kapazitaet" definieren, die die Kapazität in Abhängigkeit der Parameter
  # K_opt, K_pess, theta_opt, praeferendumsbreite für eine gegebenes theta berechnet
  #<
  kapazitaet = function (K_opt, K_pess, theta_opt, praeferendumsbreite, theta)
  {
    #K = K_pess + (K_opt-K_pess) * dnorm(theta, mean = theta_opt, sd = praeferendumsbreite/6) / dnorm(x=0, sd=praeferendumsbreite/6)
    #K = approx(x=c(theta_opt - praeferendumsbreite/2, theta_opt, theta_opt + praeferendumsbreite/2), y = c(K_pess, K_opt, K_pess), xout = theta, rule = 2)$y
    K = approx(x=c(theta_opt + praeferendumsbreite*c(-1.5, -0.5, 0.5, 1.5)), y = c(K_pess, K_opt, K_opt, K_pess), xout = theta, rule = 2)$y
    return(K)
  }
  #>
  
  #Funktion testen und Diagramm erzeugen:
  theta_opt = 0.7 #Optimum hinsichtlich theta 
  K_opt  = 100 #Habitatkapazität unter optimalen Bedingungen
  K_pess = 3   #Habitatkapazität unter schlechtestmöglichen Bedingungen
  praeferendumsbreite = 0.2 #0.25
  
  theta_plot = 0:100/100
  K_plot = kapazitaet(K_opt = K_opt, K_pess=K_pess, theta_opt = theta_opt, praeferendumsbreite = praeferendumsbreite, theta = theta_plot)
  plot(theta_plot, K_plot, xlab="theta", ylab="K_max", type="l", col="blue")

# Funktion "log_Wachstum_umwelt" definieren (n_min=2)
#<
log_Wachstum_umwelt = function (n0, r_max, nt, K_opt, K_pess, theta_opt, praeferendumsbreite, theta, n_min=2)
#>
{  
# n0 :            Startpopulation
# r_max:   : maximale Wachstumsrate für aktuellen Zeitschritt
# nt :            Anzahl Zeitschritte
# K_opt, K_pess: Habitatkapazitäten unter optimalen bzw. Pessimum-Bedingungen
# theta_opt: Schwellenwerte der Umweltfaktoren (z.B. Bodenfeuchte) zu o.g. Kapazitäten
# praeferendumsbreite: Spannweite um das Optimum, in der die maximale Kapazität herrscht
# n_min: minimal überlebensfähige Population
# theta:   Zeitreihe des Umweltfaktors


  #Variablen vorbereiten
  n = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population
  n[1] = n0
  
  # Iterationsschleife
  for (t in 2:nt)
  {
    # Umweltabhängige Kapazität  
    #<
    K = kapazitaet(K_opt = K_opt, K_pess=K_pess, theta_opt = theta_opt, praeferendumsbreite = praeferendumsbreite, theta = theta[t])
    #>
      
    # dichtegesteuerte Wachstumsrate (logistischer Regression)
    #<
    r = r_max* (1 - n[t-1]/K)
    #>
    
    n[t] = n[t-1] + r * n[t-1]
    if (n[t] < n_min) n[t] = 0     #Population kleiner als n_min stirbt aus
  }

  # Ergebnis zurückgeben
  return(n)
}
  

  # Umweltbedingung theta (hier synthetisch erzeugt)
    set.seed(3) # Initialisierung des Zufallsgenerators für reproduzierbaren Zufall
    theta_min=0 #Minimum und Maximum der Umweltvariable
    theta_max=1
    theta = runif(n = nt, min=theta_min, max=theta_max)  #Zufallsgenerator
    theta = lowess(theta, f=0.05)$y  #Glättung, damit sich ein kontinuierlicher Verlauf zeigt
    #theta = (theta - min(theta)) / diff(range(theta))* (theta_max-theta_min) + theta_min

  #
    theta_opt = 0.7 #Optimum hinsichtlich theta 
    K_opt  = 100 #Habitatkapazität unter optimalen Bedingungen
    K_pess = 3   #Habitatkapazität unter schlechtestmöglichen Bedingungen
    praeferendumsbreite = 0.2 #0.15
    r_max = 0.1
    nt = 500
    
        
  #Funktion mit n0 = 2, r_max aus Vektor, K = 100 aufrufen, Rückgabewert in n_1 speichern
  #<
  n_1 = log_Wachstum_umwelt(n0 = 2, r_max=r_max, nt = nt, 
                            K_opt = K_opt, K_pess = K_pess, 
                            theta_opt=theta_opt, praeferendumsbreite = praeferendumsbreite,
                            theta=theta)
  #>
  

  #Population (n_1) darstellen
  plot  (x=1:length(n_1), y=n_1, type="l", col="black", xlab = "Zeitschritte", ylab="Populationsgröße")

  #Zeitreihe von theta (Klima) in die gleich Grafik einzeichnen
    #weitere Grafik über die erstere legen, ohne diese zu löschen
    par(new=TRUE)
  
    #Amplitude auf ca. Hälfte des Fensters skalieren (Tipp: plot(..., ymin=...))
    #erneute Titelausgabe unterdrücken               (Tipp: plot(..., xlab=...))
    #erneute Achsenbeschriftung unterdrücken         (Tipp: plot(..., axes=...))
    #<
      plot(x=1:length(n_1), y = theta, col="blue", type="l", ylim = c(min(theta), 2*max(theta)), axes = FALSE,
         xlab="", ylab="" )
    #>  
    #zweite y-Achsenbeschriftung rechts einfügen (Tipp: axis(...))
    #<  
    axis(side=4)
    #>
    #horizontale Linie bei theta_opt +/- praeferendumsbreite/2 einzeichnen
    #<  
    abline(h=c(theta_opt-praeferendumsbreite/2, theta_opt, theta_opt+praeferendumsbreite/2) , lty="dashed", col="black")
    #>
  
    legend("topleft", legend=c("n_1", "theta"), col=c("black","blue"), lty= 1)
  
  #<? Was passiert, wenn die Art etwas stenöker (paeferendumsbreite=0.15) ist?
  
  
  #<? Vergleiche die Popultionsdynamik mit einer zweiten Populationen n_2, 
  #<? die trockenresistenter (theta_opt=0.3) ist
  
  #<
   n_2 = log_Wachstum_umwelt(n0 = 2, r_max=r_max, nt = nt, 
                            K_opt = K_opt, K_pess = K_pess, 
                            theta_opt=0.3, praeferendumsbreite = praeferendumsbreite,
                            theta=theta)
  #> 
 
  #Population (n_1 und n_2) in einer Grafik darstellen
  plot  (x=1:length(n_1), y=n_1, type="l", col="black", xlab = "Zeitschritte", ylab="Populationsgröße")
  lines (x=1:length(n_2), y=n_2,           col="red")
  
  #weitere Grafik über die erstere legen, ohne diese zu löschen
  par(new=TRUE)
  plot(x=1:length(n_1), y = theta, col="blue", type="l", ylim = c(min(theta), 2*max(theta)), axes = FALSE,
       xlab="", ylab="" )
  #zweite y-Achsenbeschriftung rechts einfügen (Tipp: axis(...))
  axis(side=4)
  #horizontale Linie bei theta_opt +/- praeferendumsbreite/2 einzeichnen
  abline(h=c(theta_opt-praeferendumsbreite/2, theta_opt, theta_opt+praeferendumsbreite/2) , lty="dashed", col="black")
  abline(h=c(0.3-praeferendumsbreite/2, 0.3, 0.3+praeferendumsbreite/2) , lty="dashed", col="red")
  
  legend("topleft", legend=c("n_1", "n_2", "theta"), col=c("black", "red", "blue"), lty= 1)
  
  
  
  

 
  
 
 