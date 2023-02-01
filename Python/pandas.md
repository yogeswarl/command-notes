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