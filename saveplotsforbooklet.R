
library(nbaR)
library(tidyverse)


# this is not required for complex maps (which suit image (tiff, png, jpeg) 
# format outputs)

# for web content the extra steps are not really required as png is the default 

# Create fake dummy data to test a plot output 
dummy_df <- tibble(
  Biome = c("Overall","Forest", "Grassland", "Fynbos", "Karoo"),
  CR = c(27,3, 6, 18, 0),
  EN = c(35, 5, 12, 16, 2),
  VU = c(49, 2, 12, 23, 3),
  LC = c(89, 12, 25, 32, 12),
  Total = c(183,22, 55, 89, 17)
)

test_data <-  rename(dummy_df, `Critically Endangered` = CR, 
         `Endangered` = EN, 
         `Vulnerable` = VU, 
         `Least Concern` = LC )

# Make Plot

testplot <- nba_plot(test_data,
                     `Biome`,
                     2:5,
                     CHRT = "bar",
                     NUM = TRUE,
                     LAB = "Percentage of ecosystem types",
                     SAVE = NULL,
                     SCALE_TEXT = 0.6)

testplot <- testplot +
  theme(
    legend.position = "bottom",             # keep it at the bottom
    legend.margin = margin(l = -45, r = -5, t = -5, b = -5)) 
# to tweak position of legend uselegend.margin to prevent it being cut off: 
# make l more negative to shift left etc 
# but it is also affected by SCALE_TEXT above

# PDF output for Graphics team - for plots and very maps but very complex maps use png

library(extrafont) # this has tools for embedding fonts in vector graphics which 
# is required by the design team of the booklet.

loadfonts(device = "pdf") # this is required as device = cairo_pdf is not compatible with CorelDraw

ggsave(
  filename = "outputs/test.pdf",    # File name with extension for format
  plot = testplot,
  device = "pdf", # this embeds the fonts for GE to use (see first step of addfont)
  width = 8, height = 6, units = "cm") 

# eps output also for graphics team if need be - but not for maps
ggsave(
  filename = "outputs/test.eps",    # File name with extension for format
  plot = testplot,
  device = cairo_ps, # this embeds the fonts for GE to use 
  width = 8, height = 6, units = "cm") 

# png format for maps and web content plots and maps 
ggsave(
  filename = "outputs/test.png",    # File name with extension for format
  plot = testplot,
  dpi = 300, 
  width = 8, height = 6, units = "cm") 


