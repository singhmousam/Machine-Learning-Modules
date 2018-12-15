import numpy as np
import pandas as pd
USArrests = pd.read_csv("-----path to file-------/USArrests.csv",index_col=0)
USArrests.head()

from sklearn.preprocessing import StandardScaler

# Create scaler: scaler
scaler = StandardScaler()
USArrestsScaled = scaler.fit_transform(USArrests)
# Import KMeans
from sklearn.cluster import KMeans

# Create a KMeans instance with clusters: model
model = KMeans(n_clusters=3)

# Fit model to points
model.fit(USArrestsScaled)
# model.n_init
# Determine the cluster labels of new_points: labels
labels = model.predict(USArrestsScaled)

# Print cluster labels of new_points
print(labels)

clusterID = pd.DataFrame(labels)
clusteredData = pd.concat([USArrests.reset_index(), clusterID], axis=1)

# Variation
print(model.inertia_)

clustNos = [2, 3, 4, 5, 6, 7, 8, 9, 10]
Inertia = []

for i in clustNos:
    model = KMeans(n_clusters=i)
    model.fit(USArrestsScaled)
    Inertia.append(model.inertia_)

# Import pyplot
import matplotlib.pyplot as plt

plt.plot(clustNos, Inertia, '-o')
plt.xlabel('Number of clusters, k')
plt.ylabel('Inertia')
plt.xticks(clustNos)
plt.show()

clusterID = pd.DataFrame(labels)
clusteredData = pd.concat([USArrests.reset_index(drop=True), clusterID], axis=1)

## Scaling
# Perform the necessary imports
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import KMeans

# Create scaler: scaler
scaler = StandardScaler()

# Create KMeans instance: kmeans
kmeans = KMeans(n_clusters=3)

# Create pipeline: pipeline
pipeline = make_pipeline(scaler, kmeans)

# Fit the pipeline to samples
pipeline.fit(USArrests)

# Calculate the cluster labels: labels
labels = pipeline.predict(USArrests)

# Display ct
print(labels)
