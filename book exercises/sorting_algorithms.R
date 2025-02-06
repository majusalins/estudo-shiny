# algoritmos de ordenação são algoritmos que colocam elementos em uma certa
# ordem. abaixo seguem implementações de alguns desses algoritmos em R

# Bubble Sort: percorre um conjunto de elementos diversas vezes, comparando e
# trocando elementos adjacentes

bubblesort <- function(vetor) {
  n <- length(vetor)
  for (i in 1:(n - 1)) {
    for (j in 1:(n - i)) {
      if (vetor[j] > vetor[j + 1]) {
        temp <- vetor[j]
        vetor[j] <- vetor[j + 1]
        vetor[j + 1] <- temp
      }
    }
  }
  return(vetor)
}

vetor1 <- c(10, 62, 21, 18, 5, 0, -1)
teste_bubblesort <- bubblesort(vetor1)
teste_bubblesort

# Selection Sort: passa sempre o menor valor do vetor para a primeira posição,
# depois o segundo menor para a segunda posição e assim sucessivamente

selectionsort <- function(vetor) {
  n <- length(vetor)
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      if (vetor[i] > vetor[j]) {
        temp <- vetor[j]
        vetor[j] <- vetor[i]
        vetor[i] <- temp
      }
    }
  }
  return(vetor)
}

teste_selectionsort <- selectionsort(vetor1)
print(teste_selectionsort)
