propByCat <- function(df, cat1, cat2){
  small_df <- df %>%
    group_by(cat1) %>%
    summarize("my_count_by_{{cat1}}" = n())
  big_df <- df %>%
    left_join(small_df, by = c("cat1")) %>%
    group_by(cat1, cat2) %>%
    summarize("prop_of{{cat1}}by{{cat2}}" = n() / ("my_count_by_{{cat1}}"))
  return(big_df)
}
