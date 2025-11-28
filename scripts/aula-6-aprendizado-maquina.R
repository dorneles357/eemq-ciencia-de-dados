# INSTALAR PACOTES --------------------------------------------------------

install.packages(c(
  "dplyr",
  "ggplot2",
  "rpart",
  "rpart.plot",
  "caret",
  "vip",
  "yardstick"))

# IMPORTAR DADOS ----------------------------------------------------------

set.seed(123)

df <- iris

dplyr::glimpse(df)

# PARTICIONAR DADOS -------------------------------------------------------

index <- caret::createDataPartition(
  y = df$Species,
  p = 0.7,
  list = FALSE
)
index

# INDICE PARA TREINO E TESTE ----------------------------------------------

training <- df[index, ]
test <- df[-index, ]

# MODELO DE ARVORE DE DECISAO ---------------------------------------------

model_tree <- caret::train(
  Species ~ .,
  data = training,
  method = "rpart"
)
model_tree

# MODELO COM DADOS DE TREINO ----------------------------------------------

rpart.plot::rpart.plot(model_tree$finalModel, type = 2, extra = 1)

# PLOT COMPRANDO TIPOS POR TAMNHO DE PETALAS ------------------------------

ggplot2::ggplot(
  data = training,
  ggplot2::aes(x = Petal.Length, y = Petal.Width, color = Species)
) +
  ggplot2::geom_point()+
  ggplot2::geom_vline(xintercept  = 2.6) +
  ggplot2::geom_hline(yintercept  = 0.8) +
  ggplot2::geom_hline(yintercept = 1.67)

# PREDICAO COM OS DADOS DE TESTE ------------------------------------------

predict <- predict(model_tree, test)

# MATRIZ DE CONFUSAO ------------------------------------------------------

confusionMatrix(predict, test$Species)

result <- data.frame(
  current = test$Species,
  predict = predict
)
result

yardstick::conf_mat(
  result,
  truth = current,
  estimate = predict
 ) |>
  autoplot(type = "heatmap")