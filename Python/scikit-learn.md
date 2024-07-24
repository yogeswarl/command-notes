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

## Model 2:
### Linear Regression
- Fit a linear model to the data.
- Minimize the sum of the squared errors.
- Linear regression Models can be used to make predictions from a single feature
- To make predections use the reshape method to convert the data into a 2D array.


``` Python
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split

reg = LinearRegression()
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
reg.fit(X_train, y_train)
y_pred = reg.predict(X_test)
reg.score(X_test, y_test)
```
### R&sup2; Score
- Quantifies the variance in target values explained by the features
- Values range from 0 to 1
### RMSE (Root Mean Squared Error)
- Measures the difference between the predicted values and the actual values.
- Lower values of RMSE indicate a better fit.

``` Python
from sklearn.metrics import mean_squared_error
from sklearn.metrics import r2_score

rmse = np.sqrt(mean_squared_error(y_test, y_pred))
r2 = r2_score(y_test, y_pred)
```

### Cross-Validation
- More folds more computationally expensive.

``` Python
from sklearn.model_selection import cross_val_score,KFold
kf = KFold(n_splits=5, shuffle=True, random_state=1)
reg = LinearRegression()
cv_results = cross_val_score(reg, X, y, cv=kf)

# evaluating cross validation

print(cv_results)

print(np.mean(cv_results), np.std(cv_results))

print(np.quantile(cv_results, [0.25, 0.75]))
```

### Assessing Model Performance
- Overfitting: Model performs well on the training set but poorly on the test set.
- Underfitting: Model performs poorly on the training set and poorly on the test set.
- Model Complexity: The more complex the model, the more likely it will overfit.

### Regularization
- Regularization is a technique used to prevent overfitting by penalizing large coefficients.
- Lasso (L1) Regularization: Adds the absolute value of the magnitude of coefficients to the cost function.
- Ridge (L2) Regularization: Adds the squared value of the magnitude of coefficients to the cost function.

``` Python
from sklearn.linear_model import Lasso
from sklearn.linear_model import Ridge

lasso = Lasso(alpha=0.1)
ridge = Ridge(alpha=0.1)
lasso.fit(X, y)
ridge.fit(X, y)
lasso_coef = lasso.coef_
ridge_coef = ridge.coef_
```

### Metrics
``` Python
from sklearn.metrics import classification_report, confusion_matrix
knn = KNeighborsClassifier(n_neighbors=6)

# Fit the model to the training data
knn.fit(X_train,y_train)

# Predict the labels of the test data: y_pred
y_pred = knn.predict(X_test)

print(confusion_matrix(y_test, y_pred))
print(classification_report(y_test, y_pred))
```
- Precision: The number of true positives divided by the number of true positives plus the number of false positives.
- Recall: The number of true positives divided by the number of true positives plus the number of false negatives.
- F1 Score: The harmonic mean of precision and recall.
- Support: The number of samples of the true response that lie in that class.

- Probablities of the predictions can be obtained using the `predict_proba()` method.

``` Python
y_pred_prob = knn.predict_proba(X_test)[:,1]
```

- Generate an ROC curve using the `roc_curve()` function.

``` Python
from sklearn.metrics import roc_curve, roc_auc_score
fpr, tpr, thresholds = roc_curve(y_test, y_pred_probs)
roc_auc_score(y_test, y_pred_probs)
```

### Hyperparameter Tuning
``` Python
from sklearn.model_selection import GridSearchCV
param_grid = {"alpha": np.linspace(0.00001, 1,20)}
lasso_cv = GridSearchCV(lasso, param_grid, cv=kf)
lasso_cv.fit(X_train,y_train)

print("Tuned lasso paramaters: {}".format(lasso_cv.best_params_))
print("Tuned lasso score: {}".format(lasso_cv.best_score_))
```


