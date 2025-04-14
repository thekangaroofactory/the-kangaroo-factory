

# ------------------------------------------------------------------------------
# This is the global param file
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Load dependencies
# ------------------------------------------------------------------------------

library(shiny)
library(bslib)

# library(dplyr)
# library(ggplot2)


# ------------------------------------------------------------------------------
# Setup environment
# ------------------------------------------------------------------------------

# -- Debug mode
DEBUG <- ifelse(Sys.getenv("DEBUG") != "", as.logical(Sys.getenv("DEBUG")), FALSE)
GTAG <- ifelse(Sys.getenv("GTAG") != "", as.logical(Sys.getenv("GTAG")), FALSE)
EXPERIMENTAL <- ifelse(Sys.getenv("EXPERIMENTAL") != "", as.logical(Sys.getenv("EXPERIMENTAL")), FALSE)


# ------------------------------------------------------------------------------
# Source code
# ------------------------------------------------------------------------------

# -- init & source code
for(nm in list.files("R", pattern = "*.R", full.names = T, recursive = T))
  source(nm)
rm(nm)


# ------------------------------------------------------------------------------
# Global parameters
# ------------------------------------------------------------------------------

# -- path list
path <- list(data = file.path(Sys.getenv("PROJECT_HOME"), "data"),
             temp = file.path(Sys.getenv("PROJECT_HOME"), "data/temp"),
             template = file.path(Sys.getenv("PROJECT_HOME"), "shinyapp/templates"),
             code = file.path(Sys.getenv("PROJECT_HOME"), "shinyapp/R"),
             www = file.path(Sys.getenv("PROJECT_HOME"), "shinyapp/www"))

# -- filenames
file <- list ()
