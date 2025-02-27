

print_to_pdf <- function(filename, path = "./", scale = 0.75, landscape = FALSE){
  
  # -- compute urls
  input <- file.path(path, filename)
  output <- file.path(path, paste0(tools::file_path_sans_ext(filename), ".pdf"))
  
  # -- call chrome_print
  pagedown::chrome_print(input = input,
                         output = output,
                         format = "pdf",
                         options = list(scale = scale,
                                        landscape = landscape,
                                        marginTop = 0,
                                        marginBottom = 0,
                                        marginLeft = 0,
                                        marginRight = 0))
  
}
