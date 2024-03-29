# common convention to call the package matplotlib
import matplotlib.pyplot as plt

# creates a figure that holds the image and axes that holds the data.
fig, ax = plt.subplots()



# Plot column2 from DataFrame against the column1
ax.plot(Dataframe["column1"], Dataframe["column2"])

#add a marker, linestyle and their color to the plots to show they are not continuous but connecting lines between points

ax.plot(Dataframe["column1"], Dataframe["column2"], marker='v', linestyle="--",color="b") #linestyle='None'

#set axis label and title
ax.set_xlabel("x axis label is shown here")
ax.set_ylabel("y axis label is shown here")
ax.set_title("this is the title of your plot")
# Call the show function to show the result
plt.show()



# creates a multiple figures by mentioning the number of subplots required, mention sharey=True to share the y-axis range 
fig,ax = plt.subplots(3,2)
#Accessing multiple subplots
ax[0,1] #first row second col subplot

ax[0] #considered a 1 d subplot when either row or column is 0

#twin axes to plot 2 different plots sharing the same axes of x
ax2 = ax.twinx()

#using a plotting function to draw plots

# Define a function called plot_timeseries
def plot_timeseries(axes, x, y, color, xlabel, ylabel):

  # Plot the inputs x,y in the provided color
  axes.plot(x, y, color=color)

  # Set the x-axis label
  axes.set_xlabel(xlabel)

  # Set the y-axis label
  axes.set_ylabel(ylabel, color=color)

  # Set the colors tick params for y-axis
  axes.tick_params('y', colors=color)

plot_timeseries(axes, x, y, color, xlabel, ylabel)


#annotate a data to point out to important readings
# 1.xy is the value tuple
# 2. xytext is the place where the text is placed
# 3.arrowprops is the style of arrow
ax2.annotate(">1 degree", xy=(pd.Timestamp('2015-10-06'),1),xytext=(pd.Timestamp('2008-10-06'),-0.2), arrowprops={'arrowstyle':'->','color':'gray'})

## bar charts and histogram

#single bar chart with label
ax.bar(df.index, df["col1"], label="col1")

# Stack bars for "col2" on top with label "col2"
ax.bar(df.index, df["col2"], bottom=df["col1"],label="col2")

# Stack bars for "col3" on top of that with label "col3"
ax.bar(df.index,df["col1"],bottom=df["col2"] + df["col1"],label='col2')

# Display the legend
ax.legend()


# plotting a histogram with step and bins
ax.hist(df["col1"],histtype='step',label='col1',bins=5)

#scatter plot
ax.scatter(df["col1"],df["col2"],c=df.index)
plt.show()

#saving figures
plt.style.use("ggplot") #various other formats such as 'grayscale' 'seaborn-colorblind' are available
fig.set_size_inches([5,10]) #setting size of the image
fig.savefig('figurename.png',dpi=300,quality=90)

