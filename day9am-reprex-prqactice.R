library(tidyverse)
library(reprex)

mack_creek_vertebrates <- read_csv("data/AS00601.csv")



mack_creek_lengths <- mack_creek_vertebrates |>
  select(YEAR:SAMPLEDATE) |>
  filter(SECTION == "CC",
         !is.na(SPECIES)) |>
  summarize(mean_length_cm = mean(LENGTH1, na.rm = TRUE),
            sd_length_cm = sd(LENGTH1, na.rm = TRUE),
            .by = species)