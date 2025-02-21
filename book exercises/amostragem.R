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


# avaliação de satisfação de um número muito grande de clientes, utilizando a técnica
# de reamostragem bootstrap
# passo 1: coletando dados
set.seed(123)
satisfacao <- rnorm(1000, mean = 7.5, sd = 1.2)

# passo 2: calcular média e desvio padrão da amostra
media_amostra <- mean(satisfacao)
desvio_padrao <- sd(satisfacao)
cat("Média da amostra:", media_amostra, "\n")
cat("Desvio padrão da amostra:", desvio_padrao, "\n")

# passo 3: calcular o intervalo de confiança de 95%
erro_padrao <- desvio_padrao / sqrt(length(satisfacao))
t_critico <- qt(0.975, df = length(satisfacao) - 1)
limite_inferior <- media_amostra - t_critico * erro_padrao
limite_superior <- media_amostra + t_critico * erro_padrao
cat("IC 95%:[", limite_inferior, ",", limite_superior,"]\n")

# passo 4: aplicar o método bootstrap
library(boot)

media_boot <- function(data, indices){
  return(mean(data[indices]))
}

resultado_boot <- boot(data = satisfacao, statistic = media_boot, R = 1000)
ic_boot <- boot.ci(resultado_boot, type = "perc")
print(ic_boot)
