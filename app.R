
# -- setup environment
# app.R approach won't load global.R
cat("Setup app environment \n")
cat("DEBUG >> ", getwd())
source("shinyapp/global.R")

# -- run the app
shinyAppDir("shinyapp")
