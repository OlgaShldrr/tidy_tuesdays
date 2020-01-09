library(tidyverse)
library(bbplot)
# Get the Data

temperature <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-07/temperature.csv')

plot <- temperature %>% 
  spread(key=temp_type, value=temperature) %>% 
  mutate(year=lubridate::year(date)) %>% 
  group_by(city_name, year) %>% 
  summarise(max = mean(max)) %>% 
  ggplot(., aes(x=year, y=max, color=city_name))+
  geom_point(size=1) +
  geom_smooth(method = "lm")+
  ylim(0, 30)+
  scale_color_brewer(palette = "Dark2")+
  bbc_style()+
  labs(title="Maximum temperatures in Australia over the years")

plotly::ggplotly(plot)


