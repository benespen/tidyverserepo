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
library(rethinking)

precis(penguins)

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
