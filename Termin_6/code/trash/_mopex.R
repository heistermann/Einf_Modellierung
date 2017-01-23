
read.mopex = function(fname) {
  out = read.table(fname, sep=";", header=TRUE, 
                   stringsAsFactors=FALSE)
  # Konvertiere String zu Datumsobjekt
  out$date = as.Date(out$date)
  return(out)
}

plot.discharges = function(mopex, model, zoominto=NULL, baseflow=TRUE, fmt="%Y") {

  #zoominto = NULL #c(as.Date("1990-01-01"), as.Date("2000-01-01"))
  plot(mopex$date, model$Q, type="n",
       xlim=zoominto,
       ylim=c(0, max(c(model$Q, mopex$discharge), na.rm=TRUE)),
       xlab="Zeit", ylab="Abfluss", xaxt="n")
  axis.Date(1, at=mopex$date, format=fmt)
  lines(mopex$date, model$Q,  col="black", lwd=2)
  if(baseflow) lines(mopex$date, model$QB, col="blue", lwd=2)
  lines(mopex$date, mopex$discharge, col="red", lwd=2)
  legend("topright", c("obs", "sim"), col=c("red", "black"), lwd=2)
}
