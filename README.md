# Gráfico Violino

#### Autora do script: Jeanne Franco
#### Data: 07/10/23
#### Referência: https://r-graph-gallery.com/violin.html

##### Tópicos do script

1. Introdução
2. Gráfico de violino horizontal com ggplot2
- Pacotes
- Carregar dados do GitHub;
- Os dados estão em formato amplo, precisamos torná-los 'tidy' ou 'longos';
- Gráfico.
3. Gráfico violino com box-plot e tamanho de amostra
- Pacotes;
- Criar um conjunto de dados;
- Tamanho da amostra;
- Gráfico.
4. Gráfico de violino agrupado
- Pacotes;
- Carregar conjunto de dados;
- Gráfico.

##### Observação

Além do geom_violin e geom_boxplot, também podemos adicionar ao gráfico violino a função geom_jitter do ggplot2. O geom_jitter é um coveniente caminho para o is a geom_point(position = "jitter"). Ele adiciona uma pequena quantidade de variação randômica à localização de cada ponto, é uma maneira útil de lidar com plotagem excessiva causada por discrepância em conjuntos de dados menores. Ele permite visualizar a quantidade de observações das amostras de cada grupo.
