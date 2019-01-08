#Load arules library
library(arules)

#Load data using read.transactions 
categories<- read.transactions('categories.txt', format= 'basket', sep=';')

#Using eclat to find length 1 frequent items
part1<- eclat(categories, parameter= list(sup=0.01, maxlen=1))

#Writing to file
write(part1, file= 'patterns-part1.txt', sep=';', quote= FALSE)

#Apriori to find frequent itemsets, support 0.01, minlen= 1 and target is frequent itemsets
part3<- apriori(categories, parameter = list(sup=0.01, minlen=1, target='frequent itemsets'))
write(part3, file='patterns-part2.txt', sep=';', quote= FALSE)