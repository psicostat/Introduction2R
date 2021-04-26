#===============================#
#====  Analisi Attaccamento ====#
#===============================#

#---- settings -----

rm(list = ls())

# install.packages("readxl") #  pacchetto per importare i dati da excel
# library(readxl)

#----  import-data ----

my_data <- readxl::read_excel("Data/data-attachment.xls")
my_data <- as.data.frame(my_data)

class(my_data)

# Altre funzioni per importare
# csv_data <- read.csv2("Data/data-attachment.csv", header = TRUE, sep = ",") # per i file .csv
# load("Data/...")  # per i file .rda


# Descrizione dataset

str(my_data)

# Nel presente dataset sono riportati parte dei dati riguardanti un vero proggetto di ricerca.
# In questo studio è stata valutata nei bambini del 3° e 4° anno di scuola primaria la relazione tra:
# 1) attaccamento verso la madre
# 2) status socio-economico
# 3) problemi internalizzanti ed esternaizzanti

# Nel dataset abbiamo le seguenti variabili
# id : codice identificativo  di ogni bambino
# escludere : bambini che per i criteri dello studio non sono da includere nelle analisi finali (1=escludere; 0=includere)
# raccolta : i dati sono stati raccolti in due giornate diverse (1=raccolta A; 2=raccolta B )
# consenso : bambini che hanno ricevuto il consenso dei genitori per il trattamento dei dati (1=si; 0=no)
# presenza : bambini presenti il giorno della raccolta dati (1=si; 0=no)
# classe : classe frequentata dal bambino (3°anno o 4°anno scuole primarie)
# genere : genere del bambino (0=M; 1=F)
# mesi : età del bambio in mesi
# fas* (da 1 a 4): item del questionario sullo status socio-economico
# ssm* (da 1 a 15): item del questionario sicurezza materna
# sdq* (da 1 a 25): idem del questionario problemi internalizzanti e esternalizzanti

#----- munging data ------

str(my_data)

# Rendo fattori l evariabili categoriali
for(i in c("id", "escludere", "raccolta", "consenso", "presenza", "classe", "genere")){
  my_data[, i] <- factor(my_data[ ,i])
}

# ridefinisco i livelli della variabile genere
str(my_data$genere)
levels(my_data$genere) <- c("M", "F")

# creo la variabile eta dove indico l'eta in anni
my_data$eta <- my_data$mesi/12

# Selezioni solo i soggetti senza NA
summary(my_data)
my_data$fas1 == "NA" # metodo sbagliato
is.na(my_data$fas1) # metodo corretto

my_data$id[is.na(my_data$fas1)]

?complete.cases # seleziona soggetti che non hanno NA

data_complete <- my_data[complete.cases(my_data), ]
summary(data_complete)

# Salvo i risultati
save(data_complete, file = "Data/data_complete.rda")

#-----

load("Data/data_complete.rda")
str(data_complete)
#-----



