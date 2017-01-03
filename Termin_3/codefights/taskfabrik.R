# Task 01
qualitatetskontrolle = function(precip, stoertage) {
  precip[stoertage] = -9999
  return(precip)
}

qualitatetskontrolle(c(1,2,3,4,5,6), c(1,2))
qualitatetskontrolle(c(1,2,3,4,5,6), c(4,5))
qualitatetskontrolle(c(1,2,3,4,5,6), c(1,3,6))


# Task 02
gebietsniederschlag = function(messungen) {
  return(0.5*messungen[1] + 0.3*messungen[2] + 0.2*messungen[3])
}

avg(c(1, 2, 3))
avg(c(5, 2, 3))
avg(c(15, 13, 20))


# Task 03
egl1 = function(precip, egl, area) {
  return(precip * area * egl / 3.6)
}

egl1(5, c(0.2, 0.5, 0.3), 3.6)
egl1(10, c(0.1, 0.6, 0.3), 7.2)
egl1(0, c(0.1, 0.6, 0.3), 10.8)


# Task 04
egl2 = function(precip, egl) {
  return(length(precip) + length(egl) - 1)
}

egl2(c(2, 6, 3, 2, 7, 4, 5), c(0.2, 0.5, 0.3))
egl2(c(2), c(0.1, 0.6, 0.2, 0.1))
egl2(c(2, 6, 3, 2, 7, 4, 5, 15), c(0.1, 0.6, 0.2, 0.1))


# Task 05
egl3 = function(precip, egl, area) {
  out = rep(0, length(precip) + length(egl) - 1)
  for (i in 1:length(precip)) {
    ix = i:(i+length(egl)-1)
    out[ix] = out[ix] + precip[i] * egl * area / 3.6
  }  
  return(out)
}

egl3(c(2, 6), c(0.2, 0.5, 0.3), 3.6)
egl3(c(3, 10, 5), c(0.1, 0.6, 0.2, 0.1), 7.2)
egl3(c(6, 3, 4), c(0.2, 0.5, 0.3), 10.8)

egl3(c(2, 4), c(0.2, 0.8), 7.2)
