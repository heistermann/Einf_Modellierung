#Sucht alle R-Files in Unterverzeichnissen (Tiefe 1),
#erzeugt Übungsvorlagen, indem Passagen zwischen "#<" und "#>" gelöscht werden
#speichert Dateien in Unterorndern "Vorlagen"
#ACHTUNG! Überschreibt eventuell vorhandenen vorlagen-Dateien

subdirs=dir()

for (sd in subdirs)
{
  if (!file.info(sd)$isdir) next #skip files, only consider dirs
  r_files = dir(path = paste0(sd,"/code"), pattern = "\\.[Rr]$")
  if (length(r_files) == 0) next #no files found
  for (r_file in r_files)
  {
    cont=scan(file = paste0(sd,"/code/",r_file), what = character(), sep = "\n")
    cont=paste0(cont, collapse = "\n")
    cont_prev=cont
    while (1) #repeated regexp replacement
    {
      cont=sub(cont, pattern = "(.*)#<.*#>(.*)$", repl="\\1#...hier ergänzen...\\2")
      cont=sub(cont, pattern = "#![^\n]*", repl="\n")
      if (cont==cont_prev) break #all done
      cont_prev=cont
    }
    if (!file.exists(file = paste0(sd,"/Vorlagen")))
      dir.create(path =  paste0(sd,"/Vorlagen"))
    cat(file = paste0(sd,"/Vorlagen/", r_file), cont)
    print(paste0(r_file," erzeugt."))
  }
}