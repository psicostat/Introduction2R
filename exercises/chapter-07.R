##########################
####    Capitolo 7    ####
##########################

#---------  Creazione di vettori  -----

# 1
x<-c(4,6,12,34,8)

# 2
y<-seq(from = 2, to = 24, by=2)

# 3
z<-seq(from = 14, by=7,  length.out = 10)

# 4
s<-rep(c("A","B","C"), times=4)

# 5
t<-rep(c("A","B","C"), each=4)

# 6
rep(rep(c("foo", "bar"), each = 2),times = 2)

#---------- Selezione di vettori  ------

# 1
x[c(2,3,5)]

# 2
y[y<13 | y>19]

# 3
z[z>24 & z<50]

# 4
z[-c(3,5)]

# 5
s[s=="A"]

# 6
t[t!="B"]

#---------  Operazioni tra vettori ------

# 1
j<-c(x,z)

# 2
j<-j[-(13:15)]
length(j)==length(y)

# 3
y+j

# 4
z*3

# 5
y[1:10]*z


#----
