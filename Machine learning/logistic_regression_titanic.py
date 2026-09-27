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


train = pd.read_csv("C:\\Users\\HP\\OneDrive\\Documents\\DataMites\\Machine learning\\titanic_train (1) (3).csv")
print(train.head())
print("-"*60)
print(train.tail)
print("-"*60)
print(train.info())
print("-"*60)
print(train.describe())
print("-"*60)
print(train.columns)
print("-"*60)
print(train.shape)
print("-"*60)
print("\nMissing values before cleaning: ")
print(train.isnull().sum())
print("-"*60)

sns.heatmap(
    train.isnull(),
    yticklabels=False, # remove labels from The y-axis
    cbar=False, # removes color from the side of heatmap
    cmap='viridis'
)
plt.show()
print("-"*60)

# Function to replace the null age values by average
def impute_age(row):
    if pd.isnull(row['Age']):
        if row['Pclass'] == 1:  # pclass ke andar agar age null he to neeche wali vlaue de do
            return 37
        elif row['Pclass'] == 2:
            return 29
        else:
            return 24
    else:
        return row['Age']

# applt the function into the dataset
train['Age'] =   train.apply(impute_age, axis=1)
print("-"*60)

# remove unwanted columns
train.drop('Cabin', axis=1, inplace=True)
# remove null values
train.dropna(inplace=True)
print("-"*60)

# converting Gender into numeric data
sex = pd.get_dummies(train['Sex'], drop_first=True)  # 0--> Female  1--> Male
sex = sex.astype(int)

# Converting Embarks into numeric data
embark = pd.get_dummies(train['Embarked'], drop_first=True)
embark = embark.astype(int)

# attenching the dummy data into original data
train = pd.concat([train, sex, embark], axis=1)

# removing the old columns
train.drop(['Sex', 'Embarked', 'Name', 'Ticket'], axis=1, inplace=True)
train.drop('PassengerId', axis=1, inplace=True)
print("-"*60)

print("\nCleaned Data: ")
print(train.head())
print("-"*60)

sns.heatmap(
    train.isnull(),
    yticklabels=False, # remove labels from The y-axis
    cbar=False, # removes color from the side of heatmap
    cmap='viridis'
)
plt.show()
print("-"*60)

# creating Features and Labels
X = train.drop('Survived', axis=1) # --> input columns
y = train['Survived'] # --> target column
print("-"*60)

# training and testing splitting
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=40) # for reproducibility
print("-"*60)

# model apply
logmodel = LogisticRegression(max_iter=200) # 200 bar 70% data per training karna
logmodel.fit(X_train, y_train)
print("-"*60)

# Predcitions
predictions = logmodel.predict(X_test)
print("-"*60)

# accuracy
print("\nAccuracy: ", accuracy_score(y_test, predictions)) # actual,  predicted
print("-"*60)

# Confusion Matrix
cm = confusion_matrix(y_test, predictions)
print("\nConfusion Matrix: ", cm)
print("-"*60)

# classification report
print("\nClassififcation Report:", classification_report(y_test, predictions))
print("-"*60)

# confusion matrix with graph
sns.heatmap(cm, annot=True, fmt='d') # display interger value
plt.xlabel('Predicted')
plt.ylabel('Actual')
plt.show()

print("-"*60)

example_p_details = pd.DataFrame(
    [[1, 27, 5, 1, 10, 1, 1, 0]],
    columns=X.columns
)
print("\nExample Passengar: ")
print(example_p_details)
print("-"*60)

# chances of survival
print("Prediction (0 = Margyi), (1 = Bachgi) : ", logmodel.predict(example_p_details))
print("-"*60)
print("Prediction Probability: ", logmodel.predict_proba(example_p_details))
