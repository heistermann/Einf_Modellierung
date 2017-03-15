# Task 01
schwimmbad = function(N0, r, N_grenzwert) {
  
  exp_Wachstum = function (N0, r, nt)
  {  
    # N0 : Startpopulation
    # r  : Wachstumsrate
    # nt : Anzahl Zeitschritte
    
    N = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population anlegen
    N[1] = N0
    
    for (t in 2:nt)
      N[t] = N[t-1] + r * N[t-1]
    
    return(N)
  }
  
  N = exp_Wachstum (N0=N0, r=r, nt=1000)
  sperrtag = which (N > N_grenzwert)[1]
  
  if (is.na(sperrtag)) sperrtag = -1 #Grenzwert wurde nicht überschritten, gib -1 zurück
  
  return (sperrtag)
}

schwimmbad(2, 0.1, 100)
schwimmbad(50, 0.01, 200)
schwimmbad(5, 0.001, 1000)
schwimmbad(10, 1.2, 100)
schwimmbad(200, 0.1, 100)


# Task 02
schwimmbad2 = function(N0, r, N_grenzwert, r_chlor) {
  
  exp_Wachstum = function (N0, r, nt)
  {  
    # N0 : Startpopulation
    # r  : Wachstumsrate
    # nt : Anzahl Zeitschritte
    
    N = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population anlegen
    N[1] = N0
    
    for (t in 2:nt)
      N[t] = N[t-1] + r * N[t-1]
    
    return(N)
  }
  
  N = exp_Wachstum (N0=N0, r=r, nt=1000)
  sperrtag = which (N > N_grenzwert)[1]
  
  if (is.na(sperrtag)) return(round(max(N)))   #Grenzwert wurde nicht überschritten, gib Maximalpopulation zurück
  
  N_chlor = exp_Wachstum (N0=N[sperrtag], r=r_chlor, nt=4)  #Wachstum unter Chloreinfluss
  
  return (round(N_chlor[4]))
}

schwimmbad2(2, 0.1, 100, -0.1)
schwimmbad2(50, 0.01, 200, 0)
schwimmbad2(5, 0.001, 1000, -0.1)
schwimmbad2(10, 1.2, 100, 0.3)
schwimmbad2(200, 0.1, 100, 0.01)


# Task 03
wuerfel = function(n_wuerfe, seed) {
  set.seed(seed)
  wuerfe = ceiling(runif(n = n_wuerfe, min = 0, max=6))
  return (wuerfe)
}

wuerfel(2, 1)
wuerfel(5, 3)
wuerfel(7, 0)
wuerfel(3, 1000)

# Task 04
wuerfel_gezinkt = function(wurf) {
  n_wuerfe = length(wurf)
  testwurf = rep(0, n_wuerfe)
  seed=0
  while(any(testwurf != wurf))
  {
    seed=seed+1
    set.seed(seed)
    testwurf = sample(x = 1:6, size = n_wuerfe, replace = TRUE)
  }
  
  return (seed)
}

wuerfel_gezinkt(1)
wuerfel_gezinkt(c(6,6))
wuerfel_gezinkt(c(1,2,3,4))
wuerfel_gezinkt(c(1,1,1,1,1))





# Task 05
interpolation = function(t_mess, x_mess, t_approx) {
  return(round(approx(x=t_mess, y = x_mess, xout = t_approx)$y, digits=1))
  }

interpolation(c(0,1), c(0,30), c(0.5,1))
interpolation(c(0, 1, 2.5), c(0,30, 31), c(0.5, 1, 1.1))
interpolation(c(2, 4, 5, 8) , c(1, 2, 5, 10), c(2.5, 2.5, 3))
interpolation(c(-1,2), c(2,3), 0)


  

