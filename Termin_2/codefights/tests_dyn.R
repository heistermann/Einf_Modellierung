# dynamisch erzeugt mit Uebungen_Korrekturen_erzeugen.R
#Tests zu Lektion Termin_2/codefights
testliste =list()

#Uebung schwimmbad
testliste[["schwimmbad"]]=list(tests=list(
test1 = list(n0 = 2L, r = 0.1, n_grenzwert = 100L),
test2 = list(n0 = 50L, r = 0.01, n_grenzwert = 200L),
test3 = list(n0 = 5L, r = 0.001, n_grenzwert = 1000L),
test4 = list(n0 = 10L, r = 1.2, n_grenzwert = 100L),
test5 = list(n0 = 200L, r = 0.1, n_grenzwert = 100L)
), muster_lsg=schwimmbad_muster_lsg)

#Uebung schwimmbad2
testliste[["schwimmbad2"]]=list(tests=list(
test1 = list(n0 = 2L, r = 0.1, n_grenzwert = 100L, r_chlor = -0.1),
test2 = list(n0 = 50L, r = 0.01, n_grenzwert = 200L, r_chlor = 0L),
test3 = list(n0 = 5L, r = 0.001, n_grenzwert = 1000L, r_chlor = -0.1),
test4 = list(n0 = 10L, r = 1.2, n_grenzwert = 100L, r_chlor = 0.3),
test5 = list(n0 = 200L, r = 0.1, n_grenzwert = 100L, r_chlor = 0.01)
), muster_lsg=schwimmbad2_muster_lsg)

#Uebung wuerfel
testliste[["wuerfel"]]=list(tests=list(
test1 = list(n_wuerfe = 2L, seed = 1L),
test2 = list(n_wuerfe = 5L, seed = 3L),
test3 = list(n_wuerfe = 7L, seed = 0L),
test4 = list(n_wuerfe = 3L, seed = 1000L)
), muster_lsg=wuerfel_muster_lsg)

#Uebung wuerfel_gezinkt
testliste[["wuerfel_gezinkt"]]=list(tests=list(
test1 = list(wurf = 1L),
test2 = list(wurf = 6L, wurf = 6L),
test3 = list(wurf = 1L, wurf = 2L, wurf = 3L, wurf = 4L),
test4 = list(wurf = 1L, wurf = 1L, wurf = 1L, wurf = 1L, wurf = 1L)
), muster_lsg=wuerfel_gezinkt_muster_lsg)

#Uebung interpolation
testliste[["interpolation"]]=list(tests=list(
test1 = list(t_mess = 0:1, x_mess = c(0L, 30L), t_approx = list(0.5, 1L)),
test2 = list(t_mess = list(0L, 1L, 2.5), x_mess = c(0L, 30L, 31L), t_approx = list(0.5, 1L, 1.1)),
test3 = list(t_mess = c(2L, 4L, 5L, 8L), x_mess = c(1L, 2L, 5L, 10L), t_approx = list(2.6, 2.6, 3L))
), muster_lsg=interpolation_muster_lsg)


################################################################################
