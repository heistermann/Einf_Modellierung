# dynamisch erzeugt mit Uebungen_Korrekturen_erzeugen.R
#Tests zu Lektion Termin_4/codefights
testliste =list()

#Uebung aschenbroedel
testliste[["aschenbroedel"]]=list(tests=list(
test1 = list(erbsen = c(0L, 1L, 0L, 1L, 0L, 1L), gut = 1L),
test2 = list(erbsen = c(0L, 0L, 1L, 1L, 1L, 1L), gut = 0L),
test3 = list(erbsen = c(0L, 1L, 1L, 1L, 1L, 1L), gut = 1L),
test4 = list(erbsen = c(1L, 1L, 1L, 1L, 0L, 0L), gut = 0L)
), muster_lsg=aschenbroedel_muster_lsg)

#Uebung Jahresniederschlag
testliste[["Jahresniederschlag"]]=list(tests=list(
test1 = list(niederschlaege = c(100L, 500L, 300L, 2500L), jahre = 1999:2002, jahr = 2000L),
test2 = list(niederschlaege = c(100L, 500L, 300L, 2500L), jahre = c(1999L, 2005L, 2001L, 2002L), jahr = 2005L),
test3 = list(niederschlaege = c(200L, 600L, 400L, 1500L), jahre = c(1997L, 2000L, 2001L, 2010L), jahr = 2010L),
test4 = list(niederschlaege = c(200L, 600L, 400L, 1500L), jahre = c(1997L, 2000L, 2001L, 2010L), jahr = 2000L)
), muster_lsg=jahresniederschlag_muster_lsg)

#Uebung Jahresniederschlagsmittel
testliste[["Jahresniederschlagsmittel"]]=list(tests=list(
test1 = list(niederschlaege = c(100L, 500L, 300L, 2500L, 200L, 600L), jahre = 1999:2004, anfang = 2000L, ende = 2002L),
test2 = list(niederschlaege = c(100L, 500L, 300L, 2500L, 200L, 600L), jahre = 1999:2004, anfang = 2002L, ende = 2004L),
test3 = list(niederschlaege = c(100L, 500L, 300L, 2500L, 200L, 600L), jahre = 1999:2004, anfang = 1999L, ende = 2002L),
test4 = list(niederschlaege = c(100L, 500L, 300L, 2500L, 200L, 600L), jahre = 1899:1904, anfang = 1900L, ende = 1903L)
), muster_lsg=jahresniederschlagsmittel_muster_lsg)

#Uebung gradtage
testliste[["gradtage"]]=list(tests=list(
test1 = list(temp = c(1L, 7L, 3L, 2L, 4L, 8L, 3L, 8L, 7L, 3L, 5L, 1L), erntereif = 10L),
test2 = list(temp = c(1L, 7L, 3L, 2L, 4L, 8L, 3L, 8L, 7L, 3L, 5L, 1L), erntereif = 20L),
test3 = list(temp = c(1L, 7L, 3L, 2L, 4L, 8L, 3L, 8L, 7L, 3L, 5L, 1L), erntereif = 25L),
test4 = list(temp = c(1L, 7L, 3L, 2L, 4L, 8L, 3L, 8L, 7L, 3L, 5L, 1L), erntereif = 40L)
), muster_lsg=gradtage_muster_lsg)

#Uebung curveNumber1
testliste[["curveNumber1"]]=list(tests=list(
test1 = list(lanu1 = "Freiflaeche", lanu2 = "hoher Wiesenanteil", boden = "B"),
test2 = list(lanu1 = "Wohngebiet", lanu2 = "30% bebaut", boden = "A"),
test3 = list(lanu1 = "Verkehrsflaeche", lanu2 = "Feldweg", boden = "A"),
test4 = list(lanu1 = "Freiflaeche", lanu2 = "mittlerer Wiesenanteil", boden = "D")
), muster_lsg=curvenumber1_muster_lsg)

#Uebung curveNumber2
testliste[["curveNumber2"]]=list(tests=list(
test1 = list(cn2 = 72L, precip = c(2L, 5L, 3L, 6L, 0L), vegetation = TRUE),
test2 = list(cn2 = 57L, precip = c(2L, 20L, 30L, 6L, 0L), vegetation = FALSE),
test3 = list(cn2 = 63L, precip = c(2L, 1L, 3L, 1L, 0L), vegetation = FALSE),
test4 = list(cn2 = 92L, precip = c(2L, 5L, 3L, 6L, 30L), vegetation = TRUE)
), muster_lsg=curvenumber2_muster_lsg)


################################################################################
