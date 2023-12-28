# Pandas
``` python
import pandas as pd
```

## read a csv or tsv
``` python
pd.read_csv('Filename', sep=',', skip_blank_lines=False, )
```
arguments

- sep = , `\t`, `\r\r`
- engine = python (use when sep is a regex pattern)
- skip_blank_lines = False (will not skip blank lines, default = **True**)
- dtype  = dictionary of column and column datatype.
- usecols = a subset of the dataframe with the columns to use
- skipfooter = number of rows to skip from the bottom of the dataframe
- na_values =  set to consider values to be not a number(NA)
- encoding = encoding (use utf-8 when found with mix of characters)
- parse_dates = Column to parse as date

### read from other sources.
 - read from excel
 ``` python
  pd.read_excel('Filename', sheet_name='Sheet1', skiprows=2, usecols='A:C', na_values=['NA'], parse_dates=['Date'])
  ```
  - read from json
  ``` python
  pd.read_json('Filename', orient='columns', lines=True)
  ```
  - read from sql
  ``` python
  from sqlalchemy import create_engine
  engine = create_engine('sqlite:///:memory:')  
  df = pd.read_sql("SELECT * FROM table_name", engine)
  ```
  - read from url
  ``` python
  df = pd.read_csv('https://raw.githubusercontent.com/justmarkham/DAT8/master/data/chipotle.tsv', sep='\t')
  ```
  - read from pickle
  ``` python
  df = pd.read_pickle('Filename')
  ```
  - read from stata
  ``` python
  df = pd.read_stata('Filename')
  ```
  - read from sas
  ``` python
  df = pd.read_sas('Filename')
  ```
  - read from hdf5
  ``` python
  df = pd.read_hdf('Filename')
  ```


## Basic DataFrame Commands
few basic commands 
``` python
  df.head() #first 10 rows
  df.info() #shows info on each column, no of missing values  and data types
  df.info(memory_usage='deep') #use this to get memory usage of dataframe
  df.shape # returns number of rows and columns
  df.describe() #calculate few summary statistics for each column
  df.values #a 2-d numpy array of all values
  df.columns # an index of columns with their names
  df.index # an index of rows
  pd.to_datetime(df['col1']) #converts a column to datetime
  df.dtypes #returns datatypes of each column
  df['col1'].unique() #returns unique values in a column
  df['col1'].nunique() #returns number of unique values in a column
  df['col1'].nbytes() #returns number of bytes used by a column
```

### getting date from a datetime column
``` python
df['col1'].dt.year
df["col1"].dt.month
df["col1"].dt.day
df["col1"].dt.weekday
df["col1"].dt.hour
```
### converting to a timezone
`dt.tz_convert()` converts to a new timezone, whereas `dt.tz_localize()` sets a timezone in the first place.
``` python
df['col1'].dt.tz_localize('US/Central',ambiguous='NaT') #ambiguous='NaT' will return NaT for ambiguous values
df['col1'].dt.tz_convert('US/Eastern')

```
### adding a new column

``` python
df['new_col'] = df['one'] + df['two'] 
```
### computing stats

``` python
df['one'].mean()
df['two'].median()
df['three'].min()
df['four'].max()
df['five'].cumsum() #cumulative sum of previous rows 
df['six'].cummax() #cumulative max of previous rows
```
### agg (aggregate) method
can be used to create your own custom functions or apply them to a whole dataframe for each column being passed into as a key value pair dict.
``` python
# A custom IQR function
def iqr(column):
    return column.quantile(0.75) - column.quantile(0.25)
    
# Print IQR of the temperature_c column
print(sales['temperature_c'].agg(iqr))
```
- agg() method can be used with a list or a dictionary
- agg() method can be used with a list of functions or a dictionary of functions
- agg() method applies to named columns
``` python
df.group(['col1','col2']).agg({'col1':'mean','col2':'max'}) # different functions to different columns
df.group(['col1']).agg(
  mean_rating = ('rating','mean')
  std_price = ('price','std')
  median_year = ('year','median')
  )
   # different functions to different columns
```


## Sorting
pass column name/s as a string or list 
``` python
df.sort_values('one',ascending=False) #ascending keyword to make use of ordering 
df.sort_values(['one','one'])
```

## Subsetting
subsetting required column/s from a dataframe and you can also filter these columns based on condtions
``` python
df['one'] #subset a single column
df[['one','two']] #subset 2 columns 
df[df['one'] > value]
df[df['one'] == 'one']
df[(df['one'] > value) & (df['two'] =='one')]

```

subsetting categorical values 
``` python
colors = ["brown", "black", "tan"]
condition = df["color"].isin(colors)
df[condition]
```

## duplicates and dropping them
- drop_duplicates() method drops the duplicate rows
- duplicated() method returns a boolean series with True for duplicate rows
- drop_duplicates() method can be used with subset keyword to drop duplicates based on a subset of columns
- Both duplicated() and drop_duplicates() method havea `subset`, `keep` and `inplace` keyword
``` python
sales = sales.duplicated() #returns a boolean series
sales = sales.drop_duplicates() #drops if the whole row is duplicated
sales = sales.drop_duplicates(subset=['col1','col2']) # drops rows if subset columns are duplicate
```


## value counts
``` python
store_count = store['type'].value_counts()
```
arguments:
- normalize=True gives proportion of the values
- sort=True sorts in ascending

## group by
``` python
sales.groupby('type')['weekly_sales'].sum() # efficient way to calculate weekly sales for each type.
sales.groupby(by=['item1','item2']).size() # return size of each values grouped as a series
sales.groupby(by=['item1','item2']).count() # return count of each values grouped as a series
sales.groupby(by=['item1','item2']).mean() # return mean of each values grouped as a series
```

### astype
``` python
df['col1'] = df['col1'].astype('int')
```
various Python Datatypes that pandas accepts:
- int
- float
- str
- bool
- datetime
- category

### filling missing values
- general rule of thumb is to drop values if missing values is <= 5% of the total data
``` python
# Count the number of missing values in each column
print(planes.isna().sum())
# Find the five percent threshold
threshold = len(planes) * 0.05
# Create a filter
cols_to_drop = planes.columns[planes.isna().sum() <= threshold]
# Drop missing values for columns below the threshold
planes.dropna(subset=cols_to_drop, inplace=True)
print(planes.isna().sum())
```

- if missing values is more than 5% of the total data then fill the missing values with mean or median
``` python
# Calculate median plane ticket prices by Airline
airline_prices = planes.groupby("Airline")["Price"].median()

print(airline_prices)

# Convert to a dictionary
prices_dict = airline_prices.to_dict()

# Map the dictionary to missing values of Price by Airline
planes["Price"] = planes["Price"].fillna(planes["Airline"].map(prices_dict))

# Check for missing values
print(planes.isna().sum())
```

### find datatypes
``` python
# Filter the DataFrame for object columns
non_numeric = planes.select_dtypes("object")

# Loop through columns
for cols in non_numeric.columns:
  
  # Print the number of unique values
  print(f"Number of unique values in {cols} column: ", non_numeric[cols].nunique()) 

```
### Handling Outliers
``` python
# Find the 75th and 25th percentiles
price_seventy_fifth = planes["Price"].quantile(0.75)
price_twenty_fifth = planes["Price"].quantile(0.25)

# Calculate iqr
prices_iqr = price_seventy_fifth - price_twenty_fifth

# Calculate the thresholds
upper = price_seventy_fifth + (1.5 * prices_iqr)
lower = price_twenty_fifth - (1.5 * prices_iqr)

# Subset the data
planes = planes[(planes["Price"] > lower) & (planes["Price"] < upper)]

print(planes["Price"].describe())
```


### replacing string in columns
``` python
# Replace "Dr." with empty string ""
df["name"] = df["name"].str.replace("Dr.","")
```
### cross tab
``` python
# Create crosstab
pd.crosstab(planes["Source"], planes["Destination"],values=planes["Price"], aggfunc="median")
```
### set labels for data in a column
``` python
labels = ['low', 'medium', 'high']
bins = [0, 200, 400, 600]
pd.cut(df['col1'], bins=bins, labels=labels)
```

### Creating categorical data columns
- creating categorical data saves number of bytes used by a column
``` python
series1 = pd.Series(['a','b','c','a'], dtype="category")
series2 = pd.Categorical(['a','b','c','a'], categories=['a','b','c'], ordered=True) # ordered=True will order the categories
```

### Updating categorical values
- updating single values can be done with rename
``` python
# Create the my_changes dictionary
my_changes = {'Maybe?':'Maybe'}

# Rename the categories listed in the my_changes dictionary
dogs["likes_children"] = dogs['likes_children'].cat.rename_categories(my_changes)

# Use a lambda function to convert all categories to uppercase using upper()
dogs["likes_children"] =  dogs["likes_children"].cat.rename_categories(lambda c: c.upper())

# Print the list of categories
print(dogs['likes_children'].cat.categories)
```

- collapsing multiple categories into one needs to be done with replace
``` python
# Collapse the categories into 'one' and 'other'
new_changes = {'medium-black':'medium', 'medium-brown':'medium', 'medium-gray':'medium', 'medium-red':'medium', 'medium-white':'medium'}
dogs["likes_children"] = dogs["likes_children"].replace(new_changes)
dogs["likes_children"] = dogs["likes_children"].astype('category')
print(dogs["likes_children"].cat.categories)
```
- printing category
``` python

print(dogs.loc[dogs.index == 23807, 'coat'])
# Find the count of male and female dogs who have a "long" coat
print(dogs.loc[dogs['coat'] == 'long', 'sex'].value_counts())
# Print the mean age of dogs with a breed of "English Cocker Spaniel"
print(dogs.loc[dogs['breed'] == 'English Cocker Spaniel', 'age'].mean())
# Count the number of dogs that have "English" in their breed name
print(dogs[dogs["breed"].str.contains("English", regex=False)].shape[0])
```
### creating categorical codes
- create codes from 1 to n for each category
``` python
codes = df['col1'].cat.codes
names= df['col1']
name_map = dict(zip(codes, names))
#reverting to previous values
df['code'].map(name_map)
```
- Boolean coding
``` python
df['col codes'] = np.where(df['col'].str.contains("value",regex=False),1,0) #adds 1 for True and 0 for False
used_cars["van_code"].value_counts() # value counts will return only 1 and 0
```

- One hot encoding with Pandas
``` python
# Create the dummy variables
df_onehot = pd.get_dummies(df, columns=['col1','col2'], prefix="")
df_onehot.head() # each category gets 1 column from the original column with 1 for True and 0 for False
# should be used when the amount of categories are less in value
```

### creating ranges for categories
- 
```python
# Create ranges for categories
label_ranges = [0, 60, 180, np.inf]
label_names = ['short', 'medium', 'long']

# Create wait_type column
airlines['wait_type'] = pd.cut(airlines['wait_min'], bins = label_ranges, 
                                labels = label_names)

# Create mappings and replace
mappings = {'Monday':'weekday', 'Tuesday':'weekday', 'Wednesday': 'weekday', 
            'Thursday': 'weekday', 'Friday': 'weekday', 
            'Saturday': 'weekend', 'Sunday': 'weekend'}

airlines['day_week'] = airlines['day'].replace(mappings)
```

### Remapping categories
``` python
from thefuzz import process
# Iterate through categories
for cuisine in categories:  
  # Create a list of matches, comparing cuisine with the cuisine_type column
  matches = process.extract(cuisine, restaurants['cuisine_type'], limit=len(restaurants.cuisine_type))

  # Iterate through the list of matches
  for match in matches:
     # Check whether the similarity score is greater than or equal to 80
    if match[1] >= 80:
      # If it is, select all rows where the cuisine_type is spelled this way, and set them to the correct cuisine
      restaurants.loc[restaurants['cuisine_type'] == match[0]] = cuisine
      
# Inspect the final result
print(restaurants['cuisine_type'].unique())
```

### Generating, Comparing and Linking pairs with Record Linkage
- `pip install recordlinkage` to install record linkage package
- Generating Pairs
``` python
import recordlinkage
# Create an indexer and object and find possible pairs
indexer = recordlinkage.Index()
indexer.block('columnName') # blocks the column to find pairs
pairs = indexer.index(df1, df2) #two dataframes to find pairs from
# returns a pandas multiIndex object containing all possible pairs
```
- Comparing Pairs
``` python
# Create a comparison object
comp_cl = recordlinkage.Compare()
comp_cl.exact('col1', 'col2', label='col1') # exact comparison
compl_cl.string('col1','col2',threshold=0.85,label='col1') # string comparison with a threshold
# Compute the comparison of the pairs
potential_matches = comp_cl.compute(pairs, df1, df2)
```
- Finding the matches
``` python
matches = potential_matches[potential_matches.sum(axis = 1) >= n]
```

- Linking the matches
``` python
# Get values of second column index of matches
matching_indices = matches.index.get_level_values(1) # can also be done with .get_level_values('indexName') for second column

# Subset df2 based on non-duplicate values
non_dup = df2[~df2.index.isin(matching_indices)]

# Append non_dup to restaurants
new_df = df1.append(df2)
print(new_df)
```

- Random Sampling
``` python
# Randomly sample 5 numbers into sampled_df
sampled_df = df.sample(n=5, random_state=1500)

# set frac to return a proportion of the dataframe
sampled_df = df.sample(frac=0.5, random_state=1500)
```

- systematic sampling
``` python
# Calculate the increment size (i_size)
shuffled =  df.sample(frac=1)
shuffled = shuffled.reset_index(drop=True).reset_index()
```

- Stratified Sampling
``` python
 stratified = df.groupby('col1', group_keys=False).sample(n=15,random_state=1500)
 stratified_counts = stratified['col1'].value_counts(normalize=True) # returns the proportion of each category.
 ```

 - Weighted Sampling
 ``` python
  # Calculate the sampling weights
weights = df['col1'].value_counts(normalize=True)

# Set the weights parameter
weighted = df.sample(n=15, random_state=1, weights=weights)
```

- Cluster Sampling
``` python
import random;
top_3 = random.sample(sample_cols, k=3)
top_condition = df['col1'].isin(top_3)
top_cluster = df[top_condition]
df[top_condition] = df[top_condition].cat.remove_unused_categories()
df_clust = df.groupby('col1', group_keys=False).apply(lambda x: x.sample(min(len(x), 2)))
```

- Relative Error between sample size and population size
``` python
pop_mean = df['col1'].mean()
sample_mean = df['col1'].sample(n=50, random_state=1).mean()
mean_diff = 100 * abs(sample_mean - pop_mean) / pop_mean
```
**Note**: For smaller sample means, the relative error decreases substantially for every increase to the sample size. For larger sample means, the relative error decreases at a much slower rate.

- Replicating Sampling
``` python
# Create an empty list
mean_attritions = []
# Loop 500 times to create 500 sample means
for i in range(500):
	mean_attritions.append(
    	attrition_pop.sample(n=60)['Attrition'].mean()
	)

# Create a histogram of the 500 sample means
plt.hist(mean_attritions,bins=16)
plt.show()
```
- Exact sampling Appropriate
```python
dice = expand_grid(
    {'die1':[1,2,3,4,5,6,7,8],
     'die2':[1,2,3,4,5,6,7,8],
     'die3':[1,2,3,4,5,6,7,8],
     'die4':[1,2,3,4,5,6,7,8],
     'die5':[1,2,3,4,5,6,7,8]
    }
)
dice['mean_roll'] = (dice['die1'] + dice['die2'] + dice['die3'] + dice['die4'] + dice['die5']) / 5
dice['mean_roll'] = dice['mean_roll'].astype('category')

# Draw a bar plot of mean_roll
dice['mean_roll'].value_counts(sort=False).plot(kind='bar')

# replicating once
five_rolls = np.random.choice(list(range(1,9)),size=5,replace=True)

# replicated 1000's of times``
sample_means_1000 = []
for i in range(1000):
    sample_means_1000.append(
  		np.random.choice(list(range(1, 9)), size=5, replace=True).mean()
    )

# Draw a histogram of sample_means_1000 with 20 bins
plt.hist(sample_means_1000,bins=20)
```


## Bootstrap Sampling
``` python
# a single bootstrap sample
spotify_1_resample = spotify_sample.sample(frac=1,replace=True)

mean_danceability_1 = np.mean(spotify_1_resample['danceability'])

## 1000 bootstrap samples
mean_danceability_1000 = []
for i in range(1000):
	mean_danceability_1000.append(
        np.mean(spotify_sample.sample(frac=1, replace=True)['danceability'])
	)

# Draw a histogram of the resample means
plt.hist(mean_danceability_1000)
plt.show()

```
- for bootstrap distribution, the mean is often not the best measure of center. instead use std deviation and multiply it with `sqrt` of the sample size
``` python
# Calculate the population std dev popularity
pop_sd = spotify_population['popularity'].std(ddof=0)

# Calculate the original sample std dev popularity
samp_sd = spotify_sample['popularity'].std(ddof=1)

# Calculate the sampling dist'n estimate of std dev popularity
samp_distn_sd = np.std(sampling_distribution,ddof=1) * np.sqrt(5000)

# Calculate the bootstrap dist'n estimate of std dev popularity
boot_distn_sd = np.std(bootstrap_distribution,ddof=1) * np.sqrt(5000)

```