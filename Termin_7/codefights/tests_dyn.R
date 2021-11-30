# dynamisch erzeugt mit Uebungen_Korrekturen_erzeugen.R
#Tests zu Lektion Termin_7/codefights
testliste =list()

#Uebung namenseintrag
testliste[["namenseintrag"]]=list(tests=list(
test1 = list(),
test2 = list(),
test3 = list(),
test4 = list()
), muster_lsg=namenseintrag_muster_lsg)

#Uebung umkehren
testliste[["umkehren"]]=list(tests=list(
test1 = list(),
test2 = list(),
test3 = list(),
test4 = list()
), muster_lsg=umkehren_muster_lsg)

#Uebung namenseintrag
testliste[["namenseintrag"]]=list(tests=list(
test1 = list(),
test2 = list(),
test3 = list(),
test4 = list()
), muster_lsg=namenseintrag_muster_lsg)

#Uebung Schach
testliste[["Schach"]]=list(tests=list(
test1 = list(feld = "b7"),
test2 = list(feld = "d8"),
test3 = list(feld = "a2")
), muster_lsg=schach_muster_lsg)

#Uebung afd_rede
testliste[["afd_rede"]]=list(tests=list(
test1 = list(text = "Denk ich an Deutschland in der Nacht, bin ich um den Schlaf gebracht", abstand = 4L, schwort = "Patrioten"),
test2 = list(text = "Für jedes komplexe Problem gibt es eine Lösung, die einfach, einleuchtend und falsch ist", abstand = 1L, schwort = "Außengrenze"),
test3 = list(text = "Drei Chinesen mit nem Kontrabass saßen auf der Straße", abstand = 2L, schwort = "Sauerkraut")
), muster_lsg=afd_rede_muster_lsg)

#Uebung T7_02_Sieb
testliste[["T7_02_Sieb"]]=list(tests=list(
test1 = list(bis = 10L),
test2 = list(bis = 30L),
test3 = list(bis = 50L)
), muster_lsg=t7_02_sieb_muster_lsg)


################################################################################
