
# DATA --------------------------------------------------------------------

titanic <- readr::read_csv("data/titanic.csv")

dplyr::glimpse(titanic)

# EXERCICIO 1 -------------------------------------------------------------

ggplot2::ggplot(data = titanic, ggplot2::aes( x = Age)) +
  ggplot2::geom_histogram(binwidth = 5, fill = "lightblue", color = "black") +
  ggplot2::labs(
    x = "Idade",
    y = "Contagem"
  ) +
  ggplot2::theme_minimal()

# EXERCICIO 2 -------------------------------------------------------------

ggplot2::ggplot(data = titanic, mapping = ggplot2::aes(x = Pclass)) +
  ggplot2::geom_density(ggplot2::aes(fill = Pclass), alpha = 0.5) +
  ggplot2::labs(
    x = "Classe",
    y = "Idade"
  ) +
  ggplot2::theme_bw()

# EXERCICIO 3 -------------------------------------------------------------

titanic |>
  dplyr::mutate(
    Pclass = dplyr::case_when(
      Pclass == "1st" ~ "Primeira Classe",
      Pclass == "2nd" ~ "Segunda Classe",
      Pclass == "3rd" ~ "Terceira Classe",
      TRUE ~ "Tripulação"
    )
  ) |>
ggplot2::ggplot() +
  ggplot2::geom_bar(ggplot2::aes( x = Pclass)) +
  ggplot2::labs(
    x = "Classe",
    y = "Contagem"
  ) +
  ggplot2::theme_bw()

# EXERCICIO 4 -------------------------------------------------------------

titanic |>
  dplyr::mutate(
    Pclass = dplyr::case_when(
      Pclass == "1st" ~ "Primeira Classe",
      Pclass == "2nd" ~ "Segunda Classe",
      Pclass == "3rd" ~ "Terceira Classe",
      TRUE ~ "Tripulação"
    ),
    Survived = dplyr::case_when(
      Survived != 0 ~ "Sobreviveu",
      TRUE ~ "Morreu"
    )
  ) |>
  dplyr::group_by(Pclass, Survived) |>
  dplyr::summarise(Total = dplyr::n(), .groups = "drop") |>
  dplyr::mutate(Prop = Total / sum(Total)) |>
  ggplot2::ggplot(ggplot2::aes(x = Total, y = Pclass)) +
  ggplot2::geom_bar(
    ggplot2::aes(fill = Survived),
    stat = "identity",
    position = "fill",
    width = 0.8
  ) +
  ggplot2::labs(
    y = "Classe",
    x = "Prop",
    fill = "Status",
    title = "Proporção de sobreviventes por classe",
    caption = "Fonte: Titanic Dataset",
  ) +
  ggplot2::theme_bw()