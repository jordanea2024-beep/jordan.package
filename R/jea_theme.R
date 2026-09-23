font_add_google("EB Garamond", family = "eb_garamond")

jea_theme <- function() {
  theme_bw(base_family = "eb_garamond") +
    theme(
      # Text Elements
      plot.title = element_text(
        face = "bold",
        color = "black",
        size = 25,
        hjust = 0.5 # centered
      ),
      plot.subtitle = element_text(
        color = "gray5",
        size = 20,
        hjust = 0.5 # centered
      ),
      plot.caption = element_text(
        color = "gray5",
        size = 20,
        hjust = 0.5 # centered
      ),
      axis.text = element_text(color = "gray5",
                               size = 15),
      axis.title = element_text(color = "gray5",
                                size = 20),

      ## Legend Elements

      # Put it at the bottom of the plot
      legend.position = "bottom",
      #lays out items horizontally
      legend.direction = "horizontal",
      # put a box around it
      legend.box.background = element_rect(color = "gray5", size = 1),
      # put its title on top
      legend.title.position = "top",
      legend.title = element_text(color = "gray5",
                                  hjust = 0.5, # center,
                                  size = 15
      ),
      legend.text = element_text(
        size = 15
      )

    )
}
