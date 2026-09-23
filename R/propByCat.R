#' @importFrom magrittr %>%
#' @export
propByCat <- function(df, cat1, cat2){
  small_df <- df %>%
    dplyr::group_by(cat1) %>%
    dplyr::summarize("my_count_by_{{cat1}}" = dplyr::n())
  big_df <- df %>%
    dplyr::left_join(small_df, by = c("cat1")) %>%
    dplyr::group_by(cat1, cat2) %>%
    dplyr::summarize("prop_of{{cat1}}by{{cat2}}" = dplyr::n() / ("my_count_by_{{cat1}}"))
  return(big_df)
}
