#############################################################################################################
# Free spark book
#https://therinspark.com/index.html
#############################################################################################################
library(fs)         #A cross-platform interface to file system operations, built on top of the 'libuv' C library.
library(tidyverse)
library(DBI)
#install.packages("sparklyr")
library(sparklyr)
#############################################################################################################
############################################################################################################## Check java version
# Install at least java 8 (probably already have it )
################################################################
# Locations 
# C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Java
# C:\Windows\System32
#C:\Program Files (x86)\Common Files\Oracle\Java\javapath
system("java -version")
Sys.which("java")

#Sys.setenv(JAVA_HOME = " C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Java\\java.exe")
#Sys.setenv(JAVA_HOME = "C:\\Users\\btindol\\OneDrive - Stryker\\Documents\\R\\R-4.1.0\\library\\sparklyr\\java\\sparklyr-2.3-2.11.jar")
Sys.setenv(JAVA_HOME = "C:\\JavaSDK\\bin")
######################################
# Which versions of spark are available
spark_available_versions()
######################################
#lets install the version in the book tutorial for now
spark_install("2.3")

######################################
#Check the version we have installed 
spark_installed_versions()

######################################
######################################
#If you want to uninstall a particualar version 

spark_uninstall(version = "3.1.1", hadoop = "3.2")
#####################################
######################################
?spark_connect
######################
# Configuration (Optional way of doing it)
conf <- list()
conf$`sparklyr.cores.local`<- 4               # use all 6 cores on the machine (Go to task manager/ performance/CPU to find out how many cores your computer has)
conf$`sparklyr.shell.driver-memory` <- "8G"  # search system informatin then scroll down to installed pysical memory (i only have 16 so half that might be appropriate )
conf$spark.memory.fraction <- 0.9             # saying you only want to use 90% of the allocated 16 gig
sc <- spark_connect(master = "local", version = "2.3",config=conf)
######################

sc <- spark_connect(master = "local", version = "2.3")
