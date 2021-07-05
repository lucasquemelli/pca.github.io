# pca.github.io
Este projeto é a utilização de Análise de Componentes Principais (PCA - Principal Component Analysis) para uma planta química de produção de anidrido acético.

# Limpeza de dados e de outliers 6 sigma

Inicialmente, foi feita a limpeza de dados anômalos utilizando Excel. Para a limpeza, foram consideradas as vazões de entrada (ácido acético) e de saída (produto: anidrido acético) a fim de excluir os períodos transientes, os períodos em que a planta não estava em funcionamento e os valores que apresentavam excessivas repetições. 

O resultado da limpeza está presente na Figura 1, na qual está presente a variação das vazões de ácido acético e de produto ao longo do tempo – no gráfico, foi preferível inserir o número de observações porque se tratava da união de vários períodos (em horas) diferentes.

![image](https://user-images.githubusercontent.com/81119854/124501242-8f5d7900-dd97-11eb-9fbc-c9ec2245c26a.png)

A partir da limpeza anterior de dados, foi feita a identificação dos outliers da corrente de anidrido para a sua, posterior, exclusão. Esta etapa foi realizada utilizando o RStudio. 

A seguir, os comandos para a inserção do DataFrame, para a definição dos limites inferior e superior (que excluem os outliers), o gráfico da corrente de anidrido com sua média e limites e, por fim, o comando de exibição de outliers.

![image](https://user-images.githubusercontent.com/81119854/124501676-62f62c80-dd98-11eb-8bd7-acf7d59e06d9.png)

Abaixo, o gráfico de controle para a corrente de anidrido, com a definição dos limites para exclusão dos outliers.

![image](https://user-images.githubusercontent.com/81119854/124501914-d13aef00-dd98-11eb-8e55-31c015f10257.png)

Pela figura acima, observa-se que não há outliers (porque os identificados foram removidos). Ainda assim, foi possível confirmar que não há outliers a partir da verificação no código anterior:

![image](https://user-images.githubusercontent.com/81119854/124502068-1bbc6b80-dd99-11eb-875e-415a035689fc.png)

Procedimento análogo foi realizado com a corrente de ácido acético.

# Identificação e remoção de outliers Mahalanobis

Os comandos para a limpeza Mahalanobis estão abaixo:

![image](https://user-images.githubusercontent.com/81119854/124502345-af8e3780-dd99-11eb-8ff1-f4acd53cf7b6.png)

# Aplicação da PCA

Em seguida, foi inserido um novo DataFrame de nome pca, excluindo a coluna 1 (de horas). A inserção do PCA foi feita pelo comando prcomp. 

Para a primeira análise, utilizou-se o comando TRUE - que corresponde à matriz de correlação. Os comandos podem ser vistos abaixo:

![image](https://user-images.githubusercontent.com/81119854/124502770-73a7a200-dd9a-11eb-9d33-8bade61c3602.png)

As variáveis PCA_var e PCA_propvarex foram inseridas para serem utilizadas na construção dos gráficos de distribuição para definição do número de componentes principais. Os comandos dos gráficos de distribuição podem ser vistos abaixo:

![image](https://user-images.githubusercontent.com/81119854/124502930-cf722b00-dd9a-11eb-90a4-a31a00ef11b1.png)

