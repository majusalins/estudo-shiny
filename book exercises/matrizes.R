# conjunto de registros com linhas e colunas,
# contendo somente números ou somente caracteres.

# a função byrow define se a matriz será preenchida por linha
# ou por coluna

matriz <- matrix(c(1, 2, 3, 4, 5, 6),
                 nrow = 3,
                 ncol = 2,
                 byrow = TRUE)
matriz

matriz <- matrix(c(1, 2, 3, 4, 5, 6),
                 nrow = 3,
                 ncol = 2,
                 byrow = FALSE)
matriz

# buscar elemento por posição

matriz[2, 2]

# juntando dois vetores em uma só matriz

vetorA <- c(12, 20, 36)
vetorB <- c(24, 48, 54)
matrizAB <- rbind(vetorA, vetorB)
matrizAB

# encontrar dimensões de matrizes

dim(matrizAB)
nrow(matrizAB)
ncol(matrizAB)

# nomear linhas e colunas

dimnames(matrizAB) <- list(c("Linha 1", "Linha 2"), c("Coluna 1", "Coluna 2", "Coluna 3"))
matrizAB

# cálculos com matrizes

produto <- 2 * matrizAB
produto

