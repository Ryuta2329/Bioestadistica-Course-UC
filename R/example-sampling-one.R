suppressPackageStartupMessages({
  library(dplyr)
  library(infer)
  library(ggplot2)
  library(purrr)
})

# Se asume media poblacional de 1161 g y desviacion estandar poblacional de 98 g
bd_wieghts <- tibble(duck_id = 1:2300, weight = rnorm(2300, 1161, 98))

# Se realizan 1 muestreo aleatorios de n observaciones de la poblacion.
# Se usan tres muestreos, uno con un tamaño pequeño de 20, uno de tamaño medio de 50,
# y uno de tamaño grande de 100
virtual_samples <- list(small=20, medium=50, large=100) %>%
  map(\(n) { # Aqui el paso iterativo
    n_sample <- bd_wieghts %>%
      rep_sample_n(size = n, reps = 1)

    # Se realiza el histograma de frecuencias
    ggplot(n_sample, aes(x = weight)) +
      geom_histogram(bins=15, boundary = 0.4, color = "#213555", fill="#213555") +
      labs(x = "Peso de los patos negros", y="Conteo",
        title = paste("Distribution muestral para n= ", n, sep="")) +
      theme_light() + 
      theme(
        panel.background=element_rect(fill="#F5EFE7"),
        plot.background=element_rect(fill="#F5EFE7")
      )
  })

# Grafico los histogramas en fila
cowplot::plot_grid(plotlist=virtual_samples, nrow=3)