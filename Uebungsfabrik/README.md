# Übungen erzeugen

Anleitung:
1. Beliebig viele Uebungen im yaml-Format in jeder Lektion erzeugen (siehe Beispiel in 00_example)
- Achtung: Bei Umlauten muss die yaml-Datei als UTF-8 encodiert sein. Das geht z.B. mit Notepad++ -> Encodung -> Convert to UTF-8. Die richtige Anzahl an Leerzeichen am Zeilenanfang ist wichtig: Der yaml-Standard entfernt Zeilenümbrüche, sofern sie nicht in der Folgezeile mit Leerzeichen weitergehen. Der task_name einer Übung muss identisch mit dem Funktionsnamen sein, da sonst die automatische Kontrolle nicht funktioniert. Zeilen mit Werten (z.B. Input-Felder) nicht länger als 500 Zeichen machen.
2. Uebungen_Korrekturen_erzeugen.R im Ordner Uebungsfrabrik/R ausführen - In jedem Lektionsverzeichnis entstehen
- Uebungen_template.R   enthält die Uebungen. Veröffentlichen zur Bearbeitung.
- tests_dyn.R           enthält die Tests. Nicht veröffentlichen.
- musterloesungen_dyn.R enthält die Musterlösungen. Ggf. nach Abgabe veröffentlichen.
- teste_alles.RData     enthält die "codierten" Tests und Musterlösungen. Veröffentlichen zu Kontrolle.
3. Uebungen_template.R zur Bearbeitung veröffentlichen
4. kontroll_template.R (universell) und teste_alles.RData (lektionsspezifisch) zur Kontrolle veröffentlichen

nach Abgabetermin:
5. Abgabecode validieren mit ueberpruefe_Ergebniscodes.R (Anleitung dort)
6. ggf. musterloesungen_dyn.R veröffentlichen

**English**

Instruction:
1. Generate a number of excersises as yaml-files for each lesson in the respective folder (see example in 00_example)
- Attention: When using umlaute (ä, ö, ü, ß) the yaml-file has to be encoded as UTF-8. This can be done for example with Notepad++ -> Encoding -> Convert to UTF-8. The right number of blanks at the beginning of a line is important: The yaml-standard removes line breaks if they do not continue with blanks in the following line. The task_name of an excersise has to be identical to the name of the function, otherwise the automatic control won't work. Lines with values (e.g. input fields) should not be longer than 500 characters.
2. Run Uebungen_Korrekturen_erzeugen.R in the folder Uebungsfrabrik/R - In every directory of a lesson the following files are generated:
- Uebungen_template.R   contains the excersises. Publish before the coding workshop.
- tests_dyn.R           contains the tests. Do not publish.
- musterloesungen_dyn.R contains the sample solution. Publish maybe after submission.
- teste_alles.RData     contains the "encoded" tests and sample solutions. Publish for the automated control.
3. Publish Uebungen_template.R before the coding workshop
4. Publish kontroll_template.R (universal) and teste_alles.RData (lesson specific) for the automated control

after the deadline:
5. validate the submission codes with ueberpruefe_Ergebniscodes.R (instructions there)
6. potentially publish musterloesungen_dyn.R