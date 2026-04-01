
# -- Base image
FROM rocker/r-base

# -- system libraries
# RUN apt-get update && apt-get install -y \
# libcurl4-gnutls-dev

# -- Install R dependencies
# Shiny is already included in base image
# remotes needed at next step
RUN R -e "install.packages(c('shiny', 'bslib', 'remotes', 'quarto', 'pagedown'))"

# -- Install dependencies from GitHub (requires remotes)
RUN R -e 'remotes::install_github("thekangaroofactory/ktools")'
RUN R -e 'remotes::install_github("thekangaroofactory/kitems")'

# -- Make a directory in the container
RUN mkdir /home/shinyapp

# -- Copy the code
COPY shinyapp/R /home/shinyapp/R
COPY shinyapp/www /home/shinyapp/www
COPY shinyapp/*.R /home/shinyapp

# -- Copy the internal data
COPY data /home/data

# -- Expose the application port
EXPOSE 3838

# -- Run the Shiny app
CMD ["R", "-e", "shiny::runApp('/home/shinyapp', host = '0.0.0.0', port = 3838)"]
