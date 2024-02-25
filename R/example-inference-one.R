suppressPackageStartupMessages({
  library(dplyr)
  library(infer)
  library(ggplot2)
})

# Se asume media poblacional de 1161 g y desviacion estandar poblacional de 98 g
bd_wieghts <- tibble(duck_id = 1:2300, weight = rnorm(2300, 1161, 98))

# Se realizan 10000 muestreos aleatorios de 50 observaciones de la población.
virtual_samples <- bd_wieghts %>% 
  rep_sample_n(size = 50, reps = 100000)

# A cada replica se le calcula el peso promedio
virtual_bd_weights <- virtual_samples %>% 
  group_by(replicate) %>% 
  summarize(Peso = mean(weight))

# Se realiza un grafico de los valores promedios
ggplot(virtual_bd_weights, aes(x = Peso)) +
  geom_histogram(binwidth = 0.1, boundary = 0.4, color = "#213555") +
  labs(x = "Peso de los patos negros", y="Conteo",
    title = "Distribution of 10,000 realizaciones de medidas de peso.") +
  theme_light() + 
  theme(
    panel.background=element_rect(fill="#F5EFE7"),
    plot.background=element_rect(fill="#F5EFE7")
  )