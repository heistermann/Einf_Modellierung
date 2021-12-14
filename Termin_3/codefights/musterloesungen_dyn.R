# dynamisch erzeugt mit Uebungen_Korrekturen_erzeugen.R
#Musterloesungen zu Lektion Termin_3/codefights
lektion = "Termin_3/codefights" #lektion/Nr der Lektion
################################################################################
################################################################################

#Uebung qualitaetskontrolle; Musterloesung:
qualitaetskontrolle_muster_lsg  = function(precip, stoertage) {
 #Codefights-bug; sonst nicht nötig
  precip[stoertage] = -9999
  return(precip)
}
################################################################################

#Uebung gebietsniederschlag; Musterloesung:
gebietsniederschlag_muster_lsg  = function(messungen) { messungen=unlist(messungen) #codefights-bug
  return(0.5*messungen[1] + 0.3*messungen[2] + 0.2*messungen[3])
}

################################################################################

#Uebung egl1; Musterloesung:
egl1_muster_lsg  = function(precip, egl, area) {
 #Codefights Bug
  return(precip * area * egl / 3.6)
}

################################################################################

#Uebung egl2; Musterloesung:
egl2_muster_lsg  = function(precip, egl) {
 #Codefights Bug
  return(length(precip) + length(egl) - 1)
}

################################################################################

#Uebung egl3; Musterloesung:
egl3_muster_lsg  = function(precip, egl, area) {
 #Codefights Bug
  out = rep(0, length(precip) + length(egl) - 1)
  for (i in 1:length(precip)) {
	ix = i:(i+length(egl)-1)
	out[ix] = out[ix] + precip[i] * egl * area / 3.6
  }  
  return(out)
}



################################################################################
