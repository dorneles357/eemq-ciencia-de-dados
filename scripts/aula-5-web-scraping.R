
# PACKAGES ----------------------------------------------------------------

install.packages("robotstxt")
install.packages("rvest")


# WEB SCRAPING PERMISSION -------------------------------------------------

url <- "https://pt.wikipedia.org/wiki/Lista_de_munic%C3%ADpios_do_Rio_Grande_do_Sul_por_IDH-M";

is_web_scraping_permission <- robotstxt::paths_allowed(url)

if (is_web_scraping_permission) {
  print("Permissão de web-scraping para o site está liberada.")
} else {
  ("Permissão de web-scraping para o site não está liberada.")
}

# WEB SCRAPING ------------------------------------------------------------

df_wiki <- rvest::read_html(url)
tabela_idh <- df_wiki |>
  rvest::html_element("table.wikitable") |>
  rvest::html_table()


validator_idh <- function (value) {
  dplyr::case_when(
      0.000 <= value && value <= 0.499 ~ 1,
      0.500 <= value && value <= 0.599 ~ 1,
      0.600 <= value && value <= 0.699 ~ 1,
      0.700 <= value && value <= 0.799 ~ 1,
      0.800 <= value && value <= 1 ~ 1,
      TRUE ~ 0
    )
}
df_wiki <- rvest::read_html(url)

validator_idh <- function (value) {
  dplyr::case_when(
      0.000 <= value && value <= 0.499 ~ 1,
      0.500 <= value && value <= 0.599 ~ 1,
      0.600 <= value && value <= 0.699 ~ 1,
      0.700 <= value && value <= 0.799 ~ 1,
      0.800 <= value && value <= 1 ~ 1,
      TRUE ~ 0
    )
}

tabela_idh <- df_wiki |>
  rvest::html_element("table.wikitable") |>
  rvest::html_table() |>
  janitor::clean_names() |>
  dplyr::mutate(
    posicao = as.numeric(posicao),
    dados_de_2010 = as.double(stringr::str_replace(dados_de_2010, ",", ".")),
    dados_de_2010_2 = as.double(stringr::str_replace(dados_de_2010_2, ",", ".")),
    dados_de_2010_3 = as.double(stringr::str_replace(dados_de_2010_3, ",", ".")),
    dados_de_2010_4 = as.double(stringr::str_replace(dados_de_2010_4, ",", "."))
  ) |>
  dplyr::filter(! is.na(posicao))

