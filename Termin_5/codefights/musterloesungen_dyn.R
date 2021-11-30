lektion = "Termin_5/codefights" #lektion/Nr der Lektion
################################################################################
################################################################################

#Uebung welchertag; Musterloesung:
welchertag_muster_lsg  = function(datum) {
  return(strftime(as.Date(datum), format="%A"))
}

################################################################################

#Uebung ausschlafen; Musterloesung:
ausschlafen_muster_lsg  = function(datum) {
  name = strftime(as.Date(datum), format="%A")
  wochenende = c("Saturday", "Sunday")
  return(name %in% wochenende)
}

################################################################################

#Uebung vegetationsperiode; Musterloesung:
vegetationsperiode_muster_lsg  = function(datum, start, ende) {
  doy = as.numeric(strftime(as.Date(datum), format="%j"))
  if ((doy>= start) & (doy<=ende)) {
	return(TRUE)
  } else return(FALSE)
}

################################################################################

#Uebung ereignisdauer; Musterloesung:
ereignisdauer_muster_lsg  = function(start, ende) {
  dauer = difftime(as.POSIXct(ende), as.POSIXct(start), units="hours")
  return(round(as.numeric(dauer), 2))
}

################################################################################

#Uebung niederschlagsintensitaet; Musterloesung:
niederschlagsintensitaet_muster_lsg  = function(start, ende, volumen, radius) {
  dauer = difftime(as.POSIXct(ende), as.POSIXct(start), units="hours")
  hoehe = volumen * 1e3 / (pi*(radius*10)^2)
  return(round(hoehe / as.numeric(dauer), digits=2))
}


################################################################################
