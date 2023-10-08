
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
