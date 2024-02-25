
# Bioestadistica-Course-UC

<!-- badges: start -->
<!-- badges: end -->

The goal of Bioestadistica-Course-UC is to ...

# Material faltante.

* Añade gráficos explicativos de explicación de las medidas de forma y de dispersión.
* Añade before_script con el cargado de paquetes usados.
* Trata de crear shiny apps para añadir en el libro, para hacerlo intercativo. 
* Completa el capitulo con las escalas de medida usando formalismos mas completos
* Añade en Estadistica desfcriptiva:
 * La normal como estandar de comapracion.
 * Sesgos y como se ven
 * Observaciones atipicas y extremas.
 * Datos agrupados y no agrupados.
 * Aspectos prácicos del análisis descriptivo (esto al final del capitulo).
* Añade capitulo de estadistica descriptiva esclas de medida, y graficos.
* Completa el capitulo de distribuciones de probabilidad con una introduccion de que inckuya la definción de probabilidad axiomatica y los espacios de probabilidad antes descritos. 
* Ejercucuis de Cap 9 de entendimiento de Bayesian y Likelihiid anaklysis
* Añade a las distriobuciones muestrales el cap 8 los valores de error estandar.
* Ejercicios del cap de sampling theory
* Añade esto a un cap de varianza y esperanza.

<!---
Demuestre que $S^2$ es un estimador insesgado del parámetro $\sigma^2$.

Utilizando $X_i - \hat{X} = (X_i - E[X]) - (\hat{X} - E[X])$, elevando al cuadrado y expandiendo se obtiene:

$$S^2 = \frac{1}{n}\sum_{i=1}^n (X_i - E[X])^2 - (\hat{X} - E[X])^2$$

Como la varianza muestral es una variable aleatoria, su valor esperado es:

$$E[S^2] = \frac{n-1}{n}\sigma^2_X$$

De allí se ve que la media de la varianza muestral no es igual a la varianza poblacional $\sigma^2_X$, entonces no es un estimador insesgado. Para obtener un estimador insesgado, se define una variable aleatoria nueva como:

$$\hat{S}^2 = \frac{n}{n-1}S^2 = \frac{1}{n-1}\sum_{i=1}^n (X_i - \hat{X})^2$$

de forma que:

$$E[\hat{S}^2] = \sigma^2_X$$
--->

* Añade a sampling theory en estratos la forma de realizar calculara estimadores poblacionales de los estratos
* Añade tambien los resultados cuando la población es finita. 