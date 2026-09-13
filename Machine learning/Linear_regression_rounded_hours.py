#Datasete--> rounded_hours_student_scores

## Step 1 --> Importing Libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

## ML Libraries --> Scikit learn --> Model / function / metrics / classes
from sklearn.model_selection import train_test_split ## Used for data splitting into trainning and testing 
from sklearn.linear_model import LinearRegression
from sklearn import metrics

## Step 2 --> Load the Dataset
df = pd.read_csv("C:\\Users\\HP\\OneDrive\\Documents\\DataMites\\Machine learning\\rounded_hours_student_scores.csv")

## Step 3 --> Data Exploration 
print(df.head())
print("-"*60)
print(df.tail())
print("-"*60)
print(df.describe()) ## Mean \ median \ Std Derivation 
print("-"*60)
print(df.info()) ## Columns \ not null
print("-"*60)
print(df.columns)


## step 4 --> Data Visualization 

# Pair Plot
sns.pairplot(df)
plt.title("Pair Plot")
plt.show()

## histogram
sns.histplot(df['Scores'], kde = True)
plt.title("Histogram")
plt.show()

## Heatmap
sns.heatmap(df.corr(),annot = True , cmap = "coolwarm") ## Coloring
plt.title("Heatmap")
plt.show()

## Step 5 --> Preparing data for training
X = df.drop(['Scores'],axis = 1) ## Independent variable / features / input
Y = df["Scores"] ## Dependent variable / label / target / output

## Step 6 --> Data divide into training (more data usually 70%) and testing(30%)
X_train ,X_test , Y_train , Y_test = train_test_split(X,Y,test_size = 0.3,random_state = 101) ## Random_state = Reproducibility

## Step 7 ---> Model Initialization
lm = LinearRegression()

## Step 8 -- > Model Training , fitting the model with training data
lm.fit(X_train,Y_train) ## Only training data

# Linear regression formula --> Y = mX + C  --> m = Slop  C = intercept

print("Slop :",lm.coef_)
print("Intercept : ",lm.intercept_)
print("-"*60)

## step 9 --> Model Prediction
predictions = lm.predict(X_test)
print("Sample Predcition : ",predictions[:10])

## Step 10 --> Model Evaluation
print("Mean Absolute Error : ",metrics.mean_absolute_error(Y_test,predictions))
print("Mean Squared Error : ",metrics.mean_squared_error(Y_test,predictions))
print("Root Mean Squared Error : ",np.sqrt(metrics.mean_squared_error(Y_test,predictions)))

## Step 11 --> Model Visualization
plt.scatter(Y_test,predictions)
plt.xlabel("Y test")
plt.ylabel("Predictions")
plt.title("Actual vs Predicted")
plt.show()

## Step 12 --> Model Visualization with Regression Line
plt.scatter(X,Y)
plt.plot(X, lm.predict(X), color = "red")
plt.title("Regression Line")
plt.show()