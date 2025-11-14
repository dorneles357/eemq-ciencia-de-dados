# PACKAGES ----------------------------------------------------------------

install.packages("geobr")

# DATA --------------------------------------------------------------------

municipios <- geobr::read_municipality(code_muni = "RS")
escolas <- geobr::read_schools(year = 2023)

dplyr::glimpse(municipios)
dplyr::glimpse(escolas)

# STATE = RS --------------------------------------------------------------

ggplot2::ggplot(data = municipios) +
  ggplot2::geom_sf()

# MUNI = SANTA MARIA ------------------------------------------------------

municipios |>
  dplyr::filter(name_muni == "Santa Maria" | code_muni == 4316907) |>
ggplot2::ggplot() +
  ggplot2::geom_sf()

# MUNI = SANTA MARIA & SCHOOL ---------------------------------------------

df_school <- escolas |>
  dplyr::filter(name_muni == "Santa Maria" & abbrev_state == "RS")

df_santa_maria <- municipios |>
  dplyr::filter(name_muni == "Santa Maria" | code_muni == 4316907)

ggplot2::ggplot(data = df_school) +
  ggplot2::geom_sf(data = df_santa_maria) +
  ggplot2::geom_sf(ggplot2::aes(color = urban)) +
  ggplot2::facet_wrap(~ government_level)

# MAP WITH GGPLOT2 --------------------------------------------------------

df_map_world <- ggplot2::map_data(map = "world")

ggplot2::ggplot(data = df_map_world) +
  ggplot2::geom_polygon(ggplot2::aes(x = long, y = lat, group = group))
  