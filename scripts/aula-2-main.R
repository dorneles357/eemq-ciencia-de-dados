source("scripts/aula-2-data.R")

# Uso do dplyr (seleção, filtro, transformação) ----------------------------

dados_jogos_olimpicos |>
  dplyr::select(year, name, sex, noc, city, event, medal) |>
  dplyr::filter(year == 2016) |>
  dplyr::mutate(medalha = case_when(
      medal == "Gold" ~ 1,
      medal == "Silver" ~ 2,
      medal == "Bronze" ~ 3
    )
  )

# média (altura, idade) dos atletas brasileiros na OLM - 2016 -------------

dados_jogos_olimpicos |>
  dplyr::select(year, height, age, name, sex, noc, city, event, medal) |>
  dplyr::filter(year == 2016) |>
  dplyr::group_by(noc) |>
  dplyr::summarise(
    mean_height = mean(height, na.rm = TRUE),
    mean_age = mean(age, na.rm = TRUE)
  ) |>
  dplyr::filter(noc == "BRA")

# total de medalhas por equipe e medalha para o ano de 2016 ---------------

dados_jogos_olimpicos |>
  dplyr::select(year, name, sex, noc, city, event, medal) |> 
  dplyr::filter( year == 2016) |> 
  dplyr::group_by(noc, medal) |> 
  dplyr::summarise(total_de_medalhas = n_distinct(event)) |> 
  dplyr::arrange(desc(total_de_medalhas)) |>
  head(10)
