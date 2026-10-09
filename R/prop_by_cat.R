#' Proportion by Categorical Attribute
#'
#' Create a new dataframe with the proportion of category two for each group in category one
#'
#' @param df A Data Frame
#' @param cat1 a string of the column name for the first category, the one the user should want to cat2 out of
#' @param cat2 a string of the column name for the second category, the user should want to know this variable by cat1
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#' @return a data frame with each cat1 and cat2 and their proportions
#' @export
#'
#' @examples
#' df <- data.frame( row_id = 1:10, category_a = c("A", "A", "B", "B", "C", "C", "D", "D", "E", "E"), category_b = c("1", "2", "3", "1", "1", "2", "2", "3", "1", "1"))
#' new_df <- prop_by_cat(df, "category_a", "category_b")
#' print(new_df)
prop_by_cat <- function(df, cat1, cat2) {
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
#' Add Proportion by Categorical Attribute to Dataframe
#'
#' Adds to the dataframe the proportion of category two for each group in category one
#'
#' @param df A Data Frame
#' @param cat1 a string of the column name for the first category, the one the user should want to cat2 out of
#' @param cat2 a string of the column name for the second category, the user should want to know this variable by cat1
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#' @return a dataframe with the proportions as a new column
#' @export
#'
#' @examples
#' df <- data.frame( row_is = 1:10, category_a = c("A", "A", "B", "B", "C", "C", "D", "D", "E", "E"), category_b = c("1", "2", "3", "1", "1", "2", "2", "3", "1", "1"))
#' new_df <- add_prop_to_df(df, "category_a", "category_b")
add_prop_to_df <- function(df, cat1, cat2){
  df_with_prop <- prop_by_cat(df, cat1, cat2)
  df <- df %>%
    # join a df with info from the propByCat function
    dplyr::left_join(df_with_prop, by = c({{cat1}}, {{cat2}}))
  return(df)
}
