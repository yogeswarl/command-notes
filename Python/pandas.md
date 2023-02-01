# Pandas
``` python
import pandas as pd
```

## read a csv or tsv
``` python
pd.read_csv('Filename', sep=',', skip_blank_lines=False, )
```
arguments

- sep = , \t, \r\r 
- engine = python (use when sep is a regex pattern)
- skip_blank_lines = False (will not skip blank lines, default = **True**)
- dtype  = dictionary of column and column datatype.
- usecols = a subset of the dataframe with the columns to use
- skipfooter = number of rows to skip from the bottom of the dataframe
- na_values =  set to consider values to be not a number(NA)
- encoding = encoding (use utf-8 when found with mix of characters)


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

