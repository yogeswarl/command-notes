#A python data visualization library built on top of matplotlib. 

import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
#example
height = [62,64,69,75,66,68,65,71,76,73]
weight = [120,136,148,175,137,165,154,172,200,187]
gender = ["Female","Male","Female","Male","Female","Male","Female","Male"]
sns.scatterplot(x=height, y=weight)
sns.countplot(x=gender)


#reading from a file

df = pd.read_csv('test.csv')
sns.countplot(x='row',data=df)


#scatter plot with hue
color_palette = {"yes":'black', "no":'red'}
sns.scatterplot(x='row',y='col',data=df,hue='row_col',hue_order=['yes','No'],palette=color_palette)

#count plot with hue
sns.countplot(x="gender",data=gender, hue="sex")
plt.show()