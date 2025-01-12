# data frames são estruturas de dados em formato de tabelas que podem possuir
# tanto números quanto caracteres

numero_mes <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
nome_mes <- c(
  "Janeiro",
  "Fevereiro",
  "Março",
  "Abril",
  "Maio",
  "Junho",
  "Julho",
  "Agosto",
  "Setembro",
  "Outubro",
  "Novembro",
  "Dezembro"
)
ano <- c(2025, 2025, 2025, 2025, 2025, 2025, 2025, 2025, 2025, 2025, 2025, 2025)
data.frame(numero_mes,nome_mes,ano)

df_meses <- data.frame(numero_mes,nome_mes,ano)
View(df_meses)


# listas podem conter elementos de diferentes tipos

nome <- c("Alexandre", "Bárbara", "Cláudia", "Daniel")
idade <- c(22, 21, 23, 25)
curso <- c("Direito", "Nutrição", "Medicina", "Matemática")
lista <- list(nome, idade, curso)

# nomeando termos de uma lista

lista2 <- list(nome = c("Alexandre", "Bárbara", "Cláudia", "Daniel"),
               idade = c(22, 21, 23, 25),
               curso = c("Direito", "Nutrição", "Medicina", "Matemática")
)
lista2

lista_numeros <- c(1, 3, 5, 7, 11, 15)
for(numero in lista_numeros){
  mult = numero * 2
  print(mult)
}
