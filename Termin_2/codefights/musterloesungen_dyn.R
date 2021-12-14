# dynamisch erzeugt mit Uebungen_Korrekturen_erzeugen.R
#Musterloesungen zu Lektion Termin_2/codefights
lektion = "Termin_2/codefights" #lektion/Nr der Lektion
################################################################################
################################################################################

#Uebung schwimmbad; Musterloesung:
schwimmbad_muster_lsg  = function(n0, r, n_grenzwert) {
  exp_Wachstum = function (n0, r, nt)
  {  
      # n0 : Startpopulation
      # r  : Wachstumsrate
      # nt : Anzahl Zeitschritte
      
      n = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population anlegen
      n[1] = n0
      
      for (t in 2:nt)
      n[t] = n[t-1] + r * n[t-1]
      
      return(n)
  }
  
  n = exp_Wachstum (n0, r, 1000)
  sperrtag = which (n > n_grenzwert)[1]
  
  if (is.na(sperrtag)) sperrtag = -1
  
  return (sperrtag)
}
################################################################################

#Uebung schwimmbad2; Musterloesung:
schwimmbad2_muster_lsg  = function(n0, r, n_grenzwert, r_chlor) {
   exp_Wachstum = function (n0, r, nt)
   {  
     # n0 : Startpopulation
     # r  : Wachstumsrate
     # nt : Anzahl Zeitschritte
     
     n = rep(NA,nt) #Vektor für zeitlichen Verlauf der Population anlegen
     n[1] = n0
     
     for (t in 2:nt)
       n[t] = n[t-1] + r * n[t-1]
     
     return(n)
   }
   
   n = exp_Wachstum (n0=n0, r=r, nt=1000)
   sperrtag = which (n > n_grenzwert)[1]
   
   if (is.na(sperrtag)) return(round(max(n)))   #Grenzwert wurde nicht überschritten, gib Maximalpopulation zurück
   
   N_chlor = exp_Wachstum (n0=n[sperrtag], r=r_chlor, nt=4)  #Wachstum unter Chloreinfluss
   
   return (round(N_chlor[4]))
}
################################################################################

#Uebung wuerfel; Musterloesung:
wuerfel_muster_lsg  = function(n_wuerfe, seed) {
   set.seed(1, kind = "Super-Duper")
   wuerfe = ceiling(runif(n = n_wuerfe, min = 0, max=6))
   return (wuerfe)
}
################################################################################

#Uebung wuerfel_gezinkt; Musterloesung:
wuerfel_gezinkt_muster_lsg  = function(wurf) {
   n_wuerfe = length(wurf)
   testwurf = rep(0, n_wuerfe)
   seed=0
   while(any(testwurf != wurf))
   {
    seed=seed+1
    set.seed(seed=seed, kind="Super-Duper")
    testwurf = sample(x = 1:6, size = n_wuerfe, replace = TRUE)
   }
   return (seed)
}
################################################################################

#Uebung interpolation; Musterloesung:
interpolation_muster_lsg  = function(t_mess, x_mess, t_approx) { return(round(approx(x=t_mess, y = x_mess, xout =t_approx)$y, digits=1)) }


################################################################################
