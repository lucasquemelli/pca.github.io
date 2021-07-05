# pca.github.io
Este projeto é a utilização de Análise de Componentes Principais (PCA - Principal Component Analysis) para uma planta química de produção de anidrido acético.

# Matriz de correlação

Inicialmente, foi feita a limpeza de dados anômalos utilizando Excel. Para a limpeza, foram consideradas as vazões de entrada (ácido acético) e de saída (produto: anidrido acético) a fim de excluir os períodos transientes, os períodos em que a planta não estava em funcionamento e os valores que apresentavam excessivas repetições. 

O resultado da limpeza está presente na Figura 1, na qual está presente a variação das vazões de ácido acético e de produto ao longo do tempo – no gráfico, foi preferível inserir o número de observações porque se tratava da união de vários períodos (em horas) diferentes.

![image](https://user-images.githubusercontent.com/81119854/124501242-8f5d7900-dd97-11eb-9fbc-c9ec2245c26a.png)

A partir da limpeza anterior de dados, foi feita a identificação dos outliers da corrente de anidrido para a sua, posterior, exclusão. Esta etapa foi realizada utilizando o RStudio. 

A seguir, os comandos para a inserção do DataFrame, para a definição dos limites inferior e superior (que excluem os outliers), o gráfico da corrente de anidrido com sua média e limites e, por fim, o comando de exibição de outliers.

![image](https://user-images.githubusercontent.com/81119854/124501676-62f62c80-dd98-11eb-8bd7-acf7d59e06d9.png)

