#' Make a Confusion Matrix
#'
#' Using a model, your data, and the predictor column this will create a Confusion Matrix to Better understand your classifer model
#'
#' @param my_model the classier model being evaluated
#' @param my_data The data you would like to test your model on
#' @param my_predictor the column that is associated with your predictor, use $ notation for this input
#' @return Confusion Matrix
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
