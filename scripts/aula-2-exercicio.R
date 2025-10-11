sinasc_rs <- readr::read_csv("data/sinasc_rs.csv")

dplyr::glimpse(sinasc_rs)

# EXERCICIO 1, 2, 3, 4 e 5 ------------------------------------------------

dado_sinasc_final <- sinasc_rs |>
  dplyr::select(
    PARTO,
    SEXO,
    IDADEMAE,
    PESO,
    ANONASC,
    MESNASC,
    DIANASC,
    DIASEMNASC,
    CODMUNRES,
    GESTACAO
  ) |>
  dplyr::mutate(
    PESO  = as.numeric(PESO),
    IDADEMAE = as.numeric(IDADEMAE),
    CODMUNRES = as.numeric(CODMUNRES),
    GESTACAO = as.numeric(GESTACAO)
  ) |>
  dplyr::mutate(
    PARTO = dplyr::case_when(
      PARTO == 9 ~ "Ignorado",
      PARTO == 1 ~ "Vaginal",
      PARTO == 2 ~ "Cesáreo"
    )
  ) |>
  dplyr::mutate(
    SEXO = dplyr::case_when(
      SEXO == 0 ~ "Ignorado",
      SEXO == 1 ~ "Masculino",
      SEXO == 2 ~ "Feminino"
    )
  )

readr::write_csv(dado_sinasc_final, 'data/dado_sinasc_final.csv')

# EXERCICIO 6 -------------------------------------------------------------

dado_sinasc_final |>
  dplyr::group_by(ANONASC) |>
  dplyr::summarise(MEDIA_IDADEMAE = mean(IDADEMAE, na.rm = TRUE))


# EXERCICIO 7 -------------------------------------------------------------

dado_sinasc_final |>
  dplyr::filter(ANONASC == 2023) |>
  dplyr::group_by(SEXO) |>
  dplyr::summarise(MEDIA_PESO = mean(PESO, na.rm = TRUE))

# EXERCICIO 8 -------------------------------------------------------------

sinasc_rs |>
  dplyr::group_by(MESNASC, ANONASC) |>
  dplyr::summarise(TOTAL_MESNASC = dplyr::n()) |>
  dplyr::arrange(desc(TOTAL_MESNASC))


# EXERCICIO 9 -------------------------------------------------------------

sinasc_rs |>
  dplyr::group_by(DTNASC, ANONASC) |>
  dplyr::summarise(TOTAL_DTNASC = dplyr::n()) |>
  dplyr::arrange(desc(TOTAL_DTNASC))



# EXERCICIO 10 ------------------------------------------------------------

dado_sinasc_parto <- sinasc_rs |>
  dplyr::group_by(PARTO, DIASEMNASC) |>
  dplyr::filter(PARTO != 9) |>
  dplyr::group_by(PARTO) |>
  dplyr::summarise(TOTAL_PARTO = dplyr::n())


# EXERCICIO 11 ------------------------------------------------------------

readr::write_csv(dado_sinasc_parto, 'data/dado_sinasc_parto.csv')
