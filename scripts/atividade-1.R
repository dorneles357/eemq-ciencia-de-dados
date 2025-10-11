
# EXERCICIO 1
titanic <- readr::read_csv("data/titanic.csv")

dplyr::glimpse(titanic)

# EXERCICIO 2, 3, 4, 5
titanic %>%
  dplyr::select(
    Pclass,
    Sex,
    Age,
    Survived,
    Country
  ) %>%
  dplyr::mutate(
    Pclass = dplyr::case_when(
      Pclass == "1st" ~ "Primeira Classe",
      Pclass == "2nd" ~ "Segunda Classe",
      Pclass == "3rd" ~ "Terceira Classe",
      TRUE ~ "Tripulação"
    ),
    GRUPO = dplyr::case_when(
      Pclass != "Tripulação" ~ "Passageiro",
      TRUE ~ "Tripulante"
    )
  ) -> dado_titanic_final

# EXERCICIO 6

readr::write_csv(dado_titanic_final, "data/titanic_limpo.csv")

# EXERCICIO 7

dado_titanic_final %>%
  dplyr::group_by(Pclass, Country) %>%
  dplyr::summarise(Total_Country = dplyr::n()) %>%
  dplyr::arrange(desc(Total_Country))

# EXERCICIO 8

dado_titanic_final %>%
  dplyr::group_by(Pclass) %>%
  dplyr::summarise(Total = dplyr::n()) %>%
  dplyr::arrange(desc(Total))

# EXERCICIO 9

dado_titanic_final %>%
  dplyr::group_by(Pclass, Survived) %>%
  dplyr::summarise(Total = dplyr::n()) %>%
  dplyr::ungroup() %>%
  dplyr::mutate(Percentual = (Total / sum(Total)) * 100) %>%
  dplyr::filter(Survived == 1)

# EXERCICIO 10

dado_titanic_final %>%
  dplyr::filter(GRUPO == "Passageiro") %>%
  dplyr::group_by(Survived, Pclass, Sex) %>%
  dplyr::summarise(Total = dplyr::n(), .groups = "drop") -> dado_titanic_sobrevivencia

# EXERCICIO 11

readr::write_csv(dado_titanic_sobrevivencia, "data/dado_titanic_sobrevivencia.csv")

# EXERCICIO 12

dado_titanic_final %>%
  dplyr::mutate(
    FaixaEtaria = dplyr::case_when(
      Age <= 12 ~ "Criança",
      Age > 12 ~ "Adulto",
    )
  ) %>%
  dplyr::group_by(FaixaEtaria, Survived) %>%
  dplyr::summarise(Total = dplyr::n(), .groups = "drop") %>%
  dplyr::ungroup() %>%
  dplyr::mutate(Percentual = (Total / sum(Total)) * 100) %>%
  dplyr::filter(Survived == 1)