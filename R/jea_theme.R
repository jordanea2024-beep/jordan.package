#' @importFrom sysfonts font_add_google
#' @export
font_add_google("EB Garamond", family = "eb_garamond")

jea_theme <- function() {
  ggplot2::theme_bw(base_family = "eb_garamond") +
    ggplot2::theme(
      # Text Elements
      plot.title = ggplot2::element_text(
        face = "bold",
        color = "black",
        size = 25,
        hjust = 0.5 # centered
      ),
      plot.subtitle = ggplot2::element_text(
        color = "gray5",
        size = 20,
        hjust = 0.5 # centered
      ),
      plot.caption = ggplot2::element_text(
        color = "gray5",
        size = 20,
        hjust = 0.5 # centered
      ),
      axis.text = ggplot2::element_text(color = "gray5",
                               size = 15),
      axis.title = ggplot2::element_text(color = "gray5",
                                size = 20),

      ## Legend Elements

      # Put it at the bottom of the plot
      legend.position = "bottom",
      #lays out items horizontally
      legend.direction = "horizontal",
      # put a box around it
      legend.box.background = ggplot2::element_rect(color = "gray5", size = 1),
      # put its title on top
      legend.title.position = "top",
      legend.title = ggplot2::element_text(color = "gray5",
                                  hjust = 0.5, # center,
                                  size = 15
      ),
      legend.text = ggplot2::element_text(
        size = 15
      )

    )
}
