## Dataset --> Adverstising

## S:1 -> importing the libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import (
    classification_report,  # gives Precision, Recall, F1-Score, Support
    confusion_matrix,       # Shows correct and incorrect predictions
    accuracy_score          # gives overall accuracy of the model
)

## S:2 -> Importing the dataset
dataset = pd.read_csv("C:\\Users\\HP\\OneDrive\\Documents\\DataMites\\Machine learning\\Advertising.csv")

## S:3 -> Exploratory Data Analysis
print("Dataset Head:")
print(dataset.head())
print("-"*60)
print("Dataset Tail:")
print(dataset.tail())
print("-"*60)
print("Dataset Info:")
print(dataset.info())
print("-"*60)
print("Dataset Description :")
print(dataset.describe())
print("-"*60)
print("Dataset Columns:")
print(dataset.columns)
print("-"*60)
print("Dataset Shape:")
print(dataset.shape)
print("-"*60)


## S:4 -> Checking for missing values
print("\nMissing values : ")
print(dataset.isnull().sum())
print("-"*60)

## S:5 -> Visualizing missing values
sns.heatmap(
    dataset.isnull(),
    yticklabels=False, # remove labels from The y-axis
    cbar=False, # removes color from the side of heatmap
    cmap='viridis'
)
plt.title(" Heatmap")
plt.show()

## S:6 -> Feature Selection and Data Preprocessing 
X = dataset[['Daily Time Spent on Site','Age','Area Income','Daily Internet Usage','Male']]
y = dataset['Clicked on Ad']

## Train-Test Split 
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

## S:7 -> Model Training 
#### Model Initialization
logmodel = LogisticRegression()
## Model Fitting
logmodel.fit(X_train,y_train)

## S:8 -> Model Prediction
predictions = logmodel.predict(X_test)

## S:9 - > Model Evaluation
from sklearn.metrics import classification_report,confusion_matrix,accuracy_score
print("Confusion Matrix :")
print(confusion_matrix(y_test,predictions))
print("-"*60)
print("Classification Report :")
print(classification_report(y_test,predictions))
print("-"*60)
print("Accuracy Score :")
print(accuracy_score(y_test,predictions))
print("-"*60)

## S:10 -> Visualizing Confusion Matrix
# Confusion Matrix with Graph
cm = confusion_matrix(y_test, predictions)
sns.heatmap(cm, annot=True , fmt="d") # Display integer value
plt.xlabel("Predicted")
plt.ylabel("Actual")
plt.title("Confusion Matrix")
plt.show()
