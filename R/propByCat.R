#' @importFrom magrittr %>%
#' @export
propByCat <- function(df, cat1, cat2) {
  # Create a new dataframe with the proportion of
  # category two for each group in category one
  # Parameters:
  # df: a data frame
  # cat1: the first category, the one the user should want to cat2 out of
  # cat2: the second category, the user should want to know this variable by cat1
  # Returns:
  # big_df: a data frame with each cat1 and cat2 and their proportions
  small_df <- df %>%
    # group by the 1st cat
    dplyr::group_by(.data[[cat1]]) %>%
    # get total of each of the 1st cat
    dplyr::summarize(var_name1 = dplyr::n()) %>%
    dplyr::ungroup()
  big_df <- df %>%
    # join the totals to the df
    dplyr::left_join(small_df, by = {{cat1}}) %>%
    # group by both cats
    dplyr::group_by(.data[[cat1]], .data[[cat2]], var_name1) %>%
    # find the totals by two cats
    dplyr::summarize(my_total = dplyr::n()) %>%
    # new col of the prop of cat 2 by cat 1
    dplyr::mutate(my_prop = my_total / var_name1) %>%
    dplyr::ungroup()
  return(big_df)
}

add_prop_to_df <- function(df, cat1, cat2){
  # Adds to the dataframe the proportion of
  # category two for each group in category one
  # Parameters:
  # df: a data frame
  # cat1: the first category, the one the user should want to cat2 out of
  # cat2: the second category, the user should want to know this variable by cat1
  # Returns:
  # df: the orginal dataframe with each cat1 and cat2 and their proportions added on
  df_with_prop <- propByCat(df, cat1, cat2)
  df <- df %>%
    # join a df with info from the propByCat function
    dplyr::left_join(df_with_prop, by = c({{cat1}}, {{cat2}}))
  return(df)
}
