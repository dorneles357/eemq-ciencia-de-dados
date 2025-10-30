
sinasc_rs <- readr::read_csv("data/sinasc_rs.csv")

dplyr::glimpse(sinasc_rs)


# EXERCICIO 1 -------------------------------------------------------------

df1 <- sinasc_rs |>
  dplyr::mutate(ANONASC = as.character(ANONASC))

ggplot2::ggplot(data = df1) +
  ggplot2::geom_bar(mapping = ggplot2::aes(x = ANONASC)) +
  ggplot2::labs(
    x = "Ano de Nascimento",
    y = "Total"
  ) +
  ggplot2::theme(geom = ggplot2::element_geom(ink = "dodgerblue"))

# EXERCICIO 2  ------------------------------------------------------------

df2 <- sinasc_rs |>
  dplyr::filter(ANONASC == 2023 & SEXO %in% c("1", "2")) |>
  dplyr::mutate(SEXO = dplyr::case_when(
    SEXO == "1" ~ "MASCULINO",
    SEXO == "2" ~ "FEMININO",
    TRUE ~ "NÃO IDENTIFICADO"
  )) |>
  dplyr::mutate(PESO = as.numeric(PESO))

ggplot2::ggplot(data = df2, mapping = ggplot2::aes(x = SEXO, y = PESO)) +
  ggplot2::geom_boxplot(ggplot2::aes(fill = SEXO))

# EXERCICIO 3 -------------------------------------------------------------

ggplot2::ggplot(data = df2, mapping = ggplot2::aes(x = PESO)) +
  ggplot2::geom_density(ggplot2::aes(color = SEXO)) +
  ggplot2::labs(
    y = "Densidade"
  )

# EXERCICIO 4 -------------------------------------------------------------

df4 <- sinasc_rs |>
  dplyr::mutate(ANONASC = as.character(ANONASC)) |>
  dplyr::filter(PARTO == 2 & ANONASC == 2023)

ggplot2::ggplot(data = df4, mapping = ggplot2::aes(x = DIASEMNASC)) +
  ggplot2::geom_bar() +
  ggplot2::labs(
    x = "Dia da semana de nascimento",
    y = "Total"
  )

# EXERCICIO 5 -------------------------------------------------------------

df5 <- sinasc_rs |>
  dplyr::mutate(ANONASC = as.character(ANONASC)) |>
  dplyr::filter(PARTO == 1 & ANONASC == 2023)

ggplot2::ggplot(data = df5, mapping = ggplot2::aes(x = DIASEMNASC)) +
  ggplot2::geom_bar() +
  ggplot2::labs(
    x = "Dia da semana de nascimento",
    y = "Total"
  )

# EXERCICIO 6 -------------------------------------------------------------

df6 <- sinasc_rs |>
  dplyr::mutate(ANONASC = as.character(ANONASC)) |>
  dplyr::filter(ANONASC >= 2000 & ANONASC <= 2023) |>
  dplyr::mutate(SEXO = dplyr::case_when(
    SEXO == "1" ~ "MASCULINO",
    SEXO == "2" ~ "FEMININO",
    TRUE ~ "NÃO IDENTIFICADO"
  ))

ggplot2::ggplot(data = df6, mapping = ggplot2::aes(x = DIASEMNASC)) +
  ggplot2::geom_bar(ggplot2::aes(fill = SEXO)) +
  ggplot2::labs(
    x = "Dia da semana de nascimento",
    y = "Total"
  )
