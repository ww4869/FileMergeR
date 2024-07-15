#' @title merge csv file
#' @description this function is mainly used to merge all CSV files in a specified directory
#'
#' @param directory the directory where the CSV file is located
#' @param output_file The name of the merged csv file
#'
#' @return The merged data frame
#' @export
#'
#' @examples merge_csv("test_data/", "test_data/csv_merge_file.csv")
merge_csv <- function(directory, output_file) {

  files <- list.files(directory, pattern = "\\.csv$", full.names = TRUE)

  combined_data <- lapply(files, read.csv)
  merged_data <- do.call(rbind, combined_data)

  write.csv(merged_data, file = output_file, row.names = FALSE)

  return(merged_data)
}
