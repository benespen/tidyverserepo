# Chapter 1

# load the tidyverse package
library(tidyverse)

# load the package with data set we will be using
library(palmerpenguins)

# load a package with color blind friendly palettes
library(ggthemes)

# display a summary of the data frame as a tibble
penguins

# compare tibble with precis from rethinking
rethinking::precis(penguins)

# precis gives me a nice idea of the distribution of a variable
# tibble gives me the R data type and a preview of the first ten rows

# another alternative way of looking a data frame
glimpse(penguins)

# R Studio's interactive viewer
View(penguins)
# look at the raw data
View(penguins_raw)

# ggplot is the grammar of graphics


# data tells ggplot what data frame we are using
# this displays a completely empty plot
ggplot(data = penguins)

# mapping tells ggplot what to display using the aesthetics aes() function
# this plot now has axes and grid lines, but no data points 
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
)

# adding data points requires defining geometrical objects or geoms
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point()

# color the data points by the species factor in the data table
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) +
  geom_point()

# add in linear models by species
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) +
  geom_point() +
  geom_smooth(method = "lm")

# move the color mapping to the points and have one linear model on length and
# mass
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species)) +
  geom_smooth(method = "lm")

# add in a shape to the color for species
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species, shape = species)) +
  geom_smooth(method = "lm")

# add in graph labels and use a colorblind palette
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind()

# make a scatterplot of bill depth by bill length
ggplot(
  data = penguins,
  mapping = aes(x = bill_depth_mm, y = bill_length_mm , color = species)
) +
  geom_point(aes( shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Bill depth versus bill length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Bill depth (mm)", y = "Bill length (mm)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind()

# try switching the axes
ggplot(
  data = penguins,
  mapping = aes(y = bill_depth_mm, x = bill_length_mm , color = species)
) +
  geom_point(aes( shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Bill depth versus bill length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    y = "Bill depth (mm)", x = "Bill length (mm)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind()

# add a caption
ggplot(
  data = penguins,
  mapping = aes(x = bill_depth_mm, y = bill_length_mm , color = species)
) +
  geom_point(aes( shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Bill depth versus bill length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    caption = "Data come from the palmerpenguins package.",
    x = "Bill depth (mm)", y = "Bill length (mm)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind()

# recreate the visualization in question 8
# had to remove the color blind scale to make this work
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g )
) +
  geom_point( aes(color= bill_depth_mm )) +
  geom_smooth(method = "loess") 

# R functions can be written more or less explicitly.
# for example these two function calls are equivalent

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point()

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point()

# a simple bar chart
ggplot(penguins, aes(x = species)) +
  geom_bar()

# using the forcats package, unordered categories can be displayed
# in the order they appear, in highest count to lowest count, or by 
# numerical values

# this orders the bars by counts
ggplot(penguins, aes(x = fct_infreq(species))) +
  geom_bar()

# a histogram
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(binwidth = 200)

# In R binwidth must be called 
# here are examples of too low and too high binwidths
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(binwidth = 20)
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(binwidth = 2000)

# this is a density plot
ggplot(penguins, aes(x = body_mass_g)) +
  geom_density()

# rethinking provides a shortcut density plot function
# binwidths are automatic
# https://www.rdocumentation.org/packages/rethinking/versions/2.13/topics/dens
rethinking::dens(penguins$body_mass_g)

rethinking::dens(diamonds$carat)

# box and whiskers plots of the penguin body mass data
ggplot(penguins, aes(x = species, y = body_mass_g)) +
  geom_boxplot()

# density plot of the same data
ggplot(penguins, aes(x = body_mass_g, color = species)) +
  geom_density(linewidth = 0.75)

# adding in transparent fill to the density plot
ggplot(penguins, aes(x = body_mass_g, color = species, fill = species)) +
  geom_density(alpha = 0.5)

# simple categorical frequency plots

# count by species
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar()

# frequency of species
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill")

# adding a label to fix the y-axis
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill") +
  labs(y = "proportion")

# a scatterplot using shape and color for different variables
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = island))

# this is hard to read, so splitting the plot into facets can help
# facet_wrap() needs a function on a categorical variable

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species)) +
  facet_wrap(~island)

# save a plot
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()
ggsave(filename = "penguin-plot.png")

