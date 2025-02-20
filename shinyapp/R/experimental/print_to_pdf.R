

print_to_pdf <- function(scale = 0.75, landscape = FALSE){
  
  pagedown::chrome_print(input = "E:/Portfolio/R/Projects/the-kangaroo-factory/shinyapp/R/experimental/test_3.html",
                         output = "E:/Portfolio/R/Projects/the-kangaroo-factory/shinyapp/R/experimental/test_3.pdf",
                         format = "pdf",
                         options = list(scale = scale,
                                        landscape = landscape,
                                        marginTop = 0.2,
                                        marginBottom = 0.2))
  
}
