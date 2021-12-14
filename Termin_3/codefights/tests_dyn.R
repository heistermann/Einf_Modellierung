# dynamisch erzeugt mit Uebungen_Korrekturen_erzeugen.R
#Tests zu Lektion Termin_3/codefights
testliste =list()

#Uebung qualitaetskontrolle
testliste[["qualitaetskontrolle"]]=list(tests=list(
test1 = list(precip = list(20L, 50L, 0.3, 0L, 0.7, 1L), stoertage = 1:2),
test2 = list(precip = 1:6, stoertage = 4:5),
test3 = list(precip = 1:6, stoertage = c(1L, 3L, 6L))
), muster_lsg=qualitaetskontrolle_muster_lsg)

#Uebung gebietsniederschlag
testliste[["gebietsniederschlag"]]=list(tests=list(
test1 = list(messungen = 1L, messungen = 2L, messungen = 3L),
test2 = list(messungen = 5L, messungen = 2L, messungen = 3L),
test3 = list(messungen = 15L, messungen = 13L, messungen = 20L)
), muster_lsg=gebietsniederschlag_muster_lsg)

#Uebung egl1
testliste[["egl1"]]=list(tests=list(
test1 = list(precip = 5L, egl = c(0.2, 0.5, 0.3), area = 3.6),
test2 = list(precip = 10L, egl = c(0.1, 0.6, 0.3), area = 7.2),
test3 = list(precip = 0L, egl = c(0.1, 0.6, 0.3), area = 10.8)
), muster_lsg=egl1_muster_lsg)

#Uebung egl2
testliste[["egl2"]]=list(tests=list(
test1 = list(precip = c(2L, 6L, 3L, 2L, 7L, 4L, 5L), egl = c(0.2, 0.5, 0.3)),
test2 = list(precip = 2L, egl = c(0.1, 0.6, 0.2, 0.1)),
test3 = list(precip = c(2L, 6L, 3L, 2L, 7L, 4L, 5L, 15L), egl = c(0.1, 0.6, 0.2, 0.1))
), muster_lsg=egl2_muster_lsg)

#Uebung egl3
testliste[["egl3"]]=list(tests=list(
test1 = list(precip = c(2L, 6L), egl = c(0.2, 0.5, 0.3), area = 3.6),
test2 = list(precip = c(3L, 10L, 5L), egl = c(0.1, 0.6, 0.2, 0.1), area = 7.2),
test3 = list(precip = c(6L, 3L, 4L), egl = c(0.2, 0.5, 0.3), area = 10.8)
), muster_lsg=egl3_muster_lsg)


################################################################################
