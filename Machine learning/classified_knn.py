import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import classification_report


df = pd.read_csv(
    "C:\\Users\\DANISH\\PycharmProjects\\Machine_learning\\Classified Data",
    index_col=0
)

print(df.head())
print("-"*60)

# Knn --> Model init...
scaler = StandardScaler()

# Getting data into a single scale
scaler.fit(
    df.drop("TARGET CLASS", axis=1)
)

# transform()
scaled_features = scaler.transform(
    df.drop("TARGET CLASS", axis=1)
)
print("\nScaled Features:\n")
print(scaled_features)

print("-"*60)

scaled_df = pd.DataFrame(
    scaled_features,
    columns=df.columns[:-1]
)
print("\nScaled DataFrame:\n")
print(scaled_df.head())

# X --> Input --> Idependant variable
# y --> dependent variable

X = scaled_df
y = df["TARGET CLASS"]

X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    test_size=0.30,
    random_state=101
)

knn = KNeighborsClassifier(
    n_neighbors=1
)

knn.fit(
    X_train,
    y_train
)

pred = knn.predict(
    X_test
)

from sklearn.metrics import (
    confusion_matrix,
)
print("-"*60)
print("Confusion Matrix (k = 1):\n ")
print(confusion_matrix(y_test, pred))


print("\nClassification Report: ")
print(classification_report(y_test, pred))


print("-"*60)

error_rate = []

for i in range(1, 40):

    knn = KNeighborsClassifier(
        n_neighbors=i
    )

    knn.fit(
        X_train,
        y_train
    )

    pred_i = knn.predict(
        X_test
    )

    # error --> when actual value != predicted value
    error_rate.append(
        np.mean(pred_i != y_test)
    )


print(error_rate)

plt.figure(
    figsize=(10, 6)
)

plt.plot(
    range(1, 40),
    error_rate,
    color="Blue",
    linestyle="dashed",
    marker="o",
    markerfacecolor="red",
    markersize=8
)
plt.title(
    "Error Rate vs K - value"
)

plt.xlabel("K")
plt.ylabel("Error Rate")
plt.grid(True)
plt.show()

print("-"*60)

knn = KNeighborsClassifier(
    n_neighbors=38
)
knn.fit(X_train, y_train)
pred = knn.predict(X_test)
print("\nConfusion Matrix (k = 38): ")
print(confusion_matrix(y_test, pred))

print("-"*60)

print("\nClassification Report: ")
print(classification_report(y_test, pred))