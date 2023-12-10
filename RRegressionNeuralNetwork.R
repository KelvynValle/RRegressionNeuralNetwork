install.packages("neuralnet")
library(neuralnet)
dados_entrada <- as.data.frame(runif(50, min=0, max=100))
dados_saida <- sqrt(dados_entrada)
dados_treino <- cbind(dados_entrada,dados_saida)
colnames(dados_treino) <- c("Entrada","Saida")
net.raiz <- neuralnet(Saida~Entrada,dados_treino, hidden=10,
                      threshold=0.01)
net.raiz
plot(net.raiz)
dados_teste <- as.data.frame((1:10)^2)
net.resultados <- compute(net.raiz, dados_teste)
ls(net.resultados)
print(net.resultados$net.result)
resultado_final <- cbind(dados_teste,sqrt(dados_teste),
                         as.data.frame(net.resultados$net.result))
colnames(resultado_final) <- c("Entrada","Saida Esperada","Saida da
Rede")
print(resultado_final)