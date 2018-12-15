data("USArrests")
head(USArrests)

#### Scaling 
USArrestsscaled<-scale(USArrests)
################# K-means ####################
k4<-kmeans(USArrestsscaled, centers=4)
k4$tot.withinss

k5<-kmeans(USArrestsscaled, centers=5)
k5$tot.withinss

k6<-kmeans(USArrestsscaled, centers=6)
k6$tot.withinss

# Plot function for within groups sum of squares by number of clusters
wssplot <- function(data, nc=15, seed2=1234) {
  wss <- array(dim=c(nc))
  for (i in 2:nc){
    set.seed(seed2)
    km <- kmeans(data, centers=i)
    wss[i] <- km$tot.withinss
  }
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")
}

wssplot(USArrestsscaled)

k4<-kmeans(USArrestsscaled, centers=4)

k4clust <- data.frame(USArrests , k4$cluster)

pairs(USArrests,col= k4$cluster)

library(ggfortify)
autoplot(kmeans(USArrestsscaled, 4), data = USArrests,
         label = TRUE, label.size = 4)
