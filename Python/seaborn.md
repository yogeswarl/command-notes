# A python data visualization library built on top of matplotlib. 
## It provides a high-level interface for drawing attractive and informative statistical graphics.
## Basic setup for seaborn

``` python
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
```
## example
``` python
height = [62,64,69,75,66,68,65,71,76,73]
weight = [120,136,148,175,137,165,154,172,200,187]
gender = ["Female","Male","Female","Male","Female","Male","Female","Male"]
sns.scatterplot(x=height, y=weight)
sns.countplot(x=gender)
```

## reading from a file and countplot
``` python 
df = pd.read_csv('test.csv')
sns.countplot(x='row',data=df)
```

## scatter plot with hue
``` python 
color_palette = {"yes":'black', "no":'red'}
sns.scatterplot(x='row',y='col',data=df,hue='row_col',hue_order=['yes','No'],palette=color_palette)
```

## count plot with hue
```
sns.countplot(x="gender",data=gender, hue="sex")
plt.show()
```
## Different types of plots 
### Strip and swarm plot show all single observations
- `**stripplot**` - Draw a scatterplot where one variable is categorical.
- `**swarmplot**` - Draw a categorical scatterplot with non-overlapping points.
### box, violin and boxen plot are used to show an abstraction of the categorical types. 
- `**boxplot**` - Draw a box plot to show distributions with respect to categories.
- `**violinplot**` - Draw a combination of boxplot and kernel density estimate. Can be used for large datasets, but require significant computation time.
- `**boxenplot**` - Draw an enhanced box plot for larger datasets. Similar to box plot, but allows plotting a larger number of observations.
###  Show statistical estimates of the mean and confidence interval around the mean
- `**pointplot**` - Show point estimates and confidence intervals using scatter plot glyphs. 
- `**barplot**` - Show point estimates and confidence intervals as rectangular bars.
- `**countplot**` - Show the counts of observations in each categorical bin using bars.
- `**catplot**` - Figure-level interface for drawing categorical plots onto a FacetGrid.
- `**factorplot**` - Deprecated figure-level interface for drawing categorical plots onto a FacetGrid.


## Strip plot
``` python
sns.stripplot(x='day',y='total_bill',data=tips)
```

## Swarm plot
``` python
sns.swarmplot(data=df, x='Award_Amount', y='Model Selected', hue='Region')
```

## Box plot
``` python
sns.boxplot(x='day',y='total_bill',palette='husl',data=tips)
```

## Boxen plot
``` python
sns.boxenplot(data=df, x='Award_Amount', y='Model Selected', palette='Paired', hue='Region')
```

## Count Plot
``` python
sns.countplot(data=df, y="Model Selected", hue="Region")
```

## Point plot
``` python
sns.pointplot(data=df, y='Award_Amount', x='Model Selected', capsize=.1)
```
## Bar Plot
``` python
sns.barplot(data=df, y='Award_Amount', x='Model Selected', hue='Region')
```

## Reg plot
- used to plot a linear regression model
``` python
sns.regplot(data=tips, y='day', x='total_bill', marker='^', color='g')
sns.regplot(data=tips, y='day', x='total_bill', marker='^', color='g',x_bins = 5 ) # x_bins = 5 will divide the x axis into 5 bins
sns.regplot(data=tips, y='day', x='total_bill', marker='^', color='g',x_bins = 5, order =2 ) # order = 2 will plot a polynomial fit regression line
sns.regplot(data=tips, y='day', x='total_bill', fit_reg = False ) # Disable the regression line

```
## residual plot
- used to plot the residuals of a linear regression
``` python
sns.residplot(data=df, y='Tuition', x='SAT_AVG_ALL', color='g')
```

## heatmap
- used to plot a correlation matrix
``` python
# Create a crosstab table of the data
pd_crosstab = pd.crosstab(df["Group"], df["YEAR"])
print(pd_crosstab)

# Plot a heatmap of the table
sns.heatmap(pd_crosstab)
sns.heatmap(pd_crosstab, cbar=False, cmap="BuGn", linewidths=0.3) # cbar = False will remove the color bar cmap will change the color of the heatmap and linewidths will change the width of the lines

# Rotate tick marks for visibility
plt.yticks(rotation=0)
plt.xticks(rotation=90)

plt.show()
```

## FacetGrid, catplot and lmplot are used to create multiple plots side by side
- Create FacetGrid with Degree_Type and specify the order of the rows using row_order. then create a pointplot with the map function
``` python
g2 = sns.FacetGrid(df, row="Degree_Type", row_order=['Graduate', 'Bachelors', 'Associates', 'Certificate'])
g2.map(sns.pointplot,'SAT_AVG_ALL')
```
- Create a factor plot that contains boxplots of Tuition values
``` python
sns.catplot(data=df, x='Tuition', kind='box', row='Degree_Type')

```
- Create a facetted pointplot of Average SAT_AVG_ALL scores facetted by Degree Type 
``` python
sns.catplot(data=df,x='SAT_AVG_ALL', kind='point', row='Degree_Type',row_order=['Graduate', 'Bachelors', 'Associates', 'Certificate'])
```
- Create an lmplot that has a column for Ownership, a row for Degree_Type and hue based on the WOMENONLY column
``` python 
sns.lmplot(data=df, x='SAT_AVG_ALL', y='Tuition', col="Ownership", row='Degree_Type', row_order=['Graduate', 'Bachelors'], hue='WOMENONLY', col_order=inst_ord)
```

## PairGrid and PairPlot
- PairGrids are subplots that show the relationships between two variables in a dataset.
- PairGrids don't require X and Y variables to be specified, They are instead denoted as a `vars` array.
- Create a PairGrid with a scatter plot for fatal_collisions and premiums
``` python
g = sns.PairGrid(df, vars=["fatal_collisions", "premiums"])
g2 = g.map(plt.scatter)
```
- Create another PairGrid but plot a histogram on the diagonal and scatter plot on the off diagonal.
``` python
g = sns.PairGrid(df)
g2 = g.map_diag(plt.hist)
g3 = g.map_offdiag(plt.scatter)
```
## JointGrid and JointPlot
- JointGrids are a subplot type that show the marginal distributions of two variables along with plotting their joint distribution.
- Create a JointGrid that shows a scatter plot using the Durbin-Watson and Insurance_losses columns
``` python
g = sns.JointGrid(data=df, x='Durbin-Watson', y='Insurance_losses')
g2 = g.plot(sns.regplot, sns.distplot)
```
- Create a jointplot similar to the JointGrid
``` python
sns.jointplot(data=df, x='Durbin-Watson', y='Insurance_losses', kind='reg')
# Plot temp vs. total_rentals as a regression plot
sns.jointplot(x="temp", y="total_rentals", kind='reg', data=df, order=2, xlim=(0, 1)) # order = 2 will plot a polynomial fit regression line and xlim will set the x axis limit
```
- Jointplot can be compbined with KDE Plot to create a more informative overlay
``` python
g = sns.jointplot(x="temp", y="registered", kind='scatter', data=df, marginal_kws=dict(bins=10))
g.plot_joint(sns.kdeplot)
```

# What plot to choose
## Univariate Distribution Analysis
- `**displot()**` -  best place to start for univariate distributions
- `rugplot(),kdeplot(),ecdfplot()` are useful alternatives

## Regression Analysis
- `**lmplot()**` - Performs regression analysis and supports facetting
- `regplot(), residplot()` are useful alternatives

## Categorical Plot
- `**catplot()**` - Explore categorical data
- `boxplot(), stripplot(), swarmplot(), barplot(), countplot()` are useful alternatives
