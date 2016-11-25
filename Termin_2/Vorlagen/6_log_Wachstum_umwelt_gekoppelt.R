# Seminar zu "Einführung in die Modellierung/Integrierte Modellierung"
# 1.11.2016
# Populationswachstum, exponentielles Modell mit Umweltstochastizität
kapazitaet = function (K_opt, K_pess, theta_opt, praeferendumsbreite, theta)
{
  K = approx(x=c(theta_opt + praeferendumsbreite*c(-1.5, -0.5, 0.5, 1.5)), y = c(K_pess, K_opt, K_opt, K_pess), xout = theta, rule = 2)$y
  return(K)
}
# Funktion "log_Wachstum_umwelt_gekoppelt" definieren
#...hier ergänzen...
{  
  # n0 :            Startpopulation
  # r_max:   : maximale Wachstumsrate für aktuellen Zeitschritt
  # nt :            Anzahl Zeitschritte
  # K_opt, K_pess: Habitatkapazitäten unter optimalen bzw. Pessimum-Bedingungen
  # theta_opt: Schwellenwerte der Umweltfaktoren (z.B. Bodenfeuchte) zu o.g. Kapazitäten
  # praeferendumsbreite: Spannweite um das Optimum, in der die maximale Kapazität herrscht
  # theta_A:   Zeitreihe des Umweltfaktors für Population A
  # theta_B:   Zeitreihe des Umweltfaktors für Population B
  
  # n_min: minimal überlebensfähige Population
  # m:  Migrationswahrscheinlichkeit
  #Variable n vorbereiten: Matrix mit 2 Zeilen (Populationen A und B) und nt Spalten Tipp: "array()"
  #...hier ergänzen...
  n[,1] = n0 #Zuweisung der Anfangspopulation von A und B
  
  # Iterationsschleife
  for (t in 2:nt)
  {
    # dichtegesteuerte Wachstumsrate (logistischer Regression)
    # Umweltabhängige Kapazität  
    # Migration  
    # jeweils für Population A (speichern in n[1,]) und Population B (speichern in n[,2])
    #...hier ergänzen...
  
  # Ergebnis zurückgeben
  return(n)
}
  
#Populationsparameter
  theta_opt = 0.7 #Lage des Optimums (Bodenfeuchte)
  K_opt  = 100 #Habitatkapazität unter optimalen Bedingungen
  K_pess = 1   #Habitatkapazität unter schlechtestmöglichen Bedingungen
  praeferendumsbreite = 0.3 #Breite des Präferendums
  r_max = 0.01 # maximale Reproduktionsrate
  nt = 3000 # Anzahl der zu simulierenden Zeitschritte
  n0 = c(20, 20) # Werte für Anfangspopulation für A und B
  m = 0.01
 
  # Umweltbedingung (hier synthetisch erzeugt)
    # Initialisierung des Zufallsgenerators für reproduzierbaren Zufall
    set.seed(3)
    theta_min=0 #Minimum und Maximum der Umweltvariable
    theta_max=1
    theta_A = runif(n = nt, min=theta_min, max=theta_max)  
    theta_A = lowess(theta_A, f=0.10)$y  #Glättung, damit sich ein kontinuierlicher Verlauf zeigt
    theta_A = (theta_A - min(theta_A)) / diff(range(theta_A))* (theta_max-theta_min) + theta_min
    
    theta_B = runif(n = nt, min=theta_min, max=theta_max)  
    theta_B = lowess(theta_B, f=0.10)$y  #Glättung, damit sich ein kontinuierlicher Verlauf zeigt
    theta_B = (theta_B - min(theta_B)) / diff(range(theta_B))* (theta_max-theta_min) + theta_min
    
    theta_B = 1- theta_A
    
  #Funktion mit Populationsparametern aufrufen, Rückgabewert in n speichern
  #...hier ergänzen...
  
  
  #Populationen in einer Grafik darstellen
  par(oma=c(0,0,0,1.5))
  
  plot  (x=1:length(n[1,]), y=n[1,], type="l", col="black", xlab = "Zeitschritte", ylab="Populationsgröße", ylim=c(0, max(n)))
  lines (x=1:length(n[2,]), y=n[2,],           col="red")
  
  #weitere Grafik über die erstere legen, ohne diese zu löschen
  par(new=TRUE)
  plot(x=1:length(n[1,]), y = theta_A, col="black", type="l", lty=2, ylim = c(theta_min, 2*theta_max), axes = FALSE,
       xlab="", ylab="" )
  lines(x=1:length(n[2,]), y = theta_B, col="red", type="l", lty=2)
  #zweite y-Achsenbeschriftung rechts einfügen (Tipp: axis(...))
  axis(side=4)
  #horizontale Linie bei theta_opt +/- praeferendumsbreite/2 einzeichnen
  abline(h=c(theta_opt-praeferendumsbreite/2, theta_opt, theta_opt+praeferendumsbreite/2) , lty=3, col="black")
  mtext(text="theta", side=4, outer = TRUE)
  
  legend("topright", legend=c("n_1", "n_2", "theta"), col=c("black", "red"), lty= c(1,1,2))
 
  #<? Wie groß muss die Migrationsrate sein, um ein Aussterben beider Populationen innerhalb 
  #<? des simulierten Zeitraums zu verhindern?
  #...hier ergänzen...
  
  #<? Durch Ändern eines Parameters sollen beide Populationen die gleiche Dynamik zeigen.
  #<? Welceh Möglichkeiten gibt es?
  #...hier ergänzen...
  
  
 
  
  
 
  
 
 