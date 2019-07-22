library(readr)
library(ggplot2)

wwc_outcomes <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-07-09/wwc_outcomes.csv")
squads <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-07-09/squads.csv")

# Using the 'squads' data, create a scatterplot where the number of caps (international games played) is depicted
# along the X-axis, goals (international goals scored) is visualized at the Y-axis. Let's add colors based on the
# footballer's position.

ggplot(data = squads,
       aes(x = caps,
           y = goals,
           color = pos)) +
  geom_point()

# Now, overlay multiple histograms on each other -- use fill = variable to have a histogram of goals with players 
# of different position depicted with different colors. You might want to trim (set the limits of) the x-axis at
# 75 goals, as very few players score more than that. 

ggplot(data = squads,
       mapping = aes(x = goals,
                     fill = pos)) +
  xlim(0, 75) +
  geom_histogram(binwidth = 0.4, position = "identity", alpha = 0.65)

# Create a histogram of caps (international games played), fill the bars with grey color, and overlap it with 
# a density plot, filled with the color 'salmon'! 

ggplot(squads,
       mapping = aes(x = caps)) +
  geom_histogram(aes(y = ..density..),
                 binwidth = 0.4,
                 fill = "grey",
                 color = "black") +
  xlim(0, 200) +
  geom_density(alpha = 0.25, fill = "salmon")

# Create a joyplot of *scores* using the wwc_outcomes data, using the result (i.e. whether the team won, lost or tied) as a grouping variable! 

library(ggridges)

ggplot(data = wwc_outcomes,
       mapping = aes(x = score,
                     y = win_status,
                     fill = win_status)) +
  geom_density_ridges(scale = 0.8, alpha = 0.5)
