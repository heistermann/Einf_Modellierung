rm(list=ls())

# Task 01
welchertag = function(datum) {
  return(strftime(as.Date(datum), format="%A"))
}
# Tests
welchertag("2016-11-15")
welchertag("2000-10-30")
welchertag("1999-05-10")
welchertag("1999-01-31")


# Task 02
ausschlafen = function(datum) {
  name = strftime(as.Date(datum), format="%A")
  wochenende = c("Saturday", "Sunday")
  return(name %in% wochenende)
}
# Tests
ausschlafen("1944-05-03")
ausschlafen("1988-06-11")
ausschlafen("1915-08-16")
ausschlafen("2023-12-27")


# Task 03
vegetationsperiode = function(datum, start, ende) {
  doy = as.numeric(strftime(as.Date(datum), format="%j"))
  if ((doy>= start) & (doy<=ende)) {
    return(TRUE)
  } else return(FALSE)
}
# Tests
vegetationsperiode("1944-05-03", 90, 300)
vegetationsperiode("2025-02-15", 132, 196)
vegetationsperiode("2015-10-15", 132, 196)
vegetationsperiode("1993-07-23", 101, 290)


# Task 04
ereignisdauer = function(start, ende) {
  dauer = difftime(as.POSIXct(ende), as.POSIXct(start), units="hours")
  return(round(as.numeric(dauer), 2))
}
# Tests
ereignisdauer("2011-03-05 09:02:34", "2011-03-05 16:40:43")
ereignisdauer("1999-04-06 20:00:00", "1999-04-08 17:40:00")
ereignisdauer("2023-04-06 19:30:00", "2023-05-08 17:40:00")
ereignisdauer("2011-03-05 10:02:00", "2011-03-05 16:40:43")


# Task 05
niederschlagsintensitaet = function(start, ende, volumen, radius) {
  dauer = difftime(as.POSIXct(ende), as.POSIXct(start), units="hours")
  hoehe = volumen * 1e3 / (pi*(radius*10)^2)
  return(round(hoehe / as.numeric(dauer), digits=2))
}
# Tests
niederschlagsintensitaet("2011-03-05 09:02:00", "2011-03-05 16:40:00", 101, 5.64)
niederschlagsintensitaet("2012-03-06 10:02:34", "2012-03-06 13:40:43", 206, 5.64)
niederschlagsintensitaet("2011-03-05 09:02:00", "2011-03-05 16:40:00", 300, 11.3)
niederschlagsintensitaet("2012-03-06 10:02:34", "2012-03-06 13:40:43", 563, 5.64)
