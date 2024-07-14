#' @title merge excel file
#' @description this function is mainly used to merge all excel files in a specified directory
#' @param directory the directory where the excel file is located
#' @param output_file the name of the merged excel file
#'
#' @return The merged data frame
#' @export
#'
#' @examples merge_excel("path/to/excel/files", "output/merged.xlsx")
merge_excel <- function(directory, output_file) {

  files <- list.files(directory, pattern = "\\.xlsx$", full.names = TRUE)

  combined_data <- lapply(files, readxl::read_excel)
  merged_data <- dplyr::bind_rows(combined_data)

  openxlsx::write.xlsx(merged_data, file = output_file, rowNames = FALSE)

  return(merged_data)
}
