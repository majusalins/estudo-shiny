# amostragem aleatória simples

populacao <- 1:1000
set.seed(123)
amostra <- sample(populacao, size = 100, replace = FALSE)
print(amostra)

# calculando o tamanho da amostra para uma população de 10000

z <- 1.96 # para 95% de confiança
p <- 0.5
e <- 0.05 # proporção esperada
n <- (z^2 * p * (1 - p)) / e^2 # margem de erro
N <- 10000 # ajustando para uma população finita
n_ajustado <- (n * N) / (n + (N - 1))
print(n_ajustado)

# simulando o teorema do limite central

set.seed(123)
amostra_media <- function(n, tamanho_amostra){
  medias <- replicate(n, mean(runif(tamanho_amostra, min = 0, max = 100)))
  return(medias)
}

medias_amostrais <- amostra_media(1000, 30) # gerando 1000 médias de amostras de tamanho 30

hist(medias_amostrais, breaks = 30, main = "Distribuição das Médias Amostrais",
     xlab = "Média Amostral")

# ilustrando amostragem estratificada

library(dplyr)
populacao <- data.frame(grupo = rep(c("A", "B"), times = c(700, 300)),
                        valor = c(rnorm(700, mean = 50, sd = 10), 
                                  rnorm(300, mean = 60, sd = 15)))

amostra_estratificada <- populacao %>% group_by(grupo) %>% sample_n(size = 50)
print(amostra_estratificada)
