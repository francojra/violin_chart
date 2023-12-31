
# Gráfico Violino --------------------------------------------------------------------------------------------------------------------------
# Autora do script: Jeanne Franco ----------------------------------------------------------------------------------------------------------
# Data: 07/10/23 ---------------------------------------------------------------------------------------------------------------------------
# Referência: https://r-graph-gallery.com/violin.html --------------------------------------------------------------------------------------

# Introdução -------------------------------------------------------------------------------------------------------------------------------

### Gráficos violino permitem visualizar a distribuição de uma variável numérica para
### um ou vários grupos. Eles são muito bem adaptados grandes conjuntos de dados. Eles
### são frequentemente usados para substituir o boxplot. A função usada para gerar esse
### gráfico com ggplot2 é geom_violin.

# Gráfico de violino horizontal com ggplot2 ------------------------------------------------------------------------------------------------

### Gráficos violino são úteis para comparar a distribuição de vários grupos. Como os 
### rótulos dos grupos precisam ser lidos, a posição horizontal dos gráficos violinos se
### torna necessária.

### A função coord_flip permite rotacionar os eixos x e y e assim obter um gráfico na
### horizontal. Note também o uso do elegante tema theme_ipsum do pacote hrbrthemes que
### melhora a aparência geral do gráfico.

### Pacotes

library(ggplot2)
library(dplyr)
library(tidyr)
library(forcats)
library(hrbrthemes)
library(viridis)

### Carregar dados do GitHub

data <- read.table("https://raw.githubusercontent.com/zonination/perceptions/master/probly.csv", 
                   header = TRUE, sep = ",")
View(data)

### Os dados estão em formato amplo, precisamos torná-los 'tidy' ou 'longos'

data <- data %>% 
  gather(key = "text", value = "value") %>%
  mutate(text = gsub("\\.", " ",text)) %>%
  mutate(value = round(as.numeric(value),0)) %>%
  filter(text %in% c("Almost Certainly",
                     "Very Good Chance",
                     "We Believe","Likely",
                     "About Even", 
                     "Little Chance", 
                     "Chances Are Slight", 
                     "Almost No Chance"))
View(data)

### Gráfico

p <- data %>%
  mutate(text = fct_reorder(text, value)) %>% # Reorder data
  ggplot(aes(x = text, y = value, fill = text, color = text)) +
    geom_violin(width = 2.1, size = 0.2) +
    scale_fill_viridis(discrete = TRUE) +
    scale_color_viridis(discrete = TRUE) +
    theme_ipsum() +
    theme(legend.position = "none") +
    coord_flip() + # This switch X and Y axis and allows to get the horizontal version
    xlab("") +
    ylab("Assigned Probability (%)")

p

# Gráfico violino com box-plot e tamanho de amostra ----------------------------------------------------------------------------------------

### Nós podemos adicionar um box-plot ao gráfico de violino para ver ambos distribuição de 
### dados e estatísticas de resumo. Além disso, podemos adicionar o tamanho da amostra de cada
### grupo ao eixo x. Vamos fazer isso com R e ggplot2.

### É possível usar geom_boxplot() com um pequeno width para adicionar um boxplot ao gráfico
### que resume as estatísticas.

### Além disso, note um pequeno truque que permite promover tamanho de amostra de cada grupo
### ao eixo x: uma nova coluna chamada myaxis é criada e então usada para o eixo x.

### Pacotes

library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(viridis)

### Criar um conjunto de dados

data <- data.frame(
  name = c(rep("A",500), rep("B",500), rep("B",500), rep("C",20), rep('D', 100)),
  value = c(rnorm(500, 10, 5), rnorm(500, 13, 1), 
           rnorm(500, 18, 1), rnorm(20, 25, 4), 
           rnorm(100, 12, 1)))
View(data)

### Tamanho da amostra

sample_size = data %>% 
  group_by(name) %>% 
  summarize(num = n())

### Gráfico

data %>%
  left_join(sample_size) %>%
  mutate(myaxis = paste0(name, "\n", "n=", num)) %>%
  ggplot(aes(x = myaxis, y = value, fill = name)) +
    geom_violin(width = 1.4) +
    geom_boxplot(width = 0.1, color = "grey", alpha = 0.2) +
    scale_fill_viridis(discrete = TRUE) +
    theme_ipsum() +
    theme(legend.position = "none",
          plot.title = element_text(size = 11)) +
    ggtitle("A Violin wrapping a boxplot") +
    xlab("")

# Gráfico de violino agrupado --------------------------------------------------------------------------------------------------------------

### Essa é uma extensão do gráfico clássico de violino. Aqui os dados são organizados
### em grupos e subgrupos, permitindo construir um gráfico agrupado. 

### Um gráfico de violino agrupado exibe a distribuição de uma variável numérica
### para grupos e subgrupos. Aqui, os grupos são dias da semana e os subgrupos são
### machos e fêmeas. O ggplot2 permite essa construção graças ao argumento position="dodge"
### da função geom_violin(). Os grupos são promovidos pelo eixo x e os subgrupos
### pelo argumento fill.

### Pacotes

library(ggplot2)
library(dplyr)
library(forcats)
library(hrbrthemes)
library(viridis)

### Carregar conjunto de dados

data <- read.table("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/10_OneNumSevCatSubgroupsSevObs.csv", 
                   header = T, sep = ",") %>%
        mutate(tip = round(tip/total_bill*100, 1))
View(data)

### Gráfico

data %>%
  mutate(day = fct_reorder(day, tip)) %>%
  mutate(day = factor(day, levels = c("Thur", "Fri", "Sat", "Sun"))) %>%
  ggplot(aes(fill = sex, y = tip, x = day)) + 
    geom_violin(position = "dodge", alpha = 0.5, outlier.colour = "transparent") +
    scale_fill_viridis(discrete = T, name = "") +
    theme_ipsum()  +
    xlab("") +
    ylab("Tip (%)") +
    ylim(0,40)
