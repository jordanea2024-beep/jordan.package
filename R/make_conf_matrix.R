make_conf_matrix <- function(my_model, my_data, my_predictor){
  # Function to make a confusion matrix for a classier model
  print(summary(my_model))
  pred_prob <- predict(my_model, newdata = my_data, type = "response")
  pred_class <- ifelse(pred_prob > 0.5, 1, 0)
  pred_class <- factor(pred_class, levels = c(0,1))
  actual_class <- factor(my_predictor, levels = c(0, 1))
  matrix_results <- caret::confusionMatrix(data = pred_class,
                                           reference = actual_class,
                                           positive = "1")
  return(matrix_results)
}
