

# ------------------------------------------------------------------------------
# This is the global param file
# ------------------------------------------------------------------------------

# -- init & source code
for(nm in list.files("R", full.names = T, recursive = T))
  source(nm)
rm(nm)


# ------------------------------------------------------------------------------
# Global parameters
# ------------------------------------------------------------------------------

# -- path list
path <- list()

# -- filenames
file <- list ()

DEBUG <- ifelse(is.logical(Sys.getenv("DEBUG")), Sys.getenv("DEBUG"), FALSE)

