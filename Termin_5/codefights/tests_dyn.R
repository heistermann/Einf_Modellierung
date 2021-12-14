# dynamisch erzeugt mit Uebungen_Korrekturen_erzeugen.R
#Tests zu Lektion Termin_5/codefights
testliste =list()

#Uebung welchertag
testliste[["welchertag"]]=list(tests=list(
test1 = list(datum = "2016-11-15"),
test2 = list(datum = "2000-10-30"),
test3 = list(datum = "1999-05-10"),
test4 = list(datum = "1999-01-31")
), muster_lsg=welchertag_muster_lsg)

#Uebung ausschlafen
testliste[["ausschlafen"]]=list(tests=list(
test1 = list(datum = "1944-05-03"),
test2 = list(datum = "1988-06-11"),
test3 = list(datum = "1915-08-16"),
test4 = list(datum = "2023-12-27")
), muster_lsg=ausschlafen_muster_lsg)

#Uebung vegetationsperiode
testliste[["vegetationsperiode"]]=list(tests=list(
test1 = list(datum = "1944-05-03", start = 90L, ende = 300L),
test2 = list(datum = "2025-02-15", start = 132L, ende = 196L),
test3 = list(datum = "2015-10-15", start = 132L, ende = 196L),
test4 = list(datum = "1993-07-23", start = 101L, ende = 290L)
), muster_lsg=vegetationsperiode_muster_lsg)

#Uebung ereignisdauer
testliste[["ereignisdauer"]]=list(tests=list(
test1 = list(start = "2011-03-05 09:02:34", ende = "2011-03-05 16:40:43"),
test2 = list(start = "1999-04-06 20:00:00", ende = "1999-04-08 17:40:00"),
test3 = list(start = "2023-04-06 19:30:00", ende = "2023-05-08 17:40:00"),
test4 = list(start = "2011-03-05 10:02:00", ende = "2011-03-05 16:40:43")
), muster_lsg=ereignisdauer_muster_lsg)

#Uebung niederschlagsintensitaet
testliste[["niederschlagsintensitaet"]]=list(tests=list(
test1 = list(start = "2011-03-05 09:02:00", ende = "2011-03-05 16:40:00", volumen = 101L, radius = 5.64),
test2 = list(start = "2012-03-06 10:02:34", ende = "2012-03-06 13:40:43", volumen = 206L, radius = 5.64),
test3 = list(start = "2011-03-05 09:02:00", ende = "2011-03-05 16:40:00", volumen = 300L, radius = 11.3),
test4 = list(start = "2012-03-06 10:02:34", ende = "2012-03-06 13:40:43", volumen = 563L, radius = 5.64)
), muster_lsg=niederschlagsintensitaet_muster_lsg)


################################################################################
