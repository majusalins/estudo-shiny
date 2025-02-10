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
