# Pandas
``` python
import pandas as pd
```

# read a csv or tsv
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

