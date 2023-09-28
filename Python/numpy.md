# Numpy Introduction
Numpy is a python library for scientific computing. It provides a high-performance multidimensional array object, and tools for working with these arrays.
### Create Numpy Array
```python
import numpy as np
np_array = np.array([1,2,3,4,5])
print(np_array)
```
### Loading datasets into numpy
```python
import numpy as np
data = np.loadtxt("data.csv", delimiter=",")
data = np.genfromtxt("data.csv", delimiter=",",dtype=str, names=True)
data = np.recfromcsv("data.csv") # by default delimiter, dtype and names are set 
```

### Select and reshape a row
``` python
im = data[21, 1:]
im_sq = np.reshape(im, (28, 28))`
```