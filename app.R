
# -- source app files
cat("Source app files \n")
source("shinyapp/global.R")
source("shinyapp/server.R")
source("shinyapp/ui.R")

# -- create shiny app
cat("Start app \n")
shinyApp(ui = ui, 
         server = server)
