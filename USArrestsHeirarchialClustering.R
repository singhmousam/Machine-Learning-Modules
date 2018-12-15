data("USArrests")
head(USArrests)


#### Scaling 
USArrestsscaled<-scale(USArrests)
d <- dist(USArrestsscaled)
fit.average <- hclust(d, method="average")


# Finding the optimal number of clusters
library(NbClust)
nc <- NbClust(USArrestsscaled, distance="euclidean",
              min.nc=2, max.nc=15, method="average")

par(mfrow=c(1,1))
plot(fit.average, main="Average Linkage Clustering",hang = -1)
rect.hclust(fit.average, k=2)

# Obtaining the final cluster solution
clusterID <- cutree(fit.average, k=2)
# Attaching ClusterID to observations
USArrestsClust <- data.frame(USArrests , clusterID)

plot(fit.average,main="Average Linkage Clustering\n3 Cluster Solution")
rect.hclust(fit.average, k=2)

########### Coloured Dendrogram ##########
library(colorhcplot)
colorhcplot(fit.average,fac = factor(clusterID))


################### Subsetting clustered data #################
ArrestClust<-subset(USArrestsClust,USArrestsClust$clusterID==2)
