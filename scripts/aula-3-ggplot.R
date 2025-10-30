# REMOVER PONTOS NULOS ----------------------------------------------------

df_remove_na <- dplyr::filter(
  df_example_1, ! is.na(bill_length_mm) &  ! is.na(bill_depth_mm)
)

# PLOT (PROFUNDIDADE X COMPRIMENTO) ---------------------------------------

ggplot2::ggplot(
  df_remove_na,
  mapping = ggplot2::aes(x = bill_depth_mm, y = bill_length_mm)
) +
  ggplot2::geom_point(
    ggplot2::aes(color = species),
    size = 1.5,
    alpha = 0.4,
    shape = 17
  )

# PLOT (PROFUNDIDADE X COMPRIMENTO - LABS) --------------------------------

ggplot2::ggplot(
  df_remove_na,
  mapping = ggplot2::aes(x = bill_depth_mm, y = bill_length_mm)
) +
  ggplot2::geom_point(
    ggplot2::aes(color = species),
    size = 1.5,
    alpha = 0.4,
    shape = 17
  ) +
  ggplot2::labs(
    title = "profundidade bico x comprimento do bico",
    x = "profundidade do bico",
    y = "Comprimento do bico",
    color = "Especíes",
    caption = "Fonte: penguis"
  )

# PLOT (PROFUNDIDADE X COMPRIMENTO -  SCALES) -----------------------------

ggplot2::ggplot(
  df_remove_na,
  mapping = ggplot2::aes(x = bill_depth_mm, y = bill_length_mm)
) +
  ggplot2::geom_point(
    ggplot2::aes(color = species),
    size = 1.5,
    alpha = 0.4,
    shape = 17
  ) +
  ggplot2::scale_x_continuous(name = "Profundidade do bico") +
  ggplot2::scale_y_continuous(name = "Comprimento do bico") +
  ggplot2::scale_color_discrete(name = "Espécies")


# BOXPLOT  ----------------------------------------------------------------

ggplot2::ggplot(
  data = df_remove_na,
  mapping = ggplot2::aes(x = species, y = body_mass_g)
) +
  ggplot2::geom_boxplot(ggplot2::aes(fill = species)) +
  ggplot2::scale_x_discrete(name = "Espécies") +
  ggplot2::scale_y_continuous(name = "Massa corporal") +
  ggplot2::scale_fill_discrete(name = "Espécies") +
  ggplot2::labs(title = "Espécies x Massa corporal")