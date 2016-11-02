# Quickstart command-collection for R
# CAWA-Summerschool 2015, Almaty
# Till Francke

# The #-sign starts a comment. Everything following it is ignored. 

# simple assignment
  x <- 3

# just the same (but not liked by the true R-purist)
  x = 3
  
# print value of x
  x
  print(x)

# do some math
  y <- x^2 + 3
  y

# vectors (a.k.a. "arrays")
  z <- 1:5
  z
  
  q <- seq(from = 2, to = 10, by = 2)
  q

  z[1] <- 4 #set first element in vector
  
  both <- c(z,q) #concatenate vectors
  both

# vector math
  z <- z + 1 #add 1 to all elements in z
  
  v <- q + z #add single elements of q and z to each other
  v
  
  sum(z)   #sum     of all elements
  mean(z)  #mean    of all elements
  max(z)   #maximum of all elements
  ?max     #help is always at hand (or put cursor at command and press F1)

#plotting
  plot (q,z) # simple point plot
  
  plot (q,v, type = "l") # plot lines, previous plot is overwritten
  lines(q,4*sqrt(q), col = "red") #add lines to previous plot
  legend("topleft", legend = c("This is v","This is some sqrt"), col = c("black", "red"), lty = 1)
  

# file i/o (reading and writing data)
  #change working directory first (e.g. via "Session" <- "Set working directory" or using the command "setwd()" )
  imported_data <- read.table(file = "data_table.txt", header = TRUE) #import a text-file having column names
  imported_data
  
  imported_data <- read.table(file = "data_table.txt", header = TRUE, sep = "\t", dec = ".", nrows = 4) #you may also specify lots of other settings
  imported_data #this is called a "data frame", basically a table with different kind of data
  
  imported_data$Rknowledge #access single column of table
  imported_data[,1] #same, but different
  
  imported_data$Rknowledge[2] #access single entry in first column of table
  imported_data[2,1] #same, but different
  
  imported_data$Rknowledge = NULL #delete column
  imported_data$Rdesire = "high"  #set new column
  
  plot(imported_data$knowledge_index, imported_data$happyness_index) #plot contents of dataframe
  
  write.table(file = "output.csv", x = imported_data, sep = ";") #export data using ";" as field separator
  
#program control structures
  animal <- "cat"
  
  if (animal == "cat")          #use "==", not "=" for comparison
    print("meeouw!") else
    print("I am not a cat.")
        
  for (counter in 1:10)        #loop with predetermined number of iterations
    print(counter)
  
  countdown <- 10
  while (countdown > 0)        #loop with undetermined number of iterations
  {                            # use curly braces {} to combine multiple commands within the loop
    print(countdown)
    countdown <- countdown - 1
  }
  print("ignition!")
  
  
  
  