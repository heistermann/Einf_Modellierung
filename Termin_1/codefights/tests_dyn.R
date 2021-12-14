# dynamisch erzeugt mit Uebungen_Korrekturen_erzeugen.R
#Tests zu Lektion Termin_1/codefights
testliste =list()

#Uebung echo
testliste[["echo"]]=list(tests=list(
test1 = list(n = 1L),
test2 = list(n = 2L),
test3 = list(n = 3L)
), muster_lsg=echo_muster_lsg)

#Uebung summe
testliste[["summe"]]=list(tests=list(
test1 = list(arg1 = 1L, arg2 = 2L),
test2 = list(arg1 = 2L, arg2 = 3L),
test3 = list(arg1 = 4L, arg2 = 4L)
), muster_lsg=summe_muster_lsg)

#Uebung max_maximum
testliste[["max_maximum"]]=list(tests=list(
test1 = list(v1 = 1:3, v2 = 1:4),
test2 = list(v1 = c(5L, 2L, 3L), v2 = 0L),
test3 = list(v1 = 1000L, v2 = 1:7)
), muster_lsg=max_maximum_muster_lsg)

#Uebung vektorteil
testliste[["vektorteil"]]=list(tests=list(
test1 = list(v = 1:3, start = 1L, n_e = 2L),
test2 = list(v = c(5L, 2L, 3L, 9L), start = 2L, n_e = 3L),
test3 = list(v = c(15L, 13L, 20L, 21L), start = 3L, n_e = 2L),
test4 = list(v = 1:20, start = 19L, n_e = 2L),
test5 = list(v = 1:3, start = 3L, n_e = 2L)
), muster_lsg=vektorteil_muster_lsg)

#Uebung draengler
testliste[["draengler"]]=list(tests=list(
test1 = list(reihe = c(1.8, 1.2, 1.7)),
test2 = list(reihe = c(1.1, 1.8, 1.2, 1.7, 1.3)),
test3 = list(reihe = c(1, 1, 0.8, 2, 0.9)),
test4 = list(reihe = c(1.4, 1.3, 1.2, 1.1, 0.9))
), muster_lsg=draengler_muster_lsg)

#Uebung hitzephasen
testliste[["hitzephasen"]]=list(tests=list(
test1 = list(zeitreihe_temp = c(19L, 23L, 24L, 25L, 19L, 21L), schwellenwert_temp = 20L, schwellenwert_laenge = 1L),
test2 = list(zeitreihe_temp = c(30L, 33L, 19L, 23L, 24L, 25L, 19L, 21L, 22L), schwellenwert_temp = 20L, schwellenwert_laenge = 3L),
test3 = list(zeitreihe_temp = c(30L, 33L, 27L, 15L, 30L, 31L, 33L, 20L, 32L, 33L), schwellenwert_temp = 20L, schwellenwert_laenge = 1L),
test4 = list(zeitreihe_temp = c(30L, 33L, 27L, 15L, 30L, 31L, 33L, 20L, 32L, 33L), schwellenwert_temp = 15L, schwellenwert_laenge = 2L),
test5 = list(zeitreihe_temp = c(30L, 33L, 27L, 15L, 30L, 31L, 33L, 20L, 32L, 33L), schwellenwert_temp = 40L, schwellenwert_laenge = 2L)
), muster_lsg=hitzephasen_muster_lsg)


################################################################################
