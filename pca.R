## Dataframe com os dados limpos

library(readxl)
pca <- read_excel("R/pca.xlsx")
View(pca)

## Adota-se duas variáveis principais (entrada e saída)
## Remoção de Outliers das vazões de anidrido e ácido acético (principais)


# Para FC0619 (anidrido)
sda <- sd(pca$FC0619)
LI.6S <- mean(pca$FC0619) - 3*sda
LS.6S <- mean(pca$FC0619) + 3*sda

plot(pca$FC0619, ylim = c(0,2600), xlab = "n° de observações", ylab = "Vazão (kg/h)", main = "Gráfico de controle: FC0619 +- 3S")

abline(h=mean(pca$FC0619),col=2,lwd=3)
abline(h=LI.6S,col=2,lty=2)
abline(h=LS.6S,col=2,lty=2)

# Exibir os outliers

pca$FC0619[pca$FC0619 < LI.6S]
pca$FC0619[pca$FC0619 > LS.6S]



# Para FC0629 (ácido acético)

sda <- sd(pca$FC0629)
LI.6S <- mean(pca$FC0629) - 3*sda
LS.6S <- mean(pca$FC0629) + 3*sda

plot(pca$FC0629, ylim = c(0,2000), xlab = "n° de observações", ylab = "Vazão (kg/h)", main = "Gráfico de controle: FC0629 +- 3S")

abline(h=mean(pca$FC0629),col=2,lwd=3)
abline(h=LI.6S,col=2,lty=2)
abline(h=LS.6S,col=2,lty=2)

# Exibir os outliers

pca$FC0629[pca$FC0629 < LI.6S]
pca$FC0629[pca$FC0629 > LS.6S]



# Utilizando matriz de correlação (comando TRUE)
pca <- pca[,-c(1)]

# distância estatístia

x <- pca
y <- as.data.frame(mahalanobis(x, colMeans(x), cov(x)))
names(y)[1] = "Distancias"
y$Index = c(1:nrow(y))


alpha = 0.05
df <- ncol(x[,])
limite <- qchisq(1-alpha,df = df)
is_mv_outlier <- ifelse(y$Distancias > limite, "SIM", "NÃO")
x$Outliers <- is_mv_outlier
x = x[x$Outliers == "NÃO",]

x
summary(x)

x[29] = NULL

pca <- x

### Fazendo PCA

## pca é o dataframe (letras minúsculas)
## PCA é a variável (letras maiúsculas)

PCA <- prcomp(pca,scale = TRUE)

names(PCA)
PCA$sdev
PCA$rotation
PCA$center   #médias
PCA$scale
PCA$x

PCA_var <- PCA$sdev^2
PCA_var

PCA_propvarex <- PCA_var/sum(PCA_var)*100 #proporção da variância
PCA_propvarex

summary(PCA)

screeplot(PCA,type = "line", ylim = c(0,15))
abline(h=1,lty=2,lwd=1.5,col=2)  

install.packages("factoextra")
library(factoextra)
fviz_eig(PCA)

plot(cumsum(PCA_propvarex),type = "b",xlab = "n° de variáveis (UM)", ylab = "Fração acumulada (%)")
abline(h=94,lty=2,lwd=1.5,col=2)  #5 variáveis são responsáveis por 90% da variância de todo o conjunto de variáveis

# pela inclinação do gráfico é possível observar que as 5 primeiras
# variáveis representam a maior parte da variância do sistema (90%)
# sendo as mais importantes, com base na variância dos dados
# então há correlação clara entre as variáveis e há ganho em 
# substituir as variáveis originais por componentes principais

pca.load <- PCA$rotation
pca.load.ordered.1 <- pca.load[order(abs(pca.load[,1])),1]
dotchart(pca.load.ordered.1,cex = 0.7,xlab = "loadings", main = "loadings PC1")

pca.load <- PCA$rotation
pca.load.ordered.1 <- pca.load[order(abs(pca.load[,2])),2]
dotchart(pca.load.ordered.1,cex = 0.7,xlab = "loadings", main = "loadings PC2")

pca.load <- PCA$rotation
pca.load.ordered.1 <- pca.load[order(abs(pca.load[,3])),3]
dotchart(pca.load.ordered.1,cex = 0.7,xlab = "loadings", main = "loadings PC3")

pca.load <- PCA$rotation
pca.load.ordered.1 <- pca.load[order(abs(pca.load[,4])),4]
dotchart(pca.load.ordered.1,cex = 0.7,xlab = "loadings", main = "loadings PC4")

pca.load <- PCA$rotation
pca.load.ordered.1 <- pca.load[order(abs(pca.load[,5])),5]
dotchart(pca.load.ordered.1,cex = 0.7,xlab = "loadings", main = "loadings PC5")


biplot(PCA,scale = 0,cex=c(0.5,0.9))


## escolhendo as variáveis principais

pca <- pca[,c(5,6,11,13,18)]
View(pca)

PCA <- prcomp(pca,scale = TRUE)

biplot(PCA,scale = 0,cex=c(0.5,0.9))


# Utilizando matriz de covariância (comando FALSE)

library(readxl)
pca <- read_excel("R/pca.xlsx")
View(pca)

pca <- pca[,-c(1)]

PCA <- prcomp(pca,scale = FALSE)

names(PCA)
PCA$sdev
PCA$rotation
PCA$center   #médias
PCA$scale
PCA$x

PCA_var <- PCA$sdev^2
PCA_var

PCA_propvarex <- PCA_var/sum(PCA_var)*100 #proporção da variância
PCA_propvarex

screeplot(PCA,type = "line", ylim = c(0,15))
abline(h=1,lty=2,lwd=1.5,col=2)  

library(factoextra)
fviz_eig(PCA)
abline(h=1,lty=2,lwd=1.5,col=2)  

plot(cumsum(PCA_propvarex),type = "b",xlab = "n° de variáveis (UM)", ylab = "Fração acumulada (%)")
abline(h=95,lty=2,lwd=1.5,col=2)  #2 variáveis são responsáveis por 90% da variância de todo o conjunto de variáveis


pca.load <- PCA$rotation
pca.load.ordered.1 <- pca.load[order(abs(pca.load[,1])),1]
dotchart(pca.load.ordered.1,cex = 0.7,xlab = "loadings", main = "loadings PC1")

pca.load <- PCA$rotation
pca.load.ordered.1 <- pca.load[order(abs(pca.load[,2])),2]
dotchart(pca.load.ordered.1,cex = 0.7,xlab = "loadings", main = "loadings PC2")

pca.load <- PCA$rotation
pca.load.ordered.1 <- pca.load[order(abs(pca.load[,3])),3]
dotchart(pca.load.ordered.1,cex = 0.7,xlab = "loadings", main = "loadings PC2")


## escolhendo as variáveis principais

pca <- pca[,c(5,11,18)]
View(pca)

PCA <- prcomp(pca,scale = FALSE)

PCA_var <- PCA$sdev^2
PCA_var

PCA_propvarex <- PCA_var/sum(PCA_var)*100 #proporção da variância
PCA_propvarex

biplot(PCA,scale = 0,cex=c(0.5,0.9))







