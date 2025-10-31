# PACKAGES ----------------------------------------------------------------

install.packages(c("devtools", "scales"))
devtools::install_github("tidyverse/dsbox")

# DATA --------------------------------------------------------------------

df <- dsbox::ucbadmit

df |> dplyr::glimpse()

# GGPLOT2 -----------------------------------------------------------------

ggplot2::ggplot(data = df, ggplot2::aes(y = gender, fill = admit)) + 
  ggplot2::geom_bar(position = "fill", with = 0.8) + 
  ggplot2::scale_x_continuous(name = "", 
                              breaks = seq(0, 1, 0.2),
                              labels = scales::percent_format()) +
  ggplot2::scale_y_discrete(name = "",
                            labels = c("Female" = "Feminino", "Male" = "Masculino")) +
  ggplot2::scale_fill_viridis_d(name = "",
                                alpha = 0.8,
                                option = "D",
                                labels = c("Admitted" = "Admitido", "Rejected" = "Rejeitado")) +
  ggplot2::theme_bw()

# CUSTOM THEME ------------------------------------------------------------

ggplot2::ggplot(data = df, ggplot2::aes(y = dept, fill = admit)) + 
  ggplot2::geom_bar(position = "fill", with = 0.6) + 
  ggplot2::scale_x_continuous(name = "", 
                              breaks = seq(0, 1, 0.2),
                              labels = scales::percent_format()) +
  ggplot2::scale_y_discrete(name = "",
                            labels = c("Female" = "Feminino", "Male" = "Masculino")) +
  ggplot2::scale_fill_viridis_d(name = "",
                                option = "D",
                                labels = c("Admitted" = "Admitido", "Rejected" = "Rejeitado")) +
  ggplot2::scale_fill_manual(values = c("skyblue", "salmon")) +
  ggplot2::theme_bw()

# FACETE ------------------------------------------------------------------

  ggplot2::ggplot(data = df, ggplot2::aes(y = dept, fill = admit)) + 
    ggplot2::geom_bar(position = "fill", with = 0.6) + 
    ggplot2::scale_x_continuous(name = "", 
                                breaks = seq(0, 1, 0.2),
                                labels = scales::percent_format()) +
    ggplot2::scale_y_discrete(name = "",
                              labels = c("Female" = "Feminino", "Male" = "Masculino")) +
    ggplot2::scale_fill_viridis_d(name = "",
                                  option = "D",
                                  labels = c("Admitted" = "Admitido", "Rejected" = "Rejeitado")) +
    ggplot2::scale_fill_manual(values = c("skyblue", "salmon")) +
    ggplot2::facet_wrap(~dept)
  ggplot2::theme_bw()
