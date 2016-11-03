#sicht alle R-Files in Unterverzeichnissen (Tiefe 1),
#erzeugt �bungsvorlagen, indem Passagen zwischen "#<" und "#>" gel�scht werden
#speichert Dateien in Unterorndern "Vorlagen"
#ACHTUNG! �berschreibt eventuell vorhandenen vorlagen-Dateien

subdirs=dir()

for (sd in subdirs)
{
  if (!file.info(sd)$isdir) next #skip files, only consider dirs
  r_files = dir(path = sd, pattern = "\\.[Rr]$")
  if (length(r_files) == 0) next #no files found
  for (r_file in r_files)
  {
    cont=scan(file = paste0(sd,"/",r_file), what = character(), sep = "\n")
    cont=paste0(cont, collapse = "\n")
    cont_prev=cont
    while (1) #repeated regexp replacement
    {
      cont=sub(cont, pattern = "(.*)#<.*#>(.*)$", repl="\\1#...hier erg�nzen...\\2")
      if (cont==cont_prev) break #all done
      cont_prev=cont
    }
    if (!file.exists(file = paste0(sd,"/Vorlagen")))
      dir.create(path =  paste0(sd,"/Vorlagen"))
    cat(file = paste0(sd,"/Vorlagen/", r_file), cont)
    print(paste0(r_file," erzeugt."))
  }
}