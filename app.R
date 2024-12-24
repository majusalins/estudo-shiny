library(shiny)
library(shinydashboard)
library(ggplot2)
library(readr)
library(ggrepel)
library(dplyr)
library(rsconnect)

#modificando o delimitador manualmente para que os dados sejam lidos corretamente
dataset <- read_delim("Predict Student Dropout and Academic Success.csv", delim = ";")

#utilizando a função make.names para modificar o nome das colunas, que possuem
#espaços como caracteres
colnames(dataset) <- make.names(colnames(dataset))
print(colnames(dataset)) 

ui <- dashboardPage(
  dashboardHeader(title = "Análise de Previsão de Desistência Acadêmica"),
  
  dashboardSidebar(
    HTML("<h2><b>About me</b></h2><br>"),
    HTML("<b>Nome:</b> Maria Júlia Lins<br>"),
    HTML("<b>E-mail:</b> majuhlins76@gmail.com<br>"),
    HTML("<b>Instituição:</b> Instituto Federal de Rondônia - IFRO Campus Ji-Paraná<br>"),
    HTML("<p><b>Resumo do projeto:</b> Este trabalho foi desenvolvido para a matéria de
         Probabilidade e Estatística. Seu objetivo é demonstrar, por meio de dashboards,
         uma análise relacionada à desistência de alunos. O dataset utilizado foi o
         Predict Students Dropout and Academic Success, por Syed Faizan Ali. Foram
         utilizadas as bibliotecas Shiny para design da aplicação e ggplot2 para
         modelagem dos gráficos.</p>"),
    sidebarMenu(
      menuItem("Estado Civil", tabName = "dashboard1"),
      menuItem("Curso", tabName = "dashboard2"),
      menuItem("Sexo", tabName = "dashboard3"),
      menuItem("Nota de Admissão", tabName = "dashboard4"),
      menuItem("Idade", tabName = "dashboard5"),
      menuItem("Notas por Semestre", tabName = "dashboard6")
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard1",
              fluidPage(
                h3("Previsão de desistência de alunos com base no Estado Civil"),
                h4("Utilizando gráfico de setores / gráfico de pizza"),
                h5("O gráfico de setores, também conhecido como gráfico de pizza, 
                   é uma forma de representar proporções em um todo. Ele destaca a 
                   participação de cada categoria em relação ao total."),
                plotOutput("graph1")
              )
      ),
      
      tabItem(tabName = "dashboard2",
              fluidPage(
                h3("Previsão de desistência de alunos com base no Curso"),
                h4("Utilizando gráfico de barras / gráfico de colunas"),
                h5("O gráfico de barras é a forma mais comuns de representar dados categóricos. 
           Ele é eficaz na comparação de quantidades entre diferentes categorias."),
                plotOutput("graph2")
              )
      ),
      
      tabItem(tabName = "dashboard3",
              fluidPage(
                h3("Previsão de desistência de alunos com base no Sexo"),
                h5("Utilizando gráfico de barras / gráfico de colunas"),
                plotOutput("graph3")
              )
      ),
      
      tabItem(tabName = "dashboard4",
              fluidPage(
                h3("Análise com base na Nota de Admissão dos alunos"),
                h4("Utilizando gráfico de caixa"),
                h5("O gráfico de caixa, ou boxplot, é uma ferramenta utilizada para 
                   representar a distribuição estatística de um conjunto de dados. 
                   Ele fornece informações sobre a mediana, quartis, e identifica 
                   a presença de outliers."),
                plotOutput("graph4")
              )
      ),
      
      tabItem(tabName = "dashboard5",
              fluidPage(
                h3("Análise com base na Idade dos alunos no momento da inscrição"),
                h4("Utilizando gráfico de histograma"),
                h5("O gráfico de histograma é utilizado para representar a distribuição 
                   de uma variável contínua. Ele é valioso para entender a forma da 
                   distribuição, identificar padrões e visualizar a concentração de dados 
                   em diferentes intervalos."),
                plotOutput("graph5")
              )
      ),
      
      tabItem(tabName = "dashboard6",
              fluidPage(
                h3("Análise de Desempenho por semestre"),
                h4("Utilizando gráfico de dispersão"),
                h5("O gráfico de dispersão é uma ferramenta muito utilizada na visualização
                   de dados, especialmente quando queremos explorar a relação entre duas variáveis. 
                   Ele é eficaz para identificar padrões, tendências, e verificar 
                   se existe uma correlação entre os conjuntos de dados."),
                plotOutput("graph6")
              )
      )
    )
  )
)

server <- function(input, output) {
  output$graph1 <- renderPlot({
    #configurando valores manualmente pois o dataset os disponibiliza apenas
    #como valores numéricos
    marital_status_map <- c("1" = "Solteiro",
                            "2" = "Casado",
                            "3" = "Divorciado",
                            "4" = "Viúvo")
    dataset$Marital.status <- factor(dataset$Marital.status, 
                                     levels = c(1, 2, 3, 4), 
                                     labels = marital_status_map)
    
    marital_data <- dataset %>%
      count(Marital.status) %>%
      mutate(percentage = n / sum(n) * 100) #transformando em porcentagem
    
    ggplot(marital_data, aes(x = "", y = n, fill = Marital.status)) +
      geom_bar(width = 1, stat = "identity") + 
      coord_polar(theta = "y") +
      labs(title = "Taxa de evasão com base no Estado Civil") + 
      theme_minimal() + 
      theme(axis.text = element_blank(), axis.title = element_blank()) + 
      
      #ajustar a posição da porcentagem no gráfico
      geom_text_repel(aes(label = paste0(round(percentage, 1), "%")), 
                      color = "black", size = 5, 
                      box.padding = 0.5, 
                      position = position_stack(vjust = 0.5)) +
      guides(fill = guide_legend(title = "Estado Civil")) #mudando a legenda
    
  })
  
  output$graph2 <- renderPlot({
    
    course_map <- c("33" = "Licenciatura em Química",
                    "171" = "Análise e Desenvolvimento de Sistemas",
                    "9254" = "Engenharia Florestal",
                    "9070" = "Medicina Veterinária",
                    "9773" = "Administração",
                    "8014" = "Física",
                    "9991" = "Matemática",
                    "9500" = "Medicina",
                    "9238" = "Ciências Contábeis",
                    "9670" = "Letras",
                    "9853" = "Relações Internacionais",
                    "9130" = "Agronomia",
                    "9556" = "Odontologia",
                    "9147" = "Teatro",
                    "9003" = "Jornalismo",
                    "9119" = "Ciência de Dados")
    
    dataset$Course <- factor(dataset$Course, levels = names(course_map), labels = course_map)
    
    cursos <- dataset %>%
      count(Course)
    
    ggplot(cursos, aes(x = Course, y = n, fill = Course)) + 
      geom_bar(stat = "identity", color = "black") +
      labs(
        title = "Taxa de evasão de alunos com base no curso",
        x = "Curso",
        y = "Número de Alunos"
      ) + 
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1)) 
  })
  
  
  output$graph3 <- renderPlot({
    
    contagem_genero <- dataset %>%
      mutate(Gender = factor(Gender, levels = c(0, 1), labels = c("Feminino", "Masculino"))) %>%
      group_by(Gender) %>%
      summarise(Count = n())
    
    ggplot(contagem_genero, aes(x = Gender, y = Count)) +
      geom_bar(stat = "identity", fill = "lightblue") +  
      geom_text(aes(label = Count), vjust = -0.5, size = 5, color = "blue") +  
      labs(
        title = "Quantidade de Alunos por Gênero",
        x = "Gênero",
        y = "Quantidade de Alunos"
      ) +
      theme_minimal()
  })
  
  
  output$graph4 <- renderPlot({
    
    dataset <- data.frame(notas = dataset$Admission.grade)
    
    quartis <- quantile(dataset$notas, c(0.25, 0.5, 0.75))
    decis <- quantile(dataset$notas, seq(0.1, 0.9, by = 0.1))
    percentis <- quantile(dataset$notas, seq(0.01, 0.99, by = 0.01))
    
    cat("Quartis: ", quartis, "\n")
    cat("Decis: ", decis, "\n")
    cat("Percentis: ", percentis, "\n")
    
    ggplot(dataset, aes(x = "", y = notas)) +
      geom_boxplot(width = 0.5, fill = "lightpink", color = "black", outlier.colour = "hotpink") + 
      labs(title = "Notas de Admissão dos acadêmicos",
           subtitle = paste(
             "Quartis: ", round(quartis[1], 2), ", ", round(quartis[2], 2), ", ", round(quartis[3], 2),
             "\nDecis: ", paste(round(decis, 2), collapse = ", "),
             "\nPercentis: ", paste(round(percentis, 2), collapse = ", ")
           ),
           x = "",
           y = "Notas") + 
      theme_minimal()
  })
  
  
  output$graph5 <- renderPlot({
    
    dataset <- data.frame(idade = dataset$Age.at.enrollment)
    
    dataset$idade <- as.numeric(dataset$idade)
    
    media_idades <- mean(dataset$idade, na.rm = TRUE)
    mediana_idades <- median(dataset$idade, na.rm = TRUE)
    moda_idades <- table(dataset$idade)
    moda_idades <- as.numeric(names(moda_idades) [moda_idades == max(moda_idades)])
    
    dma_idades <- mean(abs(dataset$idade - media_idades), na.rm = TRUE)
    
    ggplot(dataset, aes(x = idade)) +
      geom_histogram(binwidth = 2, color = "black", fill = "purple", position = "identity") + 
      labs(title = "Idade dos acadêmicos no momento da inscrição",
           subtitle = paste("Média das Idades: ", round(media_idades, 2), 
                            " | Mediana das idades: ", round(mediana_idades, 2),
                            "| Moda das Idades: ", moda_idades,
                            "| DMA das Idades: ", round(dma_idades, 2)),
           x = "Idade",
           y = "Alunos") + 
      theme_minimal()
  })
  
  
  output$graph6 <- renderPlot({
    
    dataset <- dataset %>%
      mutate(Gender = factor(Gender, levels = c(0, 1), labels = c("Feminino", "Masculino")))
    
    ggplot(dataset, aes(x = Curricular.units.1st.sem..grade., y = Curricular.units.2nd.sem..grade.,
                        color = Gender)) +
      geom_point(size = 2) +
      labs(title = "Relação entre Notas do 1º e 2º Semestre",
           x = "Nota do 1º Semestre",
           y = "Nota do 2º Semestre",
           color = "Gênero") +
      theme_minimal()
    
  })
  
}

shinyApp(ui = ui, server = server)
