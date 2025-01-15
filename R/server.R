
# --
# This is the server logic of a Shiny web application.
# --

library(shiny)

# Define server logic
function(input, output, session) {

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
    return(paste('<iframe style="height:600px; width:100%" src="', pdfurl, '"></iframe>', sep = ""))
  })
  
}
