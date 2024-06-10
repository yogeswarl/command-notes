# scikit-learn
## Naming Convention
- Feature = predictor Variable = independent Variable = input
- Target = response Variable = dependent Variable = output

## Requirements
- No Missing Values.
- Data in Numeric Formats.
- Data stored in Pandas DataFrame and NumPy Array. 
- Perform Exploratory Data Analysis (EDA) before applying Machine Learning Models.


## Scikit-Learn Syntax
1. Import the Model.
2. Instantiate the Model.
3. Split the Data into training and test sets using `train_test_split()`.
3. Fit the Model.
4. Predict the Model.

``` Python
from sklearn.model import Model
from sklearn.model_selection import train_test_split
model = Model()
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=21,stratify=y) # Using stratify to ensure that the proportion of the target variable is the same in both training and testing sets.
model.fit(X, y)
predictions = model.predict(X_new)
```


## Model 1:
### K-Nearst Neighbors (KNN)
- Predict the label of a data point by 
  - Looking at the `K` closest labeled data points.
  - Taking a majority vote.

``` Python
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split

knn = KNeighborsClassifier(n_neighbors=6)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=21, stratify=y)
knn.fit(X_train, y_train)
y_pred = knn.predict(X_test, y_test)
knn.score(X_test, y_test)
```
