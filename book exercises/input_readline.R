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
