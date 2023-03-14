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