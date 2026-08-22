library(tidyverse)

reg_chem <- read.csv("data/sbclter_stream_chemistry_allyears_registered_stations_20190628.csv", na = c(-999))
non_reg_chem <- read.csv("data/sbclter_stream_chemistry_allyears_non_registered_stations_20190628.csv")
# Look up the na parameter (turn negaatives to na)
#.   mutate(nh4_uM = na_if(nh4_uM, -999))
#do nutrient concentrations (nitrate, ammonium, or soluble reactive phosphorus) (select)
# spike during winter storms compared to summer? (time)


nutrient_con_reg <- reg_chem |> 
select(site_code:po4_uM) |> 
  mutate("Month" = month(ymd_hms(timestamp_local), label = TRUE)) |> 
  arrange(Month, site_code)

  ggplot(
  data = nutrient_con_reg,
    mapping = aes(
      x = Month,
      y = nh4_uM
    )
) +
  geom_point()
facet_wrap(~site_code)



nutrient_con_non <- non_reg_chem |> 
select(site_code:po4_uM) |> 
   mutate("Month" = month(ymd_hms(timestamp_local), label = TRUE)) |> 
  arrange(Month, site_code)

ggplot(
  data = nutrient_con_non,
    mapping = aes(
      x = Month,
      y = po4_uM
    )
) +
  geom_point()



concentration_joined <- nutrient_con_reg|> 
  inner_join(nutrient_con_non, by = join_by(site_code, Month))





ggplot(
  data = ,
    mapping = aes(
      x = ,
      y = 
    )
) +
  geom_point()