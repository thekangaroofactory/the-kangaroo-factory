

# ------------------------------------------------------------------------------
# This is the global param file
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

library(shiny)
library(bslib)

# library(dplyr)
# library(ggplot2)


# ------------------------------------------------------------------------------
# Environment
# ------------------------------------------------------------------------------

# -- Debug mode
DEBUG <- ifelse(Sys.getenv("DEBUG") != "", as.logical(Sys.getenv("DEBUG")), FALSE)


# ------------------------------------------------------------------------------
# Source code
# ------------------------------------------------------------------------------

# -- load code located in R
ktools::source_code(path = file.path(Sys.getenv("PROJECT_HOME"), "shinyapp/R"))


# ------------------------------------------------------------------------------
# Global parameters
# ------------------------------------------------------------------------------

# -- path list
path <- list(data = file.path(Sys.getenv("PROJECT_HOME"), "data"),
             temp = file.path(Sys.getenv("PROJECT_HOME"), "data/temp"),
             template = file.path(Sys.getenv("PROJECT_HOME"), "shinyapp/templates"),
             code = file.path(Sys.getenv("PROJECT_HOME"), "shinyapp/R"),
             www = file.path(Sys.getenv("PROJECT_HOME"), "shinyapp/www"))
