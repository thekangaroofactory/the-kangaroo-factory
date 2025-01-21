
# ------------------------------------------------------------------------------
# This is the server logic of a Shiny web application.
# ------------------------------------------------------------------------------


# -- Define server logic
function(input, output, session) {
  
  # -- Check DEBUG mode
  if(DEBUG)
    cat("[i] DEBUG mode is ON \n")
  
  
  # -- Declare objects
  portfolio <- reactiveVal(NULL)
  
  
  
  # ----------------------------------------------------------------------------
  
  
  # -- Observe url search string (set portfolio)
  observe({
    
    # -- chef for non empty string
    if(session$clientData$url_search != ''){
      
      # -- get url search key / value
      cat("New url search =", session$clientData$url_search, "\n")
      url_search <- substring(session$clientData$url_search, first = 2)
      url_search <- unlist(strsplit(url_search, "="))
      
      # -- update portfolio
      if(url_search[1] == "portfolio")
        portfolio(url_search[2])}
    
  }) |>
    
    bindEvent(session$clientData$url_search)
  
  
  # -- Observe portfolio
  observeEvent(portfolio(),
               cat("Portfolio =", portfolio()))
  
  
  
  
  pdfurl <- "./PERET_Philippe_2024_11_FR.pdf"
  
  
  # -- xxx

  # output$code <- renderText("
  # # -- style test
  # output$mywidget <- renderUI(
  #   div(
  #       p(\"some text goes here.\")
  #   ) %>% tagAppendAttributes(class = \"my_row_class\") 
  # )")

  
  output$pdfviewer <- renderText({
    return(paste('<iframe style="height:600px; width:80%" src="', pdfurl, '"></iframe>', sep = ""))
  })
  
}
