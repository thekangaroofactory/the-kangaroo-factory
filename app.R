
# -- source app files
cat("Source app files \n")
source("shinyapp/global.R")
source("shinyapp/server.R")
source("shinyapp/ui.R")

str(list.files(path = "shinyapp"))
str(list.files(path = "shinyapp/www"))
str(list.files(path = "shinyapp/www/css"))

# -- create shiny app
cat("Start app \n")
shinyApp(ui = ui, 
         server = server)
