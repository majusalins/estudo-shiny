# o R permite receber valores do usuário e armazená-los. a função readline
# recebe a entrada diretamente pelo console.

print("Conversor de Quilômetros para Milhas")
km <- as.numeric(readline(prompt = "Insira o valor em quilômetros: "))
miles <- (km * 0.62)
print(paste(km, "quilômetros equivalem a", miles, "milhas."))


# as funções max e min permitem encontrar o maior e menor valor.

print("Descubra o maior e menor número entre 3 inputs")
x <- as.numeric(readline(prompt = "Primeiro número: "))
y <- as.numeric(readline(prompt = "Segundo número: "))
z <- as.numeric(readline(prompt = "Terceiro número: "))
maximun <- max(x, y, z)
minimun <- min(x, y, z)
print(paste("Maior:", maximun, "Menor:", minimun))


# estrutura de decisão if else

print("Verifique se um número é par ou ímpar")
num <- as.integer(readline(prompt = "Insira um número:"))
if (num %% 2 == 0) {
  print("O número é par.")
} else{
  print("O número é ímpar.")
}


# loops: somando todos os números divisíveis por 3 no intervalo de 1 a 1000

sum <- 0
x <- 0

for (x in 1:1000) {
  if (x %% 3 == 0) {
    sum = sum + x
  }
}

print(sum)


# printando apenas os números pares no intervalo de 1 a 300

for (x in 1:300) {
  if (x %% 2 == 0) {
    print(x)
  }
}


# função que recebe um número X e retorna X asteriscos

x <- as.integer(readline(prompt = "Insira um número: "))
estrelas <- function(x) {
  for (i in 1:x) {
    print("*")
  }
}

estrelas(x)

# estrutura de dados: vetor

vetor <- c(1, 2, 3, 4, 5, 6, 7)
length(vetor)
class(vetor)

dias <- c("segunda",
          "terça",
          "quarta",
          "quinta",
          "sexta",
          "sábado",
          "domingo")
class(dias)

juntando <- c(vetor, dias)
print(juntando)
class(juntando)
