#' Make a Confusion Matrix
#'
#' Using a model, your data, and the predictor column this will create a Confusion Matrix to Better understand your classifer model
#'
#' @param my_model the classier model being evaluated
#' @param my_data The data you would like to test your model on
#' @param my_predictor the column that is associated with your predictor, use $ notation for this input
#' @return Confusion Matrix
#'
#' @examples
#' library(dplyr)
#' df <- data.frame( row_id = 1:10, category_a = c("A", "A", "B", "B", "C", "C", "D", "D", "E", "E"), category_b = c("1", "2", "3", "1", "1", "2", "2", "3", "1", "1"))
#' df <- df %>% mutate(is_A_bin = ifelse(category_a == "A", 1, 0))
#' my_model <- glm(data = df, is_A_bin ~ category_b + row_id, family = "binomial")
#' my_conf_matrix <- make_conf_matrix(my_model, df, df$is_A_bin)
#' print(my_conf_matrix)
#'
#' @export
make_conf_matrix <- function(my_model, my_data, my_predictor){
  # Function to make a confusion matrix for a classier model
  print(summary(my_model))
  pred_prob <- stats::predict(my_model, newdata = my_data, type = "response")
  pred_class <- ifelse(pred_prob > 0.5, 1, 0)
  pred_class <- factor(pred_class, levels = c(0,1))
  actual_class <- factor(my_predictor, levels = c(0, 1))
  matrix_results <- caret::confusionMatrix(data = pred_class,
                                           reference = actual_class,
                                           positive = "1")
  return(matrix_results)
}
