
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
