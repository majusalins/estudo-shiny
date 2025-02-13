# análise de desempenho acadêmico

notas <-  c(70, 80, 90, 100, 85, 75, 95, 88, 92, 78, 84, 91, 87, 93,
            77, 89, 86, 94, 79, 96)

media <- mean(notas)
mediana <- median(notas)

hist(
  notas,
  main = "Distribuição das notas dos alunos",
  xlab = "Notas",
  ylab = "Frequência",
  col = "lightgreen",
  breaks = 10
)

abline(
  v = media,
  col = "red",
  lwd = 2,
  lty = 2
)

abline(
  v = mediana,
  col = "blue",
  lwd = 2,
  lty = 2
)

# análise de salários em uma empresa

salarios <- c(30000, 35000, 40000, 45000, 50000, 100000, 32000, 37000, 42000, 
              47000, 52000, 105000, 31000, 36000, 41000, 46000, 51000, 110000)

media_salarios <- mean(salarios)
mediana_salarios <- median(salarios)

boxplot(salarios,
        main = "Distribuição dos salários dos funcionários",
        ylab = "Salários",
        col = "lightblue")

abline(
  h = media_salarios,
  col = "red",
  lwd = 2,
  lty = 2
)

abline(
  h = mediana_salarios,
  col = "blue",
  lwd = 2,
  lty = 2
)

legend(
  "topright",
  legend = c("Média", "Mediana"),
  col = c("red", "blue"),
  lwd = 2,
  lty = 2
)

# boxplots
# análise do salário de dois grupos

set.seed(123)

grupo_A <- rnorm(100, mean = 7000, sd = 1500)
grupo_B <- rnorm(100, mean = 8000, sd = 2000)

dados <- data.frame(
  salario = c(grupo_A, grupo_B),
  grupo = factor(rep(c("Grupo A", "Grupo B"), each = 100))
)

ggplot(dados, aes(x = grupo, y = salario, fill = grupo)) + 
  geom_boxplot() +
  labs(title = "Boxplot de Salários de Dois Grupos de Profissionais de TI",
       x = "Grupo",
       y = "Salário") +
  theme_minimal()

# análise de dispersão de IMC entre dois grupos de pessoas

set.seed(123)

jovens_adultos <- rnorm(100, mean = 24, sd = 3)
meia_idade <- rnorm(100, mean = 27, sd = 4)

dados <- data.frame(
  imc = c(jovens_adultos, meia_idade),
  grupo = factor(rep(c("Jovens Adultos", "Meia Idade"), each = 100))
)

ggplot(dados, aes(x = grupo, y = imc, fill = grupo)) +
  geom_boxplot() + 
  labs(title = "Boxplot do IMC de Jovens Adultos e Adultos de Meia-Idade",
       x = "Grupo Etário",
       y = "índice de Massa Corporal (IMC)") +
  theme_minimal()

# análise da consistência do volume de refrigerantes evasados em
# garrafas de 500 ml em um lote de 100 garrafas

set.seed(123)

volumes <- rnorm(100, mean = 500, sd = 5)

media_volume <- mean(volumes)
desvio_padrao <- sd(volumes)
mediana <- median(volumes)
quartis <- quantile(volumes)

cat("Média do Volume:", media_volume, "\nDesvio Padrão:", desvio_padrao,
    "\nMediana:", mediana, "\nQuartis:", quartis, "\n")

ggplot(data.frame(volumes), aes(y = volumes)) + 
  geom_boxplot(fill = "lightblue") + 
  labs(title = "Boxplot dos Volumes de Garrafas de Refrigerante",
       y = "Volume (ml)") +
  theme_minimal()
