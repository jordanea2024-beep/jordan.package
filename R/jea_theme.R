#' @importFrom sysfonts font_add_google
font_add_google("EB Garamond", family = "eb_garamond")
showtext::showtext_auto()
#' Custom Theme for Jordan's Package
#'
#' Based in theme_bw() this theme function elevates the simplicity of the theme, centers labels, and places boxes around the legend.
#' @examples
#' df <- data.frame( row_id = 1:10, category_a = c("A", "A", "B", "B", "C", "C", "D", "D", "E", "E"), category_b = c("1", "2", "3", "1", "1", "2", "2", "3", "1", "1"))
#' ggplot(df, aes(x = category_a, fill = category_b)) +geom_bar(postion = "fill") + jea_theme() + scale_fill_manual(values = jea_colors)
#' @export
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
#' Color Scheme For My Package
#'
#' @export
jea_colors <- c('#581c87', '#7a35d4', "#21643e", "#0f291e", "#1d4ed8")
