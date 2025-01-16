
# --
# This is the server logic of a Shiny web application.
# --

library(shiny)

# Define server logic
function(input, output, session) {
  
  if(DEBUG)
    cat("[i] DEBUG mode is ON \n")
  
  
  pdfurl <- "./PERET_Philippe_2024_11_FR.pdf"
  
  
  # -- xxx

  output$code <- renderText("
  # -- style test
  output$mywidget <- renderUI(
    div(
        p(\"some text goes here.\")
    ) %>% tagAppendAttributes(class = \"my_row_class\") 
  )")

  
  output$pdfviewer <- renderText({
    return(paste('<iframe style="height:600px; width:80%" src="', pdfurl, '"></iframe>', sep = ""))
  })
  
}
