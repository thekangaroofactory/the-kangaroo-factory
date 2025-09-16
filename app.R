
# -- setup environment
# app.R approach won't load global.R
cat("Setup app environment \n")
source("shinyapp/global.R")

# -- run the app
cat("Starting app \n")
runApp("shinyapp")
