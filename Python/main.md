# Python Notes

## Working with Dates
### import datetime module with different methods
  
``` python
import datetime
from datetime import date
from datetime import time
from datetime import datetime
from datetime import timedelta 
```

### Create a date object
``` python 
start = date(2007, 5, 9)
```


### Subtract two dates and print the number of days
``` python
end = date(2008, 6, 9)
print((end - start).days)
```
### various formats to represent dates
``` python
iso = start.isoformat()
custom = start.strftime("%d %b %Y is a %A on the %d day of %B.")

# Starting string, in MM/DD/YYYY HH:MM:SS format
s = '12/15/1986 08:00:00'

# Write a format string to parse s
fmt = '%m/%d/%Y %H:%M:%S'

# Create a datetime object d
d = datetime.strptime(s, fmt)

datetime.fromtimestamp(ts) # from a timestamp is used to convert a given timestamp into a readable date and time.
```

### Different datetime references when printing custom format
- %Y	4 digit year (0000-9999)
- %m	2 digit month (1-12)
- %d	2 digit day (1-31)
- %H	2 digit hour (0-23)
- %M	2 digit minute (0-59)
- %S	2 digit second (0-59)

